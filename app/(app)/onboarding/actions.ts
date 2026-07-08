"use server";

import { auth } from "@clerk/nextjs/server";
import { redirect } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { saveOnboarding, type OnboardingInput } from "@/lib/supabase/queries";

export async function submitOnboarding(formData: FormData) {
  const { userId } = await auth();
  if (!userId) redirect("/sign-in");

  const input: OnboardingInput = {
    learnerType: String(formData.get("learnerType") ?? ""),
    primaryGoal: String(formData.get("primaryGoal") ?? ""),
    currentLevel: String(formData.get("currentLevel") ?? "beginner"),
    goalTimeline: String(formData.get("goalTimeline") ?? ""),
    domains: formData.getAll("domains").map(String),
  };

  const supabase = createSupabaseServerClient();
  const ok = await saveOnboarding(supabase, userId, input);

  // saveOnboarding already logs the underlying error server-side — this is
  // the user-facing half: don't redirect to /dashboard as if it worked when
  // it didn't, or the user has no idea their answers weren't saved.
  redirect(ok ? "/dashboard" : "/onboarding?error=1");
}

export async function skipOnboarding() {
  const { userId } = await auth();
  if (!userId) redirect("/sign-in");

  // Skipping still marks onboarding as "seen" so the dashboard prompt doesn't
  // nag forever — access to everything was never gated on this either way.
  const supabase = createSupabaseServerClient();
  const { error } = await supabase.from("users").update({ onboarding_completed: true, updated_at: new Date().toISOString() }).eq("id", userId);
  if (error) {
    console.error("skipOnboarding failed:", error);
    redirect("/onboarding?error=1");
  }

  redirect("/dashboard");
}
