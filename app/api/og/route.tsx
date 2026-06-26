export const runtime = "edge";
import { ImageResponse } from "next/og";

// Dynamic OG image for each academy — /api/og?academy=devops&title=Kubernetes&section=Overview
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const academy  = searchParams.get("academy")  || "devops";
  const title    = searchParams.get("title")    || "SynfraCore";
  const section  = searchParams.get("section")  || "";
  const subtitle = searchParams.get("subtitle") || "Learn · Build · Get Hired";

  const colorMap: Record<string, string> = {
    devops: "#3B82F6", cloud: "#0EA5E9", databases: "#10B981", ai: "#8B5CF6",
    data: "#06B6D4", security: "#EF4444", healthcare: "#F43F5E",
    essentials: "#EC4899", education: "#F59E0B", exams: "#F97316",
    law: "#A855F7", finance: "#14B8A6", economics: "#64748B",
    agriculture: "#22C55E", telecom: "#6366F1", "state-psc": "#8B5CF6",
    "central-exams": "#FBBF24", "professional-certs": "#84CC16",
  };
  const iconMap: Record<string, string> = {
    devops: "⚙️", cloud: "☁️", databases: "🗄️", ai: "🤖",
    data: "📊", security: "🛡️", healthcare: "🏥",
    essentials: "🌿", education: "🎓", exams: "📝",
    law: "⚖️", finance: "💹", economics: "📈",
    agriculture: "🌾", telecom: "📡", "state-psc": "🏛️",
    "central-exams": "📋", "professional-certs": "🏅",
  };

  const color  = colorMap[academy]  || "#3B82F6";
  const icon   = iconMap[academy]   || "📚";
  const sectionLabel = section ? ` — ${section}` : "";

  return new ImageResponse(
    (
      <div
        style={{
          width: "1200px", height: "630px",
          background: "#0F172A",
          display: "flex", flexDirection: "column",
          justifyContent: "center", alignItems: "flex-start",
          padding: "80px",
          fontFamily: "system-ui, sans-serif",
          position: "relative",
        }}
      >
        {/* Accent bar */}
        <div style={{ position: "absolute", top: 0, left: 0, right: 0, height: "6px", background: color }} />

        {/* Brand */}
        <div style={{ fontSize: "22px", color: "#64748B", marginBottom: "32px", letterSpacing: "0.06em" }}>
          SYNFRACORE.COM
        </div>

        {/* Icon + Academy label */}
        <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "24px" }}>
          <div style={{ fontSize: "52px" }}>{icon}</div>
          <div style={{
            fontSize: "14px", fontWeight: "700", letterSpacing: "0.12em", textTransform: "uppercase",
            color: color, background: color + "20", padding: "6px 16px", borderRadius: "4px",
          }}>
            {academy.toUpperCase()} ACADEMY
          </div>
        </div>

        {/* Main title */}
        <div style={{ fontSize: "60px", fontWeight: "800", color: "#F1F5F9", lineHeight: 1.1, marginBottom: "20px", maxWidth: "900px" }}>
          {title}{sectionLabel}
        </div>

        {/* Subtitle */}
        <div style={{ fontSize: "22px", color: "#94A3B8", maxWidth: "800px" }}>
          {subtitle}
        </div>

        {/* Bottom accent */}
        <div style={{ position: "absolute", bottom: "80px", right: "80px", display: "flex", gap: "10px" }}>
          {["Free", "No Login", "Production-Grade"].map(t => (
            <div key={t} style={{ fontSize: "13px", color: color, background: color + "15", padding: "5px 14px", borderRadius: "20px", border: `1px solid ${color}40` }}>
              {t}
            </div>
          ))}
        </div>
      </div>
    ),
    { width: 1200, height: 630 }
  );
}
