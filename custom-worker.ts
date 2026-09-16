// Wraps the OpenNext-generated worker to add a scheduled() Cron Trigger
// handler — @opennextjs/cloudflare has no built-in support for this (checked
// live: not documented under its supported features), so the documented
// workaround is this thin wrapper: re-export everything the generated worker
// needs (fetch + its Durable Object bindings), and add scheduled() alongside
// it. wrangler.jsonc's "main" points here instead of directly at
// .open-next/worker.js.
//
// Used by: the Telegram scheduled-post dispatch job (Phase 2,
// docs/social-integrations-schema.sql, lib/social/telegramDispatch.ts).
// Every 2 minutes (wrangler.jsonc's triggers.crons), checks scheduled_posts
// for due rows and sends them via Telegram's Bot API.
//
// IMPORTANT: scheduled() cannot use lib/supabase/serviceRole.ts's
// createServiceRoleClient() — that reads process.env, which is only
// populated by OpenNext's populateProcessEnv() inside the fetch handler's
// runWithCloudflareRequestContext (confirmed by reading
// .open-next/cloudflare/init.js directly). scheduled() never goes through
// that path, so process.env would be empty here. The Supabase client is
// built directly from the env bindings scheduled() actually receives.

// @ts-expect-error — .open-next/worker.js is generated at build time (npm
// run pages:build), not present in source control, so this import never
// resolves at typecheck time under the project's established process
// (both CI's bare `tsc --noEmit`, which never builds, and the real deploy
// checklist's `rm -rf .open-next` before every `next build`) — the
// directive always has a real error to suppress. If .open-next/worker.js
// is ever left on disk from a previous build and NOT cleared before a
// typecheck (e.g. an ad hoc local `tsc --noEmit` without the deploy
// checklist's cleanup step), the import resolves fine and this directive
// will itself fail as "unused" — that's a signal to re-run the standard
// clear-and-rebuild flow, not a bug in this comment.
import { default as handler } from "./.open-next/worker.js";
// @ts-expect-error — see above
export { DOQueueHandler } from "./.open-next/worker.js";
// @ts-expect-error — see above
export { DOShardedTagCache } from "./.open-next/worker.js";
// @ts-expect-error — see above
export { BucketCachePurge } from "./.open-next/worker.js";

import { createClient } from "@supabase/supabase-js";
import { dispatchDueTelegramPosts } from "./lib/social/telegramDispatch";

type WorkerEnv = {
  NEXT_PUBLIC_SUPABASE_URL?: string;
  SUPABASE_SERVICE_ROLE_KEY?: string;
  TELEGRAM_BOT_TOKEN?: string;
};

// Minimal local shapes for the two Workers-runtime types used below —
// deliberately not pulled from @cloudflare/workers-types (not a project
// dependency; app/api/ai/route.ts established this same "define the narrow
// shape actually used" pattern for the AI binding rather than adding it).
type ScheduledController = { cron: string; scheduledTime: number };
type WaitUntilCtx = { waitUntil(promise: Promise<unknown>): void };

export default {
  fetch: handler.fetch,

  async scheduled(_controller: ScheduledController, env: WorkerEnv, ctx: WaitUntilCtx) {
    // SUPABASE_SERVICE_ROLE_KEY/NEXT_PUBLIC_SUPABASE_URL are always-set
    // production config (question-bank grading and the Clerk webhook both
    // already depend on them) — missing here is a genuine misconfiguration
    // worth an error log.
    if (!env.SUPABASE_SERVICE_ROLE_KEY || !env.NEXT_PUBLIC_SUPABASE_URL) {
      console.error("scheduled(): SUPABASE_SERVICE_ROLE_KEY/NEXT_PUBLIC_SUPABASE_URL not set, skipping Telegram dispatch");
      return;
    }

    // TELEGRAM_BOT_TOKEN unset means the feature isn't configured yet — no
    // bot has been created via BotFather, or its secret hasn't been added.
    // This is the expected, permanent state until the connect-flow/composer
    // UI ships, and this Cron Trigger fires every 2 minutes regardless — a
    // console.error here every 2 minutes forever (confirmed live in
    // production: this branch fired and logged as an error before this fix)
    // is log noise for a known, not-yet-configured state, not a real
    // problem. Returns silently, same "fails closed, not loud" posture as
    // AI_ASSISTANT_ENABLED.
    if (!env.TELEGRAM_BOT_TOKEN) {
      return;
    }

    const botToken = env.TELEGRAM_BOT_TOKEN;
    const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY);

    ctx.waitUntil(
      (async () => {
        const start = Date.now();
        const result = await dispatchDueTelegramPosts(supabase, botToken);
        const elapsedMs = Date.now() - start;
        // Wall-clock, not the platform's own billed CPU-time-only figure
        // (CPU time excludes network I/O wait, which dominates this
        // handler) — logged on every invocation while empirically verifying
        // the free-tier 10ms CPU-time budget, not just when there's work to
        // report.
        console.log(
          `scheduled(): Telegram dispatch — processed ${result.processed}, sent ${result.sent}, failed ${result.failed}, elapsed ${elapsedMs}ms (wall-clock)`
        );
      })()
    );
  },
};
