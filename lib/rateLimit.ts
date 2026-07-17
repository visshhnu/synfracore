// Cloudflare KV-backed per-IP rate limiter for public, unauthenticated API
// routes (Stage 2 F5) — reuses the same BLOG_KV namespace already wired up
// for blog likes/comments (see app/api/blog/route.ts) rather than adding a
// second binding for one counter's worth of data.
//
// Best-effort, not atomic: KV has no native increment, so two concurrent
// requests from the same IP can both read the same count before either
// writes back, under-counting by one in that race. Acceptable here — this
// is abuse deterrence for free-tier growth endpoints, not billing-grade
// metering. Fails open (allows the request) if KV isn't configured, matching
// every other KV access in this app (see app/api/blog/route.ts's own
// kv-missing fallback) — a missing binding should degrade gracefully, not
// take down the endpoint.

import { getCloudflareContext } from "@opennextjs/cloudflare";

// Confirmed live (2026-07-08) that (globalThis as any).BLOG_KV — the access
// pattern app/api/blog/route.ts had used since before this file existed —
// never actually works under @cloudflare/next-on-pages: it compiles Next.js
// into the ES-modules Workers format, where bindings arrive via the fetch
// handler's `env` argument, not as globals (that's only true of the legacy
// Service Worker format). The binding was genuinely present in the
// Cloudflare Pages dashboard the whole time; the code just could never see
// it. getCloudflareContext() is @opennextjs/cloudflare's equivalent API for
// reaching that `env` (replaces next-on-pages' getOptionalRequestContext()
// as of the D1 migration) — wrapped in a try/catch since, unlike the old
// API, it throws rather than returning undefined outside a real Cloudflare
// request context (e.g. local `next dev` without
// initOpenNextCloudflareForDev() wired up), so the existing "degrade
// gracefully" fallbacks below still apply there unchanged.
declare global {
  interface CloudflareEnv {
    BLOG_KV?: KVNamespaceLike;
  }
}

export function getBlogKv(): KVNamespaceLike | undefined {
  try {
    return getCloudflareContext().env.BLOG_KV;
  } catch {
    return undefined;
  }
}

export function getClientIp(request: Request): string {
  return (
    request.headers.get("cf-connecting-ip") ??
    request.headers.get("x-forwarded-for")?.split(",")[0]?.trim() ??
    "unknown"
  );
}

// Each allowed request resets the key's TTL to windowSeconds — a sliding
// window, not a fixed calendar one. Once a caller hits `limit`, further
// requests are left untouched (not re-counted, TTL not extended), so the
// block naturally lifts windowSeconds after their last allowed request.
export async function isRateLimited(
  kv: KVNamespaceLike | undefined,
  key: string,
  limit: number,
  windowSeconds: number
): Promise<boolean> {
  if (!kv) return false;
  try {
    const current = await kv.get(key);
    const count = current ? parseInt(current, 10) : 0;
    if (count >= limit) return true;
    await kv.put(key, String(count + 1), { expirationTtl: windowSeconds });
    return false;
  } catch {
    return false;
  }
}

// Matches the shape actually used at the two call sites (kv.get/kv.put) —
// avoids pulling in @cloudflare/workers-types just for this.
type KVNamespaceLike = {
  get(key: string): Promise<string | null>;
  put(key: string, value: string, options?: { expirationTtl?: number }): Promise<void>;
};
