// Client-side error logging — posts to app/api/log-error/route.ts, which
// does the actual Supabase insert with the service-role key (client code
// can never hold that key). Fire-and-forget and fully swallowed on
// failure: a logging failure must never itself break the page the user is
// already having a bad time on. See docs/error-logs-schema.sql for the
// table this ultimately writes to, and why Sentry isn't used instead
// (~650KB gzip, ~96% of the free Workers plan's 3MB limit — see
// docs/OPERATIONAL-GUIDE.md's Sentry section).
export type ErrorLogSource = "client-boundary" | "global-boundary" | "unhandled";

export function logClientError(params: {
  message: string;
  stack?: string | null;
  source: ErrorLogSource;
  digest?: string | null;
}) {
  try {
    const body = JSON.stringify({
      message: params.message,
      stack: params.stack ?? null,
      source: params.source,
      digest: params.digest ?? null,
      route: typeof window !== "undefined" ? window.location.pathname : null,
    });
    // navigator.sendBeacon doesn't let us set a JSON content-type reliably
    // across browsers, and this fires rarely enough (only on real errors)
    // that a fire-and-forget fetch with keepalive is simpler and just as
    // safe to send during/right before unload.
    fetch("/api/log-error", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body,
      keepalive: true,
    }).catch(() => {});
  } catch {
    // Never let logging itself throw.
  }
}
