# UPSC Prelims Interview Q&A

## Polity

**Q: Fundamental Rights vs Directive Principles — key difference?**
Fundamental Rights (Part III, Articles 12-35): Justiciable — enforceable in courts; individuals can approach courts if violated; negative obligations on the state (prohibit certain actions).
Directive Principles of State Policy (Part IV, Articles 36-51): Non-justiciable — cannot be enforced in courts; positive obligations on the state (what it SHOULD do); guide legislation and policy. However, DPSP can serve as valid basis to impose reasonable restrictions on Fundamental Rights (Article 31C). Both must be read harmoniously.

**Q: What are the three types of constitutional emergencies?**
Article 352 — National Emergency: Proclamation by President on Cabinet's written recommendation when security of India is threatened by war, external aggression, or armed rebellion. FRs (except Arts 20, 21) may be suspended. Parliamentary control necessary.
Article 356 — President's Rule (State Emergency): When constitutional machinery fails in a state — state government dismissed, state legislature suspended or dissolved, President governs through Governor.
Article 360 — Financial Emergency: When financial stability of India or any state is threatened. Financial authority of states placed under Centre's direction. Never proclaimed so far.

**Q: What is the basic structure doctrine?**
Established in Kesavananda Bharati v. State of Kerala (1973, 13-judge bench). Parliament's amending power under Article 368 cannot be used to alter the "basic structure" of the Constitution. Basic structure includes: supremacy of the Constitution, republican and democratic form, separation of powers, federal character, judicial review, secularism, fundamental rights. The Supreme Court can strike down constitutional amendments that destroy basic structure.

## Geography

**Q: What is the Western Disturbance and why is it important?**
Extratropical cyclones originating in the Mediterranean Sea; travel eastward along the subtropical jet stream. Bring non-monsoon winter rainfall to north and northwest India (Punjab, Haryana, J&K, HP, western UP). Critical for Rabi crop cultivation — especially wheat. Bring snowfall to Himalayas (important for glacier health and river flows). Peak activity: December to February.

**Q: Tropical Evergreen vs Tropical Deciduous forests?**
Tropical Evergreen (Rainforests): Rainfall >200 cm annually, no distinct dry season, trees don't shed leaves simultaneously (remain green year-round), dense multi-layered canopy, maximum biodiversity. Found in Western Ghats, Andaman/Nicobar, Northeast India. Species: ebony, mahogany, rosewood.
Tropical Deciduous (Monsoon forests): Rainfall 70-200 cm, distinct hot dry season, trees shed leaves during dry season (water conservation), more open canopy. MOST WIDESPREAD forest type in India. Species: teak (moist deciduous), sal (dry deciduous). Provides most commercial timber.

## Economy and Environment

**Q: What is the Repo Rate and how does it control inflation?**
Repo rate: the rate at which the Reserve Bank of India (RBI) lends short-term funds to commercial banks against government securities as collateral. Higher repo rate → more expensive for banks to borrow from RBI → banks raise their lending rates → consumers and businesses borrow less → spending decreases → demand-pull inflation reduces. Current repo rate (2024): 6.5%. Set by the Monetary Policy Committee (MPC) with 3 RBI members + 3 government-appointed external members.

**Q: What is fiscal deficit and why does it matter?**
Fiscal deficit = Total government expenditure − Total government receipts (excluding borrowings). Represents the government's total borrowing requirement. Expressed as % of GDP. India's FY2024 target: 5.1% of GDP; medium-term target: 4.5% of GDP. High fiscal deficit concerns: inflationary pressure (government borrowing crowds out private investment by reducing available credit), increases public debt (future interest burden), can pressure credit ratings (borrowing costs increase), may weaken currency. Governed by the Fiscal Responsibility and Budget Management (FRBM) Act.

**Q: What is judicial review in the Indian context?**
Power of the Supreme Court and High Courts to examine the constitutional validity of legislative and executive acts. If found inconsistent with the Constitution, the act is declared ultra vires (null and void). Constitutional basis: Article 13 (laws inconsistent with FRs are void), Article 32 (SC can enforce FRs), Article 226 (HC can issue writs). Scope expanded by Basic Structure Doctrine — courts can review even constitutional amendments. India's judicial review is narrower than the USA (India follows parliamentary sovereignty except for constitutional violations) but broader than the UK's historically deferential approach.

**Q: What is the Rajya Sabha's special powers?**
Rajya Sabha (Council of States) represents states and UTs. Special powers not available to Lok Sabha: Article 249 — can authorize Parliament to legislate on State List subjects for national interest (by 2/3rd resolution); Article 312 — can create new All India Services (by 2/3rd resolution); cannot be dissolved (6-year terms, 1/3rd retire every 2 years). Money bills CANNOT originate in Rajya Sabha. In joint sitting: Rajya Sabha is outnumbered by Lok Sabha (550:250). Original jurisdiction: cannot present no-confidence motion against government (only Lok Sabha can).

**Q: What is the role of the Finance Commission?**
Constitutional body established under Article 280; appointed every 5 years by the President. Functions: recommend distribution of net proceeds of taxes between Centre and states (vertical devolution), allocation among states (horizontal distribution), grants-in-aid to states, and measures to improve state finances. 15th Finance Commission (2021-26) devolved 41% of divisible pool taxes to states. Key principles used: population, area, income distance, demographic performance, forest cover. Finance Commission reports are binding recommendations that Parliament accepts by convention.

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
