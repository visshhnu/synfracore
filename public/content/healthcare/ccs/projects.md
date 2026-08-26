# CCS — Portfolio Projects

Build coded work spanning both inpatient and outpatient scenarios — the dual-setting fluency CCS certifies, not just PCS mechanics in isolation.

## Project 1: ICD-10-PCS Code-Building Practice Set

**Level:** Beginner | **Time:** 2-3 days

Build 10-15 complete 7-character PCS codes from realistic inpatient operative notes, working position by position (Section → Body System → Root Operation → Body Part → Approach → Device → Qualifier) rather than pattern-matching to a code you half-remember.

### Steps

1. Collect or write 10-15 inpatient operative notes spanning at least 4 different root operations (e.g. Excision, Resection, Insertion, Extirpation)
2. For each note, identify the root operation FIRST using this course's distinguishing-question method, before looking at any table
3. Build the full 7-character code position by position, writing a one-line justification for each position's value
4. Deliberately include at least 2 notes with a confusable root-operation pair (e.g. a case that could be mistaken for Excision but is actually Extirpation) and document why you ruled out the wrong option

### Skills Demonstrated

- Root operation identification from documentation, not procedure name
- Position-by-position PCS code construction
- Recognizing and resolving confusable root-operation pairs

### Note

**Verify every constructed code's actual character values against current official ICD-10-PCS tables/code books** before treating any specific code as production-accurate — this project builds the construction process, which is stable, but exact table values should always be checked against the current-year code set.

---

## Project 2: Inpatient Principal Diagnosis & POA Practice Set

**Level:** Intermediate | **Time:** 2-3 days

Work through 8-10 inpatient case scenarios, each requiring you to (a) determine the UHDDS principal diagnosis, (b) assign POA indicators to every diagnosis coded, and (c) identify any secondary diagnosis that plausibly qualifies as a CC/MCC.

### Steps

1. Write or collect 8-10 realistic inpatient case summaries, including at least 3 where the admitting diagnosis differs from the diagnosis established "after study"
2. For each, state the principal diagnosis and justify it using the UHDDS definition (not just naming a diagnosis)
3. Assign a POA indicator to every diagnosis in the case, with a one-line justification per indicator
4. Flag any secondary diagnosis you believe plausibly affects DRG tier as a CC/MCC, and note that this needs verification against current CC/MCC lists rather than treating your own judgment as final

### Skills Demonstrated

- UHDDS principal diagnosis selection under the "after study" standard
- POA indicator assignment and justification
- CC/MCC awareness and its connection to DRG impact

### Note

**Verify current CC/MCC qualifying-condition lists against current CMS MS-DRG documentation** before treating a specific secondary diagnosis's CC/MCC status as confirmed — this list is revised periodically.

---

## Project 3: Combined Inpatient/Outpatient Coding Audit

**Level:** Advanced | **Time:** 1 week

The centerpiece CCS-track project: a mixed set of encounters spanning both settings, requiring you to first correctly recognize which setting each encounter belongs to before selecting the right code set at all.

### Steps

1. Assemble 15-20 encounters — a genuine mix of inpatient stays and outpatient facility encounters (not a purely inpatient set)
2. For each encounter, FIRST state which setting it is and which code set(s) apply (ICD-10-PCS for inpatient procedures, CPT/HCPCS for outpatient) before coding anything
3. Fully code each encounter: diagnosis codes (with correct sequencing logic for that setting) and procedure codes
4. For the inpatient subset, additionally assign POA indicators and identify the principal diagnosis/principal procedure
5. Self-audit a week later: re-review your setting-recognition calls specifically, since a wrong setting call invalidates the whole code set choice, not just one code

### Skills Demonstrated

- Setting recognition as a distinct, prerequisite coding skill
- Dual code-set fluency (ICD-10-PCS + CPT/HCPCS) within one portfolio
- Inpatient-specific sequencing and POA assignment at scale

### Portfolio Artifact Name

`ccs-inpatient-outpatient-audit`

---

## Tips for Great Projects

**Identify the setting before you code anything.** A wrong setting call (treating an inpatient stay as outpatient, or vice versa) means the wrong code set entirely — catch this before selecting any individual code, not after.

**Identify the root operation before opening a PCS table.** Guessing a code from a table without first committing to a root operation from the documentation is backward — the root operation should come from what the documentation says was done, then the table confirms the remaining positions.

**Justify principal diagnosis with the UHDDS definition, not intuition.** "This seems like the main problem" isn't the same reasoning as "this is what was established after study to be chiefly responsible for the admission" — practice writing the formal justification every time.

**Flag CC/MCC and PCS character-value claims for verification, don't assert them as final.** Both are revised periodically by CMS — treating your own project work as a source of truth for a live coding job is a real compliance risk.

## Portfolio Checklist

- [ ] At least 10 fully constructed 7-character PCS codes with position-by-position justification
- [ ] At least 1 project demonstrating correct setting recognition across a mixed inpatient/outpatient case set
- [ ] At least 1 project demonstrating UHDDS principal diagnosis selection with "after study" reasoning
- [ ] POA indicators assigned and justified across multiple inpatient cases
- [ ] Any PCS character value or CC/MCC claim checked against current CMS guidance before treating it as final

