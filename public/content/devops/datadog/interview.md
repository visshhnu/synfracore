# Datadog Interview Q&A

**Q: How is Datadog different from Prometheus+Grafana?**
Datadog is a fully managed SaaS — no infrastructure to run. Prometheus is self-hosted (you manage storage, Alertmanager, Grafana). Datadog has better APM (distributed tracing, service maps), built-in log management, and SLO tracking. Cost trade-off: Prometheus is free, Datadog is expensive at scale.

**Q: What is the Datadog Agent?**
Lightweight process running on every host. Collects: system metrics (CPU, memory, disk, network), process metrics, logs (tail -f), traces (APM), custom metrics via StatsD. Sends data to Datadog SaaS platform.

**Q: How do you write a Datadog monitor?**
Threshold alert (metric > value), anomaly detection (based on historical pattern), forecast (predict future breach), composite (combine multiple monitors), log-based. Define: query, conditions, message (with @mentions for Slack/PagerDuty), evaluation window.

**Q: What is Datadog APM vs Infrastructure monitoring?**
APM: distributed tracing across microservices — track a request from frontend through backend services to database. Shows service dependency maps, error rates, latency by endpoint. Infrastructure: host-level metrics, container metrics, cloud service metrics. Both use the same Agent.

**Q: How do you instrument an application for Datadog APM?**
Add Datadog tracing library (ddtrace for Python, dd-trace-js for Node, etc.). Set DD_SERVICE, DD_ENV, DD_VERSION environment variables. Agent runs alongside (sidecar or DaemonSet in K8s). Auto-instrumentation available for common frameworks (Flask, Express, Django, Spring).

## Quick Reference — Datadog

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
