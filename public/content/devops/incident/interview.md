# Incident Management Interview Q&A

**Q: What is the incident lifecycle?**
Detection → Triage (severity) → Escalation → Mitigation → Resolution → Post-mortem. Key: MTTR (Mean Time to Recovery) is the key metric.

**Q: What are P1/P2/P3 severities?**
P1: Customer-facing outage, all users impacted. Alert all on-call immediately. P2: Significant degradation, some users impacted. P3: Minor issue, workaround available. Each has different response SLAs.

**Q: What makes a good post-mortem?**
Blameless — focus on systems, not people. Five Whys to root cause. Timeline of events. What went well, what went wrong. Action items with owners and dates. Shared widely across engineering.

**Q: What makes an incident commander effective?**
Clear decision-making authority, not getting into debugging details, managing communication channels, setting a timeline for updates, making the mitigation call even with incomplete information. The IC coordinates — they don't fix the problem personally.

**Q: What is blameless post-mortem culture?**
Focus on systems and processes, not individual fault. Assumes people acted with the information they had at the time. Five Whys methodology to reach systemic root causes. Action items go to systems/processes, not blame to individuals. Psychological safety to share what went wrong without fear.

**Q: How do you calculate MTTR?**
Mean Time to Recovery = total downtime / number of incidents in a period. Example: 3 incidents with 30 min, 45 min, 15 min downtime = 90 min / 3 = 30 min MTTR. Track by severity separately — P1 MTTR vs P2 MTTR give different insights.

**Q: When do you declare an incident vs handle it silently?**
Declare when: customer-facing impact, SLO breach likely, multiple teams need coordination, or uncertainty about blast radius. Better to declare and stand down quickly than to silently handle something that grows. Most mature teams err on the side of declaring and have a quick stand-down process.
