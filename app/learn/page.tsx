export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { educationBoards } from "@/lib/data/education";

export const metadata: Metadata = {
  title: "Learn — Education for Every Indian Student",
  description: "Class 10, JEE, NEET, GATE, UPSC, Banking, SSC — structured chapter-wise learning with PYQs, MCQs, and revision notes. Free for every Indian student.",
  keywords: ["JEE preparation","NEET preparation","GATE CSE","UPSC prelims","Banking exam","Class 10 CBSE","SSC CGL","SynfraCore Learn"],
  alternates: { canonical: "https://synfracore.com/learn" },
};

export default function LearnPage() {
  const phase1 = educationBoards.filter(b => ["class-10","jee","gate-cse","banking"].includes(b.slug));
  const phase2 = educationBoards.filter(b => ["upsc","neet","ssc","class-12"].includes(b.slug));

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "48px 24px" }}>

      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "56px" }}>
        <div style={{ display: "inline-block", background: "rgba(59,130,246,0.1)", border: "1px solid rgba(59,130,246,0.2)", borderRadius: "20px", padding: "4px 14px", fontSize: "12px", color: "#60A5FA", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", marginBottom: "16px" }}>
          Education for Every Indian
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "42px", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "14px", lineHeight: 1.1 }}>
          Learn Anything.<br/>
          <span style={{ background: "linear-gradient(135deg,#3B82F6,#8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" }}>Crack Every Exam.</span>
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.6 }}>
          Class 10 to PhD. JEE to UPSC. Chapter-wise content, PYQs, MCQs, revision notes — all free, all structured.
        </p>
      </div>

      {/* Learning Methodology Banner */}
      <div style={{ background: "linear-gradient(135deg,rgba(59,130,246,0.06),rgba(139,92,246,0.06))", border: "1px solid var(--border)", borderRadius: "16px", padding: "20px 24px", marginBottom: "48px", display: "flex", gap: "0", overflowX: "auto" }}>
        {["📖 Learn","✏️ Practice","🔄 Recall","🧪 Test","🔍 Analyse","🔁 Repeat"].map((step, i) => (
          <div key={i} style={{ display: "flex", alignItems: "center", gap: "0", flexShrink: 0 }}>
            <div style={{ textAlign: "center", padding: "0 16px" }}>
              <div style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-2)", whiteSpace: "nowrap" }}>{step.split(" ")[0]}</div>
              <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{step.split(" ")[1]}</div>
            </div>
            {i < 5 && <div style={{ color: "var(--text-4)", fontSize: "18px" }}>→</div>}
          </div>
        ))}
      </div>

      {/* Phase 1 — Live */}
      <div style={{ marginBottom: "48px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "24px" }}>
          <span style={{ background: "#10B981", color: "white", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>LIVE NOW</span>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", margin: 0 }}>Phase 1 — Available Now</h2>
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {phase1.map(board => (
            <Link key={board.slug} href={`/learn/${board.slug}`} style={{ textDecoration: "none" }}>
              <div style={{ padding: "24px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", height: "100%" }} className="card-hover">
                <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "12px" }}>
                  <span style={{ fontSize: "36px" }}>{board.icon}</span>
                  <span style={{ background: board.color + "20", color: board.color, fontSize: "11px", fontWeight: 700, padding: "3px 8px", borderRadius: "6px" }}>
                    {board.subjects.length} Subjects
                  </span>
                </div>
                <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "4px" }}>{board.name}</h3>
                <p style={{ color: board.color, fontSize: "12px", fontWeight: 600, marginBottom: "8px" }}>{board.tagline}</p>
                <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.5, margin: 0 }}>{board.description.slice(0, 100)}...</p>
                <div style={{ display: "flex", gap: "4px", flexWrap: "wrap", marginTop: "12px" }}>
                  {board.phases.map(p => (
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
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "24px" }}>
          <span style={{ background: "var(--bg-2)", color: "var(--text-4)", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>COMING SOON</span>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", margin: 0 }}>Phase 2 — In Progress</h2>
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: "14px" }}>
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
        </div>
      </div>

    </div>
  );
}
