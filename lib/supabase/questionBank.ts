import type { SupabaseClient } from "@supabase/supabase-js";

// Query/mutation functions for the BCHH-C question bank (docs/question-bank-schema.sql).
// Split explicitly by which client each function requires — this split is the
// load-bearing security design of the whole feature, not a style preference:
//
//   - "Public" functions: safe with either the anon client or the normal
//     Clerk-authenticated client (question_papers/questions/question_options
//     all have a public SELECT policy — never contain answer data).
//   - "Authenticated" functions: use the normal Clerk-authenticated client
//     (lib/supabase/server.ts) — RLS restricts these to the caller's own rows.
//   - "Service-role" functions: MUST be called with createServiceRoleClient()
//     (lib/supabase/serviceRole.ts), and ONLY from inside a "use server"
//     action, never exposed to a Client Component. question_answers has zero
//     SELECT policies for any role; attempt_responses/paper_attempts have no
//     authenticated-role INSERT/UPDATE policy for the grading-related columns
//     — both are deliberate, per the schema's own comments. Because the
//     service-role client bypasses RLS entirely, every service-role function
//     here does its own explicit `attempt.user_id === userId` ownership check
//     in application code — do not remove those checks when editing.
//
// Every function follows queries.ts's existing convention: never throws,
// catches its own errors, returns a safe empty/null value on failure.

export type QuestionPaper = {
  id: string;
  slug: string;
  title: string;
  exam_type: string;
  focus_tags: string[];
  question_count: number;
  difficulty: string;
  is_premium: boolean;
  sort_order: number;
};

export type QuestionOption = { id: string; option_text: string };
export type QuestionWithOptions = {
  id: string;
  sort_order: number;
  question_text: string;
  options: QuestionOption[];
};

export type AttemptRow = {
  id: string;
  user_id: string;
  paper_id: string;
  question_order: string[];
  started_at: string;
  submitted_at: string | null;
  time_taken_seconds: number | null;
  score: number | null;
  total: number | null;
};

export type AttemptResponseRow = {
  id: string;
  attempt_id: string;
  question_id: string;
  shown_option_order: string[];
  selected_option_id: string | null;
  is_correct: boolean | null;
};

// ── Public reads (anon or authenticated client — never contain answer data) ──

export async function getPaperCatalog(supabase: SupabaseClient): Promise<QuestionPaper[]> {
  try {
    const { data, error } = await supabase
      .from("question_papers")
      .select("id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order")
      .order("sort_order", { ascending: true });
    if (error) throw error;
    return (data ?? []) as QuestionPaper[];
  } catch (err) {
    console.error("getPaperCatalog failed:", err);
    return [];
  }
}

// Backs the technology sidebar/landing-page's conditional "Practice Exams"
// tab (see technologyExamTypeMap in lib/data/navigation.ts) — used purely as
// an existence check (does this exam_type have any real papers?), not to
// link into a specific one. The tab itself links to /question-bank, the full
// catalog — linking straight into a single paper hid the other 9 BCHHC
// papers from a user who only found the tab (confirmed live 2026-07-18).
export async function getFirstPaperByExamType(supabase: SupabaseClient, examType: string): Promise<QuestionPaper | null> {
  try {
    const { data, error } = await supabase
      .from("question_papers")
      .select("id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order")
      .eq("exam_type", examType)
      .order("sort_order", { ascending: true })
      .limit(1)
      .maybeSingle();
    if (error) throw error;
    return data as QuestionPaper | null;
  } catch (err) {
    console.error("getFirstPaperByExamType failed:", err);
    return null;
  }
}

export async function getPaperBySlug(supabase: SupabaseClient, slug: string): Promise<QuestionPaper | null> {
  try {
    const { data, error } = await supabase
      .from("question_papers")
      .select("id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order")
      .eq("slug", slug)
      .maybeSingle();
    if (error) throw error;
    return data as QuestionPaper | null;
  } catch (err) {
    console.error("getPaperBySlug failed:", err);
    return null;
  }
}

// Deliberately separate from QuestionPaper/getPaperBySlug — time_limit_minutes
// is a new column (docs/add-paper-time-limit.sql) that may not exist yet on
// a given environment's DB until that migration is manually applied (see the
// migration file's own comment for why this project doesn't automate DDL).
// Bundling it into the shared paper-select() clauses those existence-check
// functions use would mean any environment without the migration applied
// gets a query error on EVERY question-bank page (paper lookup fails ->
// treated as "paper doesn't exist" -> notFound()) — confirmed exactly this
// way against a preview without the migration applied. Isolating it here
// means only the attempt timer itself degrades (falls back to 60min) if the
// column is missing; nothing else on the site is affected either way.
export async function getPaperTimeLimitMinutes(supabase: SupabaseClient, paperId: string): Promise<number> {
  try {
    const { data, error } = await supabase
      .from("question_papers")
      .select("time_limit_minutes")
      .eq("id", paperId)
      .maybeSingle();
    if (error) throw error;
    return (data?.time_limit_minutes as number | undefined) ?? 60;
  } catch (err) {
    console.error("getPaperTimeLimitMinutes failed (column may not exist yet — falling back to 60):", err);
    return 60;
  }
}

// Questions+options in ORIGINAL sort_order — used internally to build the
// per-attempt shuffle and to map ids -> display text. Never render this
// return value's order directly on the practice screen; only the shuffled
// question_order/shown_option_order arrays determine display order.
export async function getPaperQuestionsWithOptions(
  supabase: SupabaseClient,
  paperId: string
): Promise<QuestionWithOptions[]> {
  try {
    const { data: questions, error: qErr } = await supabase
      .from("questions")
      .select("id, sort_order, question_text")
      .eq("paper_id", paperId)
      .order("sort_order", { ascending: true });
    if (qErr) throw qErr;
    if (!questions || questions.length === 0) return [];

    const questionIds = questions.map((q) => q.id as string);
    const { data: options, error: oErr } = await supabase
      .from("question_options")
      .select("id, question_id, sort_order, option_text")
      .in("question_id", questionIds)
      .order("sort_order", { ascending: true });
    if (oErr) throw oErr;

    const optionsByQuestion = new Map<string, QuestionOption[]>();
    for (const o of options ?? []) {
      const list = optionsByQuestion.get(o.question_id as string) ?? [];
      list.push({ id: o.id as string, option_text: o.option_text as string });
      optionsByQuestion.set(o.question_id as string, list);
    }

    return questions.map((q) => ({
      id: q.id as string,
      sort_order: q.sort_order as number,
      question_text: q.question_text as string,
      options: optionsByQuestion.get(q.id as string) ?? [],
    }));
  } catch (err) {
    console.error("getPaperQuestionsWithOptions failed:", err);
    return [];
  }
}

// ── Authenticated reads (own rows only, via createSupabaseServerClient()) ──

// Null on any error OR zero rows — an attempt that belongs to someone else
// and an attempt that doesn't exist are treated identically by RLS (the
// query simply returns no row for both), and callers should treat them
// identically too (redirect), rather than trying to distinguish them.
export async function getAttemptWithResponses(
  supabase: SupabaseClient,
  attemptId: string
): Promise<{ attempt: AttemptRow; responses: AttemptResponseRow[] } | null> {
  try {
    const { data: attempt, error: aErr } = await supabase
      .from("paper_attempts")
      .select("id, user_id, paper_id, question_order, started_at, submitted_at, time_taken_seconds, score, total")
      .eq("id", attemptId)
      .maybeSingle();
    if (aErr) throw aErr;
    if (!attempt) return null;

    const { data: responses, error: rErr } = await supabase
      .from("attempt_responses")
      .select("id, attempt_id, question_id, shown_option_order, selected_option_id, is_correct")
      .eq("attempt_id", attemptId);
    if (rErr) throw rErr;

    return { attempt: attempt as AttemptRow, responses: (responses ?? []) as AttemptResponseRow[] };
  } catch (err) {
    console.error("getAttemptWithResponses failed:", err);
    return null;
  }
}

export async function getLatestInProgressAttempt(
  supabase: SupabaseClient,
  userId: string,
  paperId: string
): Promise<{ id: string } | null> {
  try {
    const { data, error } = await supabase
      .from("paper_attempts")
      .select("id")
      .eq("user_id", userId)
      .eq("paper_id", paperId)
      .is("submitted_at", null)
      .order("started_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (error) throw error;
    return data ? { id: data.id as string } : null;
  } catch (err) {
    console.error("getLatestInProgressAttempt failed:", err);
    return null;
  }
}

export async function getLatestSubmittedAttempt(
  supabase: SupabaseClient,
  userId: string,
  paperId: string
): Promise<{ id: string; score: number | null; total: number | null } | null> {
  try {
    const { data, error } = await supabase
      .from("paper_attempts")
      .select("id, score, total")
      .eq("user_id", userId)
      .eq("paper_id", paperId)
      .not("submitted_at", "is", null)
      .order("submitted_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (error) throw error;
    return data as { id: string; score: number | null; total: number | null } | null;
  } catch (err) {
    console.error("getLatestSubmittedAttempt failed:", err);
    return null;
  }
}

// ── Service-role only — call ONLY from inside a "use server" action ──

function shuffled<T>(arr: T[]): T[] {
  const out = [...arr];
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [out[i], out[j]] = [out[j], out[i]];
  }
  return out;
}

export async function startAttempt(
  serviceClient: SupabaseClient,
  userId: string,
  paperId: string
): Promise<string | null> {
  try {
    const questions = await getPaperQuestionsWithOptions(serviceClient, paperId);
    if (questions.length === 0) return null;

    const questionOrder = shuffled(questions.map((q) => q.id));

    const { data: attempt, error: attemptErr } = await serviceClient
      .from("paper_attempts")
      .insert({ user_id: userId, paper_id: paperId, question_order: questionOrder })
      .select("id")
      .single();
    if (attemptErr) throw attemptErr;
    const attemptId = attempt.id as string;

    const responseRows = questions.map((q) => ({
      attempt_id: attemptId,
      question_id: q.id,
      shown_option_order: shuffled(q.options.map((o) => o.id)),
      selected_option_id: null,
      is_correct: null,
    }));

    const { error: responsesErr } = await serviceClient.from("attempt_responses").insert(responseRows);
    if (responsesErr) {
      // Don't leave an orphaned, unusable attempt behind if seeding its
      // responses failed partway — the user has no way to recover it.
      await serviceClient.from("paper_attempts").delete().eq("id", attemptId);
      throw responsesErr;
    }

    return attemptId;
  } catch (err) {
    console.error("startAttempt failed:", err);
    return null;
  }
}

export async function recordAnswer(
  serviceClient: SupabaseClient,
  attemptId: string,
  userId: string,
  questionId: string,
  optionId: string
): Promise<boolean> {
  try {
    const { data: attempt, error: aErr } = await serviceClient
      .from("paper_attempts")
      .select("user_id, submitted_at")
      .eq("id", attemptId)
      .maybeSingle();
    if (aErr) throw aErr;
    if (!attempt || attempt.user_id !== userId || attempt.submitted_at !== null) return false;

    const { error } = await serviceClient
      .from("attempt_responses")
      .update({ selected_option_id: optionId })
      .eq("attempt_id", attemptId)
      .eq("question_id", questionId);
    if (error) throw error;
    return true;
  } catch (err) {
    console.error("recordAnswer failed:", err);
    return false;
  }
}

export async function gradeAttempt(
  serviceClient: SupabaseClient,
  attemptId: string,
  userId: string
): Promise<{ score: number; total: number } | null> {
  try {
    const { data: attempt, error: aErr } = await serviceClient
      .from("paper_attempts")
      .select("id, user_id, started_at, submitted_at")
      .eq("id", attemptId)
      .maybeSingle();
    if (aErr) throw aErr;
    if (!attempt || attempt.user_id !== userId) return null;
    if (attempt.submitted_at !== null) return null;

    const { data: responses, error: rErr } = await serviceClient
      .from("attempt_responses")
      .select("id, attempt_id, question_id, shown_option_order, selected_option_id")
      .eq("attempt_id", attemptId);
    if (rErr) throw rErr;
    if (!responses || responses.length === 0) return null;

    const questionIds = responses.map((r) => r.question_id as string);
    const { data: answers, error: ansErr } = await serviceClient
      .from("question_answers")
      .select("question_id, correct_option_id")
      .in("question_id", questionIds);
    if (ansErr) throw ansErr;

    const correctByQuestion = new Map<string, string>();
    for (const a of answers ?? []) correctByQuestion.set(a.question_id as string, a.correct_option_id as string);

    let score = 0;
    const updates = responses.map((r) => {
      const correctOptionId = correctByQuestion.get(r.question_id as string);
      const isCorrect = correctOptionId != null && r.selected_option_id === correctOptionId;
      if (isCorrect) score++;
      return {
        id: r.id as string,
        attempt_id: r.attempt_id as string,
        question_id: r.question_id as string,
        shown_option_order: r.shown_option_order,
        selected_option_id: r.selected_option_id as string | null,
        is_correct: isCorrect,
      };
    });

    // Single bulk upsert, not one UPDATE per row -- a 100-question paper
    // previously issued ~100 individual Supabase REST calls here, each a
    // separate Cloudflare Worker subrequest, which silently exceeded the
    // platform's per-invocation subrequest limit ("Too many subrequests by
    // single Worker invocation") and left the attempt permanently stuck
    // un-submitted. Every NOT NULL column must be included in the payload --
    // Postgres validates constraints on the tentative row before ON CONFLICT
    // resolution applies, so omitting attempt_id/question_id/shown_option_order
    // fails with a not-null violation even though the row already exists
    // (confirmed live against a real 100-row attempt before this fix).
    const { error: bulkUpdateErr } = await serviceClient
      .from("attempt_responses")
      .upsert(updates, { onConflict: "id" });
    if (bulkUpdateErr) throw bulkUpdateErr;

    const total = responses.length;
    const startedAtMs = new Date(attempt.started_at as string).getTime();
    const timeTakenSeconds = Math.max(0, Math.round((Date.now() - startedAtMs) / 1000));

    const { error: submitErr } = await serviceClient
      .from("paper_attempts")
      .update({ score, total, submitted_at: new Date().toISOString(), time_taken_seconds: timeTakenSeconds })
      .eq("id", attemptId);
    if (submitErr) throw submitErr;

    return { score, total };
  } catch (err) {
    console.error("gradeAttempt failed:", err);
    return null;
  }
}

// An attempt submitted with fewer than this fraction of questions answered
// doesn't unlock the correct-answer/explanation review for questions that
// were never attempted — otherwise a single-question, immediate submit
// exposes the entire premium answer key for a 100-question paper for almost
// no real effort. Answered questions are always reviewable regardless of
// this threshold; this only gates the ones a learner skipped. Purely a
// query-layer decision — no schema change, nothing persisted — since
// "answered %" is fully derivable from the (immutable, post-submission)
// attempt_responses rows every time this is computed.
const FULL_REVIEW_COMPLETION_THRESHOLD = 0.8;

export type AttemptResultQuestion = {
  id: string;
  question_text: string;
  options: QuestionOption[];
  selectedOptionId: string | null;
  isCorrect: boolean;
  // Unanswered + attempt didn't meet the completion threshold. When true,
  // correctOptionId/explanation/sourceNote are never populated with the real
  // values below — not a UI-hides-it convention, the answer key data for
  // this question genuinely never leaves getAttemptResults().
  reviewLocked: boolean;
  correctOptionId: string;
  explanation: string;
  sourceNote: string | null;
};

export type AttemptResults = {
  attemptId: string;
  paperId: string;
  score: number;
  total: number;
  answeredCount: number;
  fullReviewUnlocked: boolean;
  timeTakenSeconds: number | null;
  questions: AttemptResultQuestion[];
};

export async function getAttemptResults(
  serviceClient: SupabaseClient,
  attemptId: string,
  userId: string
): Promise<AttemptResults | null> {
  try {
    const { data: attempt, error: aErr } = await serviceClient
      .from("paper_attempts")
      .select("id, user_id, paper_id, question_order, submitted_at, score, total, time_taken_seconds")
      .eq("id", attemptId)
      .maybeSingle();
    if (aErr) throw aErr;
    if (!attempt || attempt.user_id !== userId) return null;
    if (attempt.submitted_at === null) return null;

    const { data: responses, error: rErr } = await serviceClient
      .from("attempt_responses")
      .select("question_id, shown_option_order, selected_option_id, is_correct")
      .eq("attempt_id", attemptId);
    if (rErr) throw rErr;
    if (!responses) return null;

    const questionIds = responses.map((r) => r.question_id as string);

    const { data: questions, error: qErr } = await serviceClient
      .from("questions")
      .select("id, question_text")
      .in("id", questionIds);
    if (qErr) throw qErr;

    const { data: options, error: oErr } = await serviceClient
      .from("question_options")
      .select("id, question_id, option_text")
      .in("question_id", questionIds);
    if (oErr) throw oErr;

    const { data: answers, error: ansErr } = await serviceClient
      .from("question_answers")
      .select("question_id, correct_option_id, explanation, source_note")
      .in("question_id", questionIds);
    if (ansErr) throw ansErr;

    const questionTextById = new Map((questions ?? []).map((q) => [q.id as string, q.question_text as string]));
    const optionById = new Map((options ?? []).map((o) => [o.id as string, { id: o.id as string, option_text: o.option_text as string }]));
    const responseByQuestion = new Map(responses.map((r) => [r.question_id as string, r]));
    const answerByQuestion = new Map(
      (answers ?? []).map((a) => [
        a.question_id as string,
        { correctOptionId: a.correct_option_id as string, explanation: a.explanation as string, sourceNote: a.source_note as string | null },
      ])
    );

    const orderedQuestionIds = (attempt.question_order as string[]).filter((qid) => responseByQuestion.has(qid));

    const answeredCount = responses.filter((r) => r.selected_option_id !== null).length;
    const fullReviewUnlocked =
      responses.length === 0 || answeredCount / responses.length >= FULL_REVIEW_COMPLETION_THRESHOLD;

    const resultQuestions: AttemptResultQuestion[] = orderedQuestionIds.map((qid) => {
      const response = responseByQuestion.get(qid)!;
      const answer = answerByQuestion.get(qid);
      const orderedOptions = (response.shown_option_order as string[])
        .map((oid) => optionById.get(oid))
        .filter((o): o is QuestionOption => Boolean(o));

      const isUnanswered = response.selected_option_id === null;
      const reviewLocked = isUnanswered && !fullReviewUnlocked;

      return {
        id: qid,
        question_text: questionTextById.get(qid) ?? "",
        options: orderedOptions,
        selectedOptionId: response.selected_option_id as string | null,
        isCorrect: Boolean(response.is_correct),
        reviewLocked,
        correctOptionId: reviewLocked ? "" : answer?.correctOptionId ?? "",
        explanation: reviewLocked ? "" : answer?.explanation ?? "",
        sourceNote: reviewLocked ? null : answer?.sourceNote ?? null,
      };
    });

    return {
      attemptId: attempt.id as string,
      paperId: attempt.paper_id as string,
      score: (attempt.score as number) ?? 0,
      total: (attempt.total as number) ?? resultQuestions.length,
      answeredCount,
      fullReviewUnlocked,
      timeTakenSeconds: attempt.time_taken_seconds as number | null,
      questions: resultQuestions,
    };
  } catch (err) {
    console.error("getAttemptResults failed:", err);
    return null;
  }
}
