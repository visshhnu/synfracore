"use server";

import { auth } from "@clerk/nextjs/server";
import { redirect } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { saveOnboarding, type OnboardingInput } from "@/lib/supabase/queries";

// auth() can throw (the same class of bug already fixed in
// app/onboarding/page.tsx and app/dashboard/page.tsx — see their comments)
// — it was unguarded here, which meant a transient auth() failure crashed
// this entire Server Action and surfaced app/onboarding/error.tsx's generic
// boundary instead of the existing, more graceful "?error=1" state.
//
// A failed/empty result here does NOT reliably mean "signed out" — confirmed
// live (2026-07-09): auth() can fail transiently inside this Server Action
// for a genuinely signed-in user. The original code (and this function's
// first version) redirected straight to /sign-in whenever userId was falsy,
// which is wrong for that transient case: Clerk's own <SignIn/> component
// detects the still-active session and auto-redirects to afterSignInUrl
// ("/"), producing a confusing sign-in-flash-then-home bounce — plus a
// hydration error from the server briefly rendering /sign-in's content
// before the client immediately tears it down to redirect. Callers should
// redirect to /onboarding?error=1 instead, which is correct either way:
// shows the existing retry banner if the user really is signed in, or lets
// middleware's own (already-correct, stable) 404 handle it if they're not.
// TEMPORARY DIAGNOSTIC (2026-07-09): return value widened to carry the raw
// failure reason — confirmed live that the URL after a failed submit had
// NO debug param at all, meaning this function's own auth() call is what's
// failing (returning falsy), not saveOnboarding() — never got that far.
// Revert to a plain string|null return once diagnosed, matching the
// temporary comments in queries.ts and page.tsx.
async function getUserIdSafely(): Promise<{ userId: string | null; debug: string | null }> {
  try {
    const result = await auth();
    if (!result.userId) {
      return { userId: null, debug: `auth() returned no userId (sessionId=${result.sessionId ?? "null"})` };
    }
    return { userId: result.userId, debug: null };
  } catch (err) {
    console.error("auth() failed in an onboarding Server Action:", err);
    const message = err instanceof Error ? err.message : String(err);
    return { userId: null, debug: `auth() threw: ${message}` };
  }
}

function toErrorUrl(debug: string | null): string {
  return `/onboarding?error=1&debug=${encodeURIComponent(debug ?? "unknown")}`;
}

export async function submitOnboarding(formData: FormData) {
  const { userId, debug: authDebug } = await getUserIdSafely();
  if (!userId) redirect(toErrorUrl(authDebug));

  const input: OnboardingInput = {
    learnerType: String(formData.get("learnerType") ?? ""),
    primaryGoal: String(formData.get("primaryGoal") ?? ""),
    currentLevel: String(formData.get("currentLevel") ?? "beginner"),
    goalTimeline: String(formData.get("goalTimeline") ?? ""),
    domains: formData.getAll("domains").map(String),
  };

  // createSupabaseServerClient()/saveOnboarding() were previously called
  // unguarded too — saveOnboarding() catches its own internal errors and
  // returns false, but client construction itself throwing (or any other
  // unexpected failure here) would still crash the action outright.
  let ok = false;
  let errorMessage: string | null = null;
  try {
    const supabase = createSupabaseServerClient();
    const result = await saveOnboarding(supabase, userId, input);
    ok = result.ok;
    errorMessage = result.errorMessage;
  } catch (err) {
    console.error("submitOnboarding: unexpected failure:", err);
    errorMessage = err instanceof Error ? err.message : String(err);
  }

  // saveOnboarding already logs the underlying error server-side — this is
  // the user-facing half: don't redirect to /dashboard as if it worked when
  // it didn't, or the user has no idea their answers weren't saved.
  // (redirect() throws internally by design — kept outside the try/catch
  // above so it isn't accidentally swallowed by it.)
  // TEMPORARY DIAGNOSTIC (2026-07-09): errorMessage passed via query param
  // so it can be seen live — revert once the save failure is diagnosed, see
  // lib/supabase/queries.ts's matching temporary comment.
  redirect(ok ? "/dashboard" : toErrorUrl(errorMessage));
}

export async function skipOnboarding() {
  const { userId, debug: authDebug } = await getUserIdSafely();
  if (!userId) redirect(toErrorUrl(authDebug));

  // Skipping still marks onboarding as "seen" so the dashboard prompt doesn't
  // nag forever — access to everything was never gated on this either way.
  let ok = true;
  try {
    const supabase = createSupabaseServerClient();
    const { error } = await supabase.from("users").update({ onboarding_completed: true, updated_at: new Date().toISOString() }).eq("id", userId);
    if (error) {
      console.error("skipOnboarding failed:", error);
      ok = false;
    }
  } catch (err) {
    console.error("skipOnboarding: unexpected failure:", err);
    ok = false;
  }

  redirect(ok ? "/dashboard" : "/onboarding?error=1");
}
