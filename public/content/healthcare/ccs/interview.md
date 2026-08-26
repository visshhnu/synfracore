# CCS Interview Questions

**Q: What's the difference between CPT and ICD-10-PCS, and why does an inpatient coder need both?**
A: CPT describes procedures in outpatient/physician-office settings; ICD-10-PCS describes procedures exclusively in the inpatient hospital setting. They're structurally unrelated code sets — CPT is 5-digit numeric with a category/index-lookup model, PCS is always exactly 7 alphanumeric characters built position-by-position from tables. A CCS-level coder needs both because a hospital bills outpatient encounters in CPT and inpatient stays in PCS — the setting determines which code set applies, not personal preference or familiarity.

**Q: Walk through how you'd identify the root operation for a documented procedure.**
A: Start from what the physician's documentation says was actually accomplished — not the everyday name of the procedure. Ask the distinguishing questions: was a portion of the body part removed, or all of it (Excision vs. Resection)? Was something taken physically out, or destroyed in place (Excision vs. Destruction)? Is what's being removed the body part itself, or abnormal material like a clot or stone (Excision vs. Extirpation)? Root operations are defined precisely enough that guessing from a procedure's common name is a common source of coding errors.

**Q: What is the UHDDS definition of principal diagnosis, and why does "after study" matter?**
A: The condition established after study to be chiefly responsible for occasioning the admission. "After study" means the principal diagnosis is determined using everything known by the end of the stay — not locked in from the admitting diagnosis on day one. A patient admitted for "chest pain" who's ultimately diagnosed with a myocardial infarction is coded with the MI as principal diagnosis, since that's what was established after study, even though "chest pain" was the reason documented at admission.

**Q: What is a POA indicator and why does it matter beyond documentation completeness?**
A: Present on Admission indicator — reports whether a diagnosis was present when the patient was admitted (Y), developed during the stay (N), or couldn't be clinically determined (U/W). It matters financially because CMS uses POA data to identify hospital-acquired conditions, which can affect DRG payment — a complication that developed during the stay (POA=N) may be treated differently in reimbursement than a condition that was already present on arrival.

**Q: How does a CC or MCC affect DRG assignment?**
A: A Complication/Comorbidity (CC) or Major CC (MCC) coded as a secondary diagnosis can move a stay into a higher-paying DRG tier, reflecting genuinely higher resource intensity in treating that patient. This is why complete, accurate secondary-diagnosis capture matters financially in inpatient coding, not just for clinical-picture completeness — an undercoded chart can under-represent real complexity and under-reimburse the hospital for care actually provided.

**Q: A physician's note is ambiguous about whether a condition was present on admission. What do you do?**
A: Query the physician rather than guessing or defaulting to a specific POA value. Provider Queries is one of AHIMA's own five CCS exam domains specifically because recognizing insufficient documentation and generating a compliant query — rather than assuming — is core to accurate, defensible inpatient coding.

**Q: What's the difference between Insertion and Replacement as root operations?**
A: Both involve putting something into the body, but Insertion's device adds a monitoring/assisting/performing/preventing function WITHOUT taking the place of a body part (e.g. a pacemaker lead). Replacement's device physically takes the place of all or a portion of a body part (e.g. a hip prosthesis replacing the joint). The test is whether the device is replacing tissue/structure or simply adding a function alongside existing tissue.

**Q: Why is Repair considered PCS's "fallback" root operation?**
A: Repair is defined as restoring a body part to normal structure/function by a method not elsewhere classified — meaning if a more specific root operation (Replacement, Reposition, Excision, etc.) actually describes what was done, that more specific root operation should be used instead of Repair. Reaching for Repair by default, without checking whether a more specific root operation applies, is a common coding error.

## Skills Employers Value at CCS Level

```
SETTING RECOGNITION: correctly identifying inpatient vs. outpatient
  before selecting a code set at all — a prerequisite skill CPC-level
  coding doesn't require, since outpatient coders work in one setting
DUAL CODE-SET FLUENCY: comfortable in both ICD-10-PCS (inpatient) and
  CPT/HCPCS (outpatient facility) without conflating the two
DRG AWARENESS: understanding how sequencing/CC-MCC decisions affect
  hospital reimbursement, not just individual claim accuracy
QUERY DISCIPLINE: recognizing ambiguous documentation and generating
  compliant physician queries rather than defaulting/guessing
SALARY: CCS-credentialed inpatient coders generally command higher
  compensation than CPC-only outpatient coders, reflecting the added
  code-set and sequencing complexity `(needs verification — recheck
  current salary bands against current AHIMA/industry salary survey
  data before citing a specific figure)`
```
