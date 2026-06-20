export const runtime = "edge";
import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { ArrowRight } from "lucide-react";

export const metadata = {
  title: "Academies — SynfraCore",
  description: "7 specialised academies covering DevOps, Cloud, Databases, AI, Data Analytics, Cybersecurity, and Healthcare Coding.",
};

export default function AcademiesPage() {
  return (
    <div style={{ background: "var(--bg)", minHeight: "100vh" }}>
      {/* Header */}
      <div style={{ borderBottom: "1px solid var(--border)", padding: "56px 0 48px" }}>
        <div className="page-container">
          <div className="badge badge-blue" style={{ marginBottom: "16px" }}>Tech Academies</div>
          <h1 className="display-lg" style={{ marginBottom: "12px" }}>Choose Your Academy</h1>
          <p className="body-lg" style={{ maxWidth: "560px" }}>
            Each academy is a complete learning ecosystem — structured domains, guided paths, hands-on labs, and expert content from beginner to architect level.
          </p>
        </div>
      </div>

      {/* Academy grid */}
      <div className="page-container" style={{ padding: "48px 24px" }}>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))", gap: "20px" }}>
          {academies.map((academy) => (
            <Link key={academy.slug} href={`/academies/${academy.slug}`} style={{ textDecoration: "none" }}>
              <div className="card card-interactive" style={{ padding: "28px", height: "100%", display: "flex", flexDirection: "column" }}>
                {/* Header */}
                <div style={{ display: "flex", alignItems: "center", gap: "14px", marginBottom: "16px" }}>
                  <div style={{ width: "52px", height: "52px", borderRadius: "14px", background: `${academy.color}18`, border: `1px solid ${academy.color}30`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "24px", flexShrink: 0 }}>
                    {academy.icon}
                  </div>
                  <div>
                    <div className="heading" style={{ fontSize: "16px" }}>{academy.title}</div>
                    <div style={{ fontSize: "11px", color: academy.color, fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", marginTop: "2px" }}>{academy.subtitle}</div>
                  </div>
                </div>

                <p style={{ fontSize: "13px", color: "var(--text-4)", lineHeight: 1.65, marginBottom: "18px", flexGrow: 1 }}>
                  {academy.description}
                </p>

                {/* Domains */}
                <div style={{ display: "flex", flexWrap: "wrap", gap: "5px", marginBottom: "16px" }}>
                  {academy.domains.slice(0, 4).map((d) => (
                    <span key={d.slug} style={{ background: `${academy.color}10`, border: `1px solid ${academy.color}20`, color: academy.color, padding: "3px 9px", borderRadius: "6px", fontSize: "11px", fontWeight: 600 }}>
                      {d.name}
                    </span>
                  ))}
                  {academy.domains.length > 4 && (
                    <span style={{ color: "var(--text-4)", fontSize: "11px", padding: "3px 4px" }}>+{academy.domains.length - 4} more</span>
                  )}
                </div>

                {/* Footer */}
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", paddingTop: "14px", borderTop: "1px solid var(--border)" }}>
                  <span style={{ fontSize: "12px", color: "var(--text-4)" }}>
                    {academy.domains.reduce((sum, d) => sum + d.technologies.length, 0)} technologies
                  </span>
                  <span style={{ display: "flex", alignItems: "center", gap: "4px", color: academy.color, fontSize: "12px", fontWeight: 600 }}>
                    Enter Academy <ArrowRight size={12} />
                  </span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
