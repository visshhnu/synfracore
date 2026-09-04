// Client-side error ingestion for the self-hosted, Sentry-free error log
// (docs/error-logs-schema.sql). No auth required — errors can happen to
// signed-out users too — so per-IP rate limiting (same pattern as
// app/api/blog/route.ts) is the only abuse control against a scripted loop
// flooding the table. Fails open/silent on any internal problem: a broken
// logging endpoint must never surface as a user-visible error itself.
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { getBlogKv, getClientIp, isRateLimited } from "@/lib/rateLimit";

const RATE_LIMIT = 30;
const RATE_LIMIT_WINDOW_SECONDS = 300; // 5 minutes

const VALID_SOURCES = new Set(["client-boundary", "global-boundary", "unhandled"]);
const MAX_FIELD_LENGTH = 4000; // stack traces especially can be huge; truncate rather than reject

function clip(value: unknown): string | null {
  if (typeof value !== "string" || value.length === 0) return null;
  return value.length > MAX_FIELD_LENGTH ? value.slice(0, MAX_FIELD_LENGTH) : value;
}

export async function POST(request: Request) {
  try {
    const kv = getBlogKv();
    const ip = getClientIp(request);
    if (await isRateLimited(kv, `log-error:${ip}`, RATE_LIMIT, RATE_LIMIT_WINDOW_SECONDS)) {
      return new Response(null, { status: 204 });
    }

    const body = await request.json().catch(() => null);
    if (!body || typeof body.message !== "string" || !body.message) {
      return new Response(null, { status: 204 });
    }
    if (!VALID_SOURCES.has(body.source)) return new Response(null, { status: 204 });

    // Best-effort only — getAuthSafely() failing here (e.g. no session)
    // just means user_id stays null, same as any signed-out error.
    const { userId } = await getAuthSafely().catch(() => ({ userId: null }));

    const supabase = createServiceRoleClient();
    await supabase.from("error_logs").insert({
      message: clip(body.message),
      stack: clip(body.stack),
      route: clip(body.route),
      user_agent: clip(request.headers.get("user-agent")),
      user_id: userId,
      source: body.source,
      digest: clip(body.digest),
    });

    return new Response(null, { status: 204 });
  } catch {
    // Logging must never itself become a user-visible failure.
    return new Response(null, { status: 204 });
  }
}
