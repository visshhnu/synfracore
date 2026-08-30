import React from "react";

interface Props {
  section: string;
  accentColor?: string;
  // Real git-derived last-updated date (YYYY-MM-DD), from
  // lib/content/last-updated.ts — undefined when the file has no commit
  // history yet (freshly added, not committed) or no content exists.
  lastUpdated?: string;
}

function formatUpdatedDate(iso: string): string {
  const [year, month] = iso.split("-");
  const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  return `${monthNames[Number(month) - 1]} ${year}`;
}

// Previously claimed "Written by senior engineers. Reviewed for technical
// accuracy.", "Verified by practitioners with 5+ years production
// experience", "Tested in real environments. All scenarios are
// production-validated.", "Aligned with official exam objectives...", and a
// "SynfraCore {tech} Team" attribution — none of which were true; no such
// review/testing process exists. Removed entirely rather than softened,
// since a vaguer version of the same claim would still be false. The only
// thing genuinely verifiable here is the real last-updated date (see
// scripts/generate-content-dates.mjs) — shown when available, with the
// whole badge omitted (not shown empty or with a placeholder) when it isn't,
// since a badge with nothing true to say shouldn't render at all.
const sectionIcons: Record<string, string> = {
  interview: "💬",
  labs: "🧪",
  certification: "🏆",
};

export default function AuthorBadge({ section, accentColor = "#6366F1", lastUpdated }: Props) {
  if (!lastUpdated) return null;

  const icon = sectionIcons[section] || "📄";

  return (
    <div style={{
      display: "flex", alignItems: "center", gap: "12px",
      padding: "12px 16px", borderRadius: "10px",
      background: accentColor + "08",
      border: `1px solid ${accentColor}20`,
      marginBottom: "24px",
      fontSize: "13px",
    }}>
      <div style={{ fontSize: "20px", flexShrink: 0 }}>{icon}</div>
      <div>
        <span style={{ color: "var(--text-3)" }}>Last updated {formatUpdatedDate(lastUpdated)}</span>
      </div>
    </div>
  );
}
