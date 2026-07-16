import { CheckCircle2, XCircle, MinusCircle, Lock } from "lucide-react";
import type { AttemptResults } from "@/lib/supabase/questionBank";

type Props = { results: AttemptResults };

// Server Component — all data here is already known/safe post-submission
// (fetched via the service-role client inside the results page, ownership
// already checked there). No client-side comparison logic at all; this
// component only ever renders what the server already graded.
//
// reviewLocked questions (unanswered, attempt didn't hit the completion
// threshold — see FULL_REVIEW_COMPLETION_THRESHOLD in questionBank.ts) are
// rendered with no options, no highlighting, no explanation — not because
// the UI is hiding them, but because getAttemptResults() never populated
// correctOptionId/explanation/sourceNote for these in the first place.
export default function ResultsSummary({ results }: Props) {
  const pct = results.total > 0 ? Math.round((results.score / results.total) * 100) : 0;
  const minutes = results.timeTakenSeconds != null ? Math.round(results.timeTakenSeconds / 60) : null;
  const answeredPct = results.total > 0 ? Math.round((results.answeredCount / results.total) * 100) : 100;

  return (
    <div>
      <div style={{ padding: "28px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", marginBottom: "20px", textAlign: "center" }}>
        <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "42px", fontWeight: 800, color: pct >= 70 ? "#10B981" : pct >= 50 ? "#F59E0B" : "#EF4444" }}>
          {results.score}/{results.total}
        </div>
        <div style={{ fontSize: "14px", color: "var(--text-3)", marginTop: "6px" }}>
          {pct}% correct{minutes != null ? ` · ${minutes} min` : ""}
        </div>
      </div>

      {!results.fullReviewUnlocked && (
        <div style={{ display: "flex", alignItems: "center", gap: "10px", padding: "14px 18px", borderRadius: "10px", background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.25)", marginBottom: "24px", fontSize: "13px", color: "var(--text-2)" }}>
          <Lock size={15} color="#F59E0B" style={{ flexShrink: 0 }} />
          <span>
            You answered {results.answeredCount}/{results.total} questions ({answeredPct}%). Answer at least 80% of the paper to unlock full review of every question.
          </span>
        </div>
      )}

      <div style={{ display: "flex", flexDirection: "column", gap: "18px" }}>
        {results.questions.map((q, i) => (
          <div key={q.id} style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
            <div style={{ display: "flex", alignItems: "flex-start", gap: "10px", marginBottom: "12px" }}>
              {q.reviewLocked ? <Lock size={17} color="var(--text-4)" style={{ marginTop: "2px", flexShrink: 0 }} />
                : q.isCorrect ? <CheckCircle2 size={17} color="#10B981" style={{ marginTop: "2px", flexShrink: 0 }} />
                : q.selectedOptionId ? <XCircle size={17} color="#EF4444" style={{ marginTop: "2px", flexShrink: 0 }} />
                : <MinusCircle size={17} color="var(--text-4)" style={{ marginTop: "2px", flexShrink: 0 }} />}
              <div style={{ fontSize: "13.5px", fontWeight: 600, color: "var(--text-1)", lineHeight: 1.6 }}>{i + 1}. {q.question_text}</div>
            </div>

            {q.reviewLocked ? (
              <p style={{ fontSize: "12.5px", color: "var(--text-4)", marginLeft: "27px", fontStyle: "italic" }}>
                Not answered — complete more of the paper to unlock this question&apos;s review.
              </p>
            ) : (
              <>
                <div style={{ display: "flex", flexDirection: "column", gap: "6px", marginLeft: "27px" }}>
                  {q.options.map((opt) => {
                    const isCorrectOption = opt.id === q.correctOptionId;
                    const isSelected = opt.id === q.selectedOptionId;
                    let border = "1px solid var(--border)";
                    let bg = "var(--bg-2)";
                    if (isCorrectOption) { border = "1px solid #10B981"; bg = "rgba(16,185,129,0.08)"; }
                    else if (isSelected && !isCorrectOption) { border = "1px solid #EF4444"; bg = "rgba(239,68,68,0.08)"; }
                    return (
                      <div key={opt.id} style={{ display: "flex", alignItems: "center", gap: "8px", padding: "8px 12px", borderRadius: "8px", border, background: bg, fontSize: "13px", color: "var(--text-2)" }}>
                        {isCorrectOption && <CheckCircle2 size={13} color="#10B981" />}
                        {isSelected && !isCorrectOption && <XCircle size={13} color="#EF4444" />}
                        {opt.option_text}
                      </div>
                    );
                  })}
                </div>

                {q.explanation && (
                  <p style={{ fontSize: "12.5px", color: "var(--text-4)", marginTop: "12px", marginLeft: "27px", lineHeight: 1.7 }}>💡 {q.explanation}</p>
                )}
                {q.sourceNote && (
                  <p style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "6px", marginLeft: "27px", fontStyle: "italic" }}>{q.sourceNote}</p>
                )}
              </>
            )}
          </div>
        ))}
      </div>
    </div>
  );
}
