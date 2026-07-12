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
export function createServiceRoleClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}
