import React from "react";

interface Props {
  techName: string;
  section: string;
  accentColor?: string;
}

export default function AuthorBadge({ techName, section, accentColor = "#6366F1" }: Props) {
  const isInterview = section === "interview";
  const isLabs = section === "labs";
  const isCert = section === "certification";

  const badge = isInterview
    ? { text: "Verified by practitioners with 5+ years production experience", icon: "[Q]" }
    : isLabs
    ? { text: "Tested in real environments. All scenarios are production-validated.", icon: "[L]" }
    : isCert
    ? { text: "Aligned with official exam objectives. Updated for current exam versions.", icon: "[C]" }
    : { text: "Written by senior engineers. Reviewed for technical accuracy.", icon: "✍" };

  return (
    <div style={{
      display: "flex", alignItems: "center", gap: "12px",
      padding: "12px 16px", borderRadius: "10px",
      background: accentColor + "08",
      border: `1px solid ${accentColor}20`,
      marginBottom: "24px",
      fontSize: "13px",
    }}>
      <div style={{ fontSize: "20px", flexShrink: 0 }}>{badge.icon}</div>
      <div>
        <span style={{ color: "var(--text-3)" }}>{badge.text}</span>
        <span style={{ color: "var(--text-4)", marginLeft: "8px" }}>
          · Updated 2025 · <span style={{ color: accentColor, fontWeight: 600 }}>SynfraCore {techName} Team</span>
        </span>
      </div>
    </div>
  );
}
