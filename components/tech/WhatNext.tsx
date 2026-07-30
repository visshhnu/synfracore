import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { nonTechAcademyIds, getSectionsForTechnology } from "@/lib/data/navigation";

interface Props {
  academy: string;
  technology: string;
  currentSection: string;
  techName: string;
  accentColor?: string;
  // "guide" suppresses Roadmap/Projects/Certification from the flow — see
  // the Technology.contentScope doc comment in lib/data/academies.ts.
  // Absent = "full", nothing suppressed.
  contentScope?: "full" | "guide";
}

// Was a hardcoded, static 10-item list completely decoupled from the real
// section source (lib/data/navigation.ts's techSections/nonTechSections) —
// the same source the sidebar and the tech overview module grid already use
// (app/academies/[academy]/[technology]/[section]/page.tsx and
// app/academies/[academy]/[technology]/page.tsx). That drift meant "Up Next"
// silently skipped Prerequisites/Installation/Roadmap/Notes/PYQ/Real World/
// FAQ, misordered Advanced→Labs (real order has Roadmap between them), and
// treated Cheatsheet as the end of the flow even though the sidebar lists
// four more sections after it. It also never branched on academy type, so
// non-tech academies got a "Troubleshooting" suggestion that isn't even a
// nonTechSections entry. Reading from the same live source as the sidebar
// fixes all of that and stays correct automatically as sections are added.
export default function WhatNext({ academy, technology, currentSection, techName, accentColor = "#6366F1", contentScope }: Props) {
  const isNonTech = nonTechAcademyIds.includes(academy);
  const sectionFlow = getSectionsForTechnology({ contentScope }, isNonTech, academy, technology).map(s => ({
    slug: s.slug, label: s.label, icon: s.icon, desc: s.description, hasContent: s.hasContent,
  }));

  const idx = sectionFlow.findIndex(s => s.slug === currentSection);
  // "Up Next" is a "keep going" action — it should never land on an
  // unwritten stub, so it skips forward past any section with no real
  // content yet rather than always taking idx + 1. The full section list
  // (including unwritten ones, grayed out) is still reachable via the
  // sidebar/mobile nav and the "Also Worth Exploring" list below.
  const next = idx >= 0 ? sectionFlow.slice(idx + 1).find(s => s.hasContent) ?? null : null;
  const prev = idx > 0 ? sectionFlow[idx - 1] : null;

  // Suggest 2-3 related sections to explore — unwritten ones are still
  // included here, unchanged from the original ordering, just rendered
  // grayed out below rather than hidden.
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
              <div className="card-hover" style={{ padding: "14px 16px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-1)", cursor: "pointer", opacity: s.hasContent ? 1 : 0.5 }}>
                <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "4px" }}>
                  <span style={{ fontSize: "16px" }}>{s.icon}</span>
                  <span style={{ fontWeight: 600, fontSize: "13px", color: "var(--text-1)" }}>{s.label}</span>
                  {!s.hasContent && (
                    <span style={{ marginLeft: "auto", fontSize: "9px", fontWeight: 600, padding: "1px 6px", borderRadius: "10px", background: "var(--bg-2)", color: "var(--text-4)", whiteSpace: "nowrap" }}>
                      Not yet written
                    </span>
                  )}
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
