"use server";

import { redirect } from "next/navigation";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { hasActivePremiumAccess } from "@/lib/billing/access";
import {
  getPaperBySlug,
  getLatestInProgressAttempt,
  startAttempt,
  recordAnswer,
  gradeAttempt,
} from "@/lib/supabase/questionBank";

// Mirrors app/onboarding/actions.ts's exact shape: getAuthSafely() for the
// userId/token (auth() alone silently returns null inside Server Actions on
// this Cloudflare adapter — see that file's own comment), redirect-on-failure
// via query param, redirect() calls kept outside try/catch since it throws
// internally by Next.js design and must not be swallowed.

export async function startAttemptAction(paperSlug: string) {
  const { userId } = await getAuthSafely();
  if (!userId) redirect(`/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}`)}`);

  const publicClient = createSupabaseServerClient();
  const paper = await getPaperBySlug(publicClient, paperSlug);
  if (!paper) redirect("/question-bank");

  // Premium gate — currently sign-in-only (hasActivePremiumAccess is a stub
  // returning true for any signed-in user); this is the one line that
  // changes once real subscription status exists.
  if (paper.is_premium && !(await hasActivePremiumAccess(userId))) {
    redirect(`/question-bank/${paperSlug}?locked=1`);
  }

  let attemptId: string | null = null;
  try {
    const existing = await getLatestInProgressAttempt(publicClient, userId, paper.id);
    if (existing) {
      attemptId = existing.id;
    } else {
      const serviceClient = createServiceRoleClient();
      attemptId = await startAttempt(serviceClient, userId, paper.id);
    }
  } catch (err) {
    console.error("startAttemptAction: unexpected failure:", err);
  }

  if (!attemptId) redirect(`/question-bank/${paperSlug}?error=1`);
  redirect(`/question-bank/${paperSlug}/attempt/${attemptId}`);
}

// Called directly from AttemptRunner (a Client Component) as a plain async
// function on each option click — fire-and-forget, non-blocking. Returns a
// boolean rather than redirecting, since a failed autosave shouldn't
// interrupt the user mid-attempt; the caller surfaces a small "not saved"
// indicator instead (see SectionQuiz.tsx's saveFailed pattern).
export async function saveAnswerAction(attemptId: string, questionId: string, optionId: string): Promise<boolean> {
  const { userId } = await getAuthSafely();
  if (!userId) return false;

  try {
    const serviceClient = createServiceRoleClient();
    return await recordAnswer(serviceClient, attemptId, userId, questionId, optionId);
  } catch (err) {
    console.error("saveAnswerAction: unexpected failure:", err);
    return false;
  }
}

export async function submitAttemptAction(attemptId: string, paperSlug: string) {
  const { userId } = await getAuthSafely();
  if (!userId) redirect(`/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}/attempt/${attemptId}`)}`);

  let graded = false;
  try {
    const serviceClient = createServiceRoleClient();
    const result = await gradeAttempt(serviceClient, attemptId, userId);
    graded = result !== null;
  } catch (err) {
    console.error("submitAttemptAction: unexpected failure:", err);
  }

  if (!graded) redirect(`/question-bank/${paperSlug}/attempt/${attemptId}?error=1`);
  redirect(`/question-bank/${paperSlug}/attempt/${attemptId}/results`);
}
