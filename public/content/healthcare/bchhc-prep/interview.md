# BCHHC Interview Q&A

**Q: What are the five PDGM classification factors?**
1. Timing: Early (1st 30-day period) or Late (subsequent periods)
2. Admission source: Community or Institutional (post-hospital within 14 days)
3. Clinical grouping: 12 groups based on primary ICD-10-CM code
4. Functional level: Low/Medium/High from OASIS functional items
5. Comorbidity adjustment: None/Low/High based on secondary diagnoses

**Q: Who can complete the OASIS and who cannot?**
Can complete OASIS independently: SN (RN/LPN), PT (Physical Therapist), SLP/ST (Speech-Language Pathologist).
CANNOT complete OASIS: OT (Occupational Therapist) — OT cannot independently complete OASIS assessments.

**Q: What is the difference between SOC and ROC OASIS?**
SOC (Start of Care): First OASIS completed at the very start of a new home health episode. Must be completed within 5 calendar days of the first skilled visit. Opens the 60-day episode.
ROC (Resumption of Care): Completed when a patient who was on home health service is hospitalised and then returns home to resume care. Must be completed within 24 hours of the patient's return home.

**Q: How do you code CVA sequela in home health?**
Never code the acute stroke (I60–I63) in home health. Code the RESIDUAL DEFICITS using the I69.x sequela series. For cerebral infarction: I69.3xx. Hemiplegia left non-dominant (most common if dominance not documented): I69.354. Aphasia: I69.320. Dysphagia: I69.391. The sequela codes already imply that the stroke occurred previously.

**Q: When is 7th character A used vs D for wound codes?**
A (Initial encounter): Patient is receiving ACTIVE treatment — wound VAC in place, antibiotics prescribed for wound infection, wound undergoing surgical debridement.
D (Subsequent encounter): Routine care during normal healing — dressing changes only, cast checks, follow-up without active treatment.
Key: Wound VAC presence changes 7th character to A even if wound is healing.

**Q: Patient has HTN + CHF + CKD stage 3 + T2DM on insulin + anemia of CKD. What is the full code sequence?**
I13.0 (HTN + HF + CKD stages 1–4 combination) + I50.22 (chronic systolic CHF, if documented) + E11.22 (T2DM with diabetic CKD) + N18.3 (CKD stage 3) + D63.1 (anemia in CKD) + Z79.4 (insulin use). Never code I10 separately when I13.0 applies.

**Q: What is LUPA and how does it affect an agency?**
Low Utilization Payment Adjustment: when visits in a 30-day period fall below the minimum threshold for the clinical group, payment switches from the standard PDGM episode rate to a per-visit rate. LUPA payments are significantly lower. Thresholds vary by clinical group (2–6 visits). Agencies must ensure clinically appropriate visits meet LUPA thresholds and document necessity for each visit.

**Q: What is the NEC vs NOS distinction?**
NEC (Not Elsewhere Classified): Provider documentation IS specific, but no specific ICD-10-CM code exists for exactly that condition. The code is the best available option even though documentation is specific.
NOS (Not Otherwise Specified): Provider documentation is VAGUE or unspecified. A specific code exists but documentation doesn't support using it. Query the provider for more specificity when possible.

**Q: What homebound documentation is required?**
Must document a SPECIFIC limitation showing leaving home requires considerable effort: e.g., "patient is non-weight-bearing on left lower extremity and requires two-person assist to transfer," or "patient has severe dyspnea with minimal exertion, SpO2 drops to 88% with ambulation to bathroom." Brief absences (medical appointments, religious services, adult day care) do not negate homebound status. Generic statements ("patient is weak") are insufficient.

**Q: How do you select the primary diagnosis for PDGM?**
Primary diagnosis must: (1) directly relate to the skilled service need, (2) support homebound status, (3) be the condition the skilled service is actively treating. It is NOT necessarily the most severe diagnosis. The primary diagnosis determines the PDGM clinical group — wrong primary = wrong clinical group = wrong payment. If a wound is the reason for skilled nursing, a wound code should be primary even if diabetes is the underlying cause.

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
