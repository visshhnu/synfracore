export const runtime = "edge";

import { redirect } from "next/navigation";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getAttemptWithResponses, getPaperQuestionsWithOptions } from "@/lib/supabase/questionBank";
import AttemptRunner, { type AttemptQuestion } from "@/components/question-bank/AttemptRunner";

type Props = { params: Promise<{ paperSlug: string; attemptId: string }> };

// Auth-required (also covered by middleware.ts's isProtectedRoute, this is
// defense-in-depth). Reads back the persisted shuffle order — never
// re-shuffles. question_answers is never fetched here; the practice screen
// has no access to correctness data at all, by design.
export default async function AttemptPage({ params }: Props) {
  const { paperSlug, attemptId } = await params;

  const { userId } = await getAuthSafely();
  if (!userId) redirect(`/sign-in?redirect_url=${encodeURIComponent(`/question-bank/${paperSlug}/attempt/${attemptId}`)}`);

  const supabase = createSupabaseServerClient();

  // RLS on paper_attempts/attempt_responses already restricts this to the
  // caller's own rows — a null result here covers "not yours" and "doesn't
  // exist" identically, so both redirect the same way.
  const result = await getAttemptWithResponses(supabase, attemptId);
  if (!result) redirect(`/question-bank/${paperSlug}`);
  const { attempt, responses } = result;

  if (attempt.submitted_at !== null) redirect(`/question-bank/${paperSlug}/attempt/${attemptId}/results`);

  const questionsInOriginalOrder = await getPaperQuestionsWithOptions(supabase, attempt.paper_id);
  if (questionsInOriginalOrder.length === 0) redirect(`/question-bank/${paperSlug}?error=1`);

  const questionById = new Map(questionsInOriginalOrder.map((q) => [q.id, q]));
  const optionByQuestion = new Map(questionsInOriginalOrder.map((q) => [q.id, new Map(q.options.map((o) => [o.id, o]))]));
  const responseByQuestion = new Map(responses.map((r) => [r.question_id, r]));

  const orderedQuestions: AttemptQuestion[] = attempt.question_order
    .map((qid) => {
      const question = questionById.get(qid);
      const response = responseByQuestion.get(qid);
      if (!question || !response) return null;
      const optionMap = optionByQuestion.get(qid)!;
      const orderedOptions = response.shown_option_order
        .map((oid) => optionMap.get(oid))
        .filter((o): o is { id: string; option_text: string } => Boolean(o));
      return { id: question.id, question_text: question.question_text, options: orderedOptions };
    })
    .filter((q): q is AttemptQuestion => Boolean(q));

  const initialSelections: Record<string, string | null> = {};
  for (const r of responses) initialSelections[r.question_id] = r.selected_option_id;

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "32px 24px" }}>
      <AttemptRunner attemptId={attemptId} paperSlug={paperSlug} questions={orderedQuestions} initialSelections={initialSelections} />
    </div>
  );
}
