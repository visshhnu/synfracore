import { notFound } from "next/navigation";
import Link from "next/link";
import type { Metadata } from "next";
import { Lock, Sparkles } from "lucide-react";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createServiceRoleClient } from "@/lib/supabase/serviceRole";
import { getCollectionBySlug, getQuestionsForCollection, getModelAnswersForQuestions } from "@/lib/supabase/pyqBank";
import { getAuthSafely } from "@/lib/clerk/authFallback";
import { hasActivePremiumAccess } from "@/lib/billing/access";

type Props = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const supabase = createSupabaseServerClient();
  const collection = await getCollectionBySlug(supabase, slug);
  if (!collection) return { title: "PYQ Collection" };
  return {
    title: `${collection.title} — PYQ + Model Answers`,
    description: `${collection.question_count} real UPSC ${collection.exam_paper === "paper-1" ? "Paper I" : "Paper II"} questions (${collection.year}) with full written model answers.`,
    alternates: { canonical: `https://synfracore.com/pyq-bank/${slug}` },
  };
}

// A reading page, not the quiz-attempt flow — no timer, no Start/Submit, no
// scoring. Question text is always visible (public SELECT policy on
// pyq_questions, the same "preview before paying" pattern question_papers
// uses). Model answers are the one thing gated: fetched via the
// service-role client ONLY after hasActivePremiumAccess() passes here, in
// application code — pyq_model_answers itself has zero SELECT policies for
// any other role, so there is no path to leak one without this check.
export default async function PyqCollectionPage({ params }: Props) {
  const { slug } = await params;
  const supabase = createSupabaseServerClient();
  const collection = await getCollectionBySlug(supabase, slug);
  if (!collection) notFound();

  const questions = await getQuestionsForCollection(supabase, collection.id);

  const { userId } = await getAuthSafely();
  const hasAccess = collection.is_premium ? (userId ? await hasActivePremiumAccess(userId) : false) : true;

  const modelAnswers = hasAccess
    ? await getModelAnswersForQuestions(createServiceRoleClient(), questions.map((q) => q.id))
    : new Map();

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "40px 24px" }}>
      <nav style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "24px", display: "flex", gap: "6px" }}>
        <Link href="/" style={{ color: "var(--text-4)", textDecoration: "none" }}>Home</Link>›
        <Link href={`/pyq-bank?subject=${collection.subject}`} style={{ color: "var(--text-4)", textDecoration: "none" }}>PYQ Bank</Link>›
        <span style={{ color: "var(--text-2)" }}>{collection.title}</span>
      </nav>

      <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", gap: "12px", marginBottom: "8px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "24px", fontWeight: 800, color: "var(--text-1)" }}>{collection.title}</h1>
        {collection.is_premium && (
          <span style={{ display: "flex", alignItems: "center", gap: "3px", fontSize: "11px", fontWeight: 700, padding: "4px 10px", borderRadius: "20px", background: "rgba(245,158,11,0.12)", color: "#F59E0B", whiteSpace: "nowrap", flexShrink: 0 }}>
            <Sparkles size={11} /> Premium
          </span>
        )}
      </div>
      <p style={{ fontSize: "13px", color: "var(--text-4)", marginBottom: "32px" }}>
        {collection.exam_paper === "paper-1" ? "Paper I" : "Paper II"} · {collection.year} · {collection.question_count} questions
      </p>

      {!hasAccess && (
        <div style={{ display: "flex", alignItems: "center", gap: "10px", padding: "14px 18px", borderRadius: "10px", background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.25)", marginBottom: "32px", fontSize: "13px", color: "var(--text-2)" }}>
          <Lock size={15} color="#F59E0B" style={{ flexShrink: 0 }} />
          <span>{userId ? "This is premium content — unlock full model answers." : "Sign in to unlock full model answers."} Questions themselves are free to read below.</span>
        </div>
      )}

      <div style={{ display: "flex", flexDirection: "column", gap: "24px" }}>
        {questions.map((q) => {
          const answer = modelAnswers.get(q.id);
          return (
            <div key={q.id} id={`q-${q.question_number}`} style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", scrollMarginTop: "20px" }}>
              <div style={{ display: "flex", gap: "10px", alignItems: "baseline", marginBottom: "10px", flexWrap: "wrap" }}>
                <span style={{ fontSize: "12px", fontWeight: 700, color: "var(--text-4)" }}>Q{q.question_number}</span>
                {q.section && <span style={{ fontSize: "11px", color: "var(--text-4)" }}>Section {q.section}</span>}
                <span style={{ fontSize: "11px", color: "#3B82F6", fontWeight: 600 }}>{q.marks} marks</span>
                {q.word_limit && <span style={{ fontSize: "11px", color: "var(--text-4)" }}>~{q.word_limit} words</span>}
              </div>
              <p style={{ fontSize: "14.5px", fontWeight: 600, color: "var(--text-1)", lineHeight: 1.7, marginBottom: "16px" }}>{q.question_text}</p>

              {hasAccess && answer ? (
                <div style={{ borderTop: "1px solid var(--border)", paddingTop: "16px" }}>
                  <div style={{ fontSize: "11px", fontWeight: 700, color: "var(--text-4)", marginBottom: "8px", textTransform: "uppercase", letterSpacing: "0.03em" }}>Model Answer</div>
                  <p style={{ fontSize: "14px", color: "var(--text-2)", lineHeight: 1.8, whiteSpace: "pre-wrap" }}>{answer.model_answer}</p>
                  {answer.examiner_notes && (
                    <div style={{ marginTop: "14px", padding: "12px 14px", borderRadius: "8px", background: "var(--bg-2)" }}>
                      <div style={{ fontSize: "11px", fontWeight: 700, color: "var(--text-4)", marginBottom: "4px" }}>Examiner Notes</div>
                      <p style={{ fontSize: "13px", color: "var(--text-3)", lineHeight: 1.7, margin: 0 }}>{answer.examiner_notes}</p>
                    </div>
                  )}
                </div>
              ) : (
                <div style={{ borderTop: "1px solid var(--border)", paddingTop: "16px", display: "flex", alignItems: "center", gap: "8px", color: "var(--text-4)", fontSize: "13px" }}>
                  <Lock size={13} /> Model answer locked
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
