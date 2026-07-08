"use client";
import Link from "next/link";
import { useState } from "react";
export const runtime = "edge";

const PYQ_EXAMS = [
  {
    category: "Engineering & Science",
    color: "#3B82F6",
    icon: "E",
    exams: [
      { name: "JEE Main & Advanced", slug: "/academies/exams/jee-maths/pyq", subjects: ["Maths", "Physics", "Chemistry"], level: "Class 12", attempts: "2x/year" },
      { name: "NEET UG", slug: "/academies/exams/neet-biology/pyq", subjects: ["Biology", "Physics", "Chemistry"], level: "Class 12", attempts: "1x/year" },
      { name: "GATE CSE/ECE", slug: "/academies/exams/gate/pyq", subjects: ["DS&Algo", "OS", "Networks", "Digital"], level: "B.Tech", attempts: "1x/year" },
    ]
  },
  {
    category: "Government & Civil Services",
    color: "#F59E0B",
    icon: "G",
    exams: [
      { name: "UPSC Civil Services Prelims", slug: "/academies/exams/upsc-prelims/pyq", subjects: ["GS Paper 1", "CSAT Paper 2"], level: "Any graduate", attempts: "1x/year" },
      { name: "SSC CGL / CHSL / MTS", slug: "/academies/exams/ssc-exam/pyq", subjects: ["Reasoning", "Quant", "English", "GK"], level: "12th/Graduate", attempts: "Multiple/year" },
      { name: "Banking PO (SBI/IBPS)", slug: "/academies/exams/banking-exam/pyq", subjects: ["Quant", "Reasoning", "English", "Banking GK"], level: "Graduate", attempts: "Annual" },
      { name: "State PSC (GS)", slug: "/academies/exams/state-psc/pyq", subjects: ["History", "Polity", "Economy", "Science"], level: "Graduate", attempts: "Varies by state" },
    ]
  },
  {
    category: "Law",
    color: "#6366F1",
    icon: "L",
    exams: [
      { name: "CLAT (NLU Admission)", slug: "/academies/law/clat-prep/pyq", subjects: ["Legal Reasoning", "Logical", "English", "GK"], level: "Class 12", attempts: "1x/year" },
      { name: "AIBE (Bar Exam)", slug: "/academies/law/aibe-bar-exam/interview", subjects: ["All 20 law subjects", "Open book"], level: "LLB enrolled", attempts: "Unlimited" },
      { name: "Judiciary (Civil Judge)", slug: "/academies/law/judiciary-exams/intermediate", subjects: ["Constitutional", "Criminal", "Civil Law"], level: "LLB", attempts: "Annual" },
    ]
  },
  {
    category: "Finance & Commerce",
    color: "#14B8A6",
    icon: "F",
    exams: [
      { name: "CA Foundation", slug: "/academies/finance/ca-cs-foundation/overview", subjects: ["Accounts", "Law", "Maths", "Economics"], level: "Class 12", attempts: "2x/year" },
      { name: "CA Intermediate", slug: "/academies/finance/ca-intermediate/overview", subjects: ["8 papers across 2 groups"], level: "CA Foundation", attempts: "2x/year" },
      { name: "RBI Grade B", slug: "/academies/finance/banking-rbi/overview", subjects: ["ESI", "Finance & Mgmt", "English"], level: "Graduate 60%+", attempts: "Annual" },
    ]
  },
  {
    category: "Agriculture",
    color: "#22C55E",
    icon: "A",
    exams: [
      { name: "ICAR JRF/SRF", slug: "/academies/agriculture/icar-ibps-afo/overview", subjects: ["Agronomy", "Plant Science", "Genetics"], level: "B.Sc Agriculture", attempts: "Annual" },
      { name: "IBPS AFO", slug: "/academies/agriculture/icar-ibps-afo/overview", subjects: ["Agriculture + Banking GK"], level: "B.Sc Agriculture", attempts: "Annual" },
    ]
  },
  {
    category: "Telecom Engineering",
    color: "#0EA5E9",
    icon: "T",
    exams: [
      { name: "BSNL JTO / JE", slug: "/academies/telecom/bsnl-jto-prep/overview", subjects: ["ECE Fundamentals", "Telecom Systems"], level: "B.Tech ECE", attempts: "Irregular" },
      { name: "GATE ECE", slug: "/academies/exams/gate/pyq", subjects: ["Electronics", "Communications", "Networks"], level: "B.Tech ECE", attempts: "Annual" },
    ]
  },
];

export default function PYQsPage() {
  const [activeCategory, setActiveCategory] = useState("all");
  const categories = ["all", ...PYQ_EXAMS.map(g => g.category)];
  const filtered = activeCategory === "all" ? PYQ_EXAMS : PYQ_EXAMS.filter(g => g.category === activeCategory);

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "56px 24px" }}>

      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "48px" }}>
        <div style={{ display: "inline-block", background: "rgba(99,102,241,0.1)", border: "1px solid rgba(99,102,241,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#6366F1", fontWeight: 600, marginBottom: "16px" }}>
          Pattern Questions + Solving Strategy
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,5vw,48px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "14px" }}>
          Previous Year Questions
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "580px", margin: "0 auto", lineHeight: 1.6 }}>
          Curated practice questions with detailed solutions — JEE, NEET, GATE, UPSC, SSC, Banking, CLAT, State PSC and more.
        </p>
      </div>

      {/* Category filter */}
      <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", justifyContent: "center", marginBottom: "40px" }}>
        {categories.map(cat => {
          const grp = PYQ_EXAMS.find(g => g.category === cat);
          const color = grp?.color || "#6B7280";
          return (
            <button key={cat} onClick={() => setActiveCategory(cat)} style={{
              padding: "6px 16px", borderRadius: "20px", fontSize: "12px", fontWeight: 600,
              border: "1px solid var(--border)", cursor: "pointer", transition: "all 0.15s",
              background: activeCategory === cat ? color : "var(--bg-2)",
              color: activeCategory === cat ? "white" : "var(--text-3)",
              borderColor: activeCategory === cat ? "transparent" : "var(--border)",
            }}>
              {cat === "all" ? "All Exams" : cat}
            </button>
          );
        })}
      </div>

      {/* Exam groups */}
      {filtered.map(group => (
        <div key={group.category} style={{ marginBottom: "40px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "16px", paddingBottom: "10px", borderBottom: `2px solid ${group.color}30` }}>
            <div style={{ width: "28px", height: "28px", borderRadius: "8px", background: group.color, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "13px", fontWeight: 800, color: "white", flexShrink: 0 }}>
              {group.icon}
            </div>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "17px", fontWeight: 800 }}>{group.category}</h2>
          </div>

          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 320px), 1fr))", gap: "12px" }}>
            {group.exams.map(exam => (
              <Link key={exam.name} href={exam.slug} style={{ textDecoration: "none" }}>
                <div style={{
                  background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px",
                  padding: "18px 20px", cursor: "pointer", transition: "all 0.15s",
                  borderLeft: `3px solid ${group.color}`,
                }}
                  onMouseEnter={e => { (e.currentTarget as HTMLDivElement).style.boxShadow = `0 4px 16px ${group.color}18`; (e.currentTarget as HTMLDivElement).style.borderColor = group.color; }}
                  onMouseLeave={e => { (e.currentTarget as HTMLDivElement).style.boxShadow = "none"; (e.currentTarget as HTMLDivElement).style.borderColor = `var(--border)`; (e.currentTarget as HTMLDivElement).style.borderLeftColor = group.color; }}>

                  <div style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-1)", marginBottom: "8px" }}>{exam.name}</div>

                  <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", marginBottom: "10px" }}>
                    {exam.subjects.map(s => (
                      <span key={s} style={{ fontSize: "10px", padding: "2px 7px", borderRadius: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-4)" }}>{s}</span>
                    ))}
                  </div>

                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                    <span style={{ fontSize: "11px", color: "var(--text-4)" }}>{exam.level} &nbsp;|&nbsp; {exam.attempts}</span>
                    <span style={{ fontSize: "12px", fontWeight: 700, color: group.color }}>Practice +</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      ))}

      {/* Study tip */}
      <div style={{ marginTop: "40px", padding: "28px 32px", borderRadius: "16px", background: "linear-gradient(135deg, rgba(59,130,246,0.06), rgba(139,92,246,0.06))", border: "1px solid rgba(99,102,241,0.2)" }}>
        <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "10px" }}>How to use PYQs effectively</div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))", gap: "12px", fontSize: "13px", color: "var(--text-3)" }}>
          <div>1. Solve without looking at the answer first — build exam reflexes</div>
          <div>2. For wrong answers: trace back to the concept, not just the solution</div>
          <div>3. Time yourself — exam speed matters as much as accuracy</div>
          <div>4. Use the linked content sections to fill gaps revealed by PYQs</div>
        </div>
      </div>
    </div>
  );
}
