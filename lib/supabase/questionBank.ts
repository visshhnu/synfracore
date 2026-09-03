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
export type AnswerType = "mcq" | "numeric";
export type QuestionWithOptions = {
  id: string;
  sort_order: number;
  question_text: string;
  subject: string | null;
  topic: string | null;
  answer_type: AnswerType;
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
  // NUMERIC column — PostgREST returns it as a string, not a JS number
  // (same gotcha as paper_attempts.score elsewhere in this file); callers
  // must Number() it before doing arithmetic or equality comparisons.
  numeric_answer: string | null;
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

// Isolated from the shared paper-select() clauses for the same reason as
// getPaperTimeLimitMinutes above: positive_marks/negative_marks
// (docs/add-question-subject-marking.sql) is a newer column than the base
// schema, and no other caller needs a per-paper marking scheme besides
// grading/results — bundling it into getPaperCatalog/getPaperBySlug would
// put every paper-listing page at risk of a query error on an environment
// where this migration hasn't run yet, for a field those pages never use.
export async function getPaperMarkingScheme(
  supabase: SupabaseClient,
  paperId: string
): Promise<{ positiveMarks: number; negativeMarks: number }> {
  try {
    const { data, error } = await supabase
      .from("question_papers")
      .select("positive_marks, negative_marks")
      .eq("id", paperId)
      .maybeSingle();
    if (error) throw error;
    return {
      positiveMarks: Number(data?.positive_marks ?? 1),
      negativeMarks: Number(data?.negative_marks ?? 0),
    };
  } catch (err) {
    console.error("getPaperMarkingScheme failed (column may not exist yet — falling back to 1/0):", err);
    return { positiveMarks: 1, negativeMarks: 0 };
  }
}

// Isolated from the questions-select() clause above for the same reason as
// getPaperTimeLimitMinutes/getPaperMarkingScheme: answer_type
// (docs/add-numeric-answer-type.sql) is a newer column than the base
// schema. Bundling it into the shared question fetch would break the
// ENTIRE attempt page — for every paper, MCQ included — on any environment
// where this migration hasn't been applied yet (an "undefined column"
// error fails the whole multi-column select, not just this one field).
// Isolating it means only numeric-question support degrades (falling back
// to "mcq", which is correct for every question authored before this
// migration existed) if the column is missing; nothing else breaks.
async function getAnswerTypesByQuestionId(
  supabase: SupabaseClient,
  questionIds: string[]
): Promise<Map<string, AnswerType>> {
  const fallback = new Map<string, AnswerType>();
  if (questionIds.length === 0) return fallback;
  try {
    const { data, error } = await supabase
      .from("questions")
      .select("id, answer_type")
      .in("id", questionIds);
    if (error) throw error;
    return new Map((data ?? []).map((q) => [q.id as string, (q.answer_type as AnswerType | null) ?? "mcq"]));
  } catch (err) {
    console.error("getAnswerTypesByQuestionId failed (column may not exist yet — falling back to mcq for all):", err);
    return fallback;
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
      .select("id, sort_order, question_text, subject, topic")
      .eq("paper_id", paperId)
      .order("sort_order", { ascending: true });
    if (qErr) throw qErr;
    if (!questions || questions.length === 0) return [];

    const questionIds = questions.map((q) => q.id as string);
    const answerTypeById = await getAnswerTypesByQuestionId(supabase, questionIds);

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
      subject: (q.subject as string | null) ?? null,
      topic: (q.topic as string | null) ?? null,
      answer_type: answerTypeById.get(q.id as string) ?? "mcq",
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

    // Isolated from the select above for the same reason as
    // getAnswerTypesByQuestionId: numeric_answer
    // (docs/add-numeric-answer-type.sql) is a newer column. Bundling it
    // into the main select would break the ENTIRE in-progress-attempt page
    // — for every paper, MCQ included — on an environment where this
    // migration hasn't been applied yet.
    let numericAnswerById = new Map<string, string | null>();
    try {
      const { data: numericRows, error: numErr } = await supabase
        .from("attempt_responses")
        .select("id, numeric_answer")
        .eq("attempt_id", attemptId);
      if (numErr) throw numErr;
      numericAnswerById = new Map((numericRows ?? []).map((r) => [r.id as string, (r.numeric_answer as string | null) ?? null]));
    } catch (err) {
      console.error("getAttemptWithResponses: numeric_answer fetch failed (column may not exist yet):", err);
    }

    const responsesWithNumeric: AttemptResponseRow[] = (responses ?? []).map((r) => ({
      ...(r as Omit<AttemptResponseRow, "numeric_answer">),
      numeric_answer: numericAnswerById.get(r.id as string) ?? null,
    }));

    return { attempt: attempt as AttemptRow, responses: responsesWithNumeric };
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
    if (!data) return null;
    // score is a NUMERIC column — PostgREST returns it as a string, not a
    // JS number; coerce so callers doing arithmetic on it don't silently
    // get string concatenation instead.
    return { id: data.id as string, score: data.score === null ? null : Number(data.score), total: data.total as number | null };
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

// Numeric-entry counterpart to recordAnswer() above, for answer_type =
// "numeric" questions (e.g. JEE Main's NVQs) — same ownership/submitted
// checks, writing to numeric_answer instead of selected_option_id.
// numericAnswer of null clears a previously-typed answer back to
// "unanswered" (mirrors the numeric-input field being emptied out).
export async function recordNumericAnswer(
  serviceClient: SupabaseClient,
  attemptId: string,
  userId: string,
  questionId: string,
  numericAnswer: number | null
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
      .update({ numeric_answer: numericAnswer })
      .eq("attempt_id", attemptId)
      .eq("question_id", questionId);
    if (error) throw error;
    return true;
  } catch (err) {
    console.error("recordNumericAnswer failed:", err);
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
      .select("id, user_id, paper_id, started_at, submitted_at")
      .eq("id", attemptId)
      .maybeSingle();
    if (aErr) throw aErr;
    if (!attempt || attempt.user_id !== userId) return null;
    if (attempt.submitted_at !== null) return null;

    const { positiveMarks, negativeMarks } = await getPaperMarkingScheme(serviceClient, attempt.paper_id as string);

    const { data: responses, error: rErr } = await serviceClient
      .from("attempt_responses")
      .select("id, attempt_id, question_id, shown_option_order, selected_option_id, numeric_answer")
      .eq("attempt_id", attemptId);
    if (rErr) throw rErr;
    if (!responses || responses.length === 0) return null;

    const questionIds = responses.map((r) => r.question_id as string);
    const { data: answers, error: ansErr } = await serviceClient
      .from("question_answers")
      .select("question_id, correct_option_id, correct_numeric_answer")
      .in("question_id", questionIds);
    if (ansErr) throw ansErr;

    // Exactly one of these two is ever populated per row (enforced by the
    // question_answers_exactly_one_answer_shape CHECK constraint) — no
    // separate "which shape" flag needed here, just check which field the
    // authored answer actually has.
    const correctByQuestion = new Map<string, { optionId: string | null; numericAnswer: number | null }>();
    for (const a of answers ?? []) {
      correctByQuestion.set(a.question_id as string, {
        optionId: (a.correct_option_id as string | null) ?? null,
        numericAnswer: a.correct_numeric_answer != null ? Number(a.correct_numeric_answer) : null,
      });
    }

    let score = 0;
    const updates = responses.map((r) => {
      const correct = correctByQuestion.get(r.question_id as string);
      const numericAnswer = r.numeric_answer != null ? Number(r.numeric_answer) : null;
      const isAnswered = r.selected_option_id !== null || numericAnswer !== null;

      let isCorrect = false;
      if (correct?.optionId != null) {
        isCorrect = r.selected_option_id === correct.optionId;
      } else if (correct?.numericAnswer != null && numericAnswer != null) {
        // Canonical numeric equality (5 == 5.0 == 5.00), per NTA's own
        // published NVQ rule that trailing zeroes are disregarded — not a
        // fuzzy/epsilon tolerance band. Number() coercion on both sides
        // gives this for free; no custom tolerance-window logic needed.
        isCorrect = numericAnswer === correct.numericAnswer;
      }

      if (isCorrect) score += positiveMarks;
      else if (isAnswered) score -= negativeMarks;
      return {
        id: r.id as string,
        attempt_id: r.attempt_id as string,
        question_id: r.question_id as string,
        shown_option_order: r.shown_option_order,
        selected_option_id: r.selected_option_id as string | null,
        numeric_answer: numericAnswer,
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
  subject: string | null;
  topic: string | null;
  answerType: AnswerType;
  options: QuestionOption[];
  selectedOptionId: string | null;
  selectedNumericAnswer: number | null;
  isCorrect: boolean;
  // Unanswered + attempt didn't meet the completion threshold. When true,
  // correctOptionId/correctNumericAnswer/explanation/sourceNote are never
  // populated with the real values below — not a UI-hides-it convention,
  // the answer key data for this question genuinely never leaves
  // getAttemptResults().
  reviewLocked: boolean;
  correctOptionId: string;
  correctNumericAnswer: number | null;
  explanation: string;
  sourceNote: string | null;
};

export type AttemptResults = {
  attemptId: string;
  paperId: string;
  score: number;
  // Max possible score under the paper's current marking scheme
  // (total questions × positive_marks) — NOT the same as `total`, which
  // stays a plain question count for the answered% / review-threshold math
  // elsewhere. Only use maxScore for score percentage display.
  maxScore: number;
  // Exposed so per-subject score can be recomputed client-side (the subject
  // breakdown table) using the same formula as gradeAttempt() — there's no
  // per-subject score persisted anywhere, only the whole-paper total.
  positiveMarks: number;
  negativeMarks: number;
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
      .select("question_id, shown_option_order, selected_option_id, numeric_answer, is_correct")
      .eq("attempt_id", attemptId);
    if (rErr) throw rErr;
    if (!responses) return null;

    const questionIds = responses.map((r) => r.question_id as string);

    const { data: questions, error: qErr } = await serviceClient
      .from("questions")
      .select("id, question_text, subject, topic")
      .in("id", questionIds);
    if (qErr) throw qErr;

    const answerTypeById = await getAnswerTypesByQuestionId(serviceClient, questionIds);

    const { positiveMarks, negativeMarks } = await getPaperMarkingScheme(serviceClient, attempt.paper_id as string);

    const { data: options, error: oErr } = await serviceClient
      .from("question_options")
      .select("id, question_id, option_text")
      .in("question_id", questionIds);
    if (oErr) throw oErr;

    const { data: answers, error: ansErr } = await serviceClient
      .from("question_answers")
      .select("question_id, correct_option_id, correct_numeric_answer, explanation, source_note")
      .in("question_id", questionIds);
    if (ansErr) throw ansErr;

    const questionTextById = new Map((questions ?? []).map((q) => [q.id as string, q.question_text as string]));
    const questionMetaById = new Map(
      (questions ?? []).map((q) => [q.id as string, { subject: (q.subject as string | null) ?? null, topic: (q.topic as string | null) ?? null }])
    );
    const optionById = new Map((options ?? []).map((o) => [o.id as string, { id: o.id as string, option_text: o.option_text as string }]));
    const responseByQuestion = new Map(responses.map((r) => [r.question_id as string, r]));
    const answerByQuestion = new Map(
      (answers ?? []).map((a) => [
        a.question_id as string,
        {
          correctOptionId: (a.correct_option_id as string | null) ?? null,
          correctNumericAnswer: a.correct_numeric_answer != null ? Number(a.correct_numeric_answer) : null,
          explanation: a.explanation as string,
          sourceNote: a.source_note as string | null,
        },
      ])
    );

    const orderedQuestionIds = (attempt.question_order as string[]).filter((qid) => responseByQuestion.has(qid));

    const answeredCount = responses.filter((r) => r.selected_option_id !== null || r.numeric_answer !== null).length;
    const fullReviewUnlocked =
      responses.length === 0 || answeredCount / responses.length >= FULL_REVIEW_COMPLETION_THRESHOLD;

    const resultQuestions: AttemptResultQuestion[] = orderedQuestionIds.map((qid) => {
      const response = responseByQuestion.get(qid)!;
      const answer = answerByQuestion.get(qid);
      const orderedOptions = (response.shown_option_order as string[])
        .map((oid) => optionById.get(oid))
        .filter((o): o is QuestionOption => Boolean(o));
      const selectedNumericAnswer = response.numeric_answer != null ? Number(response.numeric_answer) : null;

      const isUnanswered = response.selected_option_id === null && selectedNumericAnswer === null;
      const reviewLocked = isUnanswered && !fullReviewUnlocked;

      const meta = questionMetaById.get(qid);
      return {
        id: qid,
        question_text: questionTextById.get(qid) ?? "",
        subject: meta?.subject ?? null,
        topic: meta?.topic ?? null,
        answerType: answerTypeById.get(qid) ?? "mcq",
        options: orderedOptions,
        selectedOptionId: response.selected_option_id as string | null,
        selectedNumericAnswer,
        isCorrect: Boolean(response.is_correct),
        reviewLocked,
        correctOptionId: reviewLocked ? "" : answer?.correctOptionId ?? "",
        correctNumericAnswer: reviewLocked ? null : answer?.correctNumericAnswer ?? null,
        explanation: reviewLocked ? "" : answer?.explanation ?? "",
        sourceNote: reviewLocked ? null : answer?.sourceNote ?? null,
      };
    });

    const total = (attempt.total as number) ?? resultQuestions.length;
    return {
      attemptId: attempt.id as string,
      paperId: attempt.paper_id as string,
      // NUMERIC columns come back from PostgREST as strings, not JS numbers —
      // Number(null) is 0, so this also covers the pre-submission null case.
      score: Number(attempt.score ?? 0),
      maxScore: total * positiveMarks,
      positiveMarks,
      negativeMarks,
      total,
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
