# Real Brand Logo Icons — Rollout Tracker

**Started:** 2026-09-01. **Full simple-icons rollout completed:** 2026-09-03.
**Phase C — AWS/Azure real icons completed:** 2026-09-03.
**Status: DONE — REGISTRY holds 55 verified simple-icons entries, plus 14
official AWS/Azure Architecture Icons entries (BRAND_ASSETS), wired into
every genuine technology-icon render location on the site. Deployed to
production (versions `3fce24cc-f1b5-49e5-8512-e134605ceb6f` for the
simple-icons rollout, `08225c76-2b90-438f-9329-83c423c9e43c` for Phase C).**

## Phase C — AWS/Azure real icons (2026-09-03)

Closes the AWS/Azure gap flagged throughout the simple-icons rollout above
(neither vendor has ANY entry in simple-icons at all — a real, confirmed
trademark-related exclusion, not a gap in that library). Sourced from each
vendor's own official Architecture Icons asset packs instead — a
genuinely different pipeline from simple-icons, not a variant of it.

**Sources, verified directly, not assumed**:
- AWS: `https://aws.amazon.com/architecture/icons/` — current package
  (`Icon-package_07312026...zip`), confirmed live via direct download.
- Azure: `https://learn.microsoft.com/en-us/azure/architecture/icons/` —
  current package (`Azure_Public_Service_Icons_V24.zip`), confirmed live,
  including its bundled `Microsoft_Terms_of_Use.pdf`.
- Microsoft Entra ID specifically required a THIRD, separate package
  (`https://download.microsoft.com/.../Microsoft Entra architecture icons
  - Oct 2023.zip`) — the main Azure package has no bare "Entra ID" icon,
  only sub-feature icons (Entra Connect, Entra ID Protection, etc.).

**Scope — 14 service-level technologies, not a full library pull**:
`aws-iam`, `aws-ec2`, `aws-vpc`, `aws-s3`, `aws-rds`, `aws-lambda`,
`aws-eks`, `cloudformation`, `dynamodb`, `azure-entra`, `azure-vms`,
`azure-vnets`, `azure-aks`, `azure-devops` — exactly the set
`lib/data/academies.ts` already names, nothing broader.

**A real scope narrowing, made and disclosed before deploying**: the
generic parent/overview slugs `aws` and `azure` are deliberately NOT
included, even though both vendors' Architecture Icons pages grant clear
permission for service icons in documentation/training use (our exact use
case). AWS's separate, broader Trademark Guidelines state that logo use
beyond the Architecture Icons page's own scope "requires prior AWS
approval" — a stricter standard that plausibly applies to AWS's own
general brand mark rather than individual service icons. Rather than
judge which side of that line the generic "AWS Cloud" icon falls on, both
`aws` and `azure` stay on the emoji fallback indefinitely (one consistent
standard applied to both vendors, not just AWS) — same as they already
correctly do in the simple-icons REGISTRY above.

**Technical shape — a genuinely different rendering contract from
REGISTRY**: simple-icons ships a single SVG *path* per brand that this
component recolors to the brand's hex on our own tinted backdrop. AWS's
and Microsoft's official icons ship complete, already-colored pictograms
(AWS: a full-bleed solid-color square background baked into the file;
Azure: a gradient/multi-color icon on a transparent canvas) — there is no
extractable path and no hex to recolor with, and both vendors' own terms
explicitly prohibit exactly that (no cropping/distorting/recoloring, use
as provided). `components/icons/TechIcon.tsx` gained a second, separate
`BRAND_ASSETS` registry and render branch: a plain `<img>` at fixed size
with `object-fit: contain`, `border-radius`+`overflow:hidden` on the
container only (clips corners of AWS's own baked-in square, never actual
icon content), and a neutral `var(--bg-2)` backdrop for Azure's
transparent-canvas icons only (not a color derived from the icon).

**C3 compliance pass** — reported to the user in full before deploying,
per: clear-space (fixed-size `<img>`, `object-fit:contain`, no
crop/distort), no recoloring (files used byte-for-byte as downloaded,
verified via direct `cp` with no edits), no implied endorsement (icons
label the technology a page teaches, exactly like a certification badge
identifies its subject — nothing on the page states or implies an
AWS/Microsoft partnership).

**Verified**: `tsc --noEmit` clean; local dev-server screenshots in both
themes across the sidebar (section page), academy technology grid, mobile
drawer (zoomed to confirm at actual small render size), and
`SectionContent`'s large empty-state icon — all render the real official
icons correctly; a live post-deploy check confirming the `<img>` element
actually loaded (`naturalWidth > 0`, not a broken reference) on
production, not just returning 200 for the asset URL.

## Second-pass additions (2026-09-03, same day, deeper candidate search)

After the first pass shipped 52 entries, a second search checked specific
product names directly against simple-icons (not just each technology's own
slug/name) across every academy, since a technology's platform-facing name
sometimes bundles two products together and only one half has a real icon.
Found exactly 3 more genuine matches this way — the rest of dozens of
candidates checked (Oracle, Power BI, Tableau, Excel, Argo Rollouts, Litmus,
dbt, every AWS/Azure service) came back with zero simple-icons coverage,
confirming 55 as the practical ceiling, not the originally estimated 60-90:

- `sonarqube` → `siSonarqubeserver` — simple-icons split SonarQube into 3
  post-rebrand sub-product icons (Server/Cloud/IDE), no single generic
  "SonarQube" icon exists; Server is the closest/most recognizable.
- `loki` → `siOpentelemetry` — the platform's technology is named
  "Loki + OpenTelemetry"; Loki itself (a Grafana Labs product) has no icon,
  but OpenTelemetry does.
- `ebpf` → `siCilium` — the platform's technology is named "eBPF & Cilium";
  eBPF is a kernel technology, not a branded product, so it has no icon,
  but Cilium does.

REGISTRY is now 55 entries. This closes Phase B — no further match-search
passes are planned; the remaining ~204 technologies in `academies.ts`
either fall under the AWS/Azure/KEDA/Loki/generic-sql exclusion categories
below or are generic domain topics (Healthcare, Law, Exams, etc.) with no
brand to represent.

## What the full rollout pass did (2026-09-03)

1. **Re-derived the actual technology list from `lib/data/academies.ts`
   directly** rather than trusting this doc's earlier ~60-90 estimate —
   the real count is **259 technologies** (not 285; that number was itself
   an estimate, not a re-count).
2. **Matched every technology against simple-icons' actual exports**
   (`icon.slug`, not a guessed export-key name), plus a manually-verified
   alias table for cases where the technology's own slug/name doesn't
   literally match simple-icons' slug but a real brand icon exists under a
   different key (e.g. `nodejs` → `nodedotjs`, `shell-scripting` →
   `gnubash`). Result: **52 technologies matched to a real icon** (not the
   original 60-90 estimate — several categories assumed likely turned out
   to have no real match; see exclusions below).
3. **Excluded 3 near-misses that would have been actively misleading**,
   caught by checking each match's actual identity rather than trusting a
   slug-string match alone:
   - `keda` and `loki` have **no distinct icon in simple-icons at all** —
     an early pass would have shown Kubernetes' logo for KEDA and
     Grafana's logo for Loki, misrepresenting one project as a different
     brand. Both stay on emoji fallback.
   - `sql` (the query language) has no generic brand icon — only
     `mysql`/`sqlite`/`sqlalchemy` exist. Showing MySQL's logo for a
     generic SQL topic would misleadingly imply the topic is
     MySQL-specific. Stays emoji.
4. **Confirmed the AWS/Azure exclusion extends to every individual
   service slug too** — `aws-lambda`, `aws-ec2`, `aws-s3`, `aws-rds`,
   `aws-eks`, `aws-vpc`, `aws-iam`, `azure-aks`, `azure-vms`,
   `azure-vnets`, `azure-entra`, `azure-devops` (the standalone DevOps
   product, not Azure itself — this one has its own real icon), `gke`,
   `cloud-run` — none of these have a simple-icons entry either (checked
   directly, not assumed). `gke`/`cloud-run` were given the generic Google
   Cloud logo instead, an honest "part of this platform" representation
   since no service-specific icon exists.
5. **Found and fixed the actual render-location scope** — the original
   "24 files render `.icon`" estimate conflated genuine technology-brand
   icons with academy/domain/section/roadmap/career/lab-category icons
   (none of which have a "brand" concept — correctly out of scope, per
   this doc's own original note that roadmap/career categories have no
   brand to swap in). The REAL technology-icon render surface, after
   checking each of the 35 files that render some `.icon` field, is
   **7 call sites across 6 files** (plus the 1 already wired in the
   foundation phase = 7 files total):
   - `app/academies/[academy]/[technology]/[section]/page.tsx` (sidebar)
   - `app/academies/[academy]/page.tsx` (academy technology grid)
   - `components/layout/Navbar.tsx` (mobile drawer's expanded technology list)
   - `components/tech/RelatedTechnologies.tsx` (related-technologies links)
   - `components/tech/MobileSectionNav.tsx` (mobile header, technology-icon fallback branch only — the common-case render there is a section icon, unrelated)
   - `components/tech/SectionContent.tsx` (2 sites: AI-generation loading state, empty-state)
6. **Verified theme-safety directly** (screenshots, both themes) on the
   sidebar location and the mobile drawer's expanded technology list —
   confirmed the same-hue tinted-backdrop design (fixed brand hex, not a
   CSS variable — a brand's official color doesn't change with site theme,
   so this is correct by design, not a shortcut) reads correctly against
   both light and dark surrounding backgrounds, same result as the
   foundation phase's original 3 icons.
7. Two entries are the closest genuinely-real available match rather than
   a perfect one: `java` → OpenJDK's icon (Oracle's own Java coffee-cup
   mark has no simple-icons entry) and `rest-api-design` →
   OpenAPI Initiative's icon (no generic "REST API" brand icon exists).

## What's explicitly still emoji, and why (permanent, not a gap)

- **AWS, Azure, and every individual service under both** — confirmed
  absent from simple-icons entirely, a real trademark-related exclusion.
- **KEDA, Loki** — no distinct icon exists; showing a different project's
  logo would misrepresent the brand.
- **Generic `sql`** — no accurate non-vendor-specific icon exists.
- **Healthcare, Law, Competitive Exams, Life Essentials, School Education,
  Agriculture, Finance, Aerospace, VLSI, Telecom** — as originally
  predicted, essentially zero real candidates; their content is generic
  domain topics, not branded tools.
- Everything else without a `REGISTRY` entry simply has no genuine,
  confirmed real-brand-logo match — not an oversight, checked directly.

This doc previously read as follows (kept below for history):

---

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
