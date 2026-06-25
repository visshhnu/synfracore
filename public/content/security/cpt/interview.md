# CPT Interview Q&A

**Q: What is the difference between new and established patient?**
New patient: Has NOT received face-to-face professional services from the physician or any physician of the SAME SPECIALTY in the SAME GROUP PRACTICE within the past 3 YEARS.
Established patient: HAS received such services within 3 years.
On-call coverage by same specialty/same group = use established patient code.

**Q: What is the global surgical period?**
Post-surgery time window during which related follow-up care is bundled into the surgical fee. 90-day (major surgery), 10-day (minor procedures), 0-day (some endoscopy/biopsy). Pre-op day included. All routine related follow-up visits included. Unrelated services during global period: use modifier -24 (unrelated E/M) or -79 (unrelated procedure).

**Q: When do you use modifier -25?**
When a SIGNIFICANT, SEPARATELY IDENTIFIABLE E/M service is performed on the SAME DAY as a procedure by the SAME physician. The E/M must address a separate problem beyond the normal pre/post care. Must document separate medical decision making. Without -25, payer bundles the E/M into the procedure payment.

**Q: What are Category III CPT codes?**
Temporary alphanumeric codes (4 digits + T) for emerging technologies and services not yet in Category I. Allow tracking utilization. NOT universally covered — check LCDs. Reviewed approximately every 5 years for promotion to Category I or deletion if insufficient utilization.

**Q: What is unbundling and why is it a compliance risk?**
Billing separate CPT codes for components of a single procedure that should be billed as one comprehensive code. Violates NCCI edits. Results in overpayment → mandatory refund. Intentional unbundling = False Claims Act violation with potential criminal liability.

**Q: How is critical care coded?**
99291: First 30-74 minutes of critical care on a given calendar date (cannot bill if <30 minutes total).
99292: Each additional 30 minutes (add-on code).
Bundled — cannot separately bill: CPR, intubation, central line, arterial line, cardioversion, temporary pacing.
Patient must be critically ill requiring high-complexity MDM and direct physician involvement.

**Q: Modifier -26 vs -TC?**
-26 = Professional component only: physician interpretation and report (radiologist reading films at hospital).
-TC = Technical component only: equipment, staff, facility costs (hospital billing for imaging equipment).
Global code (no modifier): both components together (private office owning equipment and employing radiologist).

**Q: What is the difference between a consultation and a referral?**
Consultation (historical CPT codes 99241-99255 — currently inactivated for Medicare): physician sees patient at REQUEST of another physician for an OPINION; consultant communicates back to requesting physician; patient may or may not be managed by the consultant. Medicare eliminated consultation codes in 2010 — use appropriate E/M codes instead for Medicare patients.
Referral: physician sends patient to another provider for ongoing MANAGEMENT of a condition; referring physician transfers care (or part of care) rather than requesting an opinion. For Medicare: use new or established patient E/M codes based on whether patient is new to that specialist.

**Q: What is the difference between a procedure code and a supply code?**
CPT procedure codes (Level I HCPCS): describe physician work — cognitive services (E/M), surgical procedures, radiology, lab, and other services performed.
HCPCS Level II supply codes: describe supplies, equipment, and drugs — what is USED rather than what is DONE. Example: sutures used during wound repair are a supply (HCPCS A6xxx); the wound repair itself is a CPT procedure code (12001-13160). Both may be billed on the same claim when both are separately chargeable and not bundled.

**Q: How do you code an office visit when the physician spends most of the time counselling?**
When more than 50% of the total face-to-face time was spent in counselling and/or coordination of care, TIME can be the determining factor for E/M level (2020 and earlier guidelines). Under 2021 guidelines, TOTAL TIME on the date of the encounter determines level — including non-face-to-face time. Document the total time spent, what was discussed in counselling (specific topics and education provided), and the decisions made. The time-based approach is particularly useful for complex psychosocial discussions, end-of-life planning conversations, or complex medication management discussions.

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
