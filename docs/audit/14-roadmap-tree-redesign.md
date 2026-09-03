# Roadmap.sh-Style Tree Redesign — Future Rollout Tracker

**Started:** 2026-09-01. **Pilot built and deployed:** 2026-09-03.
**Status: PILOT LIVE on DevOps Engineer.** Real branching UI, not a mockup —
see "Pilot build record" near the end of this doc for what shipped, what
changed from the original draft, and what a wider rollout decision should
weigh next.

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

## DRAFT — DevOps Engineer branch-point proposal (2026-09-03)

**Content/IA proposal only — no component code written, no `roadmapDetails.ts`
data model changes made.** This directly addresses "real, non-trivial piece
2" above (the branch-point editorial decision was previously unmade). Save
for review; do not build the component against this until it's confirmed.

Current linear list (`lib/data/roadmapDetails.ts`, `devops-engineer.techLinks`,
10 steps): Linux → Shell Scripting → Git → Docker → Kubernetes → CI/CD
Pipelines → Cloud (AWS) → Cloud (Azure) → Monitoring (Prometheus) → IaC
(Terraform).

**Proposed structure: a linear spine with exactly 2 genuine forks** —
deliberately restrained, matching the approved "lighter, not over-engineered"
direction. Not every step that COULD branch should; a tree with too many
forks for a 10-step roadmap would be worse than the current flat list, not
better.

```
Linux → Shell Scripting → Git → Docker → Kubernetes
                                              │
                                     FORK 1: CI/CD Tooling
                                    ┌─────────┼─────────┐
                            GitHub Actions  Jenkins  GitLab CI
                            (recommended)  (enterprise/  (if your
                                            legacy-heavy   target org
                                            orgs)          uses GitLab)
                                    └─────────┼─────────┘
                                         (reconverge)
                                              │
                                    FORK 2: Cloud Platform
                                    ┌─────────┴─────────┐
                              AWS Track              Azure Track
                          (EC2, S3, IAM,          (VMs, Storage,
                           Lambda, EKS →           Entra ID, AKS →
                           toward AWS SAA)         toward AZ-104)
                                    └─────────┬─────────┘
                                         (reconverge)
                                              │
                                    Monitoring (kept LINEAR,
                                    not forked — see reasoning below)
                                              │
                                    IaC with Terraform (kept LINEAR —
                                    see reasoning below)
```

**Fork 1 — CI/CD Tooling choice** (lighter fork; concepts transfer between
tools, but hands-on practice benefits from picking one to go deep on):
- GitHub Actions (`devops/github-actions`) — recommended default: largest
  current market share, tightest integration with GitHub (where most
  learners' own projects already live), most beginner-friendly setup.
- Jenkins (`devops/jenkins`) — still dominant in larger/legacy enterprise
  environments; more setup complexity, more configuration surface.
- GitLab CI (`devops/gitlab-ci`) — relevant specifically for learners
  targeting orgs already standardized on GitLab.
- All three technologies already exist and have real content — this fork
  needs zero new content authoring, only the branching IA/component.

**Fork 2 — Cloud Platform choice** (the heavier, more consequential fork —
this is the one that actually steers a learner's job-market specialization
and which certification they'd realistically pursue next):
- AWS Track — reflects the existing "Cloud — AWS" step
  (`cloud/aws`), with an explicit note that this track leads toward the
  AWS SAA certification (`lib/data/navigation.ts`'s existing `aws-saa` entry
  and its own live practice-exam papers — a real, already-built connection
  point, not a new one to invent).
- Azure Track — reflects the existing "Cloud — Azure" step (`cloud/azure`).
  No Azure certification practice-exam papers exist on the platform yet
  (this is not new information — same AWS/Azure asymmetry already
  documented elsewhere), so this track's end-state connection is weaker
  than AWS's today; noting this now so it isn't a surprise once the
  component is actually built.
- GCP is deliberately NOT added as a third branch here — it isn't in the
  current roadmap's step list at all, and adding it would be scope
  expansion beyond "give this existing roadmap real branches," not part of
  this proposal.

**Why Monitoring stays linear, not forked:** The current step is already
narrowly scoped to "Monitoring — Prometheus," not a generic "Monitoring"
step — the roadmap has implicitly already made this tool choice without
presenting it as a branch, and that's the right call to keep, not undo.
A genuine fork here (Prometheus/Grafana vs. cloud-native CloudWatch/Azure
Monitor, plausibly tied to whichever Fork 2 branch was taken) is real and
defensible, but adding a 3rd structural fork to a 10-step roadmap starts
working against the "lighter, restrained" design goal this pilot is
supposed to demonstrate. Recommend handling this with a short inline note
in the Prometheus step's content instead ("on AWS, also look at CloudWatch;
on Azure, Azure Monitor") rather than a structural tree fork — content-level
acknowledgment, not IA-level branching.

**Why IaC/Terraform stays linear, not forked:** Terraform's whole value
proposition is being cloud-agnostic (the same tool, same workflow, provider
plugins for AWS/Azure/GCP alike) — this is precisely why it dominates real
hiring requirements across cloud providers rather than each cloud having its
own separate go-to IaC tool in practice. Forking this step by cloud platform
would misrepresent Terraform's actual selling point. One linear step,
reconverged after Fork 2, is the accurate representation.

**Net shape**: 5 linear steps → Fork 1 (3 branches) → reconverge → Fork 2
(2 branches) → reconverge → 2 more linear steps. Two forks, not three or
more — deliberately conservative for a first pilot, consistent with the
"prove it's a genuine usability improvement on ONE example before deciding
on the other 25" plan already agreed above.

**Still needed before this can be built** (unchanged from "real,
non-trivial pieces" above — this section only resolves item 2, the
branch-point decision itself):
1. The actual branching component (CSS Grid/SVG node layout) — not started.
2. `roadmapDetails.ts`'s data model needs a way to express fork/reconverge
   structure (today's `techLinks`/`steps` are both flat arrays, confirmed by
   reading the live `devops-engineer` entry directly — 10 linear steps, CI/CD
   collapsed into one generic `cicd` slug that this proposal would replace
   with the 3 real, already-content-complete tool slugs above). A possible
   shape, sketched here as a starting point for whoever makes this call —
   **not decided, not adopted**, since a real data-model decision belongs
   with whoever designs the component, not this content/IA proposal:
   ```ts
   steps: (
     | { type: "linear"; techLink: TechLink }
     | { type: "fork"; label: string; branches: TechLink[]; recommended?: string }
   )[]
   ```
   A flat array where a `fork` entry's branches render side-by-side and the
   next `linear` entry after it is understood to reconverge — avoids a
   separate graph/edge-list structure for what is, in this pilot, always a
   simple sequence of forks each closing before the next opens (true for
   DevOps Engineer's 2 forks; may not generalize to every one of the other
   25 roadmaps, which is exactly why this stays pilot-scoped).
3. Theme/mobile/accessibility verification — unchanged, still pending the
   actual build.

## Pilot build record (2026-09-03)

Built and deployed exactly as scoped above — DevOps Engineer only, no
pan/zoom, CSS flexbox not SVG/graph library.

**What changed from the draft's data-model sketch, and why**: the tagged-
union `steps: (linear|fork)[]` proposed above turned out to conflict with
`scripts/validate-roadmaps.ts`, a strict pre-existing validator that
requires exact positional 1:1 correspondence across three parallel arrays
(`navigation.ts`'s flat label list, `roadmapDetails.ts`'s `techLinks[]`,
and its `steps[]`) for every one of the 27 roadmaps — a tagged union would
have broken that invariant for this roadmap specifically. Used a safer,
additive shape instead: `steps[i].techLink` stays required and always
points at the fork's recommended/default branch (so the existing
validator's checks pass completely unchanged, for this roadmap and all
26 others), and a new *optional* `steps[i].fork: { branches, recommendedSlug }`
field carries the full branch set for the renderer. Confirmed
`npm run validate:roadmaps` passes (27 roadmaps, 190 techLinks, zero
failures) both before and after.

**Structural change**: DevOps Engineer went from 10 linear steps to 9 —
the two previously-separate sequential steps "Cloud — AWS" and
"Cloud — Azure" are now one fork step with two branches (a genuine
either/or choice, not two things to learn back-to-back), and the generic
"CI/CD Pipelines" step became a real fork across GitHub Actions/Jenkins/
GitLab CI. `navigation.ts`'s step-count for this roadmap was updated to
match (validator would have caught it otherwise).

**New files/changes**: `components/roadmap/RoadmapTree.tsx` (new — the
branching renderer), `app/roadmaps/[slug]/page.tsx` (swapped its inline
step-list markup for `<RoadmapTree>`, which renders every non-forked step
identically to the old markup — confirmed via a live regression check on
an unrelated roadmap, `full-stack-developer`, after deploy), `lib/data/
roadmapDetails.ts` (type + DevOps Engineer's steps), `lib/data/
navigation.ts` (DevOps Engineer's step-label array).

**Verification performed**: `tsc --noEmit` clean; `validate:roadmaps`
clean; local Playwright screenshots in both dark and light theme
(desktop) — fork branches render with clear borders, the "Recommended"
badge is legible and conveyed via visible text, not color alone; a mobile
viewport (390px) screenshot confirming branches wrap via `flex-wrap`
without breaking layout; a live click-through on the deployed site
(clicked the Jenkins branch, confirmed it navigates to the real Jenkins
technology page, not a dead link). Accessibility: every step and branch
is a real `next/link` `<Link>` (keyboard-navigable, semantic `<a>`), not
a styled `<div onClick>`.

**Not yet done / next decision point**: this is still genuinely one
example. Per the standing phased-decision pattern (same as Phase 3, the
practice-exam rollout, and the brand-logo rollout) — do not roll this out
to the other 25 roadmaps without a deliberate go-ahead, and when that
decision comes up, weigh that only 2 of the other 25 roadmaps were
scoped as having genuine fork points during the original review; most are
linear by nature and wouldn't benefit from this pattern at all.
