"use client";
import { useState, useEffect } from "react";
import LabEnvironment from "./LabEnvironment";
import QuizEnvironment from "./QuizEnvironment";
import { type Lab } from "@/lib/data/labs";
import { type QuizSet } from "@/lib/data/quizzes";

// Map academy to the correct lab group file for code-splitting
const LAB_GROUP: Record<string, string> = {
  devops: "devops", cloud: "cloud", databases: "databases",
  ai: "ai", data: "data", security: "security",
  education: "education",
};

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
      // Load only the group file needed, not all 193KB
      const group = LAB_GROUP[academy] || "devops";
      const loaders: Record<string, () => Promise<{ getLabsForTech: (t: string) => Lab[] }>> = {
        devops:    () => import("@/lib/data/labs/devops"),
        cloud:     () => import("@/lib/data/labs/cloud"),
        databases: () => import("@/lib/data/labs/databases"),
        ai:        () => import("@/lib/data/labs/ai"),
        data:      () => import("@/lib/data/labs/data"),
        security:  () => import("@/lib/data/labs/security"),
        education: () => import("@/lib/data/labs/education"),
      };
      (loaders[group] || loaders.devops)().then(({ getLabsForTech }) => {
        setLabs(getLabsForTech(technology));
        setLoading(false);
      });
    }
  }, [academy, technology, useQuiz]);

  if (loading) {
    return (
      <div style={{ padding: "8px 0" }}>
        <style>{`
          @keyframes shimmer2{0%{background-position:-600px 0}100%{background-position:600px 0}}
          .sk{background:linear-gradient(90deg,var(--bg-2) 25%,var(--bg-1) 50%,var(--bg-2) 75%);
          background-size:600px 100%;animation:shimmer2 1.4s infinite;border-radius:8px}
        `}</style>
        {/* Skeleton: Lab card header */}
        <div className="sk" style={{ height: "22px", width: "40%", marginBottom: "16px" }} />
        {/* Skeleton: 3 step rows */}
        {[1,2,3].map(i => (
          <div key={i} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "18px", marginBottom: "10px" }}>
            <div className="sk" style={{ height: "15px", width: "60%", marginBottom: "10px" }} />
            <div className="sk" style={{ height: "80px", borderRadius: "8px" }} />
          </div>
        ))}
      </div>
    );
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
