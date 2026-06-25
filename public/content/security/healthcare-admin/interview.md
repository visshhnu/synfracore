# Healthcare Administration Interview Q&A

**Q: What is the revenue cycle?**
End-to-end financial process from patient registration through final payment. Key stages: patient registration → insurance verification → service delivery → charge capture → medical coding → claim submission (electronic 837) → payment posting (835 remittance) → denial management → appeals → patient collections. RCM efficiency directly determines financial sustainability. Benchmark metrics: >95% clean claim rate, <50 days in AR.

**Q: Medicare Part A vs Part B?**
Part A: Hospital insurance. Inpatient stays, SNF care (post-hospitalization), hospice, home health. Funded by payroll taxes during working years. No premium for most beneficiaries with 40+ quarters worked. Deductible per benefit period.
Part B: Medical insurance. Physician services, outpatient procedures, preventive care, DME. Requires voluntary enrollment with monthly premium (~$174/month 2024). 80/20 coinsurance after annual deductible. Nearly universally enrolled because the alternative is no coverage for outpatient care.

**Q: What is a DRG?**
Diagnosis Related Group: CMS inpatient payment classification grouping hospitalizations with similar clinical characteristics and resource requirements. Hospital receives a flat payment per DRG = base rate × DRG weight × wage index. If actual cost < payment: profit; if > payment: loss. Accurate coding of CCs and MCCs directly affects the DRG weight and therefore appropriate payment. Incentivizes efficiency — discharge early when safe.

**Q: What is HIPAA and what are the penalties?**
Health Insurance Portability and Accountability Act. Key rules: Privacy (PHI protection, patient rights, minimum necessary), Security (ePHI safeguards — administrative, physical, technical), Breach Notification (patients + HHS within 60 days), Transactions (ANSI X12 EDI standards).
Civil penalties: $100–$50,000 per violation, up to $1.9M per category per year.
Criminal penalties: willful violations with data sale/transfer — up to $250,000 and 10 years imprisonment.

**Q: Anti-Kickback Statute vs Stark Law?**
Anti-Kickback Statute: Criminal law. Prohibits offering/paying/soliciting/receiving anything of value to induce federal programme referrals. Requires INTENT to violate. Safe harbours available (employment, personal services contracts, group purchasing).
Stark Law: Civil law. Strict liability — no intent required. Prohibits physician from referring Medicare/Medicaid patients to entities in which physician or immediate family has a financial relationship for designated health services. Exceptions (not safe harbours) must be met exactly — partial compliance = violation.

**Q: What is the False Claims Act?**
Federal statute prohibiting knowingly submitting false or fraudulent claims to government healthcare programs. Penalties: 3× actual damages + $13,946–$27,894 per false claim (2023). Qui tam provisions allow whistleblowers (relators) to file on behalf of the government and receive 15-30% of recovery. Healthcare is the largest FCA enforcement area. Every healthcare organization needs a compliance program: policies, training, hotline, auditing, disciplinary standards, and prompt corrective action.

**Q: What is case mix index and why does it matter?**
Case Mix Index (CMI) = the average DRG relative weight across all inpatient discharges for a hospital or time period. Higher CMI = more complex or resource-intensive patients on average. CMI is used for: benchmarking hospitals against peers, adjusting expected costs and resource needs, evaluating appropriateness of coding practices, and financial planning. A sudden drop in CMI may indicate under-coding of complications; a sudden rise may trigger payer audits.

**Q: What is clinical documentation improvement and its impact?**
CDI: programme where specialists review inpatient records concurrently, identify documentation gaps, and query physicians to improve specificity and accuracy. Impact on hospitals: more accurate DRG assignment (correct DRG weight = correct payment), improved case mix index, better quality metric denominators, reduced post-discharge queries and denial rates, improved HCC capture for value-based contracts. CDI specialists are typically registered nurses with CDI certification (CCDS or CDIP). Well-run CDI programmes generate 3:1 or better ROI.

**Q: What is a local coverage determination (LCD)?**
An LCD is a decision by a Medicare Administrative Contractor (MAC) regarding whether a particular service is covered in its jurisdiction based on it being reasonable and necessary. LCDs specify: covered diagnoses (ICD-10-CM codes), covered indications, documentation requirements, and billing instructions. LCDs are binding for claims submitted to that MAC's jurisdiction. National Coverage Determinations (NCDs) are issued by CMS centrally and override LCDs. Providers must check applicable LCDs before billing to understand coverage conditions and required documentation.

**Q: What is value-based care and how does it differ from fee-for-service?**
Fee-for-service (FFS): provider paid for each service delivered — more volume = more revenue. No direct incentive for quality or efficiency. Can lead to overutilisation.
Value-based care (VBC): provider paid based on patient outcomes and quality metrics rather than volume. Types: Pay-for-Performance (P4P — bonus for quality metrics), Shared Savings (ACO model — share savings if costs below benchmark with quality thresholds), Bundled Payments (single payment for an episode of care), Capitation (fixed PMPM regardless of services used). VBC goals: improve quality, reduce costs, enhance patient experience (Triple Aim). Challenge: measuring outcomes fairly, accounting for social determinants, and clinical complexity differences.

**Q: What are the components of an effective compliance programme?**
OIG identified seven essential elements: (1) Written policies and procedures addressing compliance risk areas; (2) Designated Compliance Officer and Committee; (3) Effective training and education for all staff; (4) Effective lines of communication (anonymous hotline); (5) Auditing and monitoring (proactive risk assessment); (6) Disciplinary standards consistently enforced; (7) Prompt response to detected offences including self-disclosure when appropriate. Compliance programme demonstrates good faith — mitigates risk of False Claims Act liability and OIG exclusion. Must be a living programme, not just a policy binder.

**Q: What is the difference between in-network and out-of-network providers?**
In-network: providers who have contracted with a health insurance plan to provide services at negotiated (discounted) rates. The plan pays a larger share of costs for in-network care. Out-of-pocket costs (deductibles, co-pays, co-insurance) are lower.
Out-of-network: providers without a contract with the plan. Plans typically pay less or nothing for out-of-network care. Patient faces higher out-of-pocket costs. HMO plans: generally no coverage for out-of-network except emergencies. PPO plans: cover out-of-network at lower rate. The No Surprises Act (2022, USA): protects patients from surprise out-of-network bills for emergency services and certain non-emergency services at in-network facilities.

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
