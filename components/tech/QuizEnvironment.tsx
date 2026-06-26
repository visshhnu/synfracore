"use client";
import { useState, useEffect, useCallback } from "react";
import { CheckCircle, XCircle, RotateCcw, ChevronRight, Trophy, BookOpen, Zap, Target, Clock, Star } from "lucide-react";

// ─────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────
type QuizQuestion = {
  id: string;
  question: string;
  options: string[];
  correct: number;       // index of correct option
  explanation: string;
  topic?: string;
  difficulty?: "Easy" | "Medium" | "Hard";
};

type Flashcard = {
  id: string;
  front: string;
  back: string;
  category?: string;
};

type QuizSet = {
  id: string;
  title: string;
  type: "mcq" | "flashcard" | "fillblank";
  description: string;
  questions?: QuizQuestion[];
  flashcards?: Flashcard[];
  timeLimit?: number;   // seconds per question
};

type Props = {
  sets: QuizSet[];
  accentColor?: string;
  techName?: string;
};

// ─────────────────────────────────────────────────────────
// MCQ Quiz Component
// ─────────────────────────────────────────────────────────
function MCQQuiz({ set, accentColor, onComplete }: { set: QuizSet; accentColor: string; onComplete: (score: number, total: number) => void }) {
  const questions = set.questions || [];
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [answered, setAnswered] = useState(false);
  const [score, setScore] = useState(0);
  const [answers, setAnswers] = useState<(number | null)[]>(new Array(questions.length).fill(null));
  const [timeLeft, setTimeLeft] = useState(set.timeLimit || 0);
  const [finished, setFinished] = useState(false);
  const [showReview, setShowReview] = useState(false);

  const q = questions[current];

  useEffect(() => {
    if (!set.timeLimit || answered || finished) return;
    const timer = setInterval(() => {
      setTimeLeft(t => {
        if (t <= 1) {
          clearInterval(timer);
          handleAnswer(-1); // Time up
          return 0;
        }
        return t - 1;
      });
    }, 1000);
    return () => clearInterval(timer);
  }, [current, answered, set.timeLimit]);

  useEffect(() => {
    if (set.timeLimit) setTimeLeft(set.timeLimit);
  }, [current]);

  const handleAnswer = (idx: number) => {
    if (answered) return;
    setSelected(idx);
    setAnswered(true);
    const correct = idx === q.correct;
    if (correct) setScore(s => s + 1);
    const newAnswers = [...answers];
    newAnswers[current] = idx;
    setAnswers(newAnswers);
  };

  const next = () => {
    if (current + 1 >= questions.length) {
      setFinished(true);
      onComplete(score + (selected === q.correct ? 1 : 0), questions.length);
      return;
    }
    setCurrent(c => c + 1);
    setSelected(null);
    setAnswered(false);
  };

  const pct = Math.round(((current + (answered ? 1 : 0)) / questions.length) * 100);

  if (finished && !showReview) {
    const finalScore = answers.filter((a, i) => a === questions[i].correct).length;
    const pctScore = Math.round((finalScore / questions.length) * 100);
    const grade = pctScore >= 90 ? "Excellent!" : pctScore >= 75 ? "Good job!" : pctScore >= 60 ? "Keep practicing!" : "Review the material";
    const gradeColor = pctScore >= 90 ? "#3FB950" : pctScore >= 75 ? accentColor : pctScore >= 60 ? "#F59E0B" : "#F85149";
    return (
      <div style={{ textAlign: "center", padding: "40px 20px" }}>
        <div style={{ fontSize: "72px", marginBottom: "16px" }}>
          {pctScore >= 90 ? "[C]" : pctScore >= 75 ? ">" : pctScore >= 60 ? ">" : ">"}
        </div>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "28px", fontWeight: 800, color: gradeColor, marginBottom: "8px" }}>{grade}</h3>
        <div style={{ fontSize: "48px", fontWeight: 800, color: gradeColor, marginBottom: "8px" }}>{pctScore}%</div>
        <p style={{ color: "var(--text-4)", marginBottom: "32px" }}>{finalScore} / {questions.length} correct</p>
        <div style={{ display: "flex", gap: "12px", justifyContent: "center", flexWrap: "wrap" }}>
          <button onClick={() => setShowReview(true)}
            style={{ background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-1)", padding: "12px 24px", borderRadius: "10px", cursor: "pointer", fontSize: "14px", fontWeight: 600, display: "flex", alignItems: "center", gap: "6px" }}>
            <BookOpen size={16}/> Review Answers
          </button>
          <button onClick={() => { setCurrent(0); setSelected(null); setAnswered(false); setScore(0); setAnswers(new Array(questions.length).fill(null)); setFinished(false); }}
            style={{ background: accentColor, border: "none", color: "#fff", padding: "12px 24px", borderRadius: "10px", cursor: "pointer", fontSize: "14px", fontWeight: 600, display: "flex", alignItems: "center", gap: "6px" }}>
            <RotateCcw size={16}/> Retry Quiz
          </button>
        </div>
      </div>
    );
  }

  if (showReview) {
    return (
      <div>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "24px" }}>
          <h4 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px" }}>Answer Review</h4>
          <button onClick={() => setShowReview(false)} style={{ background: "none", border: "1px solid var(--border)", color: "var(--text-4)", padding: "6px 16px", borderRadius: "8px", cursor: "pointer", fontSize: "13px" }}>← Back</button>
        </div>
        {questions.map((q, i) => {
          const userAns = answers[i];
          const correct = userAns === q.correct;
          return (
            <div key={q.id} style={{ marginBottom: "20px", padding: "20px", background: "var(--bg-1)", border: `1px solid ${correct ? "#3FB95033" : "#F8514933"}`, borderRadius: "12px" }}>
              <div style={{ display: "flex", gap: "10px", marginBottom: "12px" }}>
                {correct ? <CheckCircle size={18} color="#3FB950" style={{ flexShrink: 0, marginTop: 2 }}/> : <XCircle size={18} color="#F85149" style={{ flexShrink: 0, marginTop: 2 }}/>}
                <strong style={{ fontSize: "14px" }}>Q{i+1}: {q.question}</strong>
              </div>
              {q.options.map((opt, oi) => (
                <div key={oi} style={{
                  padding: "8px 14px", marginBottom: "6px", borderRadius: "8px", fontSize: "13px",
                  background: oi === q.correct ? "#3FB95022" : oi === userAns && !correct ? "#F8514922" : "transparent",
                  border: `1px solid ${oi === q.correct ? "#3FB95044" : oi === userAns && !correct ? "#F8514944" : "var(--border)"}`,
                  color: oi === q.correct ? "#3FB950" : oi === userAns && !correct ? "#F85149" : "var(--text-3)",
                }}>
                  {oi === q.correct ? "✓ " : oi === userAns && !correct ? "✗ " : "  "}{opt}
                </div>
              ))}
              <div style={{ marginTop: "10px", padding: "10px 14px", background: `${accentColor}11`, border: `1px solid ${accentColor}22`, borderRadius: "8px", fontSize: "13px", color: "var(--text-3)" }}>
                [R] {q.explanation}
              </div>
            </div>
          );
        })}
      </div>
    );
  }

  return (
    <div>
      {/* Progress */}
      <div style={{ marginBottom: "24px" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "8px" }}>
          <span style={{ fontSize: "13px", color: "var(--text-4)" }}>Question {current + 1} of {questions.length}</span>
          <div style={{ display: "flex", alignItems: "center", gap: "16px" }}>
            {q.topic && <span style={{ fontSize: "11px", background: `${accentColor}22`, color: accentColor, padding: "2px 8px", borderRadius: "4px" }}>{q.topic}</span>}
            {q.difficulty && <span style={{ fontSize: "11px", color: q.difficulty === "Hard" ? "#F85149" : q.difficulty === "Medium" ? "#F59E0B" : "#3FB950" }}>{q.difficulty}</span>}
            {set.timeLimit && <span style={{ fontSize: "14px", fontWeight: 700, color: timeLeft <= 5 ? "#F85149" : "var(--text-3)", display: "flex", alignItems: "center", gap: "4px" }}><Clock size={14}/>{timeLeft}s</span>}
            <span style={{ fontSize: "13px", color: "#3FB950", fontWeight: 600 }}>Score: {score}</span>
          </div>
        </div>
        <div style={{ height: "4px", background: "var(--bg-2)", borderRadius: "2px" }}>
          <div style={{ width: `${pct}%`, height: "100%", background: accentColor, borderRadius: "2px", transition: "width 0.3s" }}/>
        </div>
      </div>

      {/* Question */}
      <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "28px", marginBottom: "20px" }}>
        <p style={{ fontSize: "17px", fontWeight: 600, lineHeight: 1.7, margin: 0, fontFamily: "'Plus Jakarta Sans',sans-serif" }}>{q.question}</p>
      </div>

      {/* Options */}
      <div style={{ display: "flex", flexDirection: "column", gap: "10px", marginBottom: "24px" }}>
        {q.options.map((opt, i) => {
          let bg = "var(--bg-1)", border = "var(--border)", color = "var(--text-2)";
          if (answered) {
            if (i === q.correct) { bg = "#3FB95022"; border = "#3FB950"; color = "#3FB950"; }
            else if (i === selected) { bg = "#F8514922"; border = "#F85149"; color = "#F85149"; }
          } else if (selected === i) {
            bg = `${accentColor}22`; border = accentColor; color = accentColor;
          }
          return (
            <button key={i} onClick={() => handleAnswer(i)} disabled={answered}
              style={{ background: bg, border: `2px solid ${border}`, color, padding: "16px 20px", borderRadius: "12px", cursor: answered ? "default" : "pointer", textAlign: "left", fontSize: "14px", fontWeight: 500, transition: "all 0.15s", display: "flex", alignItems: "center", gap: "12px" }}>
              <span style={{ width: "28px", height: "28px", borderRadius: "50%", background: `${border}22`, border: `1px solid ${border}`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "12px", fontWeight: 700, flexShrink: 0 }}>
                {answered && i === q.correct ? "✓" : answered && i === selected && i !== q.correct ? "✗" : String.fromCharCode(65 + i)}
              </span>
              {opt}
            </button>
          );
        })}
      </div>

      {/* Explanation */}
      {answered && (
        <div style={{ background: selected === q.correct ? "#3FB95011" : "#F8514911", border: `1px solid ${selected === q.correct ? "#3FB95033" : "#F8514933"}`, borderRadius: "12px", padding: "16px 20px", marginBottom: "20px" }}>
          <p style={{ margin: 0, fontSize: "14px", color: "var(--text-3)", lineHeight: 1.7 }}>
            <strong style={{ color: selected === q.correct ? "#3FB950" : "#F85149" }}>{selected === q.correct ? "✓ Correct! " : "✗ Incorrect. "}</strong>
            {q.explanation}
          </p>
        </div>
      )}

      {answered && (
        <button onClick={next} style={{ background: accentColor, border: "none", color: "#fff", padding: "14px 32px", borderRadius: "12px", cursor: "pointer", fontSize: "15px", fontWeight: 700, display: "flex", alignItems: "center", gap: "8px" }}>
          {current + 1 >= questions.length ? "See Results" : "Next Question"} <ChevronRight size={18}/>
        </button>
      )}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Flashcard Component
// ─────────────────────────────────────────────────────────
function FlashcardDeck({ set, accentColor }: { set: QuizSet; accentColor: string }) {
  const cards = set.flashcards || [];
  const [current, setCurrent] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [known, setKnown] = useState<Set<string>>(new Set());
  const [studying, setStudying] = useState<Set<string>>(new Set());
  const [remaining, setRemaining] = useState(cards.map(c => c.id));

  const card = cards.find(c => c.id === remaining[current]);
  if (!card) return <div>No cards</div>;

  const markKnown = () => {
    setKnown(k => new Set([...k, card.id]));
    next();
  };
  const markStudy = () => {
    setStudying(s => new Set([...s, card.id]));
    next();
  };
  const next = () => {
    setFlipped(false);
    setTimeout(() => setCurrent(c => Math.min(c + 1, remaining.length - 1)), 50);
  };
  const prev = () => { setFlipped(false); setTimeout(() => setCurrent(c => Math.max(c - 1, 0)), 50); };

  const restartWeak = () => {
    const weakCards = [...studying];
    setRemaining(weakCards);
    setStudying(new Set());
    setCurrent(0);
    setFlipped(false);
  };

  const allDone = current >= remaining.length - 1 && (known.has(card.id) || studying.has(card.id));

  return (
    <div>
      {/* Stats */}
      <div style={{ display: "flex", gap: "12px", marginBottom: "24px", flexWrap: "wrap" }}>
        <div style={{ background: "#3FB95022", border: "1px solid #3FB95044", padding: "8px 16px", borderRadius: "8px", fontSize: "13px", color: "#3FB950" }}>✓ Known: {known.size}</div>
        <div style={{ background: "#F5900022", border: "1px solid #F5900044", padding: "8px 16px", borderRadius: "8px", fontSize: "13px", color: "#F59000" }}>+ Study: {studying.size}</div>
        <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", padding: "8px 16px", borderRadius: "8px", fontSize: "13px", color: "var(--text-4)" }}>+ Remaining: {remaining.length - known.size - studying.size}</div>
      </div>

      {/* Progress */}
      <div style={{ height: "4px", background: "var(--bg-2)", borderRadius: "2px", marginBottom: "24px" }}>
        <div style={{ width: `${((known.size + studying.size) / remaining.length) * 100}%`, height: "100%", background: accentColor, borderRadius: "2px", transition: "width 0.3s" }}/>
      </div>

      {/* Card */}
      <div onClick={() => setFlipped(f => !f)} style={{
        minHeight: "220px", background: "var(--bg-1)", border: `2px solid ${flipped ? accentColor : "var(--border)"}`,
        borderRadius: "16px", padding: "36px", cursor: "pointer", position: "relative",
        transition: "all 0.2s", display: "flex", flexDirection: "column", justifyContent: "center", alignItems: "center",
        textAlign: "center", marginBottom: "20px",
      }}>
        <div style={{ position: "absolute", top: "14px", left: "16px", fontSize: "11px", color: "var(--text-4)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.1em" }}>
          {flipped ? "Answer" : "Question"} • {current + 1}/{remaining.length}
        </div>
        {card.category && (
          <div style={{ position: "absolute", top: "14px", right: "16px", fontSize: "11px", background: `${accentColor}22`, color: accentColor, padding: "2px 8px", borderRadius: "4px" }}>{card.category}</div>
        )}
        <p style={{ fontSize: flipped ? "15px" : "18px", fontWeight: flipped ? 500 : 700, lineHeight: 1.7, margin: 0, color: flipped ? "var(--text-2)" : "var(--text-1)", maxWidth: "580px" }}>
          {flipped ? card.back : card.front}
        </p>
        {!flipped && <p style={{ position: "absolute", bottom: "14px", fontSize: "12px", color: "var(--text-4)" }}>Click to reveal answer</p>}
      </div>

      {/* Actions */}
      {flipped ? (
        <div style={{ display: "flex", gap: "12px", justifyContent: "center" }}>
          <button onClick={markStudy} style={{ background: "#F5900022", border: "1px solid #F5900044", color: "#F59000", padding: "12px 28px", borderRadius: "12px", cursor: "pointer", fontSize: "14px", fontWeight: 700 }}>
            + Need to study
          </button>
          <button onClick={markKnown} style={{ background: "#3FB95022", border: "1px solid #3FB95044", color: "#3FB950", padding: "12px 28px", borderRadius: "12px", cursor: "pointer", fontSize: "14px", fontWeight: 700 }}>
            ✓ I know this
          </button>
        </div>
      ) : (
        <div style={{ display: "flex", gap: "12px", justifyContent: "center" }}>
          <button onClick={prev} disabled={current === 0} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-4)", padding: "12px 24px", borderRadius: "12px", cursor: current === 0 ? "default" : "pointer", fontSize: "14px", opacity: current === 0 ? 0.4 : 1 }}>← Previous</button>
          <button onClick={() => setFlipped(true)} style={{ background: accentColor, border: "none", color: "#fff", padding: "12px 28px", borderRadius: "12px", cursor: "pointer", fontSize: "14px", fontWeight: 700 }}>Reveal Answer</button>
          <button onClick={next} disabled={current >= remaining.length - 1} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", color: "var(--text-4)", padding: "12px 24px", borderRadius: "12px", cursor: current >= remaining.length - 1 ? "default" : "pointer", fontSize: "14px", opacity: current >= remaining.length - 1 ? 0.4 : 1 }}>Next →</button>
        </div>
      )}

      {studying.size > 0 && (
        <div style={{ marginTop: "24px", textAlign: "center" }}>
          <button onClick={restartWeak} style={{ background: "none", border: "1px solid var(--border)", color: "var(--text-4)", padding: "10px 20px", borderRadius: "10px", cursor: "pointer", fontSize: "13px" }}>
            <RotateCcw size={13} style={{ marginRight: 6 }}/>Review {studying.size} cards marked for study
          </button>
        </div>
      )}
    </div>
  );
}

// ─────────────────────────────────────────────────────────
// Main export
// ─────────────────────────────────────────────────────────
export default function QuizEnvironment({ sets, accentColor = "#3B82F6", techName = "" }: Props) {
  const [activeSet, setActiveSet] = useState<string | null>(null);
  const [scores, setScores] = useState<Record<string, {score: number, total: number}>>({});

  const handleComplete = (setId: string, score: number, total: number) => {
    setScores(s => ({ ...s, [setId]: { score, total } }));
  };

  const current = sets.find(s => s.id === activeSet);

  if (current) {
    return (
      <div>
        <button onClick={() => setActiveSet(null)} style={{ background: "none", border: "1px solid var(--border)", color: "var(--text-4)", padding: "8px 16px", borderRadius: "8px", cursor: "pointer", fontSize: "13px", marginBottom: "24px", display: "flex", alignItems: "center", gap: "6px" }}>
          ← All Practice Sets
        </button>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "24px" }}>{current.title}</h3>
        {current.type === "mcq" && (
          <MCQQuiz set={current} accentColor={accentColor} onComplete={(s, t) => handleComplete(current.id, s, t)} />
        )}
        {current.type === "flashcard" && (
          <FlashcardDeck set={current} accentColor={accentColor} />
        )}
      </div>
    );
  }

  return (
    <div>
      <div style={{ marginBottom: "28px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "8px", flexWrap: "wrap" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "22px", fontWeight: 800, margin: 0 }}>
            {techName} — Practice & Assessment
          </h2>
          <span style={{ background: `${accentColor}22`, color: accentColor, border: `1px solid ${accentColor}33`, padding: "3px 12px", borderRadius: "20px", fontSize: "12px", fontWeight: 700 }}>
            {sets.length} Sets
          </span>
        </div>
        <p style={{ color: "var(--text-4)", fontSize: "14px" }}>
          Test your knowledge with MCQ quizzes, flashcards, and practice problems. Track your progress as you improve.
        </p>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "16px" }}>
        {sets.map(set => {
          const result = scores[set.id];
          const typeIcon = set.type === "mcq" ? "❓" : set.type === "flashcard" ? ">" : "✏";
          const typeLabel = set.type === "mcq" ? "MCQ Quiz" : set.type === "flashcard" ? "Flashcards" : "Fill in Blank";
          const itemCount = set.questions?.length || set.flashcards?.length || 0;
          return (
            <div key={set.id} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", cursor: "pointer", transition: "border-color 0.2s" }}
              onClick={() => setActiveSet(set.id)}
              onMouseEnter={e => (e.currentTarget.style.borderColor = accentColor)}
              onMouseLeave={e => (e.currentTarget.style.borderColor = "var(--border)")}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "12px" }}>
                <span style={{ fontSize: "32px" }}>{typeIcon}</span>
                {result && (
                  <span style={{ fontSize: "13px", fontWeight: 700, color: result.score / result.total >= 0.75 ? "#3FB950" : "#F59E0B" }}>
                    {Math.round(result.score / result.total * 100)}%
                  </span>
                )}
              </div>
              <h4 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "8px" }}>{set.title}</h4>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "16px", lineHeight: 1.6 }}>{set.description}</p>
              <div style={{ display: "flex", gap: "10px", alignItems: "center", justifyContent: "space-between" }}>
                <div style={{ display: "flex", gap: "8px" }}>
                  <span style={{ background: `${accentColor}22`, color: accentColor, padding: "3px 10px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>{typeLabel}</span>
                  <span style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "3px 10px", borderRadius: "6px", fontSize: "11px", color: "var(--text-4)" }}>{itemCount} items</span>
                  {set.timeLimit && <span style={{ background: "var(--bg-2)", border: "1px solid var(--border)", padding: "3px 10px", borderRadius: "6px", fontSize: "11px", color: "var(--text-4)", display: "flex", alignItems: "center", gap: "3px" }}><Clock size={10}/>{set.timeLimit}s/q</span>}
                </div>
                <span style={{ color: accentColor, fontSize: "13px", fontWeight: 600 }}>Start →</span>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
