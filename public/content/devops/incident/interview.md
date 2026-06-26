# Incident Management Interview Q&A

**Q: What is the incident lifecycle?**
Detection → Triage (severity) → Escalation → Mitigation → Resolution → Post-mortem. Key: MTTR (Mean Time to Recovery) is the key metric.

**Q: What are P1/P2/P3 severities?**
P1: Customer-facing outage, all users impacted. Alert all on-call immediately. P2: Significant degradation, some users impacted. P3: Minor issue, workaround available. Each has different response SLAs.

**Q: What makes a good post-mortem?**
Blameless — focus on systems, not people. Five Whys to root cause. Timeline of events. What went well, what went wrong. Action items with owners and dates. Shared widely across engineering.
