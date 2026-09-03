import { NextRequest, NextResponse } from "next/server";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { recordAnswer, recordNumericAnswer } from "@/lib/supabase/questionBank";

// Route Handler, not a Server Action — see docs/audit/06-roadmap.md's 6th
// symptom entry (2026-07-13) for why. Called fire-and-forget from
// components/question-bank/AttemptRunner.tsx on each option click (MCQ) or
// numeric-input change (numeric-entry questions, e.g. JEE Main's NVQs).
//
// Body shape is a union, not two separate fields both allowed at once:
// { optionId: string } for MCQ, or { numericAnswer: number | null } for
// numeric entry (null clears a previously-typed answer). Exactly one must
// be present — the caller already knows which shape a question is
// (AttemptQuestion.answer_type), so this isn't inferred here.
export async function POST(req: NextRequest) {
  const { userId } = await getAuthSafely();
  if (!userId) return NextResponse.json({ ok: false }, { status: 401 });

  let body: { attemptId?: unknown; questionId?: unknown; optionId?: unknown; numericAnswer?: unknown };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ ok: false }, { status: 400 });
  }
  const { attemptId, questionId, optionId, numericAnswer } = body;
  if (typeof attemptId !== "string" || typeof questionId !== "string") {
    return NextResponse.json({ ok: false }, { status: 400 });
  }

  try {
    const serviceClient = createServiceRoleClient();

    if (typeof optionId === "string") {
      const ok = await recordAnswer(serviceClient, attemptId, userId, questionId, optionId);
      return NextResponse.json({ ok });
    }

    if (numericAnswer === null || typeof numericAnswer === "number") {
      if (typeof numericAnswer === "number" && !Number.isFinite(numericAnswer)) {
        return NextResponse.json({ ok: false }, { status: 400 });
      }
      const ok = await recordNumericAnswer(serviceClient, attemptId, userId, questionId, numericAnswer);
      return NextResponse.json({ ok });
    }

    return NextResponse.json({ ok: false }, { status: 400 });
  } catch (err) {
    console.error("POST /api/question-bank/save-answer: unexpected failure:", err);
    return NextResponse.json({ ok: false }, { status: 500 });
  }
}
