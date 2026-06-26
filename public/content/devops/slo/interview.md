# SLO & SRE Interview Q&A

**Q: SLI vs SLO vs SLA?**
SLI (Service Level Indicator): measured metric (e.g. success rate). SLO (Service Level Objective): internal target (e.g. 99.9% success). SLA (Service Level Agreement): contract with customer (99.5% — always lower than SLO to provide buffer).

**Q: What is an error budget?**
Amount of downtime/errors allowed before breaching SLO. 99.9% SLO = 0.1% error budget = 8.7 hours/year. If budget is depleted, freeze new feature deployments — focus on reliability. If budget is healthy, teams can take more deployment risk.

**Q: What are the four golden signals?**
Latency, Traffic, Errors, Saturation (LTES). Monitor these for every service. Alerting should be based on symptom (SLO breach) not cause (CPU high).

## Quick Reference — Slo

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

**Q: How do you set a meaningful SLO?**
Start with user expectations: what level of service do users actually notice as degraded? Then look at historical performance: what have you been achieving? Set the SLO slightly below historical performance to give yourself a buffer. Get product/business agreement — SLO is a business commitment, not a technical metric.

**Q: What should happen when error budget is depleted?**
Freeze new feature releases. Redirect engineering focus to reliability work. Review recent incidents to understand causes. Only ship changes that improve reliability until budget is restored. This is the key mechanism: error budget makes reliability everyone's concern, not just ops.

**Q: What is multi-window, multi-burn-rate alerting?**
Alert at different time horizons with different thresholds to catch both fast burns (sudden outage) and slow burns (gradual degradation). Example: alert if burning at 14x rate over 1 hour (fast) OR 3x rate over 3 days (slow). Google SRE Workbook provides the reference thresholds. Reduces alert fatigue vs simple threshold alerting.

**Q: How do latency SLOs work?**
Use percentiles, not averages. P50 (median) hides tail latency. P99 shows what the slowest 1% experience. Typical SLO: "99% of requests complete within 200ms." Measured with Prometheus histogram_quantile or Datadog distribution percentile. Alert when the SLI (measured P99) breaches the SLO threshold.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
