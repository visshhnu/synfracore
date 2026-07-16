"use client";
import { useEffect, useState } from "react";
import { CheckCircle2, XCircle, Sparkles } from "lucide-react";
import { useSupabaseClient } from "@/lib/supabase/client";
import { getQuizQuestions, submitQuizAttempt, type QuizQuestion } from "@/lib/supabase/queries";
import { useAuth } from "@clerk/nextjs";

type Props = {
  academy: string;
  technology: string;
  section: string;
  techName: string;
  accentColor: string;
};

// Renders nothing if no questions exist yet for this academy/technology/section
// — every important section should eventually reach 5 questions (Phase 6 of
// the learner-platform build), but this must degrade to invisible, not an
// empty placeholder box, everywhere that hasn't been reached yet.
export default function SectionQuiz({ academy, technology, section, techName, accentColor }: Props) {
  const supabase = useSupabaseClient();
  const { userId, isLoaded } = useAuth();
  const [questions, setQuestions] = useState<QuizQuestion[] | null>(null);
  const [answers, setAnswers] = useState<Record<string, number>>({});
  const [submitted, setSubmitted] = useState(false);
  const [saving, setSaving] = useState(false);
  const [saveFailed, setSaveFailed] = useState(false);

  useEffect(() => {
    let cancelled = false;
    getQuizQuestions(supabase, academy, technology, section).then(qs => {
      if (!cancelled) setQuestions(qs);
    });
    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [academy, technology, section]);

  if (!questions || questions.length === 0) return null;

  const allAnswered = questions.every(q => answers[q.id] !== undefined);
  const score = questions.reduce((s, q) => s + (answers[q.id] === q.correct_index ? 1 : 0), 0);

  const handleSubmit = async () => {
    setSubmitted(true);
    if (!isLoaded || !userId) return;
    setSaving(true);
    const ok = await submitQuizAttempt(supabase, userId, {
      academySlug: academy,
      technologySlug: technology,
      sectionSlug: section,
      score,
      total: questions.length,
      answers: questions.map(q => ({ questionId: q.id, selectedIndex: answers[q.id], correct: answers[q.id] === q.correct_index })),
    });
    setSaving(false);
    setSaveFailed(!ok);
  };

  return (
    <div style={{ marginTop: "40px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
      <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "18px" }}>
        <Sparkles size={16} color={accentColor} />
        <span style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)" }}>Check your understanding — {techName}</span>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "20px" }}>
        {questions.map((q, qi) => {
          const selected = answers[q.id];
          return (
            <div key={q.id}>
              <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)", marginBottom: "10px" }}>
                {qi + 1}. {q.question}
              </div>
              <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
                {q.options.map((opt, oi) => {
                  const isSelected = selected === oi;
                  const isCorrect = oi === q.correct_index;
                  let borderColor = "var(--border)";
                  let bg = "var(--bg-1)";
                  if (submitted) {
                    if (isCorrect) { borderColor = "#10B981"; bg = "rgba(16,185,129,0.08)"; }
                    else if (isSelected && !isCorrect) { borderColor = "#EF4444"; bg = "rgba(239,68,68,0.08)"; }
                  } else if (isSelected) {
                    borderColor = accentColor;
                    bg = `${accentColor}14`;
                  }
                  return (
                    <button key={oi} type="button" disabled={submitted}
                      onClick={() => setAnswers(a => ({ ...a, [q.id]: oi }))}
                      style={{
                        display: "flex", alignItems: "center", gap: "8px", textAlign: "left", padding: "9px 12px",
                        borderRadius: "8px", border: `1px solid ${borderColor}`, background: bg,
                        color: "var(--text-2)", fontSize: "13px", cursor: submitted ? "default" : "pointer", fontFamily: "inherit",
                      }}>
                      {submitted && isCorrect && <CheckCircle2 size={14} color="#10B981" />}
                      {submitted && isSelected && !isCorrect && <XCircle size={14} color="#EF4444" />}
                      {opt}
                    </button>
                  );
                })}
              </div>
              {submitted && q.explanation && (
                <p style={{ fontSize: "12px", color: "var(--text-4)", marginTop: "8px", lineHeight: 1.6 }}>💡 {q.explanation}</p>
              )}
            </div>
          );
        })}
      </div>

      {!submitted ? (
        <button onClick={handleSubmit} disabled={!allAnswered}
          style={{ marginTop: "18px", padding: "10px 22px", borderRadius: "8px", border: "none", background: allAnswered ? accentColor : "var(--border)", color: "#fff", fontSize: "13px", fontWeight: 700, cursor: allAnswered ? "pointer" : "default", opacity: allAnswered ? 1 : 0.5 }}>
          Submit answers
        </button>
      ) : (
        <div style={{ marginTop: "18px", padding: "12px 16px", borderRadius: "10px", background: `${accentColor}10`, border: `1px solid ${accentColor}30`, fontSize: "13px", fontWeight: 700, color: "var(--text-1)" }}>
          You scored {score}/{questions.length} {saving && "— saving…"}
          {!userId && isLoaded && <span style={{ fontWeight: 400, color: "var(--text-4)", display: "block", marginTop: "4px" }}>Sign in to save your quiz results to your dashboard.</span>}
          {saveFailed && userId && <span style={{ fontWeight: 400, color: "#F87171", display: "block", marginTop: "4px" }}>⚠️ Your score wasn&apos;t saved — a connection or database issue. Your answers above are still correct, this attempt just won&apos;t show up on your dashboard.</span>}
        </div>
      )}
    </div>
  );
}
