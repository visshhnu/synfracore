import { auth, clerkClient } from "@clerk/nextjs/server";
import { headers } from "next/headers";

export type AuthFallbackResult = { userId: string | null; token: string | null; debug: string | null };

// auth()'s AsyncLocalStorage context reliably fails to reach Server Actions on
// this Cloudflare adapter, even though clerkMiddleware() already ran to reach
// this route at all (confirmed live 2026-07-09) — a known, unresolved bug that
// reproduces on both @cloudflare/next-on-pages (what we're on) and
// @opennextjs/cloudflare (the planned 3.8 migration target), so migrating will
// NOT fix it: https://github.com/opennextjs/opennextjs-cloudflare/issues/524
//
// Since middleware already ran for this request, the session cookie IS
// present — only the in-process context handoff is broken. Fall back to
// verifying that cookie manually via clerkClient().authenticateRequest(),
// which reads it directly instead of relying on the broken handoff. This
// covers both getting the userId AND the raw session token — callers that
// need to authenticate a Supabase request (see lib/supabase/server.ts) need
// the token, not just the userId, since Supabase's RLS checks the JWT itself.
export async function getAuthSafely(): Promise<AuthFallbackResult> {
  try {
    const result = await auth();
    if (result.userId) {
      const token = await result.getToken();
      return { userId: result.userId, token, debug: null };
    }
  } catch (err) {
    console.error("auth() failed, trying manual fallback:", err);
  }

  try {
    const hdrs = await headers();
    const request = new Request("https://synfracore.com/", {
      headers: { cookie: hdrs.get("cookie") ?? "" },
    });
    const client = await clerkClient();
    const state = await client.authenticateRequest(request);
    const manualAuth = state.toAuth();
    if (manualAuth?.userId && state.token) {
      return { userId: manualAuth.userId, token: state.token, debug: null };
    }
    return { userId: null, token: null, debug: `manual fallback found no session (status=${state.status})` };
  } catch (err) {
    console.error("Manual auth fallback also failed:", err);
    const message = err instanceof Error ? err.message : String(err);
    return { userId: null, token: null, debug: `manual fallback threw: ${message}` };
  }
}
