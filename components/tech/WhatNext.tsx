import Link from "next/link";
import { ArrowRight } from "lucide-react";

interface Props {
  academy: string;
  technology: string;
  currentSection: string;
  techName: string;
  accentColor?: string;
}

const sectionFlow = [
  { slug: "overview",        label: "Overview",        icon: "[R]", desc: "What it is and why it matters" },
  { slug: "fundamentals",    label: "Fundamentals",    icon: "[F]", desc: "Core concepts from scratch" },
  { slug: "intermediate",    label: "Intermediate",    icon: "⚡", desc: "Real-world patterns and practices" },
  { slug: "advanced",        label: "Advanced",        icon: "[^]", desc: "Production hardening and scale" },
  { slug: "labs",            label: "Hands-on Labs",   icon: "[L]", desc: "Practice in real environments" },
  { slug: "projects",        label: "Projects",        icon: "[P]", desc: "Portfolio-ready builds" },
  { slug: "interview",       label: "Interview Prep",  icon: "[Q]", desc: "Questions with detailed answers" },
  { slug: "troubleshooting", label: "Troubleshooting", icon: "[T]", desc: "Debug real production issues" },
  { slug: "certification",   label: "Certification",   icon: "[C]", desc: "Exam prep and practice" },
  { slug: "cheatsheets",     label: "Cheatsheet",      icon: "[S]", desc: "Quick reference guide" },
];

export default function WhatNext({ academy, technology, currentSection, techName, accentColor = "#6366F1" }: Props) {
  const idx = sectionFlow.findIndex(s => s.slug === currentSection);
  const next = idx >= 0 && idx < sectionFlow.length - 1 ? sectionFlow[idx + 1] : null;
  const prev = idx > 0 ? sectionFlow[idx - 1] : null;

  // Suggest 2-3 related sections to explore
  const suggestions = sectionFlow
    .filter(s => s.slug !== currentSection && !["overview"].includes(s.slug))
    .slice(0, 3);

  return (
    <div style={{ marginTop: "48px", paddingTop: "32px", borderTop: "1px solid var(--border)" }}>
      {/* Primary next action */}
      {next && (
        <div style={{ marginBottom: "24px" }}>
          <div style={{ fontSize: "12px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "12px" }}>
            Up Next
          </div>
          <Link href={`/academies/${academy}/${technology}/${next.slug}`} style={{ textDecoration: "none" }}>
            <div className="card-hover" style={{
              padding: "20px 24px", borderRadius: "12px",
              border: `1px solid ${accentColor}30`,
              background: accentColor + "06",
              display: "flex", alignItems: "center", justifyContent: "space-between",
              cursor: "pointer"
            }}>
              <div style={{ display: "flex", alignItems: "center", gap: "14px" }}>
                <span style={{ fontSize: "28px" }}>{next.icon}</span>
                <div>
                  <div style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "16px", color: "var(--text-1)", marginBottom: "4px" }}>
                    {techName} — {next.label}
                  </div>
                  <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{next.desc}</div>
                </div>
              </div>
              <ArrowRight size={20} color={accentColor} style={{ flexShrink: 0 }} />
            </div>
          </Link>
        </div>
      )}

      {/* Also explore */}
      <div>
        <div style={{ fontSize: "12px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "12px" }}>
          Also Worth Exploring
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "10px" }}>
          {suggestions.map(s => (
            <Link key={s.slug} href={`/academies/${academy}/${technology}/${s.slug}`} style={{ textDecoration: "none" }}>
              <div className="card-hover" style={{ padding: "14px 16px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer" }}>
                <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "4px" }}>
                  <span style={{ fontSize: "16px" }}>{s.icon}</span>
                  <span style={{ fontWeight: 600, fontSize: "13px", color: "var(--text-1)" }}>{s.label}</span>
                </div>
                <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{s.desc}</div>
              </div>
            </Link>
          ))}
        </div>
      </div>

      {/* Back to topic overview */}
      <div style={{ marginTop: "20px", textAlign: "center" }}>
        <Link href={`/academies/${academy}/${technology}`} style={{ color: "var(--text-4)", fontSize: "13px", textDecoration: "none" }}>
          ← Back to all {techName} modules
        </Link>
      </div>
    </div>
  );
}
