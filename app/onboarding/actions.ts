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
async function getUserIdSafely(): Promise<string | null> {
  try {
    return (await auth()).userId;
  } catch (err) {
    console.error("auth() failed in an onboarding Server Action:", err);
    return null;
  }
}

export async function submitOnboarding(formData: FormData) {
  const userId = await getUserIdSafely();
  if (!userId) redirect("/sign-in");

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
  try {
    const supabase = createSupabaseServerClient();
    ok = await saveOnboarding(supabase, userId, input);
  } catch (err) {
    console.error("submitOnboarding: unexpected failure:", err);
  }

  // saveOnboarding already logs the underlying error server-side — this is
  // the user-facing half: don't redirect to /dashboard as if it worked when
  // it didn't, or the user has no idea their answers weren't saved.
  // (redirect() throws internally by design — kept outside the try/catch
  // above so it isn't accidentally swallowed by it.)
  redirect(ok ? "/dashboard" : "/onboarding?error=1");
}

export async function skipOnboarding() {
  const userId = await getUserIdSafely();
  if (!userId) redirect("/sign-in");

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
