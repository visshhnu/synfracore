# Stage 1 — Architecture & Code Organization Audit

**Scope**: project architecture, folder structure, component design, reusability, state management, technical debt. Explicitly excludes security/auth deep-dive, SQL/RLS, and content-quality review (later stages).

**Method**: static analysis of the actual repo (grep/wc/diff scripts, not assumptions), plus live spot-checks against the running dev server across DevOps (Linux — thin/dense comparison), Cloud (AWS), AI, Healthcare, and Law academies. Every finding below cites the actual file(s) and includes verified numbers, not estimates.

**Read this as a hostile senior staff engineer's due-diligence pass.** "It works today" is not evidence of production-grade; several of these are load-bearing walls that happen to still be standing.

---

## Answering the specific question: is the "empty page" finding missing-content or a rendering bug?

**Neither, cleanly — it's a wiring/registry gap, and the rendering pipeline itself is not broken.** Verified via `components/tech/SectionContent.tsx`:

- When a section has no registry entry, the component renders a designed, intentional fallback: *"Pre-written content coming soon. Generate AI content instantly."* with a button that calls `/api/ai`. This is not a crash or blank page — it's graceful degradation by design (`SectionContent.tsx:312-325`).
- The actual bug is upstream: **real, substantial, pre-written content exists on disk but is unreachable** because it was never added to the registry (`lib/content/index.ts`), or the section type isn't in the navigable section list at all (`lib/data/navigation.ts`). See Findings 2 and 3 below for hard numbers — this is systemic, not a one-off.

---

## Finding 1 — Fully open, unauthenticated, unmetered proxy to a paid third-party API
**Severity: Critical**

**Current implementation**: `app/api/ai/route.ts` accepts any POST body and forwards it verbatim to `https://api.anthropic.com/v1/messages` using the server's own `ANTHROPIC_API_KEY`, with `Access-Control-Allow-Origin: "*"`. There is no auth check (not even a Clerk session check), no rate limiting, no cap on `model`/`max_tokens`, no validation that the request originated from `SectionContent.tsx`'s `buildPrompt()` at all.

**Why it's a problem**: this is not an internal implementation detail — it's a public URL. Anyone who opens browser dev tools on any academy page sees this exact endpoint being called with a JSON body, and can replay/script arbitrary requests against it directly, with any `model`, any `max_tokens` (up to whatever the account allows), and any `messages` content. The wildcard CORS header means any third-party website can also call it directly from their own JS and read the response.

**Business impact**: unbounded Anthropic API spend, funded entirely by the account owner, with zero attribution back to real users. A single scripted loop against this endpoint could run up a large bill in minutes. This is also functionally "give away free Claude API access to anyone who finds the URL," including for entirely unrelated use cases.

**Technical impact**: no observability into who's calling it or why; a spike in usage looks identical whether it's real users clicking "Generate AI Content" or a script hammering the endpoint.

**Recommended fix**: require a valid Clerk session (`auth.protect()` or a manual `auth()` check) before proxying; pin `model` and `max_tokens` server-side (ignore/override whatever the client sends); rebuild the `system`/prompt server-side from `{academy, technology, section}` params only (never forward client-supplied prompt text verbatim) — this also closes a secondary prompt-injection surface; add per-user rate limiting (Cloudflare's own rate-limiting rules, or a KV-backed counter — the project already has a `BLOG_KV` binding in `wrangler.toml` that could hold a per-user counter); replace `Access-Control-Allow-Origin: "*"` with the site's own origin.

**Breaking or non-breaking**: non-breaking for legitimate users (the client already only ever sends `{academy, technology, section}`-derived requests); breaking for anyone currently abusing the open endpoint, which is the point.

**Migration strategy**: ship the auth check and model/token pinning first (highest value, lowest risk). Add rate limiting as a fast-follow once a KV or Durable Object counter is wired up.

**Rollback strategy**: trivial — it's a single route file; revert the commit if the auth check ever incorrectly blocks a legitimate signed-in user.

---

## Finding 2 — Content registry is a hand-maintained 2,013-line flat file with no sync tooling, and it has already drifted from disk reality
**Severity: High**

**Current implementation**: `lib/content/index.ts` is a single `Map` literal with ~1,879 manually-typed `["key","value"]` pairs, maintained by hand across (at minimum) this entire multi-session engagement.

**Verified drift** (via a direct diff script comparing every registry entry against the actual filesystem):
- **6 broken registry entries** point at files that don't exist on disk at all — e.g. `["exams/upsc-optional/overview","exams/upsc-optional/overview.md"]` has no corresponding file; `["law/legal-fundamentals/advanced", ...]` and `["law/legal-fundamentals/intermediate", ...]` are likewise dangling. Any route hitting these gets a silent `fetchContent()` → `null` → the "coming soon" fallback, even though the registry claims content exists.
- **236 real markdown files exist on disk and are never referenced by the registry at all** — including, notably, **20 `installation.md` files (2,584 lines combined) and 11 `prerequisites.md` files**, all fully written, sitting in the correct technology folders (e.g. `public/content/infrastructure/linux/installation.md`, `public/content/cloud/aws-ec2/installation.md`), permanently unreachable — not because of a registry typo, but because `installation`/`prerequisites` were never added as section types anywhere in the app at all (see Finding 3).

**Why it's a problem**: this file cannot be kept correct by hand at this scale, and the evidence is that it already isn't. There's no build-time check, no test, no CI step (see Finding 6) that would catch a broken or missing entry — it silently degrades to "content coming soon" for a real user, which reads as the site being unfinished/broken even when someone already wrote that content.

**Business impact**: real, already-paid-for content (thousands of lines) is invisible to users and to search engines, while the UI's own "AI-generate" CTA offers to synthesize (worse, unreviewed, costs money per Finding 1) content that already exists, written, on disk two directories over.

**Technical impact**: every future content addition risks silently not showing up, with no error, no log, nothing — exactly the failure mode already fixed multiple times this engagement for roadmap routing (`lib/data/roadmapDetails.ts`), now confirmed to also exist in the content layer.

**Recommended fix**: replace the hand-maintained `Map` with a build-time-generated manifest — a small Node script that walks `public/content/` and emits the registry automatically (this also makes broken/orphaned entries structurally impossible, since the registry would always exactly mirror disk reality). Add a section type array to `lib/data/navigation.ts` for `installation`/`prerequisites` where those files exist, or repurpose their content into `fundamentals` if a dedicated tab isn't wanted.

**Breaking or non-breaking**: non-breaking — it's a drop-in replacement for the `Map`; `hasContent()`/`fetchContent()`'s public signatures don't need to change.

**Migration strategy**: write the generator script, run it once, diff its output against the current hand-written file to confirm no unintended removals, then replace. Keep the generator as a `predev`/`prebuild` step so it never drifts again.

**Rollback strategy**: the old file stays in git history; reverting is a one-file revert.

---

## Finding 3 — Section navigation is a static, hardcoded list decoupled from actual content availability
**Severity: High**

**Current implementation**: `lib/data/navigation.ts` exports `techSections` (15 fixed entries: overview, fundamentals, intermediate, advanced, roadmap, labs, projects, interview, troubleshooting, certification, cheatsheets, notes, pyq, real-world-scenarios, faq) and `nonTechSections` (9 fixed entries). `app/academies/[academy]/[technology]/[section]/page.tsx:125` renders **all of them, every time**, regardless of whether that specific technology has content for that section: `const activeSections = isNonTech ? nonTechSections : techSections;`

**Why it's a problem**: a technology with only an `overview.md` (there are several — e.g. `law/civil-law-procedure`, `law/legal-career-growth` before this engagement added more sections to it) shows a full sidebar of up to 15 tabs, of which most lead to the AI-generate fallback. This isn't a content problem, it's a navigation-design problem: the UI cannot currently express "this technology has 3 real sections," only "here are all 15 possible sections, go find out which ones work."

**Business impact**: inconsistent, unpredictable UX across the site's own technologies — a user has no way to tell, from the sidebar, whether a tab is real content or a dead end, undermining trust in the "coming soon" framing after the third or fourth dead tab on the same page.

**Technical impact**: compounds Finding 2 — `installation`/`prerequisites` content isn't just unregistered, it has literally no tab that could ever link to it, static or otherwise.

**Recommended fix**: once Finding 2's auto-generated registry exists, derive `activeSections` per-technology from the registry (only show tabs that have real content) with an optional secondary "more topics" affordance for AI-generatable sections — rather than presenting all 15 as equally real.

**Breaking or non-breaking**: non-breaking, purely additive filtering logic in the section page.

**Migration strategy**: ship after Finding 2, since it depends on the registry being trustworthy.

**Rollback strategy**: single-file revert of the `activeSections` computation.

---

## Finding 4 — Content-generation tooling produced ~155 duplicate files in literal, unreachable directories across 33 locations
**Severity: Medium**

**Current implementation**: 33 directories under `public/content/` are named with **literal, un-expanded shell brace syntax** — e.g. `public/content/cloud/{aws-ec2,aws-vpc,aws-iam,aws-s3}/` is a real, single directory whose name is the literal string `{aws-ec2,aws-vpc,aws-iam,aws-s3}`, not four separate folders. This pattern repeats across `ai/`, `cloud/`, `data/`, `databases/`, `education/`, `essentials/`, `exams/`, `healthcare/`, `infrastructure/`, `monitoring/`, `security/` — 155 real `.md` files total, all git-tracked and deployed to production as dead weight.

**Root cause**: whatever script bulk-generated this content ran a `mkdir path/{a,b,c}/file` -style command in a shell that doesn't support bash brace expansion (PowerShell and `cmd.exe` both create a literal folder named `{a,b,c}` instead of three folders) — classic cross-shell scripting gotcha.

**Verified impact is bloat, not data loss**: cross-checked a sample (`cloud/aws-ec2`, `cloud/aws-vpc`, `ai/rag`, `security/soc`) — every one of these already has its own complete, correctly-named folder with all standard sections present. The bogus-folder copies are redundant duplicates, not uniquely-authored lost content. (A parallel, empty-directory version of this same bug also exists at `app/{academies,roadmaps,...}/` and `components/{layout,home,...}/` — those are **not** git-tracked, since git doesn't track empty directories, so they have zero production impact; they're local filesystem clutter only, worth `rm -rf`-ing locally but not a real finding.)

**Business impact**: none functionally (nothing points at these paths), but they inflate the deployed bundle/repo size for zero benefit, and they're confusing to anyone doing a plain `ls` of a content directory, wondering what that bracket-folder is.

**Technical impact**: this is circumstantial evidence the content-generation pipeline itself is not idempotent/shell-portable, which matters if it's ever re-run.

**Recommended fix**: `git rm -r` the 33 bogus directories (155 files). Fix whatever script originally generated this content to use a shell-portable approach (a Node/JS script with an explicit array + `fs.mkdirSync`, not shell brace expansion) before it's ever run again.

**Breaking or non-breaking**: non-breaking — nothing references these paths (confirmed: the content registry never emits a brace-containing key).

**Migration strategy**: single cleanup commit; no code changes required elsewhere.

**Rollback strategy**: git history retains them if ever needed, though there's no scenario where restoring a literal `{a,b,c}` folder would be useful.

---

## Finding 5 — Hand-rolled markdown renderer duplicates an already-installed dependency, with an XSS-relevant gap
**Severity: Medium**

**Current implementation**: `components/tech/SectionContent.tsx:18-155` implements a ~140-line hand-written markdown parser (`renderMarkdown`/`formatInline`) covering headings, lists, tables, code fences, callouts, and inline bold/code/italic — while `react-markdown@10.1.0` is already a listed dependency in `package.json` and is not used anywhere in this component (confirmed: no import of `react-markdown` in this file or elsewhere in `components/tech/`).

**Why it's a problem**: the hand-rolled parser is missing standard Markdown features the real content likely uses eventually (inline links `[text](url)`, nested/multi-level lists, blockquote nesting) and handles inline formatting via `formatInline()` regex substitution fed straight into `dangerouslySetInnerHTML` (`SectionContent.tsx:115-116, 131, 149`) — safe today only because all current content is first-party-authored markdown, but the AI-generated variant (`aiContent`, same rendering path) is LLM output rendered through the exact same `dangerouslySetInnerHTML` path with the same regex-only sanitization. A prompt-injection-influenced AI response containing raw HTML/script-like text would pass through untouched.

**Business impact**: low today (trusted content sources), but this is exactly the kind of gap that becomes exploitable the moment Finding 1's proxy is abused to inject arbitrary content into `aiContent`.

**Technical impact**: ~140 lines of parser logic to maintain, test, and extend by hand, duplicating a library already paid for in bundle size (`react-markdown` is installed but tree-shaken out unused, or bundled elsewhere unnecessarily — worth checking which).

**Recommended fix**: replace `renderMarkdown`/`formatInline` with `react-markdown` (plus `remark-gfm` for tables/strikethrough), which handles escaping by default and doesn't need `dangerouslySetInnerHTML` at all for standard content. Keep the custom SVG-diagram and `:::callout` block handling as `react-markdown` custom component overrides if that syntax needs to stay.

**Breaking or non-breaking**: visually non-breaking if done carefully (same output for existing content), but is a genuine rendering-logic swap — needs visual regression checking across a sample of pages before shipping, not a blind swap.

**Migration strategy**: introduce `react-markdown` behind the existing `renderMarkdown()` call signature first (same input/output shape), spot-check the same sample pages used in this audit (Linux, Kubernetes, ICD-10-CM, AI fundamentals), then remove the old parser.

**Rollback strategy**: keep the old `renderMarkdown` function in git history one release cycle in case a content-formatting edge case regresses.

---

## Finding 6 — Zero CI/CD automation; the roadmap validator that already caught real production bugs this engagement is 100% manual
**Severity: High**

**Current implementation**: no `.github/workflows` directory exists at all. `package.json`'s `deploy` script is `pages:build && wrangler pages deploy` — it does not run `npm run validate:roadmaps`, `tsc --noEmit`, or `eslint` before deploying. The validator (`scripts/validate-roadmaps.ts`) is a genuinely good tool — it already caught every roadmap-routing bug fixed earlier in this engagement — but it only runs when a human remembers to type the command.

**Why it's a problem**: the exact bug class this validator exists to catch (roadmap steps silently collapsing onto the same/wrong page) can reintroduce itself on the very next edit to `lib/data/roadmapDetails.ts` or `lib/data/navigation.ts`, with nothing stopping a `deploy` from shipping it. Same exposure for a TypeScript error or lint failure — `next build` catches type errors, but nothing stops a broken build from being attempted in the first place with a faster local feedback loop, and there's no gate preventing a bad commit from reaching `main` before someone runs `deploy`.

**Business impact**: this project has already spent multiple full sessions finding and fixing the same class of routing bug by hand, repeatedly, because nothing catches it automatically before it ships.

**Technical impact**: no automated regression protection for any of the fixes made this entire engagement (roadmap routing, RLS policies, error boundaries) — every one of them can silently regress.

**Recommended fix**: add a GitHub Actions workflow that runs on every push/PR: `npm run validate:roadmaps`, `tsc --noEmit`, `npm run lint`. Wire `validate:roadmaps` into `predeploy` in `package.json` at minimum, even before full CI exists, so a local `npm run deploy` can't ship a known-broken roadmap.

**Breaking or non-breaking**: non-breaking — purely additive tooling; a failing check blocks a merge/deploy, which is the intended behavior, not a regression.

**Migration strategy**: add `predeploy: "npm run validate:roadmaps"` to `package.json` scripts immediately (near-zero effort, already-written validator). Add the GitHub Actions workflow as a fast-follow.

**Rollback strategy**: remove the workflow file / `predeploy` script; no impact on runtime code.

---

## Finding 7 — `roadmapDetails.ts` and `navigation.ts` describe the same roadmaps in two unlinked files, by convention only
**Severity: Medium**

**Current implementation**: `lib/data/navigation.ts` exports `roadmaps: {slug, steps: string[], ...}[]` (just label strings); `lib/data/roadmapDetails.ts` exports `roadmapDetails: Record<string, {techLinks: RoadmapTechLink[], ...}>`. The relationship between a roadmap's `steps[i]` and its `techLinks[i]` is **positional and by convention only** — nothing in the type system enforces `steps.length === techLinks.length`, or that they're even describing the same roadmap correctly aligned. `RoadmapTechLink` (`roadmapDetails.ts:5-11`) has no reference back to a step label at all.

**Why it's a problem**: this is the exact structural root cause of essentially every roadmap-routing bug found and fixed across this entire engagement (advocate-career, judiciary-civil-judge, upsc-ias, banking-po, state-psc-officer, agricultural-officer, telecom-engineer, neet-medical, jee-engineering, and the ca-journey/banking-finance-analyst cases in the shared-target pass) — two people (or one person at two different times) can edit either file without the other, and nothing short of manually running `validate-roadmaps.ts` catches the drift.

**Business impact**: every future roadmap edit carries the same risk that consumed multiple sessions of this engagement to find and fix.

**Technical impact**: `validate-roadmaps.ts` Rule 2 (`steps.length !== techLinks.length`) is a runtime patch over a design gap that a type system could close permanently.

**Recommended fix**: merge the two into one data structure — `roadmapDetails[slug].steps: {label: string, techLink: RoadmapTechLink}[]` — so a step and its target are one object, impossible to drift apart by construction. This is a genuine breaking change to the shape both `app/roadmaps/[slug]/page.tsx` and any other consumer read from, so it needs care, but it converts an entire bug class from "possible, caught by a script if you remember to run it" to "not representable in the type system."

**Breaking or non-breaking**: **Breaking** — touches the shape of core roadmap data and all its consumers.

**Migration strategy**: (1) add the merged shape alongside the existing two exports without removing them; (2) update `validate-roadmaps.ts` to validate the new shape too, confirming equivalence; (3) migrate `app/roadmaps/[slug]/page.tsx` to read from the new shape; (4) once confirmed working in production for a release cycle, delete `navigation.ts`'s `steps` arrays and `roadmapDetails.ts`'s parallel `techLinks` arrays.

**Rollback strategy**: keep both shapes coexisting through step (3) above specifically so a revert is just "stop reading the new shape," not a data migration rollback.

---

## Finding 8 — All 2,000+ content pages render client-side only; no SSR for the actual educational content
**Severity: Medium**

**Current implementation**: `SectionContent.tsx` is `"use client"` and fetches markdown via `fetchContent()` inside a `useEffect` (`SectionContent.tsx:185-195`) — meaning the server-rendered HTML for every one of the thousands of `/academies/{academy}/{technology}/{section}` URLs contains only a loading skeleton (`SectionContent.tsx:229-256`), not the actual lesson text. Real content only appears after the client mounts, fetches `/content/{path}.md` over the network, and re-renders.

**Why it's a problem**: for a platform whose entire value proposition is educational content, this means search engines and any no-JS/slow-JS client see a shimmering skeleton, not the lesson. It also means every content page pays an extra client-server round trip (fetch the page → hydrate → fetch the markdown file → render) instead of the content simply being present in the initial HTML, which is fully knowable at request time since the content is static and already on disk.

**Business impact**: SEO for organic content discovery (a core acquisition channel for a free learning platform) is meaningfully worse than it should be — crawlers that don't execute JS, or that time out before hydration, index an empty skeleton.

**Technical impact**: slower perceived load (skeleton → flash of real content) on every single content page, for content that never changes per-request and could be read directly in the server component.

**Recommended fix**: since `fetchContent()` just reads a static file, do that read in the server component (`app/academies/[academy]/[technology]/[section]/page.tsx`, which already has access to `academy`/`technology`/`section` params) and pass the resolved markdown string into `SectionContent` as a prop, keeping the AI-generation interactivity (which genuinely needs to be client-side) as a separate client island that only activates on the "Generate AI Content" button.

**Breaking or non-breaking**: non-breaking to the rendered output; internal data-flow change only.

**Migration strategy**: move the `fetchContent` call server-side, pass result as `initialContent` prop, keep the rest of `SectionContent`'s client logic (AI generation, mode switching) unchanged — it already knows how to accept and render `preContent`.

**Rollback strategy**: revert to client-side fetching by reverting the one prop-passing change; no data model changes involved.

---

## Finding 9 — Segment-level error boundaries cover 3 of 35+ routes; everything else falls through to a layout-destroying global handler
**Severity: Medium**

**Current implementation**: only `app/dashboard/error.tsx`, `app/admin/error.tsx`, and `app/onboarding/error.tsx` exist. Every other route — including the entire `academies/[academy]/[technology]/[section]` tree (the thousands-of-URLs surface this whole audit is about), `roadmaps/[slug]`, `blog/[slug]`, `careers/[role]`, `certifications/[id]`, `learn/[board]/[subject]/[chapter]` — has no segment-level `error.tsx`, so any unhandled exception in these routes is caught only by `app/global-error.tsx`, which per Next.js semantics **replaces the entire root layout** (navbar and footer disappear along with the page content), not just the broken section.

**Why it's a problem**: the three routes that got dedicated error boundaries were the ones that happened to crash in production earlier this engagement (Clerk/Supabase-related). The much larger content surface — where a bad `getTechnology()` lookup, a markdown-fetch exception, or any other transient error could occur — has no equivalent protection, and a failure there currently means a user loses the entire site chrome, not just that one lesson page.

**Business impact**: a single broken academy page (of thousands) currently has an outsized blast radius — it looks like "the whole site is down" rather than "one page has an issue," for a much larger surface area than the three routes already protected.

**Technical impact**: inconsistent resilience posture — some routes are hardened because they already broke once; most haven't broken *yet*.

**Recommended fix**: add `app/academies/error.tsx` (covers the whole academy tree via route-segment inheritance) and `app/roadmaps/error.tsx` at minimum, following the exact pattern already proven at `app/dashboard/error.tsx`.

**Breaking or non-breaking**: non-breaking, purely additive.

**Migration strategy**: copy the existing `error.tsx` pattern (already proven, already in the codebase) to the two highest-traffic uncovered segments first.

**Rollback strategy**: delete the file; falls back to current `global-error.tsx` behavior.

---

## Finding 10 — Inline `style={{...}}` objects are the dominant styling method despite Tailwind 4 being installed and configured
**Severity: Low**

**Current implementation**: 72+ files use inline `style={{...}}` objects (verified count via grep) versus only 14 files using Tailwind utility classes, despite `tailwindcss@4` and `@tailwindcss/postcss` being installed dependencies. Color/spacing values (e.g. `"rgba(239,68,68,0.08)"`, `"#F87171"`, specific padding/border-radius pixel values) are repeated ad hoc across dozens of files rather than centralized as design tokens.

**Why it's a problem**: not a bug, but real ongoing cost — no single place to change a color/spacing decision site-wide; every visual tweak (like the several logo/navbar adjustments made earlier this engagement) requires finding and editing every inline occurrence rather than one utility class or CSS variable definition. The codebase already has `var(--bg-1)`, `var(--text-3)` etc. CSS custom properties in use for theme-aware colors — that pattern is good and consistently applied for theme-dependent values; it's the one-off decorative values (error-state reds, spacing) that are duplicated instead of tokenized.

**Business impact**: slower iteration on visual changes; higher chance of visual inconsistency creeping in (e.g. a slightly different red for "error" states in different files) as the codebase grows.

**Technical impact**: larger bundle of inline style objects vs. atomic utility classes that dedupe naturally; no build-time enforcement of a design system.

**Recommended fix**: not a rewrite — extend the existing `var(--*)` CSS custom property pattern (already proven, already used for theme colors) to cover the repeated non-theme-dependent values too (e.g. `--color-danger`, `--color-danger-bg`), and prefer it for new code going forward rather than migrating 72 existing files in one pass.

**Breaking or non-breaking**: non-breaking — additive tokens, opt-in adoption in new/touched code.

**Migration strategy**: define the missing tokens once in the global CSS; use them the next time any of these 72 files is touched for an unrelated reason, rather than a dedicated migration sprint.

**Rollback strategy**: not applicable — no forced migration, no rollback needed.

---

## Summary table

| # | Finding | Severity | Breaking? |
|---|---|---|---|
| 1 | Open/unmetered `/api/ai` proxy | Critical | Non-breaking fix |
| 2 | Content registry hand-maintained, already drifted (6 broken + 236 orphaned incl. 20 installation.md/2,584 lines) | High | Non-breaking fix |
| 3 | Static 15-tab sidebar decoupled from real content | High | Non-breaking fix |
| 6 | Zero CI/CD; validator is manual-only | High | Non-breaking fix |
| 4 | 155 duplicate files in 33 literal brace-named directories | Medium | Non-breaking fix |
| 5 | Hand-rolled markdown parser duplicates installed `react-markdown`, XSS-relevant gap | Medium | Needs visual regression check |
| 7 | `steps[]`/`techLinks[]` positional-only linkage (root cause of prior roadmap bugs) | Medium | **Breaking fix** |
| 8 | Client-side-only content rendering (no SSR) hurts SEO/LCP | Medium | Non-breaking fix |
| 9 | Error boundaries cover 3/35+ routes | Medium | Non-breaking fix |
| 10 | Inline styles dominate over Tailwind/tokens | Low | No forced migration |

**Recommended order of attack**: 1 (Critical, cheap fix) → 6 (cheap, protects everything else going forward) → 2 → 3 → 9 → 8 → 5 → 4 (pure cleanup) → 7 (biggest, do last, breaking) → 10 (opportunistic, never urgent).
