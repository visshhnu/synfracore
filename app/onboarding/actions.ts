"use server";

import { auth, clerkClient } from "@clerk/nextjs/server";
import { headers } from "next/headers";
import { redirect } from "next/navigation";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { saveOnboarding, type OnboardingInput } from "@/lib/supabase/queries";

// Confirmed live (2026-07-09): auth()'s AsyncLocalStorage context reliably
// fails to reach this Server Action on this Cloudflare adapter, even though
// the exact same clerkMiddleware() run correctly protects this route on the
// page render (onboarding/page.tsx's own auth() call works). This is a known,
// unresolved Clerk/Cloudflare issue — reproduces on both
// @cloudflare/next-on-pages (what we're on) and @opennextjs/cloudflare (the
// planned 3.8 migration target), so migrating will NOT fix it:
// https://github.com/opennextjs/opennextjs-cloudflare/issues/524
//
// Workaround: since middleware already ran for this request (that's the only
// reason this page was reachable at all), the session cookie IS present —
// only the in-process context handoff into the Server Action is broken. Fall
// back to verifying that cookie manually via clerkClient().authenticateRequest(),
// which reads the cookie directly instead of relying on the broken handoff.
async function getUserIdSafely(): Promise<{ userId: string | null; debug: string | null }> {
  try {
    const result = await auth();
    if (result.userId) return { userId: result.userId, debug: null };
  } catch (err) {
    console.error("auth() failed in an onboarding Server Action, trying manual fallback:", err);
  }

  try {
    const hdrs = await headers();
    const request = new Request("https://synfracore.com/", {
      headers: { cookie: hdrs.get("cookie") ?? "" },
    });
    const client = await clerkClient();
    const state = await client.authenticateRequest(request);
    const manualAuth = state.toAuth();
    if (manualAuth?.userId) return { userId: manualAuth.userId, debug: null };
    return { userId: null, debug: `manual fallback found no session (status=${state.status})` };
  } catch (err) {
    console.error("Manual auth fallback also failed in an onboarding Server Action:", err);
    const message = err instanceof Error ? err.message : String(err);
    return { userId: null, debug: `manual fallback threw: ${message}` };
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
