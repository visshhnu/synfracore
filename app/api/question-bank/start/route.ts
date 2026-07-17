export const runtime = "edge";

import { NextRequest, NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { ensureUserRowExists } from "@/lib/supabase/ensureUser";
import { hasActivePremiumAccess } from "@/lib/billing/access";
import { getPaperBySlug, getLatestInProgressAttempt, startAttempt } from "@/lib/supabase/questionBank";

// Route Handler, not a Server Action — see docs/audit/06-roadmap.md's
// "CONFIRMED — Static rendering is structurally blocked..." section, 6th
// symptom entry (2026-07-13): `@cloudflare/next-on-pages` has a confirmed,
// runtime-instrumentation-traced bug where a correctly-dispatched Server
// Action still 404s from inside Next.js's own action-verification code,
// before the action body ever executes. A Route Handler is an ordinary
// HTTP endpoint — it never goes through that dispatch mechanism at all,
// so this bug class is structurally inapplicable here. Returns
// { redirectTo } JSON instead of calling redirect() — the caller
// (components/question-bank/StartButton.tsx) navigates client-side.
export async function POST(req: NextRequest) {
  let paperSlug: unknown;
  try {
    ({ paperSlug } = await req.json());
  } catch {
    return NextResponse.json({ redirectTo: "/question-bank" });
  }
  if (!paperSlug || typeof paperSlug !== "string") {
    return NextResponse.json({ redirectTo: "/question-bank" });
  }

  const { userId } = await getAuthSafely();
  if (!userId) {
    return NextResponse.json({ redirectTo: `/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}`)}` });
  }

  // Guarantees a users row exists for this Clerk id before any question-bank
  // write — including self-healing an existing test-mode account that's
  // never visited /dashboard (which is the only other place this runs). See
  // lib/supabase/ensureUser.ts's ensureUserRowExists() for why this can't
  // just reuse ensureUserRecord().
  await ensureUserRowExists(userId);

  const publicClient = createSupabaseServerClient();
  const paper = await getPaperBySlug(publicClient, paperSlug);
  if (!paper) {
    return NextResponse.json({ redirectTo: "/question-bank" });
  }

  // Premium gate — currently sign-in-only (hasActivePremiumAccess is a stub
  // returning true for any signed-in user); this is the one line that
  // changes once real subscription status exists.
  if (paper.is_premium && !(await hasActivePremiumAccess(userId))) {
    return NextResponse.json({ redirectTo: `/question-bank/${paperSlug}?locked=1` });
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
    console.error("POST /api/question-bank/start: unexpected failure:", err);
  }

  if (!attemptId) {
    return NextResponse.json({ redirectTo: `/question-bank/${paperSlug}?error=1` });
  }
  return NextResponse.json({ redirectTo: `/question-bank/${paperSlug}/attempt/${attemptId}` });
}
