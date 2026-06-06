import Link from "next/link";
import { academies } from "@/lib/data/academies";
import { ArrowRight } from "lucide-react";

export const metadata = {
  title: "Academies — SynfraCore",
  description: "Choose from 6 specialized academies covering DevOps, Cloud, AI, Data, Healthcare, and Cybersecurity",
};

export default function AcademiesPage() {
  return (
    <div className="mx-auto max-w-7xl px-6 py-16">
      {/* Header */}
      <div className="mb-16 text-center">
        <h1
          style={{
            fontFamily: "'Syne', sans-serif",
            fontSize: "clamp(36px, 5vw, 56px)",
            fontWeight: 800,
            letterSpacing: "-0.03em",
            marginBottom: "16px",
          }}
        >
          All Academies
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "500px", margin: "0 auto" }}>
          Structured learning paths designed by practitioners, for practitioners
        </p>
      </div>

      <div className="grid gap-8 lg:grid-cols-2">
        {academies.map((academy) => (
          <div
            key={academy.slug}
            style={{
              background: "var(--bg-2)",
              border: "1px solid var(--border)",
              borderRadius: "20px",
              padding: "32px",
              transition: "all 0.3s",
            }}
            className="hover:border-blue-500/30"
          >
            <div style={{ display: "flex", alignItems: "flex-start", gap: "18px", marginBottom: "20px" }}>
              <div
                style={{
                  width: "60px",
                  height: "60px",
                  borderRadius: "16px",
                  background: `linear-gradient(135deg, ${academy.color}25, ${academy.color}10)`,
                  border: `1px solid ${academy.color}30`,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  fontSize: "28px",
                  flexShrink: 0,
                }}
              >
                {academy.icon}
              </div>
              <div style={{ flexGrow: 1 }}>
                <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "22px", fontWeight: 700, marginBottom: "4px" }}>
                  {academy.title}
                </h2>
                <p style={{ color: academy.color, fontSize: "13px", fontWeight: 600, letterSpacing: "0.06em" }}>
                  {academy.subtitle}
                </p>
              </div>
              <Link
                href={`/academies/${academy.slug}`}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: "4px",
                  background: `${academy.color}15`,
                  border: `1px solid ${academy.color}30`,
                  color: academy.color,
                  padding: "8px 16px",
                  borderRadius: "10px",
                  fontSize: "13px",
                  fontWeight: 600,
                  textDecoration: "none",
                  flexShrink: 0,
                }}
              >
                Enter <ArrowRight size={14} />
              </Link>
            </div>

            <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.6, marginBottom: "18px" }}>
              {academy.description}
            </p>

            <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
              {academy.technologies.map((tech) => (
                <Link
                  key={tech.slug}
                  href={`/academies/${academy.slug}/${tech.slug}`}
                  style={{
                    background: "rgba(255,255,255,0.03)",
                    border: "1px solid var(--border)",
                    color: "var(--text-3)",
                    padding: "4px 10px",
                    borderRadius: "8px",
                    fontSize: "12px",
                    fontWeight: 500,
                    textDecoration: "none",
                    transition: "all 0.15s",
                  }}
                  className="hover:bg-white/10 hover:text-white"
                >
                  {tech.name}
                </Link>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
