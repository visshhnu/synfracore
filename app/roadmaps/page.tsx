"use client";
import Link from "next/link";
import { roadmaps } from "@/lib/data/navigation";
import { Clock, ArrowRight } from "lucide-react";
export const runtime = "edge";

const CATEGORIES = [
  { id: "all",          label: "All Paths",    color: "#6B7280" },
  { id: "tech",         label: "Tech",         color: "#3B82F6" },
  { id: "law",          label: "Law",          color: "#6366F1" },
  { id: "government",   label: "Government",   color: "#F59E0B" },
  { id: "finance",      label: "Finance",      color: "#14B8A6" },
  { id: "agriculture",  label: "Agriculture",  color: "#22C55E" },
  { id: "telecom",      label: "Telecom",      color: "#0EA5E9" },
  { id: "education",    label: "Education",    color: "#F43F5E" },
  { id: "professional", label: "Professional", color: "#10B981" },
  { id: "wellness",     label: "Wellness",     color: "#A855F7" },
];

const salaries: Record<string, string> = {
  "devops-engineer": "₹8L–₹35L", "cloud-architect": "₹15L–₹60L",
  "platform-engineer": "₹20L–₹80L", "ai-engineer": "₹18L–₹80L",
  "data-analyst": "₹5L–₹25L", "security-engineer": "₹10L–₹45L",
  "database-engineer": "₹8L–₹35L", "data-engineer": "₹10L–₹40L",
  "sre-engineer": "₹20L–₹90L", "healthcare-coder": "₹3L–₹12L",
  "advocate-career": "₹3L–₹50L+", "judiciary-civil-judge": "₹13L–₹25L (govt)",
  "upsc-ias": "₹8L–₹25L (govt)", "banking-po": "₹8L–₹18L",
  "state-psc-officer": "₹6L–₹20L", "ca-journey": "₹8L–₹50L+",
  "banking-finance-analyst": "₹5L–₹25L", "agricultural-officer": "₹5L–₹18L",
  "telecom-engineer": "₹4L–₹20L", "neet-medical": "MBBS admission",
  "jee-engineering": "B.Tech admission", "personal-wellness": "Life skill",
};

import { useState } from "react";

export default function RoadmapsPage() {
  const [active, setActive] = useState("all");

  const filtered = active === "all" ? roadmaps : roadmaps.filter(r => (r as any).category === active);

  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "56px 24px" }}>
      {/* Header */}
      <div style={{ marginBottom: "48px", textAlign: "center" }}>
        <div style={{ display: "inline-block", background: "rgba(99,102,241,0.1)", border: "1px solid rgba(99,102,241,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#6366F1", fontWeight: 600, marginBottom: "16px" }}>
          22 Career Paths · All Domains
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(32px, 5vw, 52px)", fontWeight: 800, letterSpacing: "-0.03em", marginBottom: "16px" }}>
          Learning Roadmaps
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "18px", maxWidth: "600px", margin: "0 auto", lineHeight: 1.6 }}>
          Step-by-step paths from beginner to job-ready — for tech, law, government, finance, agriculture, telecom, and more.
        </p>
      </div>

      {/* Category filter */}
      <div style={{ display: "flex", gap: "8px", flexWrap: "wrap", justifyContent: "center", marginBottom: "40px" }}>
        {CATEGORIES.map(cat => (
          <button key={cat.id} onClick={() => setActive(cat.id)} style={{
            padding: "7px 16px", borderRadius: "20px", fontSize: "13px", fontWeight: 600,
            border: "1px solid var(--border)", cursor: "pointer", transition: "all 0.15s",
            background: active === cat.id ? cat.color : "var(--bg-2)",
            color: active === cat.id ? "white" : "var(--text-3)",
            borderColor: active === cat.id ? "transparent" : "var(--border)",
          }}>
            {cat.label}
            {active !== "all" && cat.id !== "all" && (
              <span style={{ marginLeft: "5px", opacity: 0.7, fontSize: "11px" }}>
                ({roadmaps.filter(r => (r as any).category === cat.id).length})
              </span>
            )}
          </button>
        ))}
      </div>

      {/* Roadmap grid */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(min(100%, 360px), 1fr))", gap: "20px" }}>
        {filtered.map(roadmap => {
          const rm = roadmap as typeof roadmap & { color?: string; category?: string };
          const color = rm.color || "#3B82F6";
          return (
            <Link key={rm.slug} href={`/roadmaps/${rm.slug}`} style={{ textDecoration: "none" }}>
              <div style={{
                background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px",
                padding: "24px", height: "100%", transition: "all 0.15s", cursor: "pointer",
                display: "flex", flexDirection: "column",
              }}
                onMouseEnter={e => { (e.currentTarget as HTMLDivElement).style.borderColor = color; (e.currentTarget as HTMLDivElement).style.boxShadow = `0 4px 20px ${color}18`; }}
                onMouseLeave={e => { (e.currentTarget as HTMLDivElement).style.borderColor = "var(--border)"; (e.currentTarget as HTMLDivElement).style.boxShadow = "none"; }}>

                {/* Top bar */}
                <div style={{ height: "3px", borderRadius: "2px", background: color, marginBottom: "16px", marginLeft: "-24px", marginRight: "-24px", marginTop: "-24px", borderTopLeftRadius: "16px", borderTopRightRadius: "16px" }} />

                {/* Icon + title */}
                <div style={{ display: "flex", alignItems: "flex-start", gap: "12px", marginBottom: "16px" }}>
                  <span style={{ fontSize: "30px", flexShrink: 0 }}>{rm.icon}</span>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontWeight: 700, fontSize: "15px", color: "var(--text-1)", marginBottom: "4px" }}>{rm.title}</div>
                    <div style={{ display: "flex", gap: "6px", flexWrap: "wrap", alignItems: "center" }}>
                      <span style={{ fontSize: "11px", color: "var(--text-4)", display: "flex", alignItems: "center", gap: "3px" }}>
                        <Clock size={10} /> {rm.duration}
                      </span>
                      {salaries[rm.slug] && (
                        <span style={{ fontSize: "10px", padding: "2px 7px", borderRadius: "10px", background: color + "18", color, fontWeight: 700 }}>
                          {salaries[rm.slug]}
                        </span>
                      )}
                    </div>
                  </div>
                </div>

                {/* Steps */}
                <div style={{ flex: 1, position: "relative", paddingLeft: "16px", marginBottom: "16px" }}>
                  <div style={{ position: "absolute", left: "5px", top: "6px", bottom: "6px", width: "1.5px", background: "var(--border)" }} />
                  {rm.steps.slice(0, 5).map((step, i) => (
                    <div key={step} style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "7px", position: "relative" }}>
                      <div style={{
                        width: "10px", height: "10px", borderRadius: "50%", flexShrink: 0,
                        background: i === 0 ? color : "var(--bg-1)",
                        border: `2px solid ${i === 0 ? color : "var(--border)"}`,
                        position: "absolute", left: "-16px",
                      }} />
                      <span style={{ fontSize: "12px", color: i === 0 ? "var(--text-1)" : "var(--text-4)", fontWeight: i === 0 ? 600 : 400 }}>
                        {step}
                      </span>
                    </div>
                  ))}
                  {rm.steps.length > 5 && (
                    <div style={{ fontSize: "11px", color: "var(--text-4)", paddingLeft: "0" }}>
                      +{rm.steps.length - 5} more phases
                    </div>
                  )}
                </div>

                {/* Footer */}
                <div style={{ paddingTop: "12px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                  <span style={{ fontSize: "11px", color: "var(--text-4)" }}>{rm.steps.length} phases</span>
                  <span style={{ fontSize: "12px", fontWeight: 700, color }}>View roadmap →</span>
                </div>
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
