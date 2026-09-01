# Roadmap.sh-Style Tree Redesign — Future Rollout Tracker

**Started:** 2026-09-01.
**Status: DIRECTION CONFIRMED, PILOT NOT STARTED.** This doc exists to
record the scoping decision and rationale so it isn't lost — same
convention as `docs/audit/12-practice-exam-coverage-rollout.md` and
`docs/audit/13-brand-logo-rollout.md`. It is explicitly **not** a
commitment to start building the pilot now, only a record of the approach
already agreed on for when that pilot does start.

## What was asked, and what was decided

The original ask: replace the current linear numbered-step roadmap pages
(`app/roadmaps/[slug]/page.tsx`) with roadmap.sh-style **zoomable,
clickable, branching tree diagrams** (collapsible sections, node-based
layout instead of a flat list).

After scoping both technical approaches, the approved direction is
**narrower than the original ask**:

- **Lighter static branching layout — approved.** Positioned nodes
  (CSS Grid/SVG), genuine branch/parallel-path representation, click-
  through navigation. **No pan/zoom.**
- **Full pan/zoom node graph (React Flow / `@xyflow/react`) — NOT
  approved**, specifically because of a real finding from the scoping
  pass: current roadmap step counts range 6-10 (average 6.9) across all
  26 roadmaps — genuinely small, nowhere near roadmap.sh's own 50-100+
  node diagrams. A heavy pan/zoom library solves a problem this content
  doesn't actually have at its current scale, at real cost (new ~40-60kb
  dependency, Server-to-Client-Component architecture change for the
  diagram, and a genuinely separate mobile-specific design — pan/zoom on
  touchscreens is a documented, real usability risk, and this project has
  consistently invested in mobile-native affordances rather than a
  second, simplified mobile fallback for a desktop-first widget).
- **Pilot scope — DevOps Engineer only**, not all 26. Chosen specifically
  because it's likely the highest-traffic roadmap AND one of the few with
  a genuine natural branch point (cloud platform choice: AWS vs. Azure;
  CI/CD tooling choice) that would actually demonstrate the redesign's
  value, rather than re-skinning an already-linear 6-10-step list with no
  real branching to show.

## Why FlowDiagram isn't the foundation

`components/tech/FlowDiagram.tsx` was checked directly and ruled out — it
is a static CSS-flexbox renderer (an ordered array of boxes, `flow` or
`stack` layout, `→` connectors), with no coordinate system, no branching
(every box has exactly one predecessor/successor), no collapse/expand
state, and it's a Server Component with zero client-side interactivity. A
branching, clickable node layout is a different category of UI, not a
small extension of this component.

## Real, non-trivial pieces the "lighter" version still requires

Approving the lighter approach over the full pan/zoom one reduces scope
meaningfully but does not make this a quick pass — still real work when
the pilot actually starts:

1. **A new component** — positioned/branching node layout (CSS Grid or
   SVG-based), custom node styling matching the site's existing card/
   badge visual language, click-through into `/academies/...` same as
   today.
2. **A genuine content/IA decision for the pilot roadmap** — the current
   `roadmapDetails.ts` data model (`steps: {label, techLink}[]`) has NO
   branching information at all; someone has to actually decide DevOps
   Engineer's real branch points (which steps are parallel/optional vs.
   strictly sequential) before any component can render them — this is
   editorial judgment, not a mechanical data conversion.
3. **Both-theme verification** and **mobile behavior** — even without
   pan/zoom, a branching layout is visually denser than a linear list and
   needs real mobile-viewport consideration (likely still simpler than a
   full pan/zoom mobile fallback, but not free).
4. **Accessibility** — a plain `<Link>` list (today's design) is trivially
   screen-reader- and keyboard-navigable for free; a positioned-node
   layout needs deliberate structure (e.g., a sensible DOM/reading order
   independent of visual position) to not regress this.

## Do not start building from this doc without an explicit go-ahead

This is a scope/direction record, not a work order. When the pilot
actually starts: build it for DevOps Engineer only, verify it's a genuine
usability improvement (not just visually different) and works on mobile
and both themes, THEN decide — with real evidence from one finished
example — whether to invest in rolling it out to the other 25 roadmaps.
Same phased-decision pattern as Phase 3, the practice-exam rollout, and
the brand-logo rollout.
