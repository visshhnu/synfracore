import { NextRequest, NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { gradeAttempt } from "@/lib/supabase/questionBank";

// Route Handler, not a Server Action — see docs/audit/06-roadmap.md's 6th
// symptom entry (2026-07-13) for why. Returns { redirectTo } JSON instead
// of calling redirect() — the caller (AttemptRunner.tsx) navigates
// client-side.
export async function POST(req: NextRequest) {
  let body: { attemptId?: unknown; paperSlug?: unknown };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ redirectTo: "/question-bank" });
  }
  const { attemptId, paperSlug } = body;
  if (typeof attemptId !== "string" || typeof paperSlug !== "string") {
    return NextResponse.json({ redirectTo: "/question-bank" });
  }

  const { userId } = await getAuthSafely();
  if (!userId) {
    return NextResponse.json({ redirectTo: `/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}/attempt/${attemptId}`)}` });
  }

  let graded = false;
  try {
    const serviceClient = createServiceRoleClient();
    const result = await gradeAttempt(serviceClient, attemptId, userId);
    graded = result !== null;
  } catch (err) {
    console.error("POST /api/question-bank/submit: unexpected failure:", err);
  }

  if (!graded) {
    return NextResponse.json({ redirectTo: `/question-bank/${paperSlug}/attempt/${attemptId}?error=1` });
  }
  return NextResponse.json({ redirectTo: `/question-bank/${paperSlug}/attempt/${attemptId}/results` });
}
