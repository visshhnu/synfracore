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

---

## Batch 2 — ICD-10-CM, CPT, HCPCS

All three technologies here share a different tab shape than Batch 1's (no
faq/notes/pyq — instead certification.md, roadmap.md, projects.md — a
"certification-track" content-scope classification per
`docs/audit/09-contentscope-classification.md`, not a defect; by design and
consistent within this group).

### ICD-10-CM (9 tabs: overview, fundamentals, intermediate, advanced,
certification, roadmap, projects, interview, cheatsheets)

**Accuracy / tab-depth:** Clean, dense, technically accurate reference-style
content — chapter structure, FY2026 guideline changes (HIV sequencing, BMI/Z68,
new diabetes-remission code E11.A, expanded R10 pain codes), conventions
(Excludes1/2, NOS/NEC, E/M convention), diabetes/HTN/sepsis coding logic, and
a full worked practice case. Intermediate/Advanced correctly deepen with 7th-
character fracture logic, neoplasm table navigation, OB trimester coding,
external-cause codes, and uncertainty-word rules (inpatient vs outpatient).
One valid cross-tab reference (Fundamentals → Overview's guideline-changes
section) confirmed accurate. No duplicate H1s, no cross-domain contamination
(checked Intermediate/Advanced for DevOps-technology leakage — none found).

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md` — dense
reference/cheat-sheet style throughout, no analogy, no diagram, no try-it.

**Status: FIXED.** Added an analogy (ICD-10-CM as a detailed postal address
system) and a diagram to `overview.md`, plus a try-it (classify bronchitis vs.
a fracture by chapter, and identify which needs a 7th character). Added an
analogy (store directory vs. the actual aisle, for Index-then-Tabular) and a
try-it (work the 8-step lookup process against a new diagnosis not previously
worked in the tab) to `fundamentals.md`.

### CPT (9 tabs, same shape as ICD-10-CM)

**Accuracy / tab-depth:** Clean. Overview covers code categories, the 6
section ranges, E/M level selection (2021 MDM-or-time model), global surgical
package, a substantial modifier list, and NCCI bundling logic with a correctly
distinguished example (column1/column2 bundling vs. mutually-exclusive
alternatives — 45380 vs. 45378). No duplicate H1s, no contamination found in
Intermediate/Advanced.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md`.

**Status: FIXED.** Added an analogy (CPT as an itemized repair-invoice line
next to ICD-10-CM's "why") and a try-it (classify a chest X-ray by section,
then pick the correct E/M code and explain the new-vs-established numbering
pattern) to `overview.md`. Added an analogy (dictionary guide-words vs. the
full entry, for index-then-verify) and a try-it (reason through add-on-code
rules using 99292) to `fundamentals.md`.

### HCPCS (9 tabs, same shape)

**Accuracy / tab-depth:** Clean. Overview correctly distinguishes Level
I(CPT)/Level II, covers the full letter-range structure, DME's four-part
test, J-code/G-code/A-code examples, HCPCS-specific modifiers, and NCD/LCD
coverage-determination logic. No duplicate H1s, no contamination.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md`.

**Status: FIXED.** Added an analogy (HCPCS as the itemized bill for what a
patient is given/uses, alongside CPT's service line) and a try-it (classify a
CPAP and an injectable drug by code category, then reason through the DME
four-criteria test on a non-durable supply) to `overview.md`. Added an
analogy (to-go container vs. the meal, for deciding whether something needs
its own HCPCS line item) and a try-it (reason through why a flu vaccine needs
two separate codes) to `fundamentals.md`.

---

## Batch 2 — closing tally

- 3/3 technologies checked (ICD-10-CM, CPT, HCPCS).
- Accuracy/tab-depth: all 3 passed cleanly — no duplicate H1s, no
  cross-domain contamination, no dead references, no truncations.
- `is_beginner_ready`: 3/3 needed fixes (6 files total) — the systemic gap
  now holds 6-for-6 across both Healthcare batches so far, matching the
  DevOps audit's headline pattern.
- No structural gaps found this batch (unlike Medical Coding's
  `intermediate.md` issue in Batch 1).

**Flagged / Fixed / Deferred:**
- Fixed: 6 files' `is_beginner_ready` scaffolding (ICD-10-CM, CPT, HCPCS —
  overview.md + fundamentals.md each).
- Flagged, deferred (carried from Batch 1): `medical-coding/intermediate.md`
  content-contamination, still open.
- Deferred: batches 3-4 (Coding Guidelines, Mock Exams, Home Health Coding,
  Patient Documentation, BCHHC Prep, Healthcare Admin) not yet checked.

---

---

## Batch 3 — Coding Guidelines, Mock Exams

### Coding Guidelines (9 tabs: overview, fundamentals, intermediate, advanced,
certification, roadmap, projects, interview, cheatsheets)

**Accuracy:** Content itself is technically accurate wherever checked — FY2026
guideline changes (HIV sequencing, BMI/Z68, SDoH, E11.A, R10 expansion),
UHDDS principal-diagnosis definition, uncertain-diagnosis inpatient/outpatient
rule, sepsis/obstetric sequencing, HCC/RAF logic (Overview); OIG compliance,
upcoding/unbundling, RAC audits, Stark/Anti-Kickback (Advanced).

**Tab-depth / sequencing — FLAGGED, NOT FIXED (real defect, larger than
Batch 1's):** `overview.md` and `advanced.md` are genuinely about this
technology's stated subject — official OGCR/UHDDS guideline rules and
compliance/audit topics. But `fundamentals.md` and `intermediate.md` are
**not** about coding guidelines at all — they're generic "Medical Coding 101"
content: `fundamentals.md` covers "What is Medical Coding," the three core
code systems, a medical-terminology prefix/suffix table, and the revenue
cycle/claim-forms flow (near-duplicate H1 "Medical Coding Fundamentals" —
same exact title as `medical-coding/fundamentals.md`, though the two files'
bodies are not identical text). `intermediate.md` covers E&M code selection,
surgery modifiers, and radiology/lab CPT ranges — content that thematically
belongs in CPT's own Intermediate tab, not here. Neither tab builds on
Overview's guideline-rule content or leads into Advanced's compliance content
— a real violation of the tab-depth/sequencing standard (Standard 9's
"confirm each tab/section builds on the previous one rather than repeating or
skipping content"). This reads as the same class of defect as Batch 1's
`medical-coding/intermediate.md` finding, but affecting 2 of this
technology's 9 tabs rather than 1. Not force-fixed here — flagging for a
dedicated content-restructuring pass (likely: replace Fundamentals/
Intermediate with genuine guideline-application content — e.g., worked
Excludes1/Excludes2 conflict resolution, sequencing walkthroughs building in
difficulty toward Advanced's compliance material — and move the current
E&M/CPT-range content to where it's already covered, since CPT's own
Fundamentals/Intermediate already contain this material almost verbatim).

**Dead references:** None — all "this course's Projects/Certification Guide/
Interview Q&A" references point to real, existing sections within the same
technology.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md` (no
analogy, diagram, or try-it in either, independent of the topic-mismatch
issue above).

**Status: PARTIALLY FIXED.** `is_beginner_ready` scaffolding added to both
tabs (analogy: traffic-sign-rules vs. right-of-way rules, for guidelines vs.
codes, plus a try-it on the inpatient/outpatient uncertain-diagnosis rule, on
`overview.md`; analogy: a coded claim as a labeled package through a shipping
network, plus a try-it tracing the revenue-cycle flow, on `fundamentals.md`).
The topic-mismatch/tab-sequencing defect itself is deferred, not fixed.

### Mock Exams (9 tabs, same shape)

**Accuracy / tab-depth:** Clean and coherent — unlike Coding Guidelines,
every tab here genuinely stays on-topic for exam-readiness practice: Overview
covers the credential landscape (with an explicit, appropriately-flagged
"needs verification" note on BCHHC's certifying body), Fundamentals covers
exam-taking mechanics and question-analysis technique, Intermediate covers
E&M documentation-under-2021-rules and claim denial/appeals codes (framed
specifically as exam-relevant knowledge, not off-topic — a legitimate design
choice, not a defect), Advanced covers complex scenario types (neoplasm,
obstetric, HIV) and audit-readiness checklists. Genuine progression, no
duplicate H1s, no contamination.

**Dead references:** None — all references to Overview's table, Certification
Guide, Projects section, and BCHHC Prep module confirmed to exist.

**`is_beginner_ready`:** FAILED on `overview.md` and `fundamentals.md`.

**Status: FIXED.** Added an analogy (free-throw practice in an empty gym vs.
a real game, for why timed mock practice differs from regular study) and a
try-it (reason through the Exams Covered table, including recognizing the
BCHHC verification flag) to `overview.md`. Added an analogy (a pilot
reviewing a flight-simulator crash report and changing one specific input)
and a try-it (apply the AFTER-review technique to a hypothetical wrong
answer) to `fundamentals.md`.

---

## Batch 3 — closing tally

- 2/2 technologies checked (Coding Guidelines, Mock Exams).
- Mock Exams: clean across all standards, `is_beginner_ready` fixed.
- Coding Guidelines: accurate content, but a real tab-sequencing/topic-mismatch
  defect found and flagged (Fundamentals + Intermediate are off-topic relative
  to the technology's own stated subject) — the most significant structural
  finding of this audit phase so far, larger in scope than Batch 1's
  Medical Coding finding. `is_beginner_ready` fixed independent of that issue.
- `is_beginner_ready`: 2/2 technologies needed fixes (4 files) — pattern now
  8-for-8 across all three Healthcare batches completed so far.

**Flagged / Fixed / Deferred:**
- Fixed: 4 files' `is_beginner_ready` scaffolding (Coding Guidelines,
  Mock Exams — overview.md + fundamentals.md each).
- Flagged, deferred (new): Coding Guidelines' `fundamentals.md` and
  `intermediate.md` topic-mismatch/tab-sequencing defect.
- Flagged, deferred (carried from Batch 1): `medical-coding/intermediate.md`
  content-contamination, still open.
- Deferred: batch 4 (Home Health Coding, Patient Documentation, BCHHC Prep,
  Healthcare Admin) not yet checked.

---

---

## Batch 4 — Home Health Coding, Patient Documentation, BCHHC Prep, Healthcare Admin

Closes the 12-technology Healthcare retroactive audit.

### Home Health Coding (9 tabs)

**Accuracy:** Strong. Notably self-corrects a prior error in its own text — the
PDGM clinical-groupings table carries an explicit note that it was corrected
from an earlier, oversimplified 6-group version to the accurate 12-group
list, cross-checked against BCHHC Prep's own material. OASIS timepoints,
HIPPS code structure, high-priority diagnosis examples, and a "Common Coding
Errors to Avoid" section are all clinically sound and well-organized.

**Tab-depth:** Clean, on-topic throughout — Fundamentals correctly builds on
Overview with eligibility detail, key documents (OASIS, Plan of Care/485,
clinical record), not a topic regression like Coding Guidelines' Batch 3
finding.

**Dead references:** None — all "this course's Projects/Certification Guide/
BCHHC Certification Prep" references confirmed to exist.

**`is_beginner_ready`:** FAILED on `overview.md`/`fundamentals.md`.
**Status: FIXED.** Analogy (PDGM as a delivery-pricing algorithm factoring
multiple variables) + diagram + try-it (classify two patients by clinical
group and reason about comorbidity adjustment) on `overview.md`. Analogy
(Medicare's 4-criteria eligibility test as an all-or-nothing bouncer
checklist) + try-it (reason through an aide-only coverage scenario) on
`fundamentals.md`.

### Patient Documentation (9 tabs)

**Accuracy / tab-depth:** Clean. Overview covers CDI's purpose, documentation
deficiency patterns with clear reimbursement/quality/legal impact, the CDI
workflow, and SOAP structure. Fundamentals correctly builds with documentation
codeability criteria, physician documentation elements, and valid-vs-leading
query construction — a real, distinct escalation from Overview, not a repeat.

**Dead references:** None — Certification Guide's "see this course's ICD-10-CM
and Coding Guidelines modules" and Fundamentals cross-reference both confirmed
valid.

**`is_beginner_ready`:** FAILED on `overview.md`/`fundamentals.md`.
**Status: FIXED.** Analogy (documentation as a chef's raw ingredients, CDI as
asking for specifics before cooking/coding starts) + try-it (classify two
documentation deficiencies and identify the query owner) on `overview.md`.
Analogy (a compliant query as a well-built multiple-choice question, not an
open essay or a leading suggestion) + try-it (draft a compliant query for an
unresolved "possible pneumonia") on `fundamentals.md`.

### BCHHC Prep (8 tabs — no `certification.md`, confirmed by design: this
technology IS the certification-prep content itself, so a separate
certification-guide tab would be redundant; Home Health Coding's own
`certification.md` already covers BCHHC's exam-format specifics)

**Accuracy:** Consistent with Mock Exams' identical, appropriately-flagged
uncertainty note about BCHHC's actual certifying body (BMSCC vs. AHCC vs.
WellSky) — the same open question stated the same way in both places, not
a contradiction. **Not clean, however — two real accuracy defects found
during this review's independent verification, not caught by the original
"Accuracy: Clean" pass:**
1. **Real, fixed:** the ROC OASIS timing was stated as "within 24 hours"
   (`overview.md`'s Key Numbers list, and the try-it built directly on top
   of it). Verified externally against CMS guidance (42 CFR 484.55 /
   OASIS guidance manual): the correct requirement is **48 hours (2
   calendar days)** from return from an inpatient stay. Corrected both the
   Key Numbers bullet and the try-it's answer in `overview.md`. The same
   "24 hours" error also appears in 8 other locations not touched by this
   batch — `bchhc-prep/{cheatsheets,interview,projects}.md` and
   `home-health-coding/{certification,cheatsheets,interview}.md` — logged
   below as an open backlog item, not fixed here (out of this batch's
   file scope).
2. **Real, flagged not fixed:** `fundamentals.md`'s "Who Fills OASIS"
   table states OT can **never** independently complete OASIS. Verified
   externally: this was accurate pre-2022 but is now outdated — as of
   January 1, 2022, CMS allows OT to complete the SOC OASIS once another
   discipline has established eligibility, and OT can independently
   complete discharge/recertification OASIS. The flat "No" doesn't reflect
   this nuance. Not fixed here — the correct rule is more nuanced than a
   binary yes/no and deserves a careful rewrite, not a rushed inline
   patch, especially since the same simplified claim likely needs checking
   elsewhere in this technology and Home Health Coding.

**Dead references:** None.

**`is_beginner_ready`:** FAILED on `overview.md`/`fundamentals.md`.
**Status: FIXED** (scaffolding), **with one accuracy correction folded in.**
Analogy (BCHHC Prep as a targeted training camp vs. Home Health Coding's
general-skill-building) + try-it (reason about why ROC's 48-hour window is
faster than SOC's 5-day window — corrected from the original's wrong
24-hour figure) on `overview.md`. Analogy
(the four coverage criteria as table legs — remove one, the table collapses)
+ try-it (apply the Who Fills OASIS table to an OT-only-services scenario —
kept as-is per the outdated-but-not-fixed-here table above) on
`fundamentals.md`.

### Healthcare Administration (9 tabs)

**Accuracy / tab-depth:** Clean. Overview covers key domains, the full RCM
flow diagram, and key regulations (HIPAA/HITECH/ACA/CMS CoPs/OIG).
Fundamentals correctly builds with healthcare organization/ownership types,
the payer/provider/regulator stakeholder map, and HIPAA Privacy/Security/
Breach rules in real depth — good escalation from Overview's regulation-name
table into actual rule mechanics.

**Dead references:** None.

**`is_beginner_ready`:** FAILED on `overview.md`/`fundamentals.md`.
**Status: FIXED.** Analogy (administration as a vehicle's chassis/fuel
system/dashboard vs. clinical care as the engine) + try-it (trace a claim
through the RCM flow and identify which HIPAA rule applies to a breach) on
`overview.md`. Analogy (the stakeholder map as buyer/bank/seller/regulator in
a home sale) + try-it (work a HIPAA breach-notification scenario against the
800-patient/500-threshold rule) on `fundamentals.md`.

---

## Batch 4 — closing tally

- 4/4 technologies checked (Home Health Coding, Patient Documentation, BCHHC
  Prep, Healthcare Admin).
- Accuracy/tab-depth: 3/4 passed cleanly. **BCHHC Prep did not** — this
  batch's independent review (external verification against CMS guidance,
  not just internal cross-referencing) found the ROC-OASIS "24 hours"
  timing figure was wrong (corrected to 48 hours / 2 calendar days in
  `overview.md`) and the "OT can never complete OASIS" claim in
  `fundamentals.md` is outdated post-2022 CMS rule changes (flagged, not
  fixed — see BCHHC Prep section above). No duplicate H1s, no cross-domain
  contamination, no topic-sequencing regressions (unlike Coding Guidelines
  in Batch 3) in any of the 4 technologies.
- `is_beginner_ready`: 4/4 needed fixes (8 files) — the systemic gap now
  holds 12-for-12 across all four Healthcare batches, mirroring the DevOps
  audit's headline pattern exactly.
- One new accuracy defect found and fixed, one new accuracy defect found
  and flagged (both this batch, both BCHHC Prep) — no new *structural*
  (tab-sequencing) gaps.

**Flagged / Fixed / Deferred:**
- Fixed: 8 files' `is_beginner_ready` scaffolding (Home Health Coding,
  Patient Documentation, BCHHC Prep, Healthcare Admin — overview.md +
  fundamentals.md each); BCHHC Prep `overview.md`'s ROC-timing error
  (24 hours → 48 hours, both the Key Numbers bullet and the try-it).
- Flagged, deferred (new): BCHHC Prep `fundamentals.md`'s outdated
  OT-cannot-complete-OASIS claim (needs a nuanced rewrite, not a binary
  flip); the same "24 hours" ROC error in 8 other file locations outside
  this batch's scope (`bchhc-prep/{cheatsheets,interview,projects}.md`,
  `home-health-coding/{certification,cheatsheets,interview}.md`).
- Deferred (carried, still open): `medical-coding/intermediate.md`
  content-contamination (Batch 1); Coding Guidelines' `fundamentals.md`/
  `intermediate.md` topic-mismatch (Batch 3).

---

# Audit closed: final tally (all 4 batches)

- **12/12 Healthcare technologies checked**, matching the confirmed scope —
  no scope correction needed this phase (unlike the DevOps audit).
- **Accuracy/tab-depth:** 11/12 technologies passed on core factual accuracy
  as originally checked; **BCHHC Prep did not** — a later, independent
  verification pass (external checks against actual CMS guidance, not just
  internal cross-referencing) found the ROC-OASIS timing was wrong (stated
  as 24 hours, actually 48 hours per 42 CFR 484.55 — corrected in
  `overview.md`) and the "OT can never complete OASIS" claim is outdated
  since a January 2022 CMS rule change (flagged, not fixed —
  `fundamentals.md`). This is a reminder that "accuracy passed" from
  internal cross-referencing alone (does this file agree with itself and
  its siblings) is not the same claim as "verified against the actual
  external regulatory source" — the two other batches' "Clean" accuracy
  verdicts were not independently re-checked externally the way BCHHC
  Prep's now has been, so a lower-priority spot-check of external accuracy
  on the highest-stakes numeric/regulatory claims elsewhere in this academy
  (ICD-10-CM, CPT, HCPCS, Home Health Coding) is worth doing at some point,
  not assumed clean by extension.
  10/12 technologies also passed cleanly on tab-depth/sequencing. 2/12
  technologies had a real tab-content defect found and flagged: Medical
  Coding (`intermediate.md` wrong-domain/OASIS content contradicting its
  own declared 3-tab scope) and Coding Guidelines (`fundamentals.md` +
  `intermediate.md` off-topic relative to the technology's own stated
  subject). Both are open backlog items, not force-fixed, per the standing
  instruction to flag structural gaps separately.
- **`is_beginner_ready`:** 12/12 technologies needed fixes — every single
  Overview/Fundamentals pair in this academy lacked the required hook/
  analogy/diagram/try-it scaffolding before this audit. 24 files fixed total
  (12 technologies × 2 files each). This is a complete, no-exceptions repeat
  of the DevOps audit's headline finding — the systemic gap is not specific
  to DevOps content, it's a platform-wide pattern in content written before
  Standard 9 existed.
- **Dead references:** 0 found across all 12 technologies — every cross-tab
  and cross-technology reference checked resolved to real, existing content.
- **Duplicate H1s / spliced boilerplate / mid-word truncations / wrong-domain
  template leaks:** 0 found.
- **Structural gaps investigated and confirmed NOT defects (by design):**
  Medical Coding's narrower 4-tab set (explicitly declared as an
  intentional index/on-ramp on its own Overview page); BCHHC Prep's missing
  `certification.md` (redundant with Home Health Coding's own certification
  tab, which already covers BCHHC format).

**Open backlog carried forward (not fixed in this audit phase):**
1. `medical-coding/intermediate.md` — Home Health/OASIS-specific content
   contradicting the technology's own stated "3 tabs only" scope. Recommend
   either moving the content to Home Health Coding or rewriting it as
   genuine medical-coding-overview content.
2. `coding-guidelines/fundamentals.md` and `intermediate.md` — generic
   CPT/billing-101 content unrelated to the technology's own OGCR-guideline
   subject matter, breaking tab-depth sequencing between Overview and
   Advanced. Recommend a dedicated content-restructuring pass building
   genuine guideline-application content for these two tabs.
3. **RESOLVED (`ae0bf36`):** the "ROC OASIS within 24 hours" error (correct
   figure: 48 hours / 2 calendar days, per 42 CFR 484.55) — a sitewide
   search after this audit's initial fix (`bchhc-prep/overview.md` only)
   found 10 more occurrences across 9 files, all individually verified and
   corrected: `bchhc-prep/{cheatsheets,fundamentals,interview}.md`,
   `bchhc-prep/projects.md` (×2), `home-health-coding/
   {cheatsheets,interview,certification}.md`, and — a genuinely new
   finding — `security/home-health-coding/{cheatsheets,fundamentals,
   interview}.md`. That last one surfaced a previously-unnoticed **fully
   separate, live, registered copy of the Home Health Coding technology
   living under the `security` academy** (see item 5 below). Sitewide
   grep after fixing confirms zero remaining matches. Closed.
4. **RESOLVED (`a09a0db`):** the "OT can never complete OASIS" claim —
   outdated since a January 2022 CMS rule change. Corrected to the actual
   rule (OT cannot independently establish Medicare eligibility — can't be
   the sole qualifying service at SOC — but can complete the SOC OASIS
   once another discipline has already established eligibility, and can
   independently complete Discharge/Recertification OASIS) across all 6
   remaining files after `security/home-health-coding`'s deletion (item 5)
   removed 2 of the original 8 instances: `bchhc-prep/
   {fundamentals,interview,projects}.md` (projects.md ×2),
   `home-health-coding/{certification,interview}.md` (certification.md
   ×2), and `medical-coding/intermediate.md`. Each location's exact
   context (table row, prose Q&A, terse practice-question format) checked
   individually and rewritten to fit, not a blind find-replace.
   `bchhc-prep/fundamentals.md`'s try-it, which specifically tested the
   old flat rule with a 3-question scenario, was rewritten to test the
   nuance directly rather than just patching the answer key. Sitewide grep
   after fixing confirms zero remaining flat "OT cannot ... OASIS" claims.
   **Note:** `medical-coding/intermediate.md`'s OT claim is now accurate,
   but this does not resolve item 1 above (the file's broader Home
   Health/OASIS scope-contamination problem) — fixing one factual claim
   inside wrong-domain content doesn't make the content belong there. Item
   1 remains open, unaddressed by this fix, exactly as it was before.
5. **RESOLVED (`a09a0db`):** `public/content/security/home-health-coding/`
   — investigated before any action, not assumed. Git history: created as
   a generic boilerplate stub in `c838af6` ("zero 404s" sweep, 2026-06-13),
   filled with real content in `9e1e84d` ("fill all thin content files",
   2026-06-25) — a bulk pass that appears to have matched on the
   technology name without checking which academy path it wrote into.
   Content comparison: same coder-facing subject matter as
   `healthcare/home-health-coding` (including the same specific errors,
   duplicated), zero security/compliance framing. Navigation check:
   `lib/data/academies.ts`'s `security` academy (8 technologies across 3
   domains) never listed `home-health-coding` — no link, card, or nav
   entry anywhere pointed to this content; the only reference to the path
   in any source file was the registry entry itself. Confirmed orphaned,
   not a deliberate dual-academy placement — deleted (5 files, via the
   real registry generator, 5 entries dropped cleanly). Verified
   post-deletion: `app/sitemap.ts` and `app/search/page.tsx` both
   enumerate technologies from `academies.ts` (never had this entry), not
   the registry directly, so nothing could break — confirmed live (all 5
   paths now 404, the security academy page itself renders normally).

(An earlier duplicate "Batch 1 — closing tally" section that appeared after
this final tally has been removed — Batch 1's findings are already fully
covered both inline in the Batch 1 section above and in this closing
summary; keeping both was redundant, not additive.)
