export const runtime = "edge";
import type { Metadata } from "next";
import Link from "next/link";
import { educationBoards } from "@/lib/data/education";

export const metadata: Metadata = {
  title: "Academy — Chapter-wise Learning for Every Exam | SynfraCore",
  description: "284+ chapters across Class 10, Class 12, JEE, NEET, GATE CSE, Banking, UPSC, SSC, Defence, Career, and Finance. Expert-written with PYQs, MCQs, and revision notes.",
  keywords: ["JEE preparation","NEET preparation","GATE CSE","Banking exam","Class 10 CBSE","UPSC","SSC CGL","SynfraCore Academy"],
  alternates: { canonical: "https://synfracore.com/learn" },
};

const categories = [
  { id: "all", label: "All Boards" },
  { id: "school", label: "School" },
  { id: "entrance", label: "Entrance Exams" },
  { id: "competitive", label: "Competitive" },
  { id: "career", label: "Career & Finance" },
];

const boardCategory: Record<string, string> = {
  "class-10": "school", "class-12": "school",
  "jee": "entrance", "neet": "entrance", "gate-cse": "entrance",
  "banking": "competitive", "upsc": "competitive", "ssc": "competitive", "defence": "competitive",
  "career": "career", "finance": "career",
};

const liveBoards = ["class-10","class-12","jee","gate-cse","banking","neet","upsc","defence","ssc","career","finance"];

export default function LearnPage() {
  const live = educationBoards.filter(b => liveBoards.includes(b.slug));
  const soon: typeof educationBoards = [];

  const totalChapters = live.reduce((acc, b) => acc + b.subjects.reduce((a, s) => a + s.chapters.length, 0), 0);

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "48px 24px" }}>

      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "48px" }}>
        <div className="badge badge-blue" style={{ marginBottom: "16px" }}>{live.length} Boards · {totalChapters}+ Chapters</div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "42px", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "14px", lineHeight: 1.1 }}>
          Learn Anything.<br />
          <span style={{ background: "linear-gradient(135deg,#3B82F6,#8B5CF6)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" }}>Crack Every Exam.</span>
        </h1>
        <p style={{ color: "var(--text-3)", fontSize: "18px", maxWidth: "560px", margin: "0 auto", lineHeight: 1.6 }}>
          Chapter-wise content with PYQs, MCQs, and revision notes —
          for school, entrance, competitive, and career exams.
        </p>
      </div>

      {/* Learning method strip */}
      <div style={{ background: "linear-gradient(135deg,rgba(59,130,246,0.06),rgba(139,92,246,0.06))", border: "1px solid var(--border)", borderRadius: "14px", padding: "14px 24px", marginBottom: "48px", display: "flex", gap: "0", overflowX: "auto", alignItems: "center" }}>
        {["[R] Learn","✏ Practice","> Recall","[L] Test","* Analyse","> Repeat"].map((step, i) => (
          <div key={i} style={{ display: "flex", alignItems: "center", flexShrink: 0 }}>
            <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-2)", padding: "0 14px", whiteSpace: "nowrap" }}>{step}</span>
            {i < 5 && <span style={{ color: "var(--text-4)", opacity: 0.4 }}>›</span>}
          </div>
        ))}
      </div>

      {/* Board grid — all live */}
      <div style={{ marginBottom: "48px" }}>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "22px", flexWrap: "wrap", gap: "12px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <span style={{ background: "#10B981", color: "white", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>LIVE</span>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "19px", margin: 0 }}>
              {live.length} Courses Available
            </h2>
          </div>

          {/* Category filter chips */}
          <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
            {categories.map(cat => (
              <span key={cat.id} style={{
                padding: "5px 14px", borderRadius: "20px", fontSize: "12px", fontWeight: 600, cursor: "pointer",
                background: cat.id === "all" ? "var(--accent)" : "var(--bg-2)",
                color: cat.id === "all" ? "white" : "var(--text-3)",
                border: "1px solid var(--border)"
              }}>
                {cat.label}
              </span>
            ))}
          </div>
        </div>

        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "16px" }}>
          {live.map(board => {
            const chapCount = board.subjects.reduce((a, s) => a + s.chapters.length, 0);
            return (
              <Link key={board.slug} href={`/learn/${board.slug}`} style={{ textDecoration: "none" }}>
                <div className="card-hover" style={{ padding: "24px", borderRadius: "14px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", height: "100%", borderTop: `3px solid ${board.color}` }}>
                  <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between", marginBottom: "12px" }}>
                    <span style={{ fontSize: "34px" }}>{board.icon}</span>
                    <span style={{ background: board.color + "20", color: board.color, fontSize: "11px", fontWeight: 700, padding: "3px 8px", borderRadius: "6px" }}>
                      {chapCount} chapters
                    </span>
                  </div>
                  <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "16px", marginBottom: "4px", color: "var(--text-1)" }}>{board.name}</h3>
                  <p style={{ color: board.color, fontSize: "12px", fontWeight: 600, marginBottom: "8px" }}>{board.tagline}</p>
                  <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.5, margin: "0 0 12px" }}>
                    {board.description.slice(0, 85)}...
                  </p>
                  <div style={{ display: "flex", gap: "4px", flexWrap: "wrap" }}>
                    {board.subjects.slice(0, 3).map(s => (
                      <span key={s.slug} style={{ fontSize: "10px", padding: "2px 7px", borderRadius: "4px", background: board.color + "12", color: board.color, fontWeight: 600 }}>{s.name}</span>
                    ))}
                    {board.subjects.length > 3 && <span style={{ fontSize: "10px", color: "var(--text-4)", padding: "2px 4px" }}>+{board.subjects.length - 3} more</span>}
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </div>

      {/* Coming soon */}
      {soon.length > 0 && (
        <div>
          <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "18px" }}>
            <span style={{ background: "var(--bg-2)", color: "var(--text-4)", fontSize: "11px", fontWeight: 700, padding: "2px 8px", borderRadius: "6px" }}>COMING SOON</span>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "19px", margin: 0 }}>In Progress</h2>
          </div>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(230px, 1fr))", gap: "12px" }}>
            {[
              { icon: "⚖", name: "Law Academy", desc: "Constitutional · Corporate · Cyber Law" },
              { icon: "*", name: "Agriculture", desc: "Agri-science · Rural development" },
            ].map(b => (
              <div key={b.name} style={{ padding: "18px 20px", borderRadius: "10px", border: "1px dashed var(--border)", background: "var(--bg)", opacity: 0.65, display: "flex", alignItems: "center", gap: "12px" }}>
                <span style={{ fontSize: "24px" }}>{b.icon}</span>
                <div>
                  <div style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-2)" }}>{b.name}</div>
                  <div style={{ color: "var(--text-4)", fontSize: "12px" }}>{b.desc}</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

    </div>
  );
}
