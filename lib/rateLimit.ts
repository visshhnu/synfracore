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
