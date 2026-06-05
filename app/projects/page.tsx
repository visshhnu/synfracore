import Link from "next/link";
import { academies } from "@/lib/data/academies";

export const metadata = { title: "Projects — SynfraCore" };

const levels = [
  { name: "Beginner", icon: "🌱", desc: "Simple practical projects", color: "#10B981" },
  { name: "Intermediate", icon: "⚡", desc: "Multi-component solutions", color: "#F59E0B" },
  { name: "Advanced", icon: "🚀", desc: "Enterprise-grade implementations", color: "#F43F5E" },
];

export default function ProjectsPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      <div className="mb-16 text-center">
        <h1 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Real Projects
        </h1>
        <p style={{ color: "#6B7A99", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Build portfolio-worthy projects that demonstrate real engineering skills
        </p>
      </div>

      <div className="grid gap-6 md:grid-cols-3 mb-16">
        {levels.map((l) => (
          <div key={l.name} style={{ background: "#0F1A2E", border: `1px solid ${l.color}25`, borderRadius: "16px", padding: "28px", textAlign: "center" }}>
            <span style={{ fontSize: "40px", display: "block", marginBottom: "12px" }}>{l.icon}</span>
            <h3 style={{ fontFamily: "'Syne', sans-serif", fontSize: "20px", fontWeight: 700, color: l.color, marginBottom: "8px" }}>{l.name} Projects</h3>
            <p style={{ color: "#6B7A99", fontSize: "14px" }}>{l.desc}</p>
          </div>
        ))}
      </div>

      <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "26px", fontWeight: 700, marginBottom: "24px" }}>
        Projects by Academy
      </h2>
      <div className="grid gap-5 md:grid-cols-2 lg:grid-cols-3">
        {academies.map((academy) => (
          <Link key={academy.slug} href={`/academies/${academy.slug}`} style={{ textDecoration: "none" }}>
            <div style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "16px", padding: "24px" }} className="card">
              <div style={{ fontSize: "32px", marginBottom: "12px" }}>{academy.icon}</div>
              <h3 style={{ fontFamily: "'Syne', sans-serif", fontSize: "18px", fontWeight: 700, marginBottom: "6px" }}>{academy.title}</h3>
              <p style={{ color: "#6B7A99", fontSize: "13px", marginBottom: "14px" }}>{academy.subtitle}</p>
              <div style={{ color: academy.color, fontSize: "13px", fontWeight: 600 }}>
                View Projects →
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}
