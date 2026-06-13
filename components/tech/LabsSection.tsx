"use client";
import { useState, useEffect } from "react";
import LabEnvironment from "./LabEnvironment";
import QuizEnvironment from "./QuizEnvironment";
import { type Lab } from "@/lib/data/labs";
import { type QuizSet } from "@/lib/data/quizzes";

const QUIZ_ACADEMIES = new Set(["exams", "healthcare", "essentials", "education"]);

type Props = {
  academy: string;
  technology: string;
  techName: string;
  accentColor: string;
};

export default function LabsSection({ academy, technology, techName, accentColor }: Props) {
  const [labs, setLabs] = useState<Lab[]>([]);
  const [quizSets, setQuizSets] = useState<QuizSet[]>([]);
  const [loading, setLoading] = useState(true);

  const useQuiz = QUIZ_ACADEMIES.has(academy);

  useEffect(() => {
    if (useQuiz) {
      import("@/lib/data/quizzes").then(({ getQuizSetsForTech }) => {
        setQuizSets(getQuizSetsForTech(academy, technology));
        setLoading(false);
      });
    } else {
      import("@/lib/data/labs").then(({ getLabsForTech }) => {
        setLabs(getLabsForTech(academy, technology));
        setLoading(false);
      });
    }
  }, [academy, technology, useQuiz]);

  if (loading) {
    return <div style={{ padding: "40px", textAlign: "center", color: "var(--text-4)" }}>Loading...</div>;
  }

  const emptyIcon = useQuiz ? "❓" : "🧪";
  const emptyTitle = useQuiz ? "Practice Sets Coming Soon" : "Labs Coming Soon";
  const emptyDesc = useQuiz
    ? `MCQ quizzes and flashcards for ${techName} are being prepared. Check back soon.`
    : `Hands-on labs for ${techName} are being developed. Check back soon for guided real-world scenarios.`;

  if ((useQuiz && quizSets.length === 0) || (!useQuiz && labs.length === 0)) {
    return (
      <div style={{ padding: "48px 32px", textAlign: "center", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "16px" }}>
        <div style={{ fontSize: "48px", marginBottom: "16px" }}>{emptyIcon}</div>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "8px" }}>{emptyTitle}</h3>
        <p style={{ color: "var(--text-4)", fontSize: "14px", maxWidth: "400px", margin: "0 auto" }}>{emptyDesc}</p>
      </div>
    );
  }

  return useQuiz
    ? <QuizEnvironment sets={quizSets} accentColor={accentColor} techName={techName} />
    : <LabEnvironment labs={labs} accentColor={accentColor} techName={techName} />;
}
