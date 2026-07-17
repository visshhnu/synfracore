import { NextRequest, NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { recordAnswer } from "@/lib/supabase/questionBank";

// Route Handler, not a Server Action — see docs/audit/06-roadmap.md's 6th
// symptom entry (2026-07-13) for why. Called fire-and-forget from
// components/question-bank/AttemptRunner.tsx on each option click.
export async function POST(req: NextRequest) {
  const { userId } = await getAuthSafely();
  if (!userId) return NextResponse.json({ ok: false }, { status: 401 });

  let body: { attemptId?: unknown; questionId?: unknown; optionId?: unknown };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ ok: false }, { status: 400 });
  }
  const { attemptId, questionId, optionId } = body;
  if (typeof attemptId !== "string" || typeof questionId !== "string" || typeof optionId !== "string") {
    return NextResponse.json({ ok: false }, { status: 400 });
  }

  try {
    const serviceClient = createServiceRoleClient();
    const ok = await recordAnswer(serviceClient, attemptId, userId, questionId, optionId);
    return NextResponse.json({ ok });
  } catch (err) {
    console.error("POST /api/question-bank/save-answer: unexpected failure:", err);
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}
