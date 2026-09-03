import Link from "next/link";
import { ArrowRight } from "lucide-react";
import type { RoadmapDetail } from "@/lib/data/roadmapDetails";

type Props = { steps: RoadmapDetail["steps"]; color: string; trackGroups?: RoadmapDetail["trackGroups"] };

// One step's own numbered-circle + link row — shared between the default
// single connected list below and each independent track group's own
// mini-list in TrackGroups, so both renderers produce visually identical
// step rows (same circle style, same link style) even though the
// surrounding structure (one continuous line vs. several disconnected
// short lists) differs.
function StepRow({ step, number, isFirst, isLast, color }: { step: RoadmapDetail["steps"][number]; number: number; isFirst: boolean; isLast: boolean; color: string }) {
  return (
    <div style={{ display: "flex", gap: "16px" }}>
      <div style={{ display: "flex", flexDirection: "column", alignItems: "center", flexShrink: 0, width: "32px" }}>
        <div
          style={{
            width: "32px", height: "32px", borderRadius: "50%",
            background: isFirst ? color : "var(--bg-1)",
            border: `2px solid ${isFirst ? color : "var(--border)"}`,
            display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: "12px", fontWeight: 700, color: isFirst ? "white" : "var(--text-4)", flexShrink: 0,
          }}
        >
          {number}
        </div>
        {!isLast && <div style={{ width: "2px", flex: 1, background: "var(--border)", minHeight: "20px" }} />}
      </div>
      <div style={{ paddingBottom: "20px", flex: 1 }}>
        <Link
          href={`/academies/${step.techLink.academy}/${step.techLink.slug}/${step.techLink.section || "overview"}`}
          prefetch={false}
          className="roadmap-step-link"
          style={{
            display: "flex", alignItems: "center", justifyContent: "space-between", gap: "8px",
            textDecoration: "none", marginTop: "6px", padding: "6px 10px", marginLeft: "-10px",
            borderRadius: "8px", transition: "background 0.15s",
          }}
        >
          <span style={{ fontWeight: isFirst ? 700 : 500, fontSize: "14px", color: isFirst ? "var(--text-1)" : "var(--text-2)" }}>
            {step.label}
          </span>
          <ArrowRight size={13} color="var(--text-4)" style={{ flexShrink: 0 }} />
        </Link>
      </div>
    </div>
  );
}

// A roadmap made of several fully independent, NON-reconverging tracks
// (see RoadmapDetail's `trackGroups` type comment — e.g.
// "professional-certifications": PMP/Scrum/ITIL/Six Sigma are four
// separate real credentials, not steps toward one shared continuation).
// Renders each track as its own short, independently-numbered mini-list
// in a responsive grid, deliberately with NO connecting line between
// groups (there's nothing to reconverge onto) and no "Recommended" badge
// (unlike `fork`, these aren't mutually exclusive — a learner might
// reasonably want more than one).
function TrackGroups({ steps, groups, color }: { steps: RoadmapDetail["steps"]; groups: NonNullable<RoadmapDetail["trackGroups"]>; color: string }) {
  return (
    <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))", gap: "24px" }}>
      {groups.map((group) => (
        <div key={group.label}>
          <div style={{ fontWeight: 700, fontSize: "13px", color, marginBottom: "12px", textTransform: "uppercase", letterSpacing: "0.03em" }}>
            {group.label}
          </div>
          <div style={{ display: "flex", flexDirection: "column" }}>
            {group.stepIndices.map((stepIdx, i) => (
              <StepRow
                key={steps[stepIdx].label}
                step={steps[stepIdx]}
                number={i + 1}
                isFirst={i === 0}
                isLast={i === group.stepIndices.length - 1}
                color={color}
              />
            ))}
          </div>
        </div>
      ))}
      <style>{`
        .roadmap-step-link:hover { background: var(--bg-1); }
      `}</style>
    </div>
  );
}

// Server Component — a lighter, static branching layout (CSS flex/grid,
// no pan/zoom, no client JS) per the approved scope in
// docs/audit/14-roadmap-tree-redesign.md: current roadmap step counts
// (6-10 steps, avg 6.9) are nowhere near the scale that would justify a
// heavy node-graph library. A `fork` step renders its branches side by
// side (stacking vertically on narrow viewports via flex-wrap) with a
// single connecting line in and out, instead of the plain one-line-per-step
// list every other roadmap still uses (RoadmapDetailPage renders that
// linear list directly; this component is opted into only where a step
// actually has a `fork`). `trackGroups`, when present, replaces the whole
// connected-list rendering with TrackGroups above instead — a genuinely
// different shape (independent tracks, not a branch-and-rejoin), so it's
// handled as an early return rather than threading a second condition
// through every line of the default renderer below.
export default function RoadmapTree({ steps, color, trackGroups }: Props) {
  if (trackGroups) {
    return <TrackGroups steps={steps} groups={trackGroups} color={color} />;
  }

  return (
    <div style={{ display: "flex", flexDirection: "column", gap: "0" }}>
      {steps.map((s, i) => {
        const isFirst = i === 0;
        const isLast = i === steps.length - 1;
        return (
          <div key={s.label}>
            <div style={{ display: "flex", gap: "16px" }}>
              <div style={{ display: "flex", flexDirection: "column", alignItems: "center", flexShrink: 0, width: "32px" }}>
                <div
                  style={{
                    width: "32px", height: "32px", borderRadius: "50%",
                    background: isFirst ? color : "var(--bg-1)",
                    border: `2px solid ${isFirst ? color : "var(--border)"}`,
                    display: "flex", alignItems: "center", justifyContent: "center",
                    fontSize: "12px", fontWeight: 700, color: isFirst ? "white" : "var(--text-4)", flexShrink: 0,
                  }}
                >
                  {i + 1}
                </div>
                {!isLast && <div style={{ width: "2px", flex: 1, background: "var(--border)", minHeight: s.fork ? "12px" : "20px" }} />}
              </div>

              <div style={{ paddingBottom: s.fork ? "8px" : "20px", flex: 1 }}>
                {!s.fork ? (
                  <Link
                    href={`/academies/${s.techLink.academy}/${s.techLink.slug}/${s.techLink.section || "overview"}`}
                    prefetch={false}
                    className="roadmap-step-link"
                    style={{
                      display: "flex", alignItems: "center", justifyContent: "space-between", gap: "8px",
                      textDecoration: "none", marginTop: "6px", padding: "6px 10px", marginLeft: "-10px",
                      borderRadius: "8px", transition: "background 0.15s",
                    }}
                  >
                    <span style={{ fontWeight: isFirst ? 700 : 500, fontSize: "14px", color: isFirst ? "var(--text-1)" : "var(--text-2)" }}>
                      {s.label}
                    </span>
                    <ArrowRight size={13} color="var(--text-4)" style={{ flexShrink: 0 }} />
                  </Link>
                ) : (
                  <div style={{ fontWeight: 500, fontSize: "14px", color: "var(--text-2)", marginTop: "6px", marginBottom: "10px" }}>
                    {s.label} <span style={{ fontSize: "11px", color: "var(--text-4)", fontWeight: 400 }}>— pick one to go deep on</span>
                  </div>
                )}
              </div>
            </div>

            {s.fork && (
              <div style={{ marginLeft: "16px", paddingLeft: "16px", borderLeft: `2px solid ${color}40`, marginBottom: "20px" }}>
                <div style={{ display: "flex", flexWrap: "wrap", gap: "10px" }}>
                  {s.fork.branches.map((b) => {
                    const isRecommended = b.slug === s.fork!.recommendedSlug;
                    return (
                      <Link
                        key={b.slug}
                        href={`/academies/${b.academy}/${b.slug}/${b.section || "overview"}`}
                        prefetch={false}
                        className="roadmap-fork-branch"
                        style={{
                          display: "flex", alignItems: "center", gap: "6px", textDecoration: "none",
                          padding: "8px 14px", borderRadius: "10px",
                          border: `1px solid ${isRecommended ? color : "var(--border)"}`,
                          background: isRecommended ? `${color}12` : "var(--bg-1)",
                        }}
                      >
                        <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{b.name}</span>
                        {isRecommended && (
                          <span style={{ fontSize: "10px", fontWeight: 700, color, background: `${color}20`, padding: "2px 6px", borderRadius: "6px" }}>
                            Recommended
                          </span>
                        )}
                      </Link>
                    );
                  })}
                </div>
              </div>
            )}
          </div>
        );
      })}

      {/* Same hover style as the plain-list version — kept identical so
          both renderers feel like one design system, not two. */}
      <style>{`
        .roadmap-step-link:hover { background: var(--bg-1); }
        .roadmap-fork-branch:hover { filter: brightness(1.1); }
      `}</style>
    </div>
  );
}
