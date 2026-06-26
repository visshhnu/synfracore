# Incident Response Runbook Template

```
INCIDENT DECLARED
  - Severity: P1 / P2 / P3
  - Incident Commander: [name]
  - Start time: [UTC]
  
IMMEDIATELY
  1. Join incident Slack channel #incident-YYYY-MM-DD
  2. Start incident timeline doc
  3. Notify stakeholders (P1: CTO, VP Eng; P2: Eng Manager)

MITIGATION FIRST
  4. Can we rollback? → helm rollback / kubectl rollout undo
  5. Can we failover? → switch traffic to backup region
  6. Can we disable the feature? → feature flag off
  7. Can we scale? → increase replicas / autoscaling
  
INVESTIGATION PARALLEL
  8. Check dashboards: Datadog/Grafana error rate, latency, saturation
  9. Check logs: Kibana/Splunk for error patterns
  10. Check recent deploys: last 2 hours of changes
  11. Check infra: node status, disk, memory pressure
  
RESOLUTION
  12. Confirm metrics back to normal
  13. Notify stakeholders: "Resolved at [time]"
  14. Keep channel open 30 min for stability monitoring
  
POST-MORTEM
  15. Schedule within 48 hours (P1) or 1 week (P2)
  16. Write timeline, root cause, action items
  17. Present to engineering team
```

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
