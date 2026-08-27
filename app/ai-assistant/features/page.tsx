import Link from "next/link";

export const metadata = {
  title: "AI Learning Features — SynfraCore",
  description: "How SynfraCore's AI-powered learning features work — the AI Assistant, Quiz Generator, Flashcard Mode, and Mock Interview Mode.",
};

// Relocated from the ai/ai-learning academy technology (overview.md +
// intermediate.md) on 2026-08-26 — this is documentation about the
// platform's own features, not a subject learners study, so it doesn't
// belong presented as an academy "technology" alongside real subject-matter
// content. See docs/audit/ for the audit that identified the mismatch.
const features = [
  {
    icon: "💬",
    title: "AI Assistant",
    tagline: "Ask anything, get instant answers",
    body: "Embedded in every topic page, with context about whatever page you're currently on. Ask \"explain this simply,\" \"give me a real example,\" \"quiz me,\" or \"what would an interviewer ask?\" and get a response tailored to that specific question — not a generic definition.",
    tips: [
      "\"Give me a real example\" — pushes past abstract definitions toward a concrete, worked scenario.",
      "\"Quiz me\" — triggers active-recall practice instead of passive re-reading.",
      "\"What would an interviewer ask about this?\" — reframes the material around how it gets tested in a real interview.",
      "\"What's a common mistake people make with this?\" — surfaces pitfalls static reference content doesn't always call out.",
    ],
  },
  {
    icon: "📝",
    title: "Quiz Generator",
    tagline: "Test your knowledge, tuned to your level",
    body: "Each quiz question is generated specifically for the page you're on, tuned to the difficulty level you select — Beginner, Engineer, or Architect — rather than pulled from a fixed question bank. Beginner questions test definitions and basic recall. Engineer questions test applied understanding — given this scenario, what would you do. Architect questions test design judgment and tradeoffs.",
    tips: [
      "Scores are tracked per topic and per difficulty level, not just as one aggregate — \"I understand Kubernetes broadly\" and \"I can answer Architect-level Kubernetes questions\" are different claims worth tracking separately.",
      "Quiz quality is bounded by the accuracy of the underlying page content — the assistant grounds questions in what the page actually says.",
    ],
  },
  {
    icon: "🗂️",
    title: "Flashcard Mode",
    tagline: "Spaced repetition learning",
    body: "Flashcards use spaced repetition — concepts you struggle with appear more often. Useful for memorizing commands, coding rules, and interview patterns: term → definition, command → effect, or scenario → solution cards.",
    tips: [],
  },
  {
    icon: "🎤",
    title: "Mock Interview Mode",
    tagline: "Practice PSR answers under real time pressure",
    body: "Presents questions and times your answer using the PSR formula (Problem → Solution → Result, 45-90 seconds max) — the same structure and time constraint a real interview imposes, so you're practicing the actual skill being tested, not just the underlying knowledge.",
    tips: [
      "Recording yourself speaking produces meaningfully higher retention than passively reading (roughly 70% vs. 30%) — actively producing an answer out loud engages recall in a way reading or writing alone doesn't.",
      "Recording also lets you review your own delivery afterward — filler words and rambling structure that feel fine in the moment often sound noticeably weaker on playback.",
    ],
  },
];

export default function AIFeaturesPage() {
  return (
    <div style={{ maxWidth: "900px", margin: "0 auto", padding: "56px 24px" }}>
      <div style={{ maxWidth: "720px", marginBottom: "56px" }}>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          AI Learning Features
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "17px", lineHeight: 1.8 }}>
          Every topic page on SynfraCore is backed by four AI-powered tools that adapt to what you&apos;re studying and where you&apos;re stuck, instead of leaving you with a static page alone.
        </p>
      </div>

      <div style={{ display: "flex", flexDirection: "column", gap: "32px", marginBottom: "56px" }}>
        {features.map(f => (
          <div key={f.title} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "28px" }}>
            <div style={{ display: "flex", gap: "14px", alignItems: "flex-start", marginBottom: "12px" }}>
              <span style={{ fontSize: "26px" }}>{f.icon}</span>
              <div>
                <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", margin: 0 }}>{f.title}</h2>
                <p style={{ color: "var(--text-3)", fontSize: "13px", margin: "2px 0 0" }}>{f.tagline}</p>
              </div>
            </div>
            <p style={{ color: "var(--text-4)", fontSize: "15px", lineHeight: 1.75, marginBottom: f.tips.length ? "14px" : 0 }}>{f.body}</p>
            {f.tips.length > 0 && (
              <ul style={{ margin: 0, paddingLeft: "20px", color: "var(--text-4)", fontSize: "14px", lineHeight: 1.8 }}>
                {f.tips.map(tip => <li key={tip}>{tip}</li>)}
              </ul>
            )}
          </div>
        ))}
      </div>

      <div style={{ display: "flex", gap: "16px", flexWrap: "wrap" }}>
        <Link href="/ai-assistant" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 700 }}>
          Try the AI Assistant →
        </Link>
        <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-2)", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 600 }}>
          Browse Academies
        </Link>
      </div>
    </div>
  );
}
