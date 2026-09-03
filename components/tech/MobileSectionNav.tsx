"use client";
import Link from "next/link";
import { useEffect, useState } from "react";
import { ChevronDown, X, Sparkles, Check } from "lucide-react";
import { nonTechAcademyIds, getSectionsForTechnology } from "@/lib/data/navigation";
import TechIcon from "@/components/icons/TechIcon";

interface Props {
  academy: string;
  technology: string;
  currentSection: string;
  techName: string;
  techIcon: string;
  accentColor?: string;
  // Sidebar's "Practice Exams" tab is gated by technologyExamTypeMap + a live
  // question_papers check (see app/academies/[academy]/[technology]/
  // [section]/page.tsx) — mobile users were losing that tab entirely since
  // the sidebar that renders it is hidden below 768px with no replacement.
  // Passed down as the already-built scoped href (was a plain boolean
  // until 2026-08-31 — that only gated whether to render the tab at all;
  // now it also carries the ?examType=... scoping so mobile users land on
  // this technology's own papers, not the full 46-paper catalog, same as
  // the desktop sidebar). Absent = don't render the tab at all, same
  // semantics the old boolean had.
  practiceExamsHref?: string;
  // "guide" suppresses Roadmap/Projects/Certification — see the
  // Technology.contentScope doc comment in lib/data/academies.ts. Absent =
  // "full", nothing suppressed.
  contentScope?: "full" | "guide";
}

// Mobile equivalent of the desktop sidebar (app/academies/[academy]/
// [technology]/[section]/page.tsx), which is hidden outright below 768px
// (globals.css: .sidebar-desktop { display: none !important; }) with
// nothing standing in for it — the site-wide hamburger drawer only
// navigates between academies/technologies, not between sections within
// one. This reads from the exact same techSections/nonTechSections source
// (lib/data/navigation.ts) the sidebar and WhatNext already use, so it
// can't drift out of sync with either.
export default function MobileSectionNav({ academy, technology, currentSection, techName, techIcon, accentColor = "#6366F1", practiceExamsHref, contentScope }: Props) {
  const [open, setOpen] = useState(false);
  const isNonTech = nonTechAcademyIds.includes(academy);
  const sections = getSectionsForTechnology({ contentScope }, isNonTech, academy, technology);
  const current = sections.find(s => s.slug === currentSection);

  useEffect(() => {
    document.body.style.overflow = open ? "hidden" : "";
    return () => { document.body.style.overflow = ""; };
  }, [open]);

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => { if (e.key === "Escape") setOpen(false); };
    document.addEventListener("keydown", onKey);
    return () => document.removeEventListener("keydown", onKey);
  }, []);

  // Close automatically if a section navigation happens elsewhere (e.g.
  // browser back/forward) so the sheet never reopens stale on a new page.
  useEffect(() => { setOpen(false); }, [currentSection]);

  return (
    <div className="show-mobile mobile-section-nav" style={{ margin: "0 -24px" }}>
      {/* Sticky "current section" bar — persists on scroll, sits right
          under the fixed header (app/layout.tsx gives <main> a constant
          64px paddingTop, so top: 64px lines up with its bottom edge).
          Negative margin on the wrapper cancels <main>'s 24px side padding
          so this reads as a full-bleed toolbar instead of an inset pill;
          the button's own horizontal padding puts the label back in line
          with the content below it. */}
      <button
        onClick={() => setOpen(true)}
        aria-label="Jump to section"
        aria-expanded={open}
        style={{
          position: "sticky", top: "64px", zIndex: 40, width: "100%",
          display: "flex", alignItems: "center", gap: "8px",
          padding: "10px 24px", background: "var(--bg-1)",
          borderBottom: "1px solid var(--border)", borderTop: "1px solid var(--border)",
          cursor: "pointer", fontFamily: "inherit", textAlign: "left",
        }}
      >
        {current?.icon ? (
          <span style={{ fontSize: "16px", flexShrink: 0 }}>{current.icon}</span>
        ) : (
          <TechIcon slug={technology} fallback={techIcon} size={16} />
        )}
        <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)", flex: 1, minWidth: 0, overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
          {current?.label || currentSection}
        </span>
        <span style={{ fontSize: "12px", color: "var(--text-4)", flexShrink: 0 }}>Jump to section</span>
        <ChevronDown size={16} color="var(--text-4)" style={{ flexShrink: 0 }} />
      </button>

      {/* Backdrop */}
      {open && (
        <div
          onClick={() => setOpen(false)}
          style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,0.45)", zIndex: 9500, backdropFilter: "blur(2px)" }}
        />
      )}

      {/* Bottom sheet */}
      <div
        role="dialog"
        aria-modal="true"
        style={{
          position: "fixed", left: 0, right: 0, bottom: 0, zIndex: 9501,
          maxHeight: "75vh", overflowY: "auto",
          background: "var(--bg-1)", borderRadius: "16px 16px 0 0",
          boxShadow: "0 -8px 40px rgba(0,0,0,0.25)",
          transform: open ? "translateY(0)" : "translateY(100%)",
          transition: "transform 0.28s cubic-bezier(0.4,0,0.2,1)",
        }}
      >
        <div style={{ position: "sticky", top: 0, display: "flex", alignItems: "center", justifyContent: "space-between", padding: "14px 16px", borderBottom: "1px solid var(--border)", background: "var(--bg-1)" }}>
          <div>
            <div style={{ fontSize: "12px", fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", color: "var(--text-4)" }}>{techName}</div>
            <div style={{ fontSize: "14px", fontWeight: 700, color: "var(--text-1)" }}>Jump to section</div>
          </div>
          <button onClick={() => setOpen(false)} aria-label="Close" style={{ background: "none", border: "1px solid var(--border)", cursor: "pointer", color: "var(--text-2)", padding: "6px", display: "flex", borderRadius: "8px" }}>
            <X size={16} />
          </button>
        </div>

        <div style={{ padding: "8px" }}>
          {sections.map(s => {
            const isActive = s.slug === currentSection;
            return (
              <Link
                key={s.slug}
                href={`/academies/${academy}/${technology}/${s.slug}`}
                prefetch={false}
                onClick={() => setOpen(false)}
                style={{
                  display: "flex", alignItems: "center", gap: "10px",
                  padding: "12px 12px", borderRadius: "10px", marginBottom: "2px",
                  textDecoration: "none",
                  background: isActive ? "var(--bg-2)" : "transparent",
                  opacity: s.hasContent ? 1 : 0.45,
                }}
              >
                <span style={{ fontSize: "16px", flexShrink: 0 }}>{s.icon}</span>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ fontSize: "14px", fontWeight: isActive ? 700 : 500, color: isActive ? "var(--accent)" : "var(--text-2)" }}>{s.label}</div>
                </div>
                {!s.hasContent && (
                  <span style={{ fontSize: "9px", fontWeight: 600, padding: "1px 6px", borderRadius: "10px", background: "var(--bg-2)", color: "var(--text-4)", whiteSpace: "nowrap", flexShrink: 0 }}>
                    Not yet written
                  </span>
                )}
                {isActive && <Check size={16} color={accentColor} style={{ flexShrink: 0 }} />}
              </Link>
            );
          })}

          {practiceExamsHref && (
            <Link
              href={practiceExamsHref}
              prefetch={false}
              onClick={() => setOpen(false)}
              style={{ display: "flex", alignItems: "center", gap: "10px", padding: "12px 12px", borderRadius: "10px", textDecoration: "none" }}
            >
              <span style={{ fontSize: "16px", flexShrink: 0 }}>📝</span>
              <div style={{ flex: 1, minWidth: 0, fontSize: "14px", fontWeight: 500, color: "var(--text-2)" }}>Practice Exams</div>
              <span style={{ display: "flex", alignItems: "center", gap: "2px", fontSize: "9px", fontWeight: 700, padding: "2px 7px", borderRadius: "20px", background: "rgba(245,158,11,0.12)", color: "#F59E0B", whiteSpace: "nowrap", flexShrink: 0 }}>
                <Sparkles size={9} /> Premium
              </span>
            </Link>
          )}
        </div>
      </div>
    </div>
  );
}
