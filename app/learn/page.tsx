export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { educationBoards } from "@/lib/data/education";

export const metadata: Metadata = {
  title: "Academy — Learn Anything, Anywhere | SynfraCore",
  description: "World-class learning for school, engineering, medicine, government exams, and tech skills. Free chapter-wise content with PYQs, MCQs, and AI tutoring.",
  keywords: ["JEE preparation","NEET preparation","GATE CSE","Banking exam","Class 10 CBSE","learn online","free education","SynfraCore Academy"],
  alternates: { canonical: "https://synfracore.com/learn" },
};

const categories = [
  {
    label: "School",
    color: "#10B981",
    boards: ["class-10"],
    icon: "📘",
    desc: "Class 6-12 boards worldwide"
  },
  {
    label: "Entrance Exams",
    color: "#F59E0B",
    boards: ["jee","neet"],
    icon: "🏆",
    desc: "Engineering and medical entrance"
  },
  {
    label: "Competitive",
    color: "#3B82F6",
    boards: ["banking","ssc","upsc"],
    icon: "🏛️",
    desc: "Government jobs and competitive exams"
  },
  {
    label: "Engineering",
    color: "#8B5CF6",
    boards: ["gate-cse"],
    icon: "💻",
    desc: "Graduate and professional engineering"
  },
];

export default function LearnPage() {
  const phase1 = educationBoards.filter(b => ["class-10","jee","gate-cse","banking"].includes(b.slug));
  const phase2 = educationBoards.filter(b => ["neet","upsc","ssc","class-12"].includes(b.slug));

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "48px 24px" }}>

      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "52px" }}>
        <div style={{ display: "inline-block", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "4px 14px", fontSize: "12px", color: "#60A5FA", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", marginBottom: "16px" }}>
          Free for Everyone, Everywhere
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "44px", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "14px", lineHeight: 1.1 }}>
          Learn Anything.<br />
          <span style={{ background: "linear-gradient(135deg,#3B82F6,#8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" }}>Crack Every Exam.</span>
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "18px", maxWidth: "580px", margin: "0 auto", lineHeight: 1.6 }}>
          From school to postgrad. JEE to UPSC. DevOps to AI.
          Structured, expert-written learning — for students everywhere.
        </p>
      </div>

      {/* Learning methodology */}
      <div style={{ background: "linear-gradient(135deg,rgba(59,130,246,0.06),rgba(139,92,246,0.06))", border: "1px solid var(--border)", borderRadius: "16px", padding: "18px 24px", marginBottom: "48px", display: "flex", gap: "0", overflowX: "auto", alignItems: "center" }}>
        {["📖 Learn","✏️ Practice","🔄 Recall","🧪 Test","📊 Analyse","🔁 Repeat"].map((step, i) => (
          <div key={i} style={{ display: "flex", alignItems: "center", gap: "0", flexShrink: 0 }}>
            <div style={{ textAlign: "center", padding: "0 16px" }}>
              <div style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-2)", whiteSpace: "nowrap" }}>{step}</div>
            </div>
            {i < 5 && <div style={{ color: "var(--text-4)", fontSize: "16px", opacity: 0.5 }}>→</div>}
          </div>
        ))}
      </div>

      {/* Phase 1 — Live */}
      <div style={{ marginBottom: "48px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "24px" }}>
          <span style={{ background: "#10B981", color: "white", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>LIVE NOW</span>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", margin: 0 }}>Available Now</h2>
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {phase1.map(board => (
            <Link key={board.slug} href={`/learn/${board.slug}`} style={{ textDecoration: "none" }}>
              <div style={{ padding: "24px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", height: "100%", transition: "border-color 0.2s" }} className="card-hover">
                <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "12px" }}>
                  <span style={{ fontSize: "36px" }}>{board.icon}</span>
                  <span style={{ background: board.color + "20", color: board.color, fontSize: "11px", fontWeight: 700, padding: "3px 8px", borderRadius: "6px" }}>
                    {board.subjects.length} Subjects
                  </span>
                </div>
                <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "4px", color: "var(--text-1)" }}>{board.name}</h3>
                <p style={{ color: board.color, fontSize: "12px", fontWeight: 600, marginBottom: "8px" }}>{board.tagline}</p>
                <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.5, margin: "0 0 12px" }}>{board.description.slice(0, 90)}...</p>
                <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                  {board.phases.slice(0,3).map(p => (
                    <span key={p} style={{ fontSize: "10px", padding: "2px 6px", borderRadius: "4px", background: "var(--bg-2)", color: "var(--text-4)" }}>{p}</span>
                  ))}
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Phase 2 — Coming Soon */}
      <div>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "20px" }}>
          <span style={{ background: "var(--bg-2)", color: "var(--text-4)", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>COMING SOON</span>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", margin: 0 }}>In Progress</h2>
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))", gap: "14px" }}>
          {phase2.map(board => (
            <div key={board.slug} style={{ padding: "20px", borderRadius: "12px", border: "1px dashed var(--border)", background: "var(--bg)", opacity: 0.65 }}>
              <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "8px" }}>
                <span style={{ fontSize: "28px" }}>{board.icon}</span>
                <div>
                  <div style={{ fontWeight: 700, fontSize: "15px" }}>{board.name}</div>
                  <div style={{ color: "var(--text-4)", fontSize: "12px" }}>{board.tagline}</div>
                </div>
              </div>
              <p style={{ color: "var(--text-4)", fontSize: "12px", margin: 0 }}>Content being prepared...</p>
            </div>
          ))}

          {/* Career Academy card */}
          <div style={{ padding: "20px", borderRadius: "12px", border: "1px dashed var(--border)", background: "var(--bg)", opacity: 0.65 }}>
            <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "8px" }}>
              <span style={{ fontSize: "28px" }}>🎯</span>
              <div>
                <div style={{ fontWeight: 700, fontSize: "15px" }}>Career Academy</div>
                <div style={{ color: "var(--text-4)", fontSize: "12px" }}>Resume · Interview · Aptitude</div>
              </div>
            </div>
            <p style={{ color: "var(--text-4)", fontSize: "12px", margin: 0 }}>Content being prepared...</p>
          </div>
        </div>
      </div>

    </div>
  );
}
