// Client-side Sentry init. No-ops safely if NEXT_PUBLIC_SENTRY_DSN isn't
// set, so this is safe to ship before a Sentry project/DSN exists yet.
import * as Sentry from "@sentry/nextjs";

const dsn = process.env.NEXT_PUBLIC_SENTRY_DSN;

if (dsn) {
  Sentry.init({
    dsn,
    tracesSampleRate: 0.1,
    // Session Replay off by default — a separate opt-in decision (it
    // captures DOM snapshots, more of a privacy consideration than error
    // tracking is) rather than something to enable silently as part of
    // basic error monitoring.
    replaysSessionSampleRate: 0,
    replaysOnErrorSampleRate: 0,
  });
}
