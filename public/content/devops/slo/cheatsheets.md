# SLO Quick Reference

```
Availability SLO to downtime conversion:
99.9%  = 8.7 hours/year  = 43.8 min/month
99.95% = 4.4 hours/year  = 21.9 min/month
99.99% = 52 min/year     = 4.4 min/month
99.999%= 5.2 min/year    = 26 sec/month

Error budget burn rate alerting:
2% burn in 1 hour  → page immediately (Sev 1)
5% burn in 6 hours → urgent (Sev 2)
10% burn in 3 days → ticket (Sev 3)

PromQL: Error rate
rate(http_requests_total{status=~"5.."}[5m]) /
rate(http_requests_total[5m])
```

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

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
