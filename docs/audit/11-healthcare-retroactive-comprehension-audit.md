# Healthcare Academy — Retroactive Standard-9 Comprehension Audit

**Active persona:** Senior Certified Medical Coder & Compliance QA Auditor.

**Scope:** 12 Healthcare technologies that received a full content-accuracy pass
(commits `2203370`, `ded0ec4`, `e692b7e`, `cdc46b6` — all 2026-07-27) but predate
Standard 9 (the beginner-simulation-read requirement, added `a3ed43a`,
2026-07-28 10:18). Same situation DevOps was in before its own retroactive audit
(`docs/audit/10-devops-retroactive-comprehension-audit.md`) — timeline confirmed
via `git log`, no scope correction needed this time.

Technologies: `anatomy-physiology`, `medical-terminology`, `medical-coding`,
`icd-10-cm`, `cpt`, `hcpcs`, `coding-guidelines`, `mock-exams`,
`home-health-coding`, `patient-documentation`, `bchhc-prep`, `healthcare-admin`.

**Batch structure:**
1. Anatomy & Physiology, Medical Terminology, Medical Coding Overview
2. ICD-10-CM, CPT, HCPCS
3. Coding Guidelines, Mock Exams
4. Home Health Coding, Patient Documentation, BCHHC Prep, Healthcare Admin

**Method (same as DevOps phase):** registry-check first (`lib/data/academies.ts`,
`lib/content/index.ts` — confirmed all 12 Healthcare technologies are self-hosted,
no aliasing/shadowing complexity), read every core tab as a true first-time
learner, check undefined terms before first use, tab-depth progression,
dead cross-tab references, duplication/contamination, and `is_beginner_ready`
scaffolding (hook, analogy, diagram, annotated example, try-it) on every
Overview/Fundamentals tab.

---

## Batch 1 — Anatomy & Physiology, Medical Terminology, Medical Coding

### Anatomy & Physiology (9 tabs: overview, fundamentals, intermediate, advanced,
interview, faq, notes, cheatsheets, pyq)

**Accuracy / tab-depth:** Clean. Genuinely strong clinical depth and real
progression — Fundamentals parses a real diagnosis statement and site-specificity
requirements; Intermediate covers CC/MCC-to-DRG impact and upcoding risk via a
chest-pain example; Advanced covers diabetes complication pathways, CKD staging
by GFR, 7th-character sequela coding, and an explicit compliance boundary
("where anatomy knowledge has real limits for a coder") — the strongest
tab-depth example seen in either audit phase to date. No duplicate H1s, no
spliced boilerplate, no wrong-domain template leaks.

**Dead references:** None. 3 cross-tab references checked, all valid (FAQ →
Overview's guidance, FAQ → PYQ tab, Fundamentals → Overview's system table —
all point at real content).

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md` — no
analogy, no true conceptual diagram, no try-it in either (Intermediate/Advanced
are not held to this bar per CLAUDE.md's schema rule, which applies only to
Overview/Fundamentals).

**Status: FIXED.** Added an analogy (hospital-directory-by-department, in
Overview) and a diagram (diagnosis → body system → ICD-10-CM chapter mapping),
plus a 2-minute try-it exercise (decode "acute cystitis with hematuria")
to `overview.md`. Added an analogy (mail-delivery precision) and a try-it
exercise (decode a distal radius fracture note) to `fundamentals.md`.

### Medical Terminology (9 tabs, same set as above)

**Accuracy / tab-depth:** Clean, genuine progression. Fundamentals adds the
connecting-vowel rule; Intermediate covers suffix-meaning precision (-itis vs.
-osis), dangerous abbreviations, eponyms, specialty-specific report language,
and term evolution over time; Advanced covers genuinely ambiguous roots
(myel/o), compound-term root order carrying directional meaning, and query
quality. No duplicate H1s, no contamination.

**Dead references:** None.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md` — the
existing prefix/root/suffix breakdown blocks read as *examples*, not a true
conceptual diagram, and neither tab had a try-it.

**Status: FIXED.** Added an analogy (LEGO-brick word parts) and a labeled
diagram to `overview.md`, plus a try-it (decode "hepatitis" independently).
Added an analogy (English linking "-s-" in compound words) and a try-it
(apply the connecting-vowel rule to "arthroscopy," a term not previously
broken down on the page) to `fundamentals.md`.

### Medical Coding (4 tabs: overview, fundamentals, intermediate, interview —
narrower than its siblings)

**Structural-gap check (per the open question from this audit's setup):**
CONFIRMED BY DESIGN, not a gap. `overview.md`'s own text explicitly states:
*"This module covers only Overview, Fundamentals, and Interview Q&A — it's
intentionally an index/on-ramp, not a full course with its own certification
track, projects, or roadmap."* This is unlike Istio's missing tabs in the
DevOps audit (an unflagged, undocumented absence) — here the narrower scope is
declared on the page itself.

**Structural inconsistency found — FLAGGED, NOT FIXED:** The technology
directory contains an `intermediate.md` file, which directly contradicts
`overview.md`'s own "only Overview, Fundamentals, and Interview Q&A" scope
claim. Worse, `intermediate.md`'s actual content is Home Health/OASIS-specific
material — a home health assessment cycle diagram (SOC/ROC, "very common in
HH"), an ICD-10-CM A-to-Z chapter guide framed with home-health-specific
callouts ("💡 Home Health most common chapters"), and ICD-10-CM convention
notes (NEC/NOS) — none of it generic medical-coding-overview content
consistent with this technology's stated scope. Cross-checked against
`home-health-coding/intermediate.md`: not an exact duplicate, but clearly the
same class of defect as the wrong-technology content leakage fixed in the
original accuracy pass (commit `cdc46b6`) — this instance was either missed
by that pass or is a later regression. Recommend either (a) deleting/moving
`medical-coding/intermediate.md`'s content to `home-health-coding` where it
topically belongs and updating registry/navigation if an intermediate tab is
added there, or (b) rewriting `intermediate.md` as genuine general
medical-coding content and removing the "only 3 tabs" claim from
`overview.md`. Not force-fixed here per standing instruction to flag
structural gaps separately.

**Dead references:** None — all "see this course's X module" references
(ICD-10-CM, CPT, HCPCS, Coding Guidelines, Home Health Coding, BCHHC Prep,
Healthcare Admin, Patient Documentation, Mock Exams) point at real,
registry-confirmed technologies.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md` — no
analogy, no diagram, no try-it in either.

**Status: FIXED (is_beginner_ready only — the intermediate.md contamination
above is deferred/flagged, not fixed in this batch).** Added an analogy
(coding-as-translation) and a diagram to `overview.md`, plus a try-it
(classify `E11.22` by code set and claim role). Added an analogy
(library card-catalog vs. bookshelf, for the index-then-verify workflow) and
a try-it (decode a hematuria/nephrolithiasis note) to `fundamentals.md`.

---

## Batch 1 — closing tally

- 3/3 technologies checked (Anatomy & Physiology, Medical Terminology,
  Medical Coding).
- Accuracy/tab-depth: all 3 passed cleanly — no duplicate H1s, no spliced
  boilerplate, no dead references, no truncations.
- `is_beginner_ready`: 3/3 needed fixes (6 files total: overview.md +
  fundamentals.md × 3 technologies) — now fixed, continuing the systemic
  pattern already documented as the DevOps audit's headline finding. This
  Healthcare batch is 3-for-3 on the same gap.
- Structural gap flagged, not fixed: `medical-coding/intermediate.md` —
  wrong-domain (Home Health/OASIS) content contradicting the technology's
  own declared 3-tab scope. Open backlog item, not urgent to block the
  remaining batches, but should not be silently dropped either.
- Medical Coding's thinner tab count itself: confirmed by-design, not a gap.

**Flagged / Fixed / Deferred:**
- Fixed: 6 files' `is_beginner_ready` scaffolding (anatomy-physiology
  overview.md + fundamentals.md, medical-terminology overview.md +
  fundamentals.md, medical-coding overview.md + fundamentals.md).
- Flagged, deferred: `medical-coding/intermediate.md` content-contamination
  and its contradiction with `overview.md`'s stated scope.
- Deferred: none of the remaining 9 technologies checked yet — batches 2-4
  pending.
