# HCPCS Level II Interview Q&A

**Q: What is the difference between HCPCS Level I and Level II?**
Level I = CPT codes, maintained by the AMA, 5-digit numeric codes, covers physician procedures and most outpatient services, updated annually January 1.
Level II = CMS-maintained, letter + 4 digits, covers DME, injectable drugs, ambulance, orthotics, prosthetics, and non-physician services not covered by CPT. Drug codes updated quarterly; others updated annually January 1.

**Q: When do you use a J code?**
For drugs administered by injection or infusion that are generally not self-administered at home. Steps: identify the drug and total ordered dose → find the correct J code → calculate units (total dose ÷ dose per J code unit) → bill J code + drug administration CPT code (96372 for IM/SQ, 96374 for IV push, 96365 for therapeutic IV infusion). Always verify the J code is valid for the date of service as drug codes update quarterly.

**Q: What is a Certificate of Medical Necessity (CMN)?**
CMS-required document signed by the ordering physician certifying that a specific DME item meets Medicare coverage criteria for that specific patient. Required for: oxygen, power wheelchairs, hospital beds, CPAP/BiPAP, enteral nutrition, pneumatic compression devices. Must be signed by physician (not NP/PA in most cases). Cannot be backdated. No valid CMN = no Medicare payment regardless of medical need.

**Q: What four criteria must DME meet for Medicare coverage?**
1. Medically necessary — ordered by physician for a medical condition
2. Used in the home — patient's residence (not hospital or SNF)
3. Serves a medical purpose — not primarily comfort or convenience
4. Durable — withstands repeated use, generally expected to last 3+ years
ALL four must be simultaneously satisfied.

**Q: What does the KX modifier mean?**
Appended to HCPCS codes to confirm that requirements in a Local Coverage Determination (LCD) have been met and that documentation is on file. Tells Medicare the provider has clinical evidence supporting medical necessity per the specific coverage policy. Required for certain DME and procedures; without it, the claim automatically denies.

**Q: How are ambulance services coded in HCPCS?**
Use A0427-A0431 based on level of care (BLS, ALS-1, ALS-2, fixed-wing, rotary-wing). Add a 2-letter origin-destination modifier: first letter = origin, second = destination. Key letters: R = Residence, H = Hospital, N = SNF, S = Scene, G = Hospital-based dialysis centre. Also bill mileage code A0425 when applicable. Documentation must justify medical necessity of ambulance vs other transport options.

**Q: What is the difference between a covered service and a non-covered service in Medicare?**
Covered service: meets Medicare's statutory, regulatory, and local coverage determination (LCD) criteria — Medicare will pay its share (usually 80% after deductible for Part B). Non-covered service: excluded by statute (services not defined as Medicare benefits), or not medically reasonable and necessary for this patient. For non-covered services: use HCPCS modifier -GY (statutorily excluded) or -GZ (expected to be denied as not reasonable/necessary). Patient must be informed in advance via an Advance Beneficiary Notice (ABN) if service is expected to be denied so they can agree to pay out of pocket.

**Q: What is an ABN (Advance Beneficiary Notice) and when is it required?**
Advance Beneficiary Notice of Non-Coverage: standard CMS form (CMS-R-131) given to Medicare beneficiaries BEFORE providing a service that Medicare may not cover. Required when: the provider believes Medicare will not pay because the service is not reasonable or necessary, or may not be a covered benefit for this patient. Patient has three options: receive the service and agree to pay if Medicare denies, receive the service but ask Medicare to make a formal denial, or choose not to receive the service. Without ABN: provider cannot bill the patient if Medicare denies — they must write off the amount.

**Q: What is the difference between HCPCS modifiers and CPT modifiers?**
Both are 2-character alphanumeric codes appended to procedure codes to provide additional information without changing the code's definition.
CPT modifiers: two digits (25, 26, 51, 59, etc.) — standardised nationally by AMA, same meaning across all payers.
HCPCS Level II modifiers: one or two letters (KX, GY, LT, RT, GA, etc.) — maintained by CMS; many are Medicare-specific but some are accepted by other payers. Both types can be used on the same claim line when needed. Payer policies determine which modifiers are accepted — always verify before appending.

**Q: How does the DMEPOS competitive bidding programme work?**
CMS implemented competitive bidding for certain DME, prosthetics, orthotics, and supplies (DMEPOS) to establish Medicare payment amounts based on market competition rather than fee schedules. In competitive bidding areas (CBAs): suppliers submit sealed bids; CMS selects winning bidders (those meeting quality standards below bid threshold); only winning contract suppliers can supply these items to Medicare beneficiaries in that area; payment amounts set based on winning bids (typically 30-40% below previous fee schedule). Currently applies to items like oxygen, CPAP, hospital beds, walkers, and some diabetes supplies. Non-contract suppliers cannot bill Medicare in CBAs for competitive bidding items.

**Q: What is the Durable Medical Equipment Medicare Administrative Contractor (DME MAC)?**
Four specialised Medicare Administrative Contractors handle all DME, prosthetics, orthotics, and supply claims nationwide (unlike regular MACs which handle geographic areas). The four DME MACs: Jurisdiction A (Northeast), Jurisdiction B (Midwest), Jurisdiction C (South), Jurisdiction D (West and Pacific). DME MACs: process DME claims, develop and issue Local Coverage Determinations (LCDs) for DME items, conduct medical review audits, handle appeals, and provide education to DME suppliers. Suppliers must enrol with the DME MAC corresponding to their physical location, but can bill any DME MAC depending on where the beneficiary resides.

**Q: What is a National Coverage Determination (NCD) vs Local Coverage Determination (LCD)?**
National Coverage Determination (NCD): Coverage decision made by CMS centrally; applies to all Medicare Administrative Contractors (MACs) and beneficiaries nationally; addresses whether a service is covered under Medicare and under what conditions; binding on all MACs. Examples: coverage for bariatric surgery, cochlear implants, diabetes self-management training.
Local Coverage Determination (LCD): Coverage decision made by an individual MAC for its geographic jurisdiction; addresses medical necessity criteria, covered diagnoses, documentation requirements for services not addressed by an NCD; does NOT apply outside that MAC's jurisdiction. When both an NCD and LCD exist for the same service: the NCD takes precedence. Providers must check BOTH NCDs and applicable LCDs before billing.

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
