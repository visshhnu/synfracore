"use client";
import { useState } from "react";

interface Question {
  q: string;
  opts: string[];
  ans: number;
  exp: string;
}

interface Props {
  questions: Question[];
  techName: string;
  accentColor?: string;
}

export default function QuickQuiz({ questions, techName, accentColor = "#6366F1" }: Props) {
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [score, setScore] = useState(0);
  const [done, setDone] = useState(false);
  const [answers, setAnswers] = useState<(number | null)[]>(Array(questions.length).fill(null));

  const q = questions[current];

  const choose = (i: number) => {
    if (selected !== null) return;
    setSelected(i);
    const updated = [...answers];
    updated[current] = i;
    setAnswers(updated);
    if (i === q.ans) setScore(s => s + 1);
  };

  const next = () => {
    if (current < questions.length - 1) {
      setCurrent(c => c + 1);
      setSelected(answers[current + 1] !== null ? answers[current + 1] : null);
    } else {
      setDone(true);
    }
  };

  const restart = () => {
    setCurrent(0);
    setSelected(null);
    setScore(0);
    setDone(false);
    setAnswers(Array(questions.length).fill(null));
  };

  const pct = Math.round((score / questions.length) * 100);

  if (done) return (
    <div style={{ padding: "28px", borderRadius: "14px", border: `2px solid ${accentColor}30`, background: accentColor + "06", textAlign: "center" }}>
      <div style={{ fontSize: "48px", marginBottom: "12px" }}>
        {pct >= 80 ? "🏆" : pct >= 60 ? "📈" : "📚"}
      </div>
      <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 800, fontSize: "22px", marginBottom: "8px" }}>
        {pct >= 80 ? "Excellent!" : pct >= 60 ? "Good job!" : "Keep studying!"}
      </h3>
      <p style={{ color: "var(--text-3)", marginBottom: "16px" }}>
        You scored <strong style={{ color: accentColor }}>{score} / {questions.length}</strong> ({pct}%) on {techName}
      </p>
      <div style={{ display: "flex", gap: "8px", justifyContent: "center", marginBottom: "20px" }}>
        {questions.map((_, i) => (
          <div key={i} style={{ width: "28px", height: "28px", borderRadius: "50%", background: answers[i] === questions[i].ans ? "#10B981" : "#EF4444", display: "flex", alignItems: "center", justifyContent: "center", fontSize: "14px" }}>
            {answers[i] === questions[i].ans ? "✓" : "✗"}
          </div>
        ))}
      </div>
      {pct < 80 && (
        <p style={{ fontSize: "13px", color: "var(--text-4)", marginBottom: "16px" }}>
          Review the material above and try again to improve your score.
        </p>
      )}
      <button onClick={restart} style={{ padding: "10px 24px", borderRadius: "8px", background: accentColor, color: "white", border: "none", cursor: "pointer", fontWeight: 700, fontSize: "14px" }}>
        Try Again
      </button>
    </div>
  );

  return (
    <div style={{ padding: "24px", borderRadius: "14px", border: `1px solid ${accentColor}25`, background: "var(--bg-1)" }}>
      {/* Header */}
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "20px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
          <span style={{ fontSize: "18px" }}>✅</span>
          <span style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "15px" }}>
            Quick Check — {techName}
          </span>
        </div>
        <span style={{ fontSize: "12px", color: "var(--text-4)", background: "var(--bg-2)", padding: "3px 10px", borderRadius: "20px" }}>
          {current + 1} / {questions.length}
        </span>
      </div>

      {/* Progress bar */}
      <div style={{ height: "4px", background: "var(--border)", borderRadius: "2px", marginBottom: "20px" }}>
        <div style={{ height: "4px", background: accentColor, borderRadius: "2px", width: `${((current + (selected !== null ? 1 : 0)) / questions.length) * 100}%`, transition: "width 0.3s" }} />
      </div>

      {/* Question */}
      <p style={{ fontWeight: 600, fontSize: "15px", lineHeight: 1.6, marginBottom: "16px", color: "var(--text-1)" }}>
        {q.q}
      </p>

      {/* Options */}
      <div style={{ display: "flex", flexDirection: "column", gap: "8px", marginBottom: "16px" }}>
        {q.opts.map((opt, i) => {
          let bg = "var(--bg-2)";
          let border = "1px solid var(--border)";
          let color = "var(--text-2)";
          if (selected !== null) {
            if (i === q.ans) { bg = "rgba(16,185,129,0.12)"; border = "1px solid #10B981"; color = "#10B981"; }
            else if (i === selected && selected !== q.ans) { bg = "rgba(239,68,68,0.1)"; border = "1px solid #EF4444"; color = "#EF4444"; }
          } else if (selected === null) {
            // hover handled via className
          }
          return (
            <button key={i} onClick={() => choose(i)} style={{
              padding: "12px 16px", borderRadius: "8px", border, background: bg,
              color, cursor: selected !== null ? "default" : "pointer",
              textAlign: "left", fontSize: "14px", fontWeight: selected === i ? 600 : 400,
              transition: "all 0.15s", display: "flex", alignItems: "center", gap: "10px"
            }}>
              <span style={{ width: "22px", height: "22px", borderRadius: "50%", border: `2px solid ${selected !== null && i === q.ans ? "#10B981" : "var(--border)"}`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "12px", flexShrink: 0, fontWeight: 700 }}>
                {selected !== null && i === q.ans ? "✓" : selected === i && i !== q.ans ? "✗" : String.fromCharCode(65 + i)}
              </span>
              {opt}
            </button>
          );
        })}
      </div>

      {/* Explanation */}
      {selected !== null && (
        <div style={{ padding: "12px 16px", borderRadius: "8px", background: selected === q.ans ? "rgba(16,185,129,0.08)" : "rgba(59,130,246,0.08)", border: `1px solid ${selected === q.ans ? "#10B981" : "#3B82F6"}22`, marginBottom: "16px" }}>
          <p style={{ fontSize: "13px", color: "var(--text-2)", margin: 0, lineHeight: 1.6 }}>
            <strong style={{ color: selected === q.ans ? "#10B981" : "#3B82F6" }}>
              {selected === q.ans ? "✓ Correct! " : "✗ Not quite. "}
            </strong>
            {q.exp}
          </p>
        </div>
      )}

      {/* Next button */}
      <div style={{ display: "flex", justifyContent: "flex-end" }}>
        <button onClick={next} disabled={selected === null} style={{
          padding: "10px 24px", borderRadius: "8px", background: selected !== null ? accentColor : "var(--border)",
          color: selected !== null ? "white" : "var(--text-4)", border: "none",
          cursor: selected !== null ? "pointer" : "not-allowed", fontWeight: 700, fontSize: "14px"
        }}>
          {current < questions.length - 1 ? "Next →" : "See Results"}
        </button>
      </div>
    </div>
  );
}
