// Server + edge runtime Sentry init. Cloudflare Pages (via
// @cloudflare/next-on-pages) only ever executes the edge branch in
// production — every route in this app runs `export const runtime = "edge"`
// — but both branches are wired for correctness in case that ever changes,
// and so `next dev` (which does run a Node process) also reports errors.
//
// No-ops safely (Sentry.init is simply never called) if
// NEXT_PUBLIC_SENTRY_DSN isn't set, so this is safe to ship before a Sentry
// project/DSN exists yet.

export async function register() {
  const dsn = process.env.NEXT_PUBLIC_SENTRY_DSN;
  if (!dsn) return;

  if (process.env.NEXT_RUNTIME === "nodejs") {
    const Sentry = await import("@sentry/nextjs");
    Sentry.init({ dsn, tracesSampleRate: 0.1 });
  }

  if (process.env.NEXT_RUNTIME === "edge") {
    const Sentry = await import("@sentry/nextjs");
    Sentry.init({ dsn, tracesSampleRate: 0.1 });
  }
}

// Next.js 15's hook for errors thrown inside nested React Server Components
// that error.tsx boundaries can't catch on their own — forwards them to
// Sentry alongside the existing console.error-based logging.
export async function onRequestError(...args: Parameters<typeof import("@sentry/nextjs").captureRequestError>) {
  if (!process.env.NEXT_PUBLIC_SENTRY_DSN) return;
  const Sentry = await import("@sentry/nextjs");
  Sentry.captureRequestError(...args);
}
