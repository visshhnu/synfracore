"use client";

import { useState, useTransition } from "react";
import { CheckCircle2 } from "lucide-react";
import QuestionNavigator from "./QuestionNavigator";
import { saveAnswerAction, submitAttemptAction } from "@/app/question-bank/actions";

export type AttemptQuestion = {
  id: string;
  question_text: string;
  options: { id: string; option_text: string }[];
};

type Props = {
  attemptId: string;
  paperSlug: string;
  questions: AttemptQuestion[];
  initialSelections: Record<string, string | null>;
};

// The interactive practice screen. Receives the already-shuffled, text-
// hydrated question list + existing selections as initial server props —
// this component NEVER fetches via the public client itself, since the
// shuffle order is only knowable from the already-created attempt_responses
// rows the server already read. Correctness is never known here — no
// client-side grading exists anywhere in this component, by design (see
// docs/question-bank-schema.sql's answer-security model).
export default function AttemptRunner({ attemptId, paperSlug, questions, initialSelections }: Props) {
  const [selections, setSelections] = useState<Record<string, string | null>>(initialSelections);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [saveFailedFor, setSaveFailedFor] = useState<string | null>(null);
  const [confirmingSubmit, setConfirmingSubmit] = useState(false);
  const [isSubmitting, startSubmitTransition] = useTransition();

  const current = questions[currentIndex];
  const answeredCount = Object.values(selections).filter(Boolean).length;
  const answeredIndexes = new Set(
    questions.map((q, i) => (selections[q.id] ? i : -1)).filter((i) => i >= 0)
  );

  function handleSelect(optionId: string) {
    setSelections((s) => ({ ...s, [current.id]: optionId }));
    setSaveFailedFor(null);
    saveAnswerAction(attemptId, current.id, optionId).then((ok) => {
      if (!ok) setSaveFailedFor(current.id);
    });
  }

  function handleSubmit() {
    if (answeredCount < questions.length && !confirmingSubmit) {
      setConfirmingSubmit(true);
      return;
    }
    startSubmitTransition(() => {
      submitAttemptAction(attemptId, paperSlug);
    });
  }

  return (
    <div style={{ display: "grid", gridTemplateColumns: "260px 1fr", gap: "24px", alignItems: "start" }}>
      {/* Left rail: progress + navigator */}
      <div style={{ position: "sticky", top: "20px" }}>
        <div style={{ marginBottom: "14px", padding: "12px 14px", borderRadius: "10px", background: "var(--bg-2)", border: "1px solid var(--border)" }}>
          <div style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)" }}>{answeredCount} / {questions.length} answered</div>
          <div style={{ height: "6px", borderRadius: "4px", background: "var(--border)", marginTop: "8px", overflow: "hidden" }}>
            <div style={{ height: "100%", width: `${(answeredCount / questions.length) * 100}%`, background: "#3B82F6", transition: "width 0.2s" }} />
          </div>
        </div>
        <QuestionNavigator
          total={questions.length}
          currentIndex={currentIndex}
          answeredIndexes={answeredIndexes}
          onJump={(i) => { setCurrentIndex(i); setConfirmingSubmit(false); }}
        />
      </div>

      {/* Main pane: current question */}
      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "26px" }}>
        <div style={{ fontSize: "12px", color: "var(--text-4)", fontWeight: 700, marginBottom: "10px" }}>Question {currentIndex + 1} of {questions.length}</div>
        <div style={{ fontSize: "15px", fontWeight: 600, color: "var(--text-1)", marginBottom: "20px", lineHeight: 1.6 }}>{current.question_text}</div>

        <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
          {current.options.map((opt) => {
            const isSelected = selections[current.id] === opt.id;
            return (
              <button
                key={opt.id}
                type="button"
                onClick={() => handleSelect(opt.id)}
                style={{
                  display: "flex", alignItems: "center", gap: "10px", textAlign: "left", padding: "12px 14px",
                  borderRadius: "10px", border: `1px solid ${isSelected ? "#3B82F6" : "var(--border)"}`,
                  background: isSelected ? "rgba(59,130,246,0.08)" : "var(--bg-2)",
                  color: "var(--text-2)", fontSize: "13.5px", cursor: "pointer", fontFamily: "inherit",
                }}
              >
                {isSelected && <CheckCircle2 size={15} color="#3B82F6" />}
                {opt.option_text}
              </button>
            );
          })}
        </div>

        {saveFailedFor === current.id && (
          <p style={{ fontSize: "12px", color: "#F87171", marginTop: "10px" }}>⚠️ This answer wasn't saved — check your connection and reselect.</p>
        )}

        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginTop: "24px", paddingTop: "20px", borderTop: "1px solid var(--border)" }}>
          <div style={{ display: "flex", gap: "8px" }}>
            <button type="button" disabled={currentIndex === 0} onClick={() => setCurrentIndex((i) => Math.max(0, i - 1))} className="btn-secondary" style={{ opacity: currentIndex === 0 ? 0.4 : 1 }}>← Prev</button>
            <button type="button" disabled={currentIndex === questions.length - 1} onClick={() => setCurrentIndex((i) => Math.min(questions.length - 1, i + 1))} className="btn-secondary" style={{ opacity: currentIndex === questions.length - 1 ? 0.4 : 1 }}>Next →</button>
          </div>

          <div style={{ textAlign: "right" }}>
            {confirmingSubmit && (
              <p style={{ fontSize: "12px", color: "#F59E0B", marginBottom: "8px" }}>
                {questions.length - answeredCount} question{questions.length - answeredCount === 1 ? "" : "s"} unanswered — submit anyway?
              </p>
            )}
            <button type="button" onClick={handleSubmit} disabled={isSubmitting} className="btn-primary" style={{ opacity: isSubmitting ? 0.6 : 1 }}>
              {isSubmitting ? "Submitting…" : confirmingSubmit ? "Yes, submit" : "Submit exam"}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
