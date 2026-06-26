# SLO & SRE Interview Q&A

**Q: SLI vs SLO vs SLA?**
SLI (Service Level Indicator): measured metric (e.g. success rate). SLO (Service Level Objective): internal target (e.g. 99.9% success). SLA (Service Level Agreement): contract with customer (99.5% — always lower than SLO to provide buffer).

**Q: What is an error budget?**
Amount of downtime/errors allowed before breaching SLO. 99.9% SLO = 0.1% error budget = 8.7 hours/year. If budget is depleted, freeze new feature deployments — focus on reliability. If budget is healthy, teams can take more deployment risk.

**Q: What are the four golden signals?**
Latency, Traffic, Errors, Saturation (LTES). Monitor these for every service. Alerting should be based on symptom (SLO breach) not cause (CPU high).
