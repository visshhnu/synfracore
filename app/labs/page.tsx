import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { FlaskConical } from "lucide-react";

export const metadata = { title: "Labs — SynfraCore" };

const labCategories = [
  { level: "Beginner", icon: "🌱", desc: "Step-by-step guided labs", color: "#10B981", bg: "rgba(16,185,129,0.1)", border: "rgba(16,185,129,0.2)" },
  { level: "Intermediate", icon: "⚡", desc: "Scenario-based implementations", color: "#F59E0B", bg: "rgba(245,158,11,0.1)", border: "rgba(245,158,11,0.2)" },
  { level: "Advanced", icon: "🚀", desc: "Production-level deployments", color: "#F43F5E", bg: "rgba(244,63,94,0.1)", border: "rgba(244,63,94,0.2)" },
];

export default function LabsPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Hands-on Labs
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Practice with real tools in structured, guided environments
        </p>
      </div>

      <div className="grid gap-6 md:grid-cols-3 mb-16">
        {labCategories.map((cat) => (
          <div key={cat.level} style={{ background: cat.bg, border: `1px solid ${cat.border}`, borderRadius: "16px", padding: "28px", textAlign: "center" }}>
            <span style={{ fontSize: "40px", display: "block", marginBottom: "12px" }}>{cat.icon}</span>
            <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "20px", fontWeight: 700, color: cat.color, marginBottom: "8px" }}>{cat.level}</h3>
            <p style={{ color: "var(--text-4)", fontSize: "14px" }}>{cat.desc}</p>
          </div>
        ))}
      </div>

      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "26px", fontWeight: 700, marginBottom: "24px" }}>Labs by Academy</h2>
      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
        {academies.map((academy) => (
          <Link key={academy.slug} href={`/academies/${academy.slug}`} style={{ textDecoration: "none" }}>
            <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "14px", padding: "22px" }} className="card">
              <div style={{ display: "flex", alignItems: "center", gap: "12px", marginBottom: "12px" }}>
                <span style={{ fontSize: "24px" }}>{academy.icon}</span>
                <div style={{ marginLeft: "8px" }}>
                  <h3 style={{ fontSize: "15px", fontWeight: 700 }}>{academy.title}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "12px" }}>{academy.domains.flatMap(d=>d.technologies).length} technologies</p>
                </div>
              </div>
              <div style={{ display: "flex", alignItems: "center", gap: "6px", color: academy.color, fontSize: "13px", fontWeight: 600 }}>
                <FlaskConical size={14} /> View Labs →
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
