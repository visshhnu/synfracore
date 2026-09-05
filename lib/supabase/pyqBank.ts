import type { SupabaseClient } from "@supabase/supabase-js";

// Query functions for the PYQ + model-answer bank (docs/pyq-bank-schema.sql)
// — the descriptive/essay-format premium content type, distinct from the
// MCQ question-bank (lib/supabase/questionBank.ts). Same public/
// service-role split convention as that file:
//
//   - "Public" functions: safe with either the anon client or the normal
//     Clerk-authenticated client (pyq_collections/pyq_questions have a
//     public SELECT policy — question text alone, no model answer).
//   - Model answers: MUST be fetched with createServiceRoleClient()
//     (lib/supabase/serviceRole.ts), and only after the caller has already
//     checked hasActivePremiumAccess() in application code — pyq_model_
//     answers has zero SELECT policies for any role, this is the only way
//     to read it. See app/pyq-bank/[slug]/page.tsx for the enforcement.
//
// Every function follows the existing convention: never throws, catches
// its own errors, returns a safe empty/null value on failure.

export type PyqCollection = {
  id: string;
  slug: string;
  subject: string;
  title: string;
  exam_paper: "paper-1" | "paper-2";
  year: number;
  is_premium: boolean;
  question_count: number;
  sort_order: number;
};

export type PyqQuestion = {
  id: string;
  collection_id: string;
  sort_order: number;
  section: string | null;
  question_number: string;
  marks: number;
  word_limit: number | null;
  question_text: string;
};

export type PyqModelAnswer = {
  question_id: string;
  model_answer: string;
  examiner_notes: string | null;
  source_note: string;
};

export async function getCollectionsBySubject(supabase: SupabaseClient, subject: string): Promise<PyqCollection[]> {
  try {
    const { data, error } = await supabase
      .from("pyq_collections")
      .select("id, slug, subject, title, exam_paper, year, is_premium, question_count, sort_order")
      .eq("subject", subject)
      .order("sort_order", { ascending: true });
    if (error) throw error;
    return (data ?? []) as PyqCollection[];
  } catch (err) {
    console.error("getCollectionsBySubject failed:", err);
    return [];
  }
}

export async function getCollectionBySlug(supabase: SupabaseClient, slug: string): Promise<PyqCollection | null> {
  try {
    const { data, error } = await supabase
      .from("pyq_collections")
      .select("id, slug, subject, title, exam_paper, year, is_premium, question_count, sort_order")
      .eq("slug", slug)
      .maybeSingle();
    if (error) throw error;
    return data as PyqCollection | null;
  } catch (err) {
    console.error("getCollectionBySlug failed:", err);
    return null;
  }
}

export async function getQuestionsForCollection(supabase: SupabaseClient, collectionId: string): Promise<PyqQuestion[]> {
  try {
    const { data, error } = await supabase
      .from("pyq_questions")
      .select("id, collection_id, sort_order, section, question_number, marks, word_limit, question_text")
      .eq("collection_id", collectionId)
      .order("sort_order", { ascending: true });
    if (error) throw error;
    return (data ?? []) as PyqQuestion[];
  } catch (err) {
    console.error("getQuestionsForCollection failed:", err);
    return [];
  }
}

// Service-role only. Caller MUST have already checked hasActivePremiumAccess()
// for the signed-in user before calling this — this function does not
// re-check entitlement itself, same division of responsibility as
// getAttemptResults() in questionBank.ts (ownership/entitlement is the
// caller's job; this just reads what RLS would otherwise block entirely).
export async function getModelAnswersForQuestions(supabase: SupabaseClient, questionIds: string[]): Promise<Map<string, PyqModelAnswer>> {
  const map = new Map<string, PyqModelAnswer>();
  if (questionIds.length === 0) return map;
  try {
    const { data, error } = await supabase
      .from("pyq_model_answers")
      .select("question_id, model_answer, examiner_notes, source_note")
      .in("question_id", questionIds);
    if (error) throw error;
    for (const row of (data ?? []) as PyqModelAnswer[]) map.set(row.question_id, row);
    return map;
  } catch (err) {
    console.error("getModelAnswersForQuestions failed:", err);
    return map;
  }
}
