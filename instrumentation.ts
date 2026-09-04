// Next.js's own onRequestError hook — server/edge-side half of the
// self-hosted error log (docs/error-logs-schema.sql). Deliberately NOT
// Sentry: this is a first-class Next.js mechanism, independent of the
// deployment target, which sidesteps the exact problem that ruled out
// both Sentry SDKs here (@sentry/nextjs's ~650KB gzip cost, ~96% of the
// free Workers plan's 3MB limit; @sentry/cloudflare having no supported
// hook into @opennextjs/cloudflare's generated worker entry point at all).
// onRequestError only fires for errors Next.js's server-side rendering/
// routing itself catches — it does not need any Workers-specific
// integration, so it isn't affected by that gap.
import type { Instrumentation } from "next";

export const onRequestError: Instrumentation.onRequestError = async (err, request) => {
  try {
    // Avoid a hard dependency on the Cloudflare-specific service-role
    // client failing to import cleanly in every runtime this hook can run
    // in (nodejs vs edge) -- dynamic import keeps this hook itself from
    // ever being the thing that throws.
    const { createServiceRoleClient } = await import("@/lib/supabase/serviceRole");
    const supabase = createServiceRoleClient();
    const message = err instanceof Error ? err.message : String(err);
    const stack = err instanceof Error ? (err.stack ?? null) : null;
    await supabase.from("error_logs").insert({
      message: message.slice(0, 4000),
      stack: stack ? stack.slice(0, 4000) : null,
      route: request.path ?? null,
      source: "server",
    });
  } catch {
    // Never let the error-logging hook itself throw during error handling.
  }
};
