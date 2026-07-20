"use client";

import { useState, useTransition, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import { CheckCircle2, Clock } from "lucide-react";
import QuestionNavigator from "./QuestionNavigator";

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
  /** ISO timestamp, from the persisted paper_attempts.started_at column. */
  startedAt: string;
  /** From question_papers.time_limit_minutes — per-paper, not hardcoded. */
  timeLimitMinutes: number;
};

function formatDuration(totalSeconds: number): string {
  const s = Math.max(0, totalSeconds);
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  return `${h}:${String(m).padStart(2, "0")}:${String(sec).padStart(2, "0")}`;
}

// The interactive practice screen. Receives the already-shuffled, text-
// hydrated question list + existing selections as initial server props —
// this component NEVER fetches via the public client itself, since the
// shuffle order is only knowable from the already-created attempt_responses
// rows the server already read. Correctness is never known here — no
// client-side grading exists anywhere in this component, by design (see
// docs/question-bank-schema.sql's answer-security model).
export default function AttemptRunner({ attemptId, paperSlug, questions, initialSelections, startedAt, timeLimitMinutes }: Props) {
  const router = useRouter();
  const [selections, setSelections] = useState<Record<string, string | null>>(initialSelections);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [saveFailedFor, setSaveFailedFor] = useState<string | null>(null);
  const [confirmingSubmit, setConfirmingSubmit] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [, startNavTransition] = useTransition();

  // Deadline is computed once from the persisted started_at + the paper's
  // own time limit — never reset client-side, so a page reload (including
  // AuthStateSync's own reload mechanism, or just a manual refresh) can't
  // grant extra time or lose track of how much has elapsed.
  const deadlineMs = useRef(new Date(startedAt).getTime() + timeLimitMinutes * 60_000).current;
  const [remainingSeconds, setRemainingSeconds] = useState(() => Math.max(0, Math.round((deadlineMs - Date.now()) / 1000)));
  const autoSubmitFiredRef = useRef(false);

  const current = questions[currentIndex];
  const answeredCount = Object.values(selections).filter(Boolean).length;
  const answeredIndexes = new Set(
    questions.map((q, i) => (selections[q.id] ? i : -1)).filter((i) => i >= 0)
  );

  // Calls the /api/question-bank/save-answer Route Handler via fetch()
  // rather than a Server Action — see docs/audit/06-roadmap.md's 6th
  // symptom entry (2026-07-13): a correctly-dispatched Server Action still
  // 404s on this adapter, from inside Next.js's own action-verification
  // code, before the action body ever runs.
  function handleSelect(optionId: string) {
    setSelections((s) => ({ ...s, [current.id]: optionId }));
    setSaveFailedFor(null);
    fetch("/api/question-bank/save-answer", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ attemptId, questionId: current.id, optionId }),
    })
      .then((res) => res.json())
      .then((data: { ok?: boolean }) => {
        if (!data.ok) setSaveFailedFor(current.id);
      })
      .catch(() => setSaveFailedFor(current.id));
  }

  // Shared by the manual submit button (after the unanswered-questions
  // confirmation step, if needed) and the auto-submit-on-timeout path,
  // which must bypass that confirmation entirely -- time being up is not
  // something the user gets to reconsider. Reuses the same
  // /api/question-bank/submit fetch() endpoint as before; no new
  // dispatch mechanism, no Server Action.
  async function doSubmit() {
    setIsSubmitting(true);
    try {
      const res = await fetch("/api/question-bank/submit", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ attemptId, paperSlug }),
      });
      const data: { redirectTo?: string } = await res.json();
      if (data.redirectTo) {
        startNavTransition(() => router.push(data.redirectTo!));
      } else {
        setIsSubmitting(false);
      }
    } catch {
      setIsSubmitting(false);
    }
  }

  async function handleSubmit() {
    if (answeredCount < questions.length && !confirmingSubmit) {
      setConfirmingSubmit(true);
      return;
    }
    await doSubmit();
  }

  // Ticks every second; remainingSeconds is always re-derived from the
  // fixed deadlineMs (not decremented directly), so drift/tab-throttling
  // can't accumulate error. Auto-submits exactly once when time is up --
  // autoSubmitFiredRef guards against the interval firing doSubmit() more
  // than once while the submit request is in flight.
  useEffect(() => {
    const tick = () => {
      const secondsLeft = Math.max(0, Math.round((deadlineMs - Date.now()) / 1000));
      setRemainingSeconds(secondsLeft);
      if (secondsLeft === 0 && !autoSubmitFiredRef.current) {
        autoSubmitFiredRef.current = true;
        doSubmit();
      }
    };
    tick();
    const id = setInterval(tick, 1000);
    return () => clearInterval(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [deadlineMs]);

  return (
    <div className="attempt-runner-grid" style={{ display: "grid", gridTemplateColumns: "260px 1fr", gap: "24px", alignItems: "start" }}>
      {/* Left rail: progress + navigator */}
      <div style={{ position: "sticky", top: "20px" }}>
        <div
          style={{
            marginBottom: "14px", padding: "12px 14px", borderRadius: "10px",
            background: remainingSeconds <= 300 ? "rgba(239,68,68,0.1)" : "var(--bg-2)",
            border: `1px solid ${remainingSeconds <= 300 ? "#EF4444" : "var(--border)"}`,
            display: "flex", alignItems: "center", gap: "8px",
          }}
        >
          <Clock size={16} color={remainingSeconds <= 300 ? "#EF4444" : "var(--text-3)"} />
          <span style={{ fontSize: "16px", fontWeight: 700, fontFamily: "monospace", color: remainingSeconds <= 300 ? "#EF4444" : "var(--text-1)" }}>
            {formatDuration(remainingSeconds)}
          </span>
          <span style={{ fontSize: "11px", color: "var(--text-4)" }}>remaining</span>
        </div>
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
          <p style={{ fontSize: "12px", color: "#F87171", marginTop: "10px" }}>⚠️ This answer wasn&apos;t saved — check your connection and reselect.</p>
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
