"use server";

import { redirect } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { saveOnboarding, type OnboardingInput } from "@/lib/supabase/queries";
import { getAuthSafely } from "@/lib/clerk/authFallback";

function toErrorUrl(debug: string | null): string {
  return `/onboarding?error=1&debug=${encodeURIComponent(debug ?? "unknown")}`;
}

export async function submitOnboarding(formData: FormData) {
  const { userId, debug: authDebug } = await getAuthSafely();
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
  const { userId, debug: authDebug } = await getAuthSafely();
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
