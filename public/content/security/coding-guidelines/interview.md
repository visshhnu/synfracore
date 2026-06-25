# Coding Guidelines Interview Q&A

**Q: What is the difference between Excludes1 and Excludes2?**
Excludes1 = "NOT coded here" — mutually exclusive conditions that cannot be coded together at the same encounter. Only one applies. Example: J44.9 COPD Excludes1 J42 chronic bronchitis — code only one.
Excludes2 = "Not included here" — separate conditions that CAN coexist. Code both when both are present. Example: F02 dementia Excludes2 F01 vascular dementia — code both if patient has both.
Memory aid: Excludes1 = one or the other. Excludes2 = two can coexist.

**Q: When can you code a probable or suspected diagnosis?**
INPATIENT ONLY: per UHDDS guidelines, may code probable, suspected, likely, possible, consistent with, compatible with diagnoses as if confirmed.
OUTPATIENT: NEVER. Code the documented sign or symptom instead. This is the most commonly tested coding distinction.

**Q: What is the principal diagnosis?**
Condition established AFTER STUDY to be chiefly responsible for the hospital admission. Determined after all workup — labs, imaging, consults. Not the admitting diagnosis necessarily. Outpatient equivalent: first-listed diagnosis = reason for the visit.

**Q: NEC vs NOS — explain with examples.**
NEC (Not Elsewhere Classified): Documentation is specific but no specific code captures it. Example: Chemo-induced anemia → D64.81 (specific situation, no better code exists).
NOS (Not Otherwise Specified): Documentation is vague. Specific codes exist but documentation doesn't support using them. Example: "Pneumonia" without organism → J18.9 (unspecified).

**Q: What does POA indicator 'N' mean?**
Not Present on Admission — the condition developed AFTER the patient was admitted. CMS uses 'N' to identify Hospital-Acquired Conditions (HACs). HACs may trigger non-payment or reduced payment. Accurate POA reporting is mandatory on inpatient claims.

**Q: What is the "code first" instruction?**
Appears in Tabular List above certain codes — indicates the underlying condition must be sequenced BEFORE that manifestation code. Mandatory sequencing even if the manifestation seems clinically more important. Example: Diabetic neuropathy — code E11.40 (DM) before G63 (polyneuropathy).

**Q: Steps for correct ICD-10-CM code assignment?**
1. Identify main term from clinical documentation
2. Look up in Alphabetic Index → tentative code
3. NEVER assign code from Index alone — verify in Tabular List
4. Read all notes: Includes, Excludes1/2, Use additional, Code first, 7th character
5. Select most specific code documentation supports
6. Apply sequencing rules per setting (inpatient vs outpatient)
7. Assign all required additional codes (laterality, POA, external cause)

**Q: What is a combination code and when should it be used?**
A single ICD-10-CM code that classifies two diagnoses, a diagnosis with an associated complication, or a diagnosis with an associated sign or symptom. When a combination code exists and accurately describes the patient's condition, it MUST be used — you cannot use two separate codes. Examples: E11.22 (type 2 DM with chronic kidney disease), I13.0 (HTN with heart failure and CKD stages 1-4), K57.30 (diverticulosis of large intestine without perforation or abscess without bleeding). Using separate codes when a combination code exists is a coding error.

**Q: What is sequela coding and how does it differ from current condition coding?**
A sequela is a late effect — a condition that arises as a direct result of a prior injury or illness after the acute phase has resolved. Sequela codes use 7th character S. The sequela code is listed FIRST (the residual condition), followed by the cause code with 7th character S. Example: Patient has muscle weakness following a prior CVA → I69.351 (hemiplegia following cerebral infarction) is coded — not the acute stroke code (I63.-). The sequela code already identifies the cause. Do NOT add both the sequela and the current acute condition codes unless the acute condition has returned.

**Q: What is the difference between a primary and secondary diagnosis?**
Primary/principal diagnosis (inpatient): Condition established after study to be chiefly responsible for the admission. The FIRST diagnosis listed on the claim. Determines the DRG.
First-listed diagnosis (outpatient): Primary reason for the encounter — what brought the patient in. The first ICD-10-CM code on the claim.
Secondary/additional diagnoses: Coexisting conditions that affect the patient's care during the encounter — additional monitoring, treatment, or nursing care. Also includes complications. Should be coded when they affect clinical management, not merely documented. In inpatient: conditions that add CC or MCC status improve appropriate DRG reimbursement.

## Interview Q&A

**Q: What is the core problem this technology solves?**
Frame your answer around the specific pain point: what was broken or missing before this tool existed, how it addresses that gap, and what the alternatives are. The best engineers understand why, not just how.

**Q: How does this behave under failure conditions?**
Discuss: graceful degradation, circuit breakers, retry logic, timeouts, and fallback strategies. What happens when a dependency is slow? When it is down entirely? When the network partitions? Production is defined by edge cases.

**Q: What are the security considerations?**
Authentication (who are you?), authorisation (what can you do?), encryption (data in transit and at rest), audit logging (what did you do?), secret management (passwords/keys never in code), and network isolation (who can reach this?).

**Q: How would you monitor this in production?**
Three pillars: Metrics (Prometheus/Datadog — RED: Rate, Errors, Duration), Logs (structured JSON, centrally aggregated), Traces (distributed context for multi-service flows). Define your SLO first, then build alerting to protect it.

**Q: How does this scale?**
Horizontal scaling (more instances), vertical scaling (bigger instances), sharding/partitioning (splitting data), and caching (reducing repeated work). What is the bottleneck? Stateless services scale easily; stateful services require careful partitioning strategy.

**Q: Walk me through your debugging process when something is wrong.**
1. Check the current state and error messages. 2. Check logs around the time of failure. 3. Check recent changes (deployments, config changes). 4. Check resource utilisation (CPU, memory, disk, connections). 5. Isolate the component. 6. Reproduce in a lower environment. 7. Fix and verify.

**Q: What is your deployment strategy for changes?**
Never deploy big bang to production. Blue-green (instant rollback), canary (gradual traffic shift), or rolling (phased instance replacement). All require automated rollback triggers based on error rate metrics. Feature flags for long-running changes.

**Q: How do you handle configuration across environments?**
Environment variables for runtime config, secrets manager (Vault, AWS Secrets Manager) for sensitive values, config maps for non-sensitive structured config. Never commit secrets to git. Validate config at startup — fail fast rather than fail mysteriously later.
