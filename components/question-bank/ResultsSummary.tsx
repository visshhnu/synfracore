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
// Subject breakdown + "Areas for Improvement" only render for papers that
// actually carry subject data on ≥2 distinct subjects — most papers
// (single-subject certs) have subject=null on every question, and a
// subject table would be meaningless noise for those.
type SubjectStat = {
  subject: string;
  attempted: number;
  correct: number;
  incorrect: number;
  skipped: number;
  score: number;
  accuracy: number;
  // Question numbers (1-based, matching the numbering already shown per
  // question below) that need review — wrong or skipped — for the
  // Areas for Improvement jump grid.
  needsReview: { questionNumber: number; status: "incorrect" | "skipped" }[];
};

function buildSubjectStats(results: AttemptResults): SubjectStat[] {
  const bySubject = new Map<string, SubjectStat>();
  results.questions.forEach((q, i) => {
    if (!q.subject) return;
    const stat = bySubject.get(q.subject) ?? {
      subject: q.subject, attempted: 0, correct: 0, incorrect: 0, skipped: 0, score: 0, accuracy: 0, needsReview: [],
    };
    const isAnswered = q.selectedOptionId !== null || q.selectedNumericAnswer !== null;
    if (!isAnswered) {
      stat.skipped++;
      stat.needsReview.push({ questionNumber: i + 1, status: "skipped" });
    } else {
      stat.attempted++;
      if (q.isCorrect) {
        stat.correct++;
        stat.score += results.positiveMarks;
      } else {
        stat.incorrect++;
        stat.score -= results.negativeMarks;
        stat.needsReview.push({ questionNumber: i + 1, status: "incorrect" });
      }
    }
    bySubject.set(q.subject, stat);
  });
  for (const stat of bySubject.values()) {
    stat.accuracy = stat.attempted > 0 ? Math.round((stat.correct / stat.attempted) * 100) : 0;
  }
  return Array.from(bySubject.values());
}

// Static circular progress ring — pure SVG, no client JS needed, so this
// stays inside ResultsSummary's own Server Component (results are already
// fully known at render time, nothing here is interactive).
function ScoreGauge({ pct, color, size = 132 }: { pct: number; color: string; size?: number }) {
  const stroke = 10;
  const radius = (size - stroke) / 2;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference * (1 - Math.min(100, Math.max(0, pct)) / 100);
  return (
    <svg width={size} height={size} viewBox={`0 0 ${size} ${size}`} role="img" aria-label={`${pct}% score`}>
      <circle
        cx={size / 2} cy={size / 2} r={radius}
        fill="none" stroke="var(--border)" strokeWidth={stroke}
      />
      <circle
        cx={size / 2} cy={size / 2} r={radius}
        fill="none" stroke={color} strokeWidth={stroke} strokeLinecap="round"
        strokeDasharray={circumference} strokeDashoffset={offset}
        transform={`rotate(-90 ${size / 2} ${size / 2})`}
        style={{ transition: "stroke-dashoffset 0.6s ease" }}
      />
    </svg>
  );
}

export default function ResultsSummary({ results }: Props) {
  const pct = results.maxScore > 0 ? Math.round((results.score / results.maxScore) * 100) : 0;
  const minutes = results.timeTakenSeconds != null ? Math.round(results.timeTakenSeconds / 60) : null;
  const answeredPct = results.total > 0 ? Math.round((results.answeredCount / results.total) * 100) : 100;
  const subjectStats = buildSubjectStats(results);
  const hasSubjectBreakdown = subjectStats.length >= 2;
  const scoreColor = pct >= 70 ? "#10B981" : pct >= 50 ? "#F59E0B" : "#EF4444";

  return (
    <div>
      <div style={{ padding: "28px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", marginBottom: "20px", display: "flex", flexDirection: "column", alignItems: "center", gap: "16px" }}>
        <div style={{ position: "relative", width: "132px", height: "132px" }}>
          <ScoreGauge pct={pct} color={scoreColor} />
          <div style={{ position: "absolute", inset: 0, display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center" }}>
            <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "26px", fontWeight: 800, color: scoreColor, lineHeight: 1 }}>{pct}%</div>
            <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "3px" }}>{results.score}/{results.maxScore}</div>
          </div>
        </div>
        <div style={{ fontSize: "14px", color: "var(--text-3)" }}>
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

      {hasSubjectBreakdown && (
        <div style={{ marginBottom: "24px" }}>
          <h2 style={{ fontSize: "15px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px" }}>Subject-wise breakdown</h2>
          <div style={{ overflowX: "auto", borderRadius: "12px", border: "1px solid var(--border)" }}>
            <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "12.5px" }}>
              <thead>
                <tr style={{ background: "var(--bg-2)", textAlign: "left" }}>
                  <th style={{ padding: "10px 14px" }}>Subject</th>
                  <th style={{ padding: "10px 14px" }}>Attempted</th>
                  <th style={{ padding: "10px 14px" }}>Correct</th>
                  <th style={{ padding: "10px 14px" }}>Incorrect</th>
                  <th style={{ padding: "10px 14px" }}>Score</th>
                  <th style={{ padding: "10px 14px" }}>Accuracy</th>
                </tr>
              </thead>
              <tbody>
                {subjectStats.map((s) => (
                  <tr key={s.subject} style={{ borderTop: "1px solid var(--border)" }}>
                    <td style={{ padding: "10px 14px", fontWeight: 600, color: "var(--text-1)" }}>{s.subject}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-3)" }}>{s.attempted}/{s.attempted + s.skipped}</td>
                    <td style={{ padding: "10px 14px", color: "#10B981" }}>{s.correct}</td>
                    <td style={{ padding: "10px 14px", color: "#EF4444" }}>{s.incorrect}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-2)" }}>{s.score}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-2)" }}>{s.accuracy}%</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {hasSubjectBreakdown && subjectStats.some((s) => s.needsReview.length > 0) && (
        <div style={{ marginBottom: "24px" }}>
          <h2 style={{ fontSize: "15px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px" }}>Areas for improvement</h2>
          <div style={{ display: "flex", flexDirection: "column", gap: "12px" }}>
            {subjectStats.filter((s) => s.needsReview.length > 0).map((s) => (
              <div key={s.subject} style={{ padding: "16px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
                <div style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px" }}>
                  {s.subject} <span style={{ fontWeight: 400, color: "var(--text-4)" }}>· {s.needsReview.length} to review</span>
                </div>
                <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
                  {s.needsReview.map(({ questionNumber, status }) => (
                    <a
                      key={questionNumber}
                      href={`#result-q-${questionNumber}`}
                      style={{
                        display: "flex", alignItems: "center", justifyContent: "center", width: "32px", height: "32px",
                        borderRadius: "6px", fontSize: "12px", fontWeight: 700, textDecoration: "none",
                        border: `1px solid ${status === "incorrect" ? "rgba(239,68,68,0.3)" : "var(--border)"}`,
                        background: status === "incorrect" ? "rgba(239,68,68,0.1)" : "var(--bg-2)",
                        color: status === "incorrect" ? "#EF4444" : "var(--text-3)",
                      }}
                    >
                      {questionNumber}
                    </a>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      <div style={{ display: "flex", flexDirection: "column", gap: "18px" }}>
        {results.questions.map((q, i) => (
          <div key={q.id} id={`result-q-${i + 1}`} style={{ padding: "20px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)", scrollMarginTop: "20px" }}>
            <div style={{ display: "flex", alignItems: "flex-start", gap: "10px", marginBottom: "12px" }}>
              {q.reviewLocked ? <Lock size={17} color="var(--text-4)" style={{ marginTop: "2px", flexShrink: 0 }} />
                : q.isCorrect ? <CheckCircle2 size={17} color="#10B981" style={{ marginTop: "2px", flexShrink: 0 }} />
                : (q.selectedOptionId || q.selectedNumericAnswer !== null) ? <XCircle size={17} color="#EF4444" style={{ marginTop: "2px", flexShrink: 0 }} />
                : <MinusCircle size={17} color="var(--text-4)" style={{ marginTop: "2px", flexShrink: 0 }} />}
              <div style={{ fontSize: "13.5px", fontWeight: 600, color: "var(--text-1)", lineHeight: 1.6 }}>{i + 1}. {q.question_text}</div>
            </div>

            {q.reviewLocked ? (
              <p style={{ fontSize: "12.5px", color: "var(--text-4)", marginLeft: "27px", fontStyle: "italic" }}>
                Not answered — complete more of the paper to unlock this question&apos;s review.
              </p>
            ) : (
              <>
                {q.answerType === "numeric" ? (
                  <div style={{ display: "flex", flexDirection: "column", gap: "6px", marginLeft: "27px" }}>
                    <div
                      style={{
                        padding: "8px 12px", borderRadius: "8px", fontSize: "13px", color: "var(--text-2)",
                        border: `1px solid ${q.isCorrect ? "#10B981" : q.selectedNumericAnswer !== null ? "#EF4444" : "var(--border)"}`,
                        background: q.isCorrect ? "rgba(16,185,129,0.08)" : q.selectedNumericAnswer !== null ? "rgba(239,68,68,0.08)" : "var(--bg-2)",
                      }}
                    >
                      Your answer: {q.selectedNumericAnswer !== null ? q.selectedNumericAnswer : "Not answered"}
                    </div>
                    {!q.isCorrect && (
                      <div style={{ padding: "8px 12px", borderRadius: "8px", border: "1px solid #10B981", background: "rgba(16,185,129,0.08)", fontSize: "13px", color: "var(--text-2)" }}>
                        Correct answer: {q.correctNumericAnswer}
                      </div>
                    )}
                  </div>
                ) : (
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
                )}

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
