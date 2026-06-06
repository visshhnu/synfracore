import Link from "next/link";
import { academies } from "@/lib/data/academies";

export const metadata = { title: "Interview Hub — SynfraCore" };

const levels = [
  { name: "Beginner", desc: "Concepts & fundamentals", icon: "🌱", color: "#10B981" },
  { name: "Intermediate", desc: "Implementation scenarios", icon: "⚡", color: "#F59E0B" },
  { name: "Advanced", desc: "Architecture & design", icon: "🚀", color: "#F43F5E" },
  { name: "Architect", desc: "System design & trade-offs", icon: "🏗️", color: "#8B5CF6" },
];

const formats = [
  { name: "MCQ Practice", icon: "📝", desc: "Multiple choice question banks" },
  { name: "Scenario Questions", icon: "🎭", desc: "Real-world problem solving" },
  { name: "Mock Interviews", icon: "🎙️", desc: "Simulated interview sessions" },
  { name: "System Design", icon: "📐", desc: "Architecture discussions" },
];

export default function InterviewPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Interview Hub
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Prepare for every level — from junior engineer to principal architect
        </p>
      </div>

      {/* Levels */}
      <div className="grid gap-5 md:grid-cols-4 mb-16">
        {levels.map((level) => (
          <div key={level.name} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", textAlign: "center" }}>
            <span style={{ fontSize: "32px", display: "block", marginBottom: "10px" }}>{level.icon}</span>
            <h3 style={{ fontWeight: 700, marginBottom: "4px", color: level.color }}>{level.name}</h3>
            <p style={{ color: "var(--text-4)", fontSize: "12px" }}>{level.desc}</p>
          </div>
        ))}
      </div>

      {/* Formats */}
      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-4 mb-16">
        {formats.map((f) => (
          <div key={f.name} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "20px" }}>
            <span style={{ fontSize: "28px", display: "block", marginBottom: "10px" }}>{f.icon}</span>
            <h3 style={{ fontSize: "14px", fontWeight: 700, marginBottom: "4px" }}>{f.name}</h3>
            <p style={{ color: "var(--text-4)", fontSize: "12px" }}>{f.desc}</p>
          </div>
        ))}
      </div>

      {/* By Technology */}
      <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "26px", fontWeight: 700, marginBottom: "24px" }}>
        Interview Q&A by Technology
      </h2>
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {academies.flatMap((a) =>
          a.technologies.slice(0, 3).map((tech) => (
            <Link
              key={`${a.slug}-${tech.slug}`}
              href={`/academies/${a.slug}/${tech.slug}/interview`}
              style={{
                display: "flex",
                alignItems: "center",
                gap: "12px",
                padding: "16px",
                background: "var(--bg-2)",
                border: "1px solid var(--border)",
                borderRadius: "12px",
                textDecoration: "none",
                transition: "all 0.2s",
              }}
              className="hover:border-blue-500/30"
            >
              <span style={{ fontSize: "20px" }}>{tech.icon}</span>
              <div>
                <div style={{ fontSize: "14px", fontWeight: 600 }}>{tech.name}</div>
                <div style={{ color: "var(--text-4)", fontSize: "11px" }}>{a.title}</div>
              </div>
              <span style={{ marginLeft: "auto", color: a.color, fontSize: "12px" }}>Q&A →</span>
            </Link>
          ))
        )}
      </div>
    </div>
  );
}
