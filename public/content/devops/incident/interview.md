# Incident Management Interview Q&A

**Q: What is the incident lifecycle?**
Detection → Triage (severity) → Escalation → Mitigation → Resolution → Post-mortem. Key: MTTR (Mean Time to Recovery) is the key metric.

**Q: What are P1/P2/P3 severities?**
P1: Customer-facing outage, all users impacted. Alert all on-call immediately. P2: Significant degradation, some users impacted. P3: Minor issue, workaround available. Each has different response SLAs.

**Q: What makes a good post-mortem?**
Blameless — focus on systems, not people. Five Whys to root cause. Timeline of events. What went well, what went wrong. Action items with owners and dates. Shared widely across engineering.

## Quick Reference — Incident

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

**Q: What makes an incident commander effective?**
Clear decision-making authority, not getting into debugging details, managing communication channels, setting a timeline for updates, making the mitigation call even with incomplete information. The IC coordinates — they don't fix the problem personally.

**Q: What is blameless post-mortem culture?**
Focus on systems and processes, not individual fault. Assumes people acted with the information they had at the time. Five Whys methodology to reach systemic root causes. Action items go to systems/processes, not blame to individuals. Psychological safety to share what went wrong without fear.

**Q: How do you calculate MTTR?**
Mean Time to Recovery = total downtime / number of incidents in a period. Example: 3 incidents with 30 min, 45 min, 15 min downtime = 90 min / 3 = 30 min MTTR. Track by severity separately — P1 MTTR vs P2 MTTR give different insights.

**Q: When do you declare an incident vs handle it silently?**
Declare when: customer-facing impact, SLO breach likely, multiple teams need coordination, or uncertainty about blast radius. Better to declare and stand down quickly than to silently handle something that grows. Most mature teams err on the side of declaring and have a quick stand-down process.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
