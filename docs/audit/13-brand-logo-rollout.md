# Real Brand Logo Icons — Future Rollout Tracker

**Started:** 2026-09-01.
**Status: FOUNDATION DONE, FULL ROLLOUT NOT STARTED.** This doc exists to
record the scope and rationale so it isn't lost — the same convention as
`docs/audit/12-practice-exam-coverage-rollout.md`. It is explicitly **not**
a commitment to swap every technology's icon now. Read this before assuming
any technology beyond the 3 listed below has a real logo — almost none do.

## What shipped this pass (the foundation)

Docker, Kubernetes, and AWS were originally kept as emoji specifically
because pulling real brand logos required `simple-icons` as a new
dependency that wasn't approved at the time. This pass is that approval,
deliberately scoped narrow:

- Installed `simple-icons@16.29.0` — confirmed it introduces zero new
  `npm audit` vulnerabilities (all 10 pre-existing ones trace to Next.js/
  Wrangler/PostCSS/etc., unrelated to this dependency).
- Built `components/icons/TechIcon.tsx` — looks up a technology's `slug`
  in a small internal `REGISTRY`; renders the real official SVG logo (the
  brand's own canonical hex as fill, on a low-opacity same-hue backdrop
  circle for theme-safe contrast with no per-brand light/dark logic
  needed) when registered, or the technology's existing emoji completely
  unchanged when not.
- `REGISTRY` currently holds exactly **3 entries**: `docker`, `kubernetes`,
  `terraform`.
- Wired into exactly **one real call site** — the technology overview
  page's hero icon (`app/academies/[academy]/[technology]/page.tsx`) — as
  the live verification surface for all 4 requested cases:
  - `/academies/devops/docker` → real Docker logo
  - `/academies/devops/kubernetes` → real Kubernetes logo
  - `/academies/devops/terraform` → real Terraform logo (the "one more"
    confirming the pattern beyond the original 3 named technologies)
  - `/academies/cloud/aws` → unchanged 🟠 emoji fallback (see below —
    genuinely can't be a real logo, not merely not-done-yet)
- The other **23 files** that also render a technology's `.icon` field
  (sidebar, mobile nav, academy listing grids, homepage, dashboard, and
  more — see "Where .icon is rendered" below) are **untouched** — still
  plain emoji everywhere else, including for Docker/Kubernetes/Terraform
  themselves outside this one hero-icon location. Wiring `TechIcon` into
  those is explicitly part of the deferred future rollout, not done here.

## Real constraint found, not a bug to route around

**AWS and Microsoft Azure have no entry in `simple-icons` at all** —
confirmed by directly inspecting the installed package's exports (3,457
total), not assumed from a naming guess. This is a known, deliberate
trademark-related exclusion on simple-icons' side, not a slug mismatch.
Both `aws` and `azure` are correctly and permanently absent from
`REGISTRY` — they will keep rendering their existing emoji indefinitely
via `TechIcon`'s fallback path, not merely until someone remembers to add
them. If a real AWS/Azure logo is ever needed, it requires a different
source entirely (each brand's own official press-kit SVG, with that
brand's own usage-guideline review) — out of scope for a `simple-icons`-
based rollout.

## The future scope this doc exists to record

**Eventually, every technology on the platform with a genuine, real
official logo should show it instead of emoji** — but this is a real,
non-trivial content-audit-and-swap effort, sized similarly to the
practice-exam coverage rollout (`docs/audit/12-...`):

- **285 technology entries total** in `lib/data/academies.ts`. A
  conservative, confidence-checked count during this session's scoping
  pass put the number with a genuine, confirmed real-brand-logo match at
  roughly **60-90 entries** — concentrated almost entirely in DevOps,
  Cloud, Databases, AI Engineering, and Data Analytics. Healthcare, Law,
  Competitive Exams, Life Essentials, School Education, Agriculture,
  Finance, Aerospace, VLSI, and Telecom have essentially **zero** real
  candidates (their content is generic domain topics, not branded tools)
  — those stay emoji permanently, not as a gap to eventually close.
- `lib/data/navigation.ts`'s 56 icons are roadmap/career-path category
  icons (⚖️ Law, 🏦 Banking) — **not in scope**, no brand exists to swap
  in for a career category.
- **Every entry needs individually confirming against simple-icons'
  actual current export list before being added to `REGISTRY`** — this
  session already found one real surprise (AWS/Azure missing entirely);
  assume there will be others (a technology whose obvious-seeming slug
  doesn't match simple-icons' actual key, a brand with no icon at all, a
  brand present but under an unexpected name).
- **Do not start the broad 60-90-icon rollout from this doc without an
  explicit go-ahead** — this is a scope record, not a work order.

## Where `.icon` is rendered (audit from this session, for the future pass)

24 files render a technology/academy/domain `.icon` field directly as
plain emoji text. Only 1 of the 24 (the technology overview hero, above)
was updated this session. The rest, in the order most relevant to a
future icon-swap pass:

- `app/academies/[academy]/[technology]/[section]/page.tsx` — sidebar
- `components/tech/MobileSectionNav.tsx` — mobile nav equivalent
- `app/academies/[academy]/page.tsx` — technology grid within an academy
- `app/academies/page.tsx` — academy-level cards
- `app/page.tsx`, `app/dashboard/page.tsx` — homepage/dashboard surfaces
- The remaining ~18 files (roadmaps, learn/exam pages, careers, projects,
  labs, community, about, contact, troubleshooting, interview, onboarding)
  — grep `\.icon\}` across `app/` for the current, authoritative list; it
  will drift as pages change, this list is a snapshot, not a contract.

## Process notes for whoever does the future full pass

1. **Confirm every candidate against the installed `simple-icons`
   package's actual exports directly** (`Object.keys(require("simple-icons"))`
   filtered by name), the same way this session caught AWS/Azure being
   absent — never assume a slug exists just because the brand is famous.
2. **`REGISTRY` in `TechIcon.tsx` is the single addition point** — no
   other file needs touching to add a new icon once a `.icon`-rendering
   call site already uses `<TechIcon slug={...} fallback={...} />` instead
   of raw `{x.icon}`. Migrating a call site from raw emoji to `TechIcon`
   and actually populating `REGISTRY` for its technologies can happen as
   two separate, independently-safe steps.
3. **Verify every newly-registered icon in both light and dark theme**
   before considering it done — this session's theme-safety design (brand
   hex on a same-hue low-opacity backdrop) should hold for any correctly-
   sourced brand hex, but confirm per-icon rather than assuming the design
   generalizes perfectly for every future brand's specific color.
4. Treat the full rollout as its own phased effort, likely academy-cluster
   by academy-cluster (DevOps first, then Cloud, then Databases, etc.)
   rather than attempting all ~60-90 in one pass — mirrors how Phase 3 and
   the practice-exam rollout were both sequenced.
