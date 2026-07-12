import { createClient } from "@supabase/supabase-js";

// Service-role Supabase client — bypasses RLS entirely (Postgres/Supabase
// BYPASSRLS on the service_role connection). Server-only; SUPABASE_SERVICE_
// ROLE_KEY must never be NEXT_PUBLIC_ or reach the browser.
//
// Two consumers today:
//   1. app/api/webhooks/clerk/route.ts — no end-user session/JWT exists for
//      a webhook, so RLS's "(select auth.jwt()->>'sub') = id" policies can
//      never be satisfied any other way.
//   2. lib/supabase/questionBank.ts's service-role-only functions — reading
//      question_answers (zero SELECT policies, by design — see
//      docs/question-bank-schema.sql) and writing attempt_responses/
//      paper_attempts grading fields (no authenticated-role INSERT/UPDATE
//      policy on those columns, also by design).
//
// Every caller must independently enforce ownership in application code
// (e.g. attempt.user_id === userId) — this client does not check it for you.
//
// Explicit guard below: without it, a missing key reaches
// @supabase/supabase-js's own createClient(), which throws the generic
// "supabaseKey is required." — technically correct, but it gives no hint
// this is an env var problem, and (depending on the caller) can get
// swallowed by a generic try/catch and logged as an opaque "unexpected
// failure" with no indication what actually broke. This was hit for real
// the first time this module gained a second consumer beyond the Clerk
// webhook (2026-07-13): the webhook route already checked for this key
// itself (returns a harmless 501 if unset), so the key was never actually
// configured in some local .env.local files — startAttemptAction's generic
// catch then logged nothing more useful than "unexpected failure", and the
// UI just said "Something went wrong."
export function createServiceRoleClient() {
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
    throw new Error(
      "SUPABASE_SERVICE_ROLE_KEY is not set. Question-bank grading and the " +
        "Clerk webhook both require it — see .env.example for where to get " +
        "it (Supabase dashboard -> Settings -> API -> service_role key) and " +
        "add it to .env.local."
    );
  }
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY
  );
}
