# Patient Documentation Interview Q&A

**Q: What is a physician query and when is it used?**
Written or verbal communication from a coder or CDI specialist to a physician requesting clarification or additional specificity in documentation. Used when documentation is: incomplete (diagnosis not specified), ambiguous (two possible interpretations), inconsistent (different terminology across notes), or not specific enough for accurate coding.
Compliant query format: non-leading, multiple-choice offering all clinically plausible options plus "clinically undetermined." NEVER suggests a specific code, directs the physician to a specific answer, or implies a financial motive. The physician must respond based solely on clinical judgment.

**Q: Subjective vs Objective in a SOAP note?**
Subjective (S): What the patient reports — symptoms, complaints, pain descriptions, history in their own words. Cannot be independently verified by another clinician. Example: "Patient reports 3-day history of sharp chest pain, rated 7/10, worsening with deep inspiration."
Objective (O): What the clinician observes, measures, or tests. Independently verifiable. Example: "BP 142/88, HR 96, SpO2 94% on room air. Dullness to percussion right lower lobe. Decreased breath sounds at right base."

**Q: Why does documentation specificity matter for reimbursement?**
Specific documentation → specific ICD-10-CM codes → correct DRG (inpatient) or PDGM clinical group (home health) → accurate, appropriate payment. Also affects: HCC risk-score capture (value-based care contracts), HEDIS quality measures (population health programmes), accurate mortality and morbidity statistics, and regulatory compliance.
Example: "heart failure" → I50.9 (unspecified) — may not qualify as MCC. "Acute-on-chronic systolic heart failure" → I50.23 — qualifies as MCC, significantly increasing DRG weight and payment.

**Q: What is CDI and what are its benefits?**
Clinical Documentation Improvement: programme where specialists (typically nurses or certified coders with additional CDI training) review inpatient records concurrently, identify documentation gaps, and query physicians during the stay (not after discharge). Benefits: correct DRG assignment (accurate revenue), appropriate case mix index (benchmark comparisons), accurate quality measure denominators, improved HCC capture for value-based contracts, fewer post-discharge claim denials. Typical CDI programme ROI: 3:1 or better.

**Q: What are the legal requirements for medical record documentation?**
Must be: signed and dated by the responsible provider, legible (electronic or clear handwriting), accurate and complete, and timely (H&P within 24 hours, discharge summary within 30 days, death summary within 24 hours, operative report immediately post-procedure). Alterations: draw single line through error, write initials and date, write "error" — NEVER erase, use correction fluid, or obscure. Late entries: label as "Late Entry" with current date. Medical records are legal documents — admissible in court and discoverable in litigation. Cannot be altered or destroyed once legal action is anticipated.

**Q: What changed in E/M documentation guidelines in 2021?**
Prior to 2021: E/M level determined by counting documentation elements — specific number of HPI elements, review of systems items, and examination organ systems. Created extensive documentation burden unrelated to clinical care.
From 2021: E/M level based on EITHER (1) Medical Decision Making (MDM): number and complexity of problems addressed, amount and complexity of data reviewed/ordered, risk of complications — OR (2) Total clinician time on the date of encounter (including non-face-to-face work like reviewing records, communicating with team).
Result: clinicians document what is clinically relevant rather than what satisfies a checklist. Notes became more concise and clinically meaningful.

**Q: What is the difference between a History and Physical (H&P) and a progress note?**
History and Physical (H&P): Comprehensive document required within 24 hours of inpatient admission. Components: chief complaint, complete HPI, past medical/surgical/family/social history, complete review of systems, complete physical examination, and assessment and plan. Establishes the baseline and initial management direction.
Progress Note: Daily documentation of current clinical status, response to treatments, changes in plan. Briefer and focused on developments since last note. Common formats: SOAP (Subjective, Objective, Assessment, Plan) or APSO. Does not repeat stable chronic history unless relevant to current decision.

**Q: What is a late entry in medical records and how should it be documented?**
A late entry is a clinical note added to the medical record after the date of service or encounter. Required because: documentation was overlooked, additional information came to light, an error was discovered after signing. Correct procedure: clearly label as "Late Entry" at the beginning of the note. Document the current date and time of the late entry. Reference the original date of service the entry pertains to. Provide the clinical reason for the late entry. Sign with credentials. Never alter the original note or insert an undated addendum — this is fraudulent alteration of medical records.

**Q: What is the difference between Assessment and Plan in a SOAP note?**
Assessment (A): The clinician's clinical interpretation — what the patient has or is most likely to have. Includes: primary diagnosis or working diagnosis, differential diagnoses if not yet determined, disease status and progression (improving, stable, worsening), patient understanding and adherence. Should be specific — not just "hypertension" but "hypertension — uncontrolled on current regimen" or "well-controlled on lisinopril 10mg."
Plan (P): What will be DONE about the assessment. Includes: new or changed medications (drug, dose, route, frequency, duration), orders (labs, imaging, referrals), procedures performed or scheduled, patient education provided (specifically what was discussed), follow-up timing and instructions.

**Q: What is meant by 'if not documented, it wasn't done' in healthcare?**
This principle means that from a legal, billing, and quality perspective, clinical observations, assessments, interventions, and outcomes must be documented in the medical record to be considered to have occurred. An undocumented service: cannot be billed to insurance, cannot be defended in a malpractice case as having been performed, does not count toward quality measures or regulatory compliance. This is why documentation must be timely, complete, and specific. Conversely, documentation also protects clinicians — a well-documented rationale for a clinical decision is the primary defence in adverse outcome cases.

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
