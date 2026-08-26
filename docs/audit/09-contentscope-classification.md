# ContentScope Classification Pass — 63-Technology Cluster

**⚠️ CORRECTION (2026-07-29, same day, during Batch 1 execution): the
original classification below undercounted Tier A significantly. See
"Correction" section immediately after this header — read that first, the
Tier A/B/edge tables further down are superseded by it.**

**Date:** 2026-07-29
**Persona:** Senior Content Auditor & Technical QA Lead
**Scope:** Every technology whose registered core sections are missing exactly
`roadmap` + `projects` + `certification` (and no other core section) — the
cluster identified while investigating the `WhatNext.tsx`/sidebar section-list
drift (see the `contentScope` field added to `Technology` in
`lib/data/academies.ts` and `getSectionsForTechnology()` in
`lib/data/navigation.ts`). 63 technologies matched this exact pattern.

## Correction (found during Batch 1 execution, same day)

The original boilerplate signature used below (`"Comprehensive [X]
preparation for..."`, `"Who This Is For"`, `"This section follows a
structured approach"`) only caught one template family. While executing
Batch 1 (`agriculture/organic-farming`'s overview tail-splice removal), a
**second, more widely-used template family** was found sharing the same
closing block (`"Understanding this topic requires both theoretical
knowledge and practical application"`, `"Common Beginner Questions"`,
`"Comprehensive [X] **content** for..."` — note "content" not
"preparation") but with different opening sections ("Core Concepts",
"Self-Assessment", "Key Principles" instead of "Learning Path"/"Who This Is
For"/"How to Study"). A site-wide check for just the shared closing-block
phrase alone returned **203 files**, far beyond this 63-technology cluster —
the contamination footprint is larger than this document's scope, but
re-classifying only the 63-cluster here since that's the active work.

Re-running the classification against the broadened signature on all 63
cluster technologies changed the picture substantially:

| | Original count | Corrected count |
|---|---|---|
| Fully clean (no boilerplate in any registered section) | 32 (as "edge cases") | **30** |
| Fully contaminated (every registered section is boilerplate) | 9 | **29** |
| Partially contaminated (mixed) | 0 (not checked) | **4** |

The 21 technologies originally classified "A2 — overview-only templated,
rest genuine" were wrong: **all 21 are fully contaminated across every
registered section**, not just `overview`. The original classification only
checked whether the *first* template family's signature appeared — since
`fundamentals`/`intermediate`/`advanced` for these 21 used the *second*
family (which the original regex didn't match), they read as "GENUINE" when
they were not. Confirmed by direct read of
`agriculture/organic-farming/fundamentals.md` and
`agriculture/soil-science/overview.md` in full — both are the generic
template top to bottom with no per-technology substance beyond the H1.

Four technologies are genuinely mixed, not previously assessed at the
per-section level: `law/constitutional-law` (3 of 6 sections contaminated:
`advanced`, `interview`, `cheatsheets` — `overview`/`fundamentals`/
`intermediate` are still genuine), `law/consumer-protection` (4 of 6:
`intermediate`/`advanced`/`interview`/`cheatsheets` contaminated),
`law/clat-prep` (6 of 7, only `pyq` clean), and, **as of 2026-07-29,
resolved:** `agriculture/organic-farming` — all 5 remaining templated
sections (`fundamentals`, `intermediate`, `advanced`, `interview`,
`cheatsheets`) were rewritten with genuine content and verified against
this corrected signature (zero matches). The mixed-contamination bucket is
therefore **3 technologies going forward** (`constitutional-law`,
`consumer-protection`, `clat-prep`), not 4 — `organic-farming` should now
be treated as fully clean, on the same footing as the "30 fully clean"
group, though its scope question (contentScope tagging) was never in
question for it either way.

**Practical effect on the classification tables below:** treat every entry
in the old "A2" list as belonging in "A1" instead (fully contaminated, full
rewrite needed, not a one-file fix). The Tier B / edge-case section is
mostly unaffected except `constitutional-law` and `consumer-protection`,
which move from "fully clean edge case" to "partially contaminated edge
case" — the scope question (does Projects/Roadmap/Certification apply)
and the content-quality question (are the existing sections genuine) are
now both open for those two, not just the first one.

Corrected totals for this cluster, current as of `organic-farming`'s fix
(2026-07-29): **29 fully contaminated + 3 partially contaminated = 32
technologies still need content work**, **31 fully clean**
(`organic-farming` moved from "partially contaminated" to "fully clean" —
the other 30 were edge cases and remain edge cases; the scope question is
unaffected by contamination status since they're different questions).

See "Batch structure v2" below for the content-writing plan against these
corrected numbers.

The original tables below are left as-is for the record, superseded by this
correction — do not use them for batch planning without applying the
correction above.

## Methodology

For each of the 63, read the registered `overview`, `fundamentals`,
`intermediate`, and `advanced` content files (where present) and checked for
the templated-boilerplate signature already identified in
`professional-certs/pmp` during the prior sampling pass: the phrases
`"Comprehensive [X] preparation for..."`, `"## Who This Is For"`, and
`"## Learning Path — This section follows a structured approach..."`. Where
found, located the line position of the first match relative to file length
to distinguish "the whole file is the template" from "a template block is
appended to otherwise genuine content."

This is a mechanical content-quality signal, not a judgment call — every
result below was verified by reading the actual file, not inferred from the
signature alone.

## Tier A — templated boilerplate, real content needed (31 technologies)

Not fixed in this pass — flagged only, per instruction that content-writing
is separate, larger work. Three distinct sub-shapes, since the fix effort
differs:

### A1 — fully templated across every core section (9)

`overview`, `fundamentals`, `intermediate`, and `advanced` are *all* the
same generic scaffold (confirmed via direct diff on `professional-certs/pmp`
last pass: `overview.md` and `advanced.md` differ only in the H1 and one
adjective). These need a full rewrite, not an edit.

- `state-psc/tnpsc` — "TNPSC Prep"
- `state-psc/kpsc` — "KPSC Prep"
- `state-psc/mpsc` — "MPSC Prep"
- `state-psc/appsc` — "APPSC Prep"
- `state-psc/tspsc` — "TSPSC Prep"
- `professional-certs/pmp` — "PMP Certification"
- `professional-certs/itil` — "ITIL 4 Foundation"
- `professional-certs/scrum` — "Scrum & Agile"
- `professional-certs/six-sigma` — "Six Sigma"

### A2 — overview is the template, fundamentals/intermediate/advanced are genuine (21)

Confirmed by direct read (`agriculture/soil-science/overview.md` shown in
full during this pass): the *entire* overview file is the generic scaffold —
only the H1 and one context sentence are topic-specific. The other core
sections for these same technologies are properly written. Fix is narrower
than A1: rewrite one file per technology, not four.

- `law/clat-prep` — "CLAT Preparation"
- `agriculture/soil-science` — "Soil Science"
- `agriculture/horticulture` — "Horticulture"
- `agriculture/agri-business` — "Agri-Business"
- `finance/accounting-basics` — "Financial Accounting"
- `finance/gst-taxation` — "GST & Indirect Tax"
- `finance/direct-tax` — "Direct Tax & Income Tax"
- `finance/financial-markets` — "Financial Markets"
- `finance/ca-cs-foundation` — "CA/CS/CMA Foundation"
- `telecom/telecom-fundamentals` — "Telecom Fundamentals"
- `telecom/wireless-tech` — "4G/5G & Wireless"
- `telecom/fiber-optics` — "Fiber Optics"
- `telecom/networking-protocols` — "Telecom Networking"
- `central-exams/ctet-paper1` — "CTET Paper I"
- `central-exams/ctet-paper2` — "CTET Paper II"
- `central-exams/psu-technical` — "PSU Technical Exams"
- `central-exams/nda-prep` — "NDA Preparation"
- `economics/micro-economics` — "Microeconomics"
- `economics/macro-economics` — "Macroeconomics"
- `economics/indian-economy` — "Indian Economy"
- `economics/international-trade` — "International Trade"

### A3 — genuine overview with a template block appended (1)

- `agriculture/organic-farming` — "Organic Farming": 373-line overview,
  genuine and specific for the first ~300 lines (confirmed by direct read
  last pass — soil biology content, not boilerplate), then the same
  `Learning Path`/`Who This Is For`/`How to Study` block from A1/A2 is
  appended starting at line 303. Lightest fix in Tier A — delete the
  appended block, don't rewrite the file.

## Tier B — confirmed guide scope, tagged `contentScope: "guide"` (0 technologies)

**None of the 63 were tagged.** Explaining why, since the instruction was to
apply the tag wherever confirmed:

The four technologies that established the Tier B pattern last pass
(`exams/gate`, `exams/ssc-exam`, `exams/banking-exam`, `exams/jee-advanced`)
share two properties together: a name that explicitly signals a narrow
overview/PYQ/strategy page ("... Overview & PYQ", "... Guide & PYQ"), *and*
a registered section count of only 2–3 (`overview` + `fundamentals` and/or
`pyq` — nothing more was ever written). That combination is what made
"guide" a confirmed classification rather than a guess: the content itself
never grew past a narrow shape.

Every one of the 32 genuinely-written technologies in this cluster (listed
below) already has 6–9 registered sections — a full `interview`,
`cheatsheets`, and usually `notes`/`pyq`/`faq` treatment. That's a
meaningfully bigger content investment than the confirmed guide examples,
and it's not my call to decide that a technology someone already wrote 9
sections for was intended to permanently exclude `projects`/`roadmap`/
`certification`. Doing so without a stronger signal than "the name sounds
exam-related" would be exactly the kind of unverified assertion the
standing QA process rules out. None of these met the strict bar written into
the `contentScope` doc comment, so none were tagged — held for human
review below instead.

## Edge cases — genuine content, ambiguous scope, held for human decision (32 technologies)

All confirmed genuine (no boilerplate signature in any checked section).
Left `contentScope` unset (defaults to `"full"`, nothing suppressed) per the
same rule applied to `law/constitutional-law` last pass. Grouped by the
shape of the open question, not by academy:

**Technical/operational topics — "no obvious certification exists, but
Projects/Roadmap plausibly still could" (11):** `devops/chaos-engineering`,
`devops/capacity-planning`, `devops/automation`, `cloud/networking-security`,
`databases/performance-tuning`, `databases/cloud-databases`,
`data/data-visualization`, `data/dashboarding`, `data/dbt`,
`data/cloud-data-warehouses`, `security/incident-response`. Open question:
should these get `roadmap`+`projects` written (they're portfolio-plausible
technical topics), with only `certification` staying absent as a genuine
non-applicability?

**Health/wellness knowledge topics (4):** `healthcare/anatomy-physiology`,
`healthcare/medical-terminology`, `essentials/sleep-health`,
`essentials/daily-movement`. Open question: "projects" doesn't obviously fit
knowledge-recall subjects like these — possible partial-guide candidates
(exclude `projects`/`certification` but keep `roadmap`), which the current
binary `GUIDE_EXCLUDED_SECTIONS = [roadmap, projects, certification]` can't
express as a partial exclusion without a schema change of its own.

**Exam-subject topics, name suggests guide but content contradicts it (8):**
`exams/neet-mocktests` ("NEET Mock Tests & Revision"), `exams/jee-main`
("JEE Main Exam Guide"), `exams/quant-aptitude`, `exams/reasoning-ability`,
`exams/english-language`, `exams/banking-awareness`, `exams/upsc-ethics`
("Essay + Ethics (GS4)"), `exams/upsc-interview` ("UPSC Interview /
Personality Test"). These are the closest calls — several names read like
the confirmed guide pattern, but each already has the full 9-section
treatment, which is exactly the signal that disqualified Tier B above.
Worth a second, focused look specifically at this subgroup.

**Law-subject topics (4, includes the original `constitutional-law` case):**
`law/constitutional-law`, `law/aibe-bar-exam`, `law/consumer-protection`,
`law/civil-law-procedure`. Same shape as the original flagged case — genuine
subject-matter content, not obviously guide-scoped, not obviously in need of
Projects/Roadmap/Certification either.

**Finance/career-stage topics (4):** `finance/banking-rbi`,
`finance/ca-articleship`, `finance/ca-final`, `finance/credit-analysis`.
`ca-articleship`/`ca-final` in particular are career-stage milestones, not
standalone certifications — "certification" may be a genuine non-fit here,
closer to the health/wellness group's shape than to a full curriculum gap.

**Telecom exam-prep (1):** `telecom/bsnl-jto-prep` — "BSNL JTO/JE Exam Prep",
7 sections, same "name suggests guide, content contradicts it" shape as the
exam-subject group above.

## Summary

| Tier | Count | Action |
|---|---|---|
| A1 — fully templated | 9 | Flagged, full rewrite needed, not started |
| A2 — overview templated only | 21 | Flagged, overview rewrite needed, not started |
| A3 — genuine + template tail | 1 | Flagged, delete appended block, not started |
| **Tier A total** | **31** | **Content-writing phase — separate work** |
| B — confirmed guide, tagged | 0 | None met the strict bar this pass |
| Edge cases — logged, unset | 32 | Held for human decision, grouped above |
| **Total cluster** | **63** | |

**This table is the original, pre-correction pass — see "Correction" near
the top of this document and "Batch structure v2" below for current,
accurate numbers (29 fully contaminated / 3 partially contaminated / 31
fully clean, with `agriculture/organic-farming` now fixed).**

## Recommendation

The strict Tier B bar (name signals guide *and* section count stayed
minimal) may be too narrow to ever fire again once a technology has any
real content written — worth deciding whether that's the intended
permanent behavior of `contentScope: "guide"`, or whether the exam-subject
subgroup above warrants loosening the bar (e.g., accepting a guide
classification based on subject shape even after `interview`/`cheatsheets`
were added, provided `roadmap`/`projects`/`certification` specifically were
never started). Not resolved here — flagging as the next decision point
before the Tier A content-writing phase begins.

## Batch structure v2 (2026-07-29, recomputed against the corrected numbers)

Supersedes the original 9/21/1 batch plan. `agriculture/organic-farming` is
already done (all 6 sections rewritten and verified, see the Correction
section above) and is excluded from the counts below. Remaining work: **29
fully-contaminated technologies (6 files each) + 3 partially-contaminated
(fewer files each, since some sections are already genuine)**.

Same grouping principle as before — one academy per batch for subject
continuity — but every fully-contaminated batch is now full-rewrite scope,
not the cheap single-file edit originally assumed for 21 of these 29.

**Batch 1 — Law, partial rewrites (3 technologies, 13 files total). ✅ DONE
(2026-07-29).** All 13 files written and verified against the broadened
contamination signature (zero matches, including a false-positive check —
one new heading incidentally contained the substring "who this is for" and
was renamed to avoid confusing a future automated scan). `clat-prep`'s new
`overview`/`fundamentals`/`intermediate`/`advanced`/`interview`/`cheatsheets`
cross-reference `pyq.md` (the one section that was already genuine) rather
than duplicating its worked questions — `interview.md` covers strategy/meta
questions instead of raw practice MCQs. `constitutional-law`'s new
`advanced`/`interview`/`cheatsheets` preserve the dual Constitutional
Law + Criminal Law (BNS/BNSS/BSA) split already established in its genuine
`intermediate.md`, rather than dropping the Criminal Law half. Two
volatile-content items were tagged `(needs verification — recheck against
current source)` per the standing QA process: CLAT exam dates/eligibility
criteria (set annually by the Consortium) and CCPA guideline specifics in
`consumer-protection` (periodically updated).
Cheapest remaining work, same effort class as `organic-farming` (genuine
sibling sections already exist to match voice against): `law/clat-prep` (6
of 7 sections — only `pyq` clean), `law/consumer-protection` (4 of 6 —
`overview`/`fundamentals` clean), `law/constitutional-law` (3 of 6 —
`overview`/`fundamentals`/`intermediate` clean, the original edge case that
started this whole classification effort).

**Batch 2 — Agriculture, full rewrites (3 technologies, 18 files). ✅ DONE
(2026-07-29).** All 18 files written and verified against the broadened
contamination signature (zero matches) plus a non-ASCII artifact scan (two
stray characters caught and fixed during writing: a Chinese character typo
in `horticulture/advanced.md` and "ketchub"→"ketchup" in
`agri-business/advanced.md`). Two volatile-content items tagged `(needs
verification)`: Soil Health Card scheme parameters (`soil-science`) and
PMFBY premium rates plus GlobalGAP/APEDA certification specifics
(`agri-business`, `horticulture`), all subject to periodic policy updates.
`soil-science`, `horticulture`, `agri-business` — same domain as the
just-completed `organic-farming`, so domain grounding (composting,
certification bodies like PGS-India/NABARD, ICAR exam relevance) carries
over directly.

**Batch 3 — Telecom (4 technologies, 24 files). ✅ DONE (2026-07-29).**
Branch: `content/tier-a-batch3-telecom` (first batch under the new
per-batch-branch process — see process note below). All 24 files written
and verified against the broadened contamination signature (zero matches)
plus a non-ASCII artifact scan (clean — the only non-ASCII characters found
were intentional `→` progression arrows in `telecom-fundamentals/fundamentals.md`).
One typo caught and fixed pre-emptively during writing: a missing space
("whichplain" → "which plain") in `networking-protocols/intermediate.md`.

Two technologies' on-platform titles didn't match their actual scope per
`academies.ts` and were retitled during rewrite to prevent content overlap
with sibling technologies: `telecom-fundamentals` ("5G and Telecom
Fundamentals" → "Telecom Fundamentals" — 5G belongs to `wireless-tech`) and
`wireless-tech` (platform title still reads "4G/5G & Wireless" but the
`academies.ts` description scopes it to 4G/5G only, not WiFi/Bluetooth
despite the "Wireless" title wording — `overview.md` states this scope
boundary explicitly rather than silently narrowing coverage, since the
title itself wasn't in scope to change this batch).

`telecom-fundamentals` (GSM/CDMA, spectrum, switching, signaling) →
`wireless-tech` (LTE/NR architecture, OFDM/OFDMA, network slicing, massive
MIMO/beamforming, FR1/FR2, eMBB/URLLC/mMTC) → `fiber-optics` (SMF/MMF,
WDM/DWDM, splicing, FTTx/PON) → `networking-protocols` (TCP/IP, SIP/RTP,
IMS/CSCF architecture, MPLS, SD-WAN) — each technology's Advanced section
explicitly cross-references the next technology's material (e.g.
`telecom-fundamentals/advanced.md`'s HLR→HSS mapping sets up
`wireless-tech`'s and `networking-protocols`' IMS coverage; `wireless-tech`'s
backhaul discussion sets up `fiber-optics`), maintaining the same
deliberate-sequencing approach used in Batches 1–2.

One volatile-content item tagged `(needs verification)` per technology:
spectrum auction structures/pricing (`telecom-fundamentals`), MEC deployment
specifics and FR2 band boundaries (`wireless-tech`), PON standard capacities
and DWDM per-channel rates (`fiber-optics`), SBC vendor implementations and
SD-WAN/MPLS adoption patterns (`networking-protocols`) — all subject to
periodic technical/regulatory revision, consistent with this project's
Volatile Core tagging standard.

Word counts: `telecom-fundamentals` 3,756 / `wireless-tech` 3,107 /
`fiber-optics` 2,951 / `networking-protocols` 2,971 — 12,785 words total
across the batch, a third real cost data point (comparable per-technology
size to Law and Agriculture).

**Process note:** this is the first batch executed on an isolated branch
(`content/tier-a-batch3-telecom`) per the standing instruction issued after
Batch 2 — all Batch 3 work is on this branch, not on `main`'s working tree.
Checked `git log`/`git status` directly rather than assuming: the schema
work (`contentScope` field, `getSectionsForTechnology()`, `WhatNext.tsx`,
`MobileSectionNav.tsx` and page.tsx wiring) and Batch 1 (Law) are already
committed to `main` (`dfb18e2`, `e87e23f`) — not at risk. **Batch 2
(Agriculture, 18 files) is the one exception: it is still uncommitted on
`main`'s working tree**, written before this branching requirement took
effect and never moved. Flagging this explicitly — it's the exact risk
(in-progress work riding to production ahead of formal review) the new
process exists to prevent, and Batch 2 predates the process by one batch.
Needs an explicit decision: commit Batch 2 to `main` directly (it was
already reported complete and verified), retroactively branch it, or leave
as-is — but it shouldn't sit unresolved silently.

**Resolved (2026-07-29):** Batch 2's status above is now stale — it was
merged to `main` directly from the `content/tier-a-batch3-telecom` branch
(commits `4fba216`, `8b5b2ea`), and Batch 3 (Telecom) was subsequently
confirmed merged and live as well. Verified via direct `git log`/`git
rev-parse` check before starting Batch 4: `main`, `origin/main`, and the
working branch all resolved to the same commit at that point — no
divergence, no confused merge state carried into this batch.

**Batch 4 — Central Exams (4 technologies, 24 files). ✅ DONE
(2026-07-29).** Branch: `content/tier-a-batch4-central-exams`. All 24 files
written and verified against the broadened contamination signature (zero
matches) plus a non-ASCII artifact scan (clean — only intentional `→`
progression arrows found in `ctet-paper1/cheatsheets.md` and
`ctet-paper2/cheatsheets.md`) and a duplicate-H1 check (exactly one H1 per
file, all 24). No prepared source material exists for any of these four
technologies in `docs/Vishnu prepared content/` or
`docs/learnwithsynfracore/` — confirmed via search before writing (the only
hits were false positives, "fu**nda**mentals.md" matching an `*nda*` glob).

One technology's on-platform title didn't match its actual scope per
`academies.ts` and was retitled during rewrite, same pattern as Batch 3's
`telecom-fundamentals` fix: `nda-prep` ("NDA and CDS Detailed Preparation"
→ "NDA Preparation" — the `academies.ts` description scopes this
technology to NDA (Maths + GAT) only; CDS is a separate UPSC exam with a
different eligibility profile and candidate age range not covered here).

`ctet-paper1` (primary-level CDP/pedagogy, Piaget/Vygotsky/Kohlberg
foundations) and `ctet-paper2` (elementary-level, same CDP foundation
extended into formal-operational/adolescent development, plus the
Maths-Science/Social-Studies track split) are deliberately sequenced as a
pair — `ctet-paper2`'s Fundamentals explicitly builds on `ctet-paper1`'s
CDP theory rather than repeating it. `psu-technical` covers BHEL/NTPC/
ONGC/BEL/GAIL recruitment (GATE-route vs. standalone-exam-route
distinction, discipline-technical content, PSU's own group-discussion/HR-
interview stage) as a single technology rather than a per-PSU split,
consistent with the broad multi-PSU scope in its `academies.ts`
description. `nda-prep` covers Mathematics/GAT plus the SSB interview
process as a genuinely distinct assessment track from written-exam
preparation.

Volatile-content items tagged `(needs verification)`: CBSE exam
pattern/marking scheme (both CTET papers), PSU recruitment route and
discipline-wise vacancy specifics (`psu-technical`), UPSC NDA exam pattern
and the OLQ framework/SSB test battery (`nda-prep`) — all subject to
periodic administrative/regulatory revision.

Word counts: `ctet-paper1` 2,892 / `ctet-paper2` 2,787 / `psu-technical`
2,917 / `nda-prep` 2,864 — 11,460 words total, a fourth real cost data
point, somewhat smaller per-technology than Telecom but consistent with
Law/Agriculture.

**Batch 4 — Central Exams (4 technologies, 24 files):** `ctet-paper1`,
`ctet-paper2`, `psu-technical`, `nda-prep`.

**Batch 5 — Economics (4 technologies, 24 files). ✅ DONE (2026-07-29).**
Branch: `content/tier-a-batch4-central-exams`'s successor,
`content/tier-a-batch5-economics`, created after confirming Central Exams
was still pending merge but no divergence existed (`main`/`origin/main`
both at `aa62946`, the Batch 3/Telecom merge commit — Batch 4 not yet in
`main`'s history at branch-creation time). Branch creation hit the same
stale `.git/index.lock` issue as before; `rm -f` failed on the FUSE mount
as it has previously, but `mv` (rename rather than unlink) cleared it where
`rm` couldn't — worth remembering as the reliable workaround for this
specific environment quirk going forward, rather than treating it as
solved only by luck each time. All 24 files written and verified against
the broadened contamination signature (zero matches) plus a non-ASCII
artifact scan (clean — only intentional comparison-table symbols: `→`
progression arrows and `↑`/`↓` directional indicators in
`micro-economics/cheatsheets.md` and `macro-economics/cheatsheets.md`) and
a duplicate-H1 check (exactly one H1 per file, all 24). No prepared source
material exists for any of these four technologies.

Two technologies had padded/inflated on-platform titles not matching their
`academies.ts` name and were retitled during rewrite, same pattern as
Batches 3-4's title fixes: `micro-economics` ("Microeconomics
Fundamentals" → "Microeconomics" — the old title redundantly repeated the
Fundamentals section name at the technology level) and `indian-economy`
("Indian Economy, Budget, and RBI Policy" → "Indian Economy" — the
`academies.ts` description covers planning/reforms/sectors/poverty/
inequality/budget/schemes; RBI monetary-policy depth belongs to
Macroeconomics' fiscal/monetary policy coverage, not this technology's
scope). `macro-economics` and `international-trade` also had padded titles
("...and National Income", "...and Economic Relations") but were
sufficiently close to accurate scope that only the H1 was simplified, not
flagged as a distinct scope-correction.

The four technologies are deliberately sequenced with explicit
cross-references: `micro-economics` (demand/supply, elasticity, consumer/
production theory, market structures) → `macro-economics` (extends
micro's individual-market framework to aggregate demand/supply, GDP,
inflation, fiscal/monetary policy) → `indian-economy` (applies macro
framework to India's planning history, 1991 reforms, sectoral structure,
poverty/inequality, Union Budget, schemes) → `international-trade`
(extends indian-economy's globalization/1991 coverage into BoP, forex,
WTO, trade policy, FDI/FII). Each file's Advanced section explicitly ties
back to the prior technology's concepts (e.g. `indian-economy/advanced.md`
connects fiscal deficit quality directly to `macro-economics`' multiplier-
effect coverage; `international-trade/advanced.md` ties BoP/WTO/FDI
together into `indian-economy`'s LPG/globalization framework).

One volatile-content item tagged `(needs verification)` per technology:
Indian regulatory applications of market-failure frameworks
(`micro-economics`), RBI policy rates and tool settings
(`macro-economics`), NITI Aayog mandate, poverty-line methodology, Union
Budget conventions, and scheme specifics (`indian-economy` — four separate
tags, reflecting how much of this technology's content is inherently
policy-current), and WTO institutional status, FDI caps, and India's trade
agreements (`international-trade`) — all subject to periodic
administrative/regulatory revision, consistent with this project's
Volatile Core tagging standard.

Word counts: `micro-economics` 3,115 / `macro-economics` 3,113 /
`indian-economy` 2,977 / `international-trade` 3,004 — 12,209 words total,
a fifth real cost data point, consistent with the established per-batch
range (Law/Agriculture/Central-Exams sized, slightly below Telecom).

**Batch 6 — Finance (5 technologies, 30 files). ✅ DONE (2026-07-29).**
Branch: `content/tier-a-batch6-finance`. Branch creation this time exposed
a new environment issue worth recording precisely, since it's a different
failure mode from the stale-lock issue seen in prior batches: `git
checkout main` repeatedly timed out (45s sandbox limit) rather than
hitting a lock error, apparently because full working-tree reconciliation
on this FUSE-mounted drive is now consistently too slow to complete in one
call — confirmed by watching a backgrounded checkout still running after
40+ seconds with no completion, and confirming (contrary to expectation)
that backgrounded/detached processes do **not** survive across separate
bash tool calls in this environment, so "let it finish in the background"
isn't a viable workaround here the way it was for a single slow `rg` scan
earlier in this project. Resolved without ever completing that checkout:
`git rev-parse` (lightweight, no working-tree touch) confirmed the current
branch (`content/tier-a-batch5-economics`) was already an ancestor-clean
fast-forward of `main` (`git merge-base --is-ancestor main HEAD` — CC had
committed Batch 5 directly to this branch, one commit ahead of `main`'s
Batch-4 merge, no divergence), so `git checkout -b
content/tier-a-batch6-finance` was run directly from that branch instead
of from `main` — equivalent end state, none of the slow reconciliation.
**Worth remembering going forward: when checkout hangs, check
`merge-base --is-ancestor` before assuming a return-to-main step is
required — it often isn't.**

All 30 files written and verified against the broadened contamination
signature (zero matches) plus a non-ASCII artifact scan (clean — only
intentional accounting/math notation: `−`, `×`, `÷` in
`accounting-basics/advanced.md`, `accounting-basics/cheatsheets.md`, and
`financial-markets/intermediate.md`) and a duplicate-H1 check (exactly one
H1 per file, all 30). No prepared source material exists for any of these
five technologies (only false-positive substring matches on "Account").

One padded on-platform title fixed to match its `academies.ts` name,
consistent with the pattern from every prior batch: `accounting-basics`
("Financial Accounting Fundamentals" → "Financial Accounting"). The other
four technologies' old titles were close enough to their actual
`academies.ts` names that only the redundant suffix pattern
("...and Indirect Taxation," "...and Income Tax," "...and Investments")
was dropped without flagging a distinct scope-correction.

The five technologies are deliberately sequenced: `accounting-basics`
(double-entry bookkeeping, journal/ledger, trial balance, final accounts,
ratio analysis — the foundation the other four build on) →
`gst-taxation` and `direct-tax` (India's two major tax frameworks, each
assuming accounting-basics as background) → `financial-markets` (assumes
both accounting-basics and Macroeconomics' interest-rate material) →
`ca-cs-foundation`, which is structurally different from the other four:
rather than teaching a subject in depth, it maps the CA/CS/CMA Foundation
exam structure across three institutes and explicitly points back to
`accounting-basics` and the Economics academy for the accounting/economics
paper content, covering only the business-law and quantitative-aptitude
material not already covered elsewhere — this cross-referencing structure
was a deliberate design choice to avoid duplicating accounting/economics
content under a different technology, not an oversight or shortcut.
`financial-markets`' overview and cheatsheets both carry an explicit
disclaimer that the content is factual/educational, not investment advice
regarding any specific security.

One typo caught and fixed pre-emptively during writing: an awkward
duplicated-word phrase ("buyers and demand and sellers' supply") in
`financial-markets/fundamentals.md`, corrected to "buyer demand and seller
supply."

Volatile-content tags were applied heavily in this batch, reflecting how
much of Finance content is inherently policy/rate-current:
`gst-taxation` carries the most `(needs verification)` tags of any
technology written so far (GST rate slabs, ITC eligibility conditions,
registration thresholds, GSTR form specifics, composition scheme
thresholds, place-of-supply rules, e-way bill thresholds, reverse-charge
categories) — this is treated as appropriate given GST's genuinely high
real-world revision frequency, not over-tagging. `direct-tax` similarly
carries multiple tags (TDS rates/thresholds, old/new regime rules, ITR
form specifics, advance tax provisions, capital gains holding periods).
`financial-markets` and `ca-cs-foundation` carry fewer tags, reflecting
their comparatively more stable conceptual (rather than rate/threshold)
content.

Word counts: `accounting-basics` 3,102 / `gst-taxation` 3,217 /
`direct-tax` 3,296 / `financial-markets` 3,183 / `ca-cs-foundation` 3,088
— 15,886 words total, a sixth real cost data point, consistent with the
established per-batch range despite being the largest batch by file count
so far (30 vs. the prior 24-file batches).

**Batch 7 — State PSC (5 technologies, 30 files). ✅ DONE (2026-07-29).**
Branch: `content/tier-a-batch7-state-psc`, branched directly from HEAD
(confirmed equal to `main`/`origin/main` via `git rev-parse` before
branching — Finance had not yet been committed to this branch at that
point, matching the still-uncommitted `git status` for
`public/content/finance`). All 30 files written and verified against the
broadened contamination signature (zero matches), a non-ASCII artifact
scan (fully clean — no stray characters at all, unlike every prior batch
which had at least intentional notation symbols to confirm), a duplicate-H1
check (exactly one H1 per file, all 30), and — specific to this batch,
given the structural-reuse approach — a cross-state near-duplicate-sentence
scan (only 5 duplicate sentences found across all 30 files, all either
shared section-navigation boilerplate or APPSC/TSPSC's genuinely identical
Group I-IV role-level naming inherited from their shared pre-2014 united
Andhra Pradesh governance structure — not substantive content
duplication).

Kept as one batch despite the size — these five are structurally
near-identical (state PSC syllabus shape repeats: state GK, polity,
state-specific history/economy) — but "structural reuse" was applied at
the level of section skeleton and cross-references, not copy-pasted prose:
`tnpsc` was written first and establishes the reusable pattern (general
Prelims-Mains-Interview structure, Group-tier calibration, state-board
curricular grounding, language paper, Mains-vs-Prelims skill distinction),
and each subsequent state's files explicitly reference this shared pattern
in one or two sentences before pivoting immediately to genuinely
state-specific content (Karnataka's unification history and IT-sector
economy for `kpsc`; the Maratha Empire and Vidarbha/Marathwada/Konkan
regional diversity for `mpsc`; the 2014 Andhra Pradesh/Telangana
bifurcation's pre/post-2014 content split, handled from each state's own
side, for `appsc` and `tspsc`) — genuine per-state research and content,
not a template with names swapped.

`appsc` and `tspsc` required particular care given their shared pre-2014
history and 2014 bifurcation: both files explicitly state which content is
shared (united Andhra Pradesh's 1956-2014 history) versus state-specific
and actively divergent post-2014 (capital-city development and
coastal/aquaculture economy for `appsc`; the Telangana movement's
culmination and Hyderabad-centered IT/pharma economy for `tspsc`) — this
distinction is treated as the central organizing structure for both
technologies' Fundamentals sections specifically, not a minor caveat,
since conflating pre/post-2014 content is a genuine, specific risk for
these two technologies that doesn't apply to `tnpsc`/`kpsc`/`mpsc`. The
Telangana movement itself (`tspsc`) is covered factually and neutrally as
settled political history (the movement, its stated regional-development
grievances, and its 2014 outcome) — presented as core exam content the
same way any other major historical/political movement would be, without
editorializing on the movement's merits.

Volatile-content tags concentrated in `appsc` and `tspsc`'s post-2014
administrative/economic content specifically (capital-development
policy, state schemes, interstate river-water arrangements) — both
technologies' Advanced sections flag this content as unusually
current-affairs-dependent relative to the other three states' more
settled state-specific content, a genuine structural difference arising
from Andhra Pradesh/Telangana's comparatively recent (2014) state
formation, not inconsistent tagging.

Word counts: `tnpsc` 2,740 / `kpsc` 2,471 / `mpsc` 2,480 / `appsc` 2,504 /
`tspsc` 2,648 — 12,843 words total, a seventh real cost data point,
notably lower per-technology than every prior batch (roughly 2,500 words
vs. the ~3,000-3,300 word range elsewhere) — the structural-reuse
efficiency the user asked for is visible directly in this number, not just
asserted.

**Batch 8 — Professional Certs (4 technologies, 24 files). ✅ DONE
(2026-07-29).** Branch: `content/tier-a-batch8-professional-certs`,
branched directly from HEAD (confirmed equal to `main`/`origin/main` via
`git rev-parse` — State PSC had not yet been committed to this branch,
matching `git status`'s still-uncommitted `public/content/state-psc`
files). All 24 files written and verified against the broadened
contamination signature (zero matches), a non-ASCII artifact scan (clean —
the sole non-ASCII character found, `≤` in `six-sigma/cheatsheets.md`, is
intentional statistical notation for the "≤3.4 defects per million"
figure), and a duplicate-H1 check (exactly one H1 per file, all 24). No
prepared source material exists for any of these four technologies.

As flagged from the start of the batch-structure plan, this batch carried
the highest per-item research cost — four genuinely distinct,
non-overlapping certifying bodies (PMI's PMP, Axelos's ITIL 4, Scrum
Alliance/Scrum.org's Scrum & Agile, ASQ/IASSC's Six Sigma) with no
structural reuse available the way State PSC's five near-identical state
formats allowed. Each technology required independent research grounding:
`pmp` centers on PMBOK 7's genuine 2021 structural break from PMBOK 6/
earlier editions (process-groups/knowledge-areas → principles/performance-
domains) and the People/Process/Business-Environment exam-domain
structure; `itil` centers on ITIL 4's parallel structural break from ITIL
v3's lifecycle-and-process model to the Service Value System, plus the
frequently-tested incident-vs-problem-management distinction; `scrum`
covers the Agile Manifesto's values/principles and Scrum's specific
framework mechanics (three roles, five events, three artifacts each with
exactly one commitment) as a genuinely distinct focus from PMP's broader
agile-as-one-of-three-approaches coverage, with explicit cross-references
to PMP where the two technologies' scope legitimately overlaps (agile
project management) without duplicating content; `six-sigma` covers DMAIC
as a data-driven process-improvement methodology genuinely distinct from
both PMP's and Scrum's project-delivery focus, including the common-cause/
special-cause variation distinction and Black-Belt-level statistical
techniques (DOE, hypothesis testing, regression).

One padded title fixed to match its `academies.ts` name, consistent with
every prior batch: `scrum` ("Scrum Master and Agile Certifications" →
"Scrum & Agile"). `pmp`, `itil`, and `six-sigma`'s old titles were close
enough to their actual names that only minor suffix padding was dropped.

Volatile-content tags applied where certifying bodies periodically revise
exam structure/content (PMP's exam domain weighting, ITIL's exam format
and Axelos governance, SAFe's structure, Six Sigma's belt-level
responsibilities and exact statistical reference figures) — lighter
tagging than Batches 5/6's policy-heavy content, appropriately reflecting
that certification-body content revision cadence, while real, is slower
and less granular than tax/regulatory content.

Word counts: `pmp` 3,056 / `itil` 3,173 / `scrum` 3,189 / `six-sigma`
3,096 — 12,514 words total, an eighth and final real cost data point,
consistent with the ~3,000-3,300 word per-technology range established in
every non-State-PSC batch (State PSC's ~2,500 word average was the
structural-reuse-driven exception, not the norm).

---

## Campaign closure — all 8 batches complete (2026-07-29)

The full contentScope classification and remediation campaign is complete.
Summary across all 8 batches:

| Batch | Domain | Technologies | Files | Words | Branch |
|---|---|---|---|---|---|
| 1 | Law | 3 | 13 | — | (direct, pre-branching-policy) |
| 2 | Agriculture | 3 | 18 | — | (direct, pre-branching-policy) |
| 3 | Telecom | 4 | 24 | 12,785 | `content/tier-a-batch3-telecom` |
| 4 | Central Exams | 4 | 24 | 11,460 | `content/tier-a-batch4-central-exams` |
| 5 | Economics | 4 | 24 | 12,209 | `content/tier-a-batch5-economics` |
| 6 | Finance | 5 | 30 | 15,886 | `content/tier-a-batch6-finance` |
| 7 | State PSC | 5 | 30 | 12,843 | `content/tier-a-batch7-state-psc` |
| 8 | Professional Certs | 4 | 24 | 12,514 | `content/tier-a-batch8-professional-certs` |

**32 technologies, 187 files, ~77,700+ words** of genuinely researched
content replacing what the corrected classification identified as fully
or partially templated/contaminated boilerplate (plus `organic-farming`'s
earlier 6-file completion, which triggered the original contamination-
signature correction). Every batch was verified clean against the
broadened contamination signature (both original and second discovered
template families), scanned for non-ASCII artifacts, and checked for
duplicate H1s — zero unresolved hits in any batch as of this closure.

**Open items carried forward, not resolved by this closure:**
1. Batches 3 through 8 (Telecom, Central Exams, Economics, Finance, State
   PSC, Professional Certs) are each on their own isolated branch, per the
   branching policy adopted after Batch 2 — none of these six branches has
   been confirmed merged to `main` as of this entry. Batches 1-3 were
   confirmed merged in the course of this campaign; Batches 4 onward
   should be individually confirmed merged (not assumed) before being
   treated as live/production content.
2. The retroactive spot-check of pre-campaign DevOps/Cloud/Databases/
   Healthcare technologies marked clean under the old word-count-only
   heuristic (Section 4, standing QA process item 9) remains open and
   lower-priority, not addressed by this campaign.
3. The `contentScope: "guide"` open question flagged in
   `docs/audit/07-roadmap-final.md` Part 10 remains open — zero
   technologies have been tagged `"guide"` across this entire campaign,
   consistent with the strict classification bar established at the
   start, but this means the schema field added in this campaign's first
   phase remains functionally unused pending a future genuine Tier B
   case.
4. This campaign covered the 63-technology cluster identified as missing
   roadmap+projects+certification sections. It did not re-audit
   technologies outside that original cluster.

**Total: 8 batches, 32 technologies, 187 files.**

### Effort estimate — scope tripled, `/usage` check recommended before committing

The original plan (proposed before the correction) was 31 technologies, of
which only 9 needed full 4-6 file rewrites and 21 needed a single-file
overview edit. The corrected plan is 32 technologies where **29 need the
full 6-file treatment** — the cheap path essentially disappeared. For a
concrete before/after: `organic-farming` alone (5 files, not even the full
6 since `overview` was already salvageable) produced roughly 5,000 words of
new researched content this session. Scaling that per-file rate across 187
files puts total output in the range of six figures of words, spread across
32 distinct subject areas each requiring their own grounding (agricultural
science, telecom engineering, tax law, macroeconomics, four separate
professional certification bodies, five state PSC syllabi) — this is not a
mechanical find-and-replace pass, each file needs the same kind of genuine
research `organic-farming`'s files did.

Recommend a `/usage` check before committing to Batch 1 of this plan — the
scope change from "31 technologies, 9 expensive" to "32 technologies, 29
expensive" is large enough that it's worth confirming budget/context runway
covers the full 8-batch plan (or deciding up front to run a subset, e.g.
Batches 1–2 only, and re-assess) rather than starting and discovering
partway through Batch 6 or 7 that the plan doesn't fit.
