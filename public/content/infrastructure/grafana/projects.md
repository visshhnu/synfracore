# Grafana — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Production-Grade Grafana Setup

**Level:** Beginner | **Time:** 1-2 days

Set up a complete, production-ready Grafana environment from scratch with proper configuration, security hardening, and monitoring.

### Steps

1. Plan your Grafana architecture and document requirements
2. Install and configure Grafana following official best practices
3. Apply security hardening (restrict access, disable defaults)
4. Set up basic monitoring and alerting
5. Write a README documenting the setup
6. Add to GitHub with .gitignore and proper structure

### Skills Demonstrated

- Grafana installation and configuration
- Security hardening
- Documentation

### GitHub Repo Name

`grafana-production-setup`

---

## Project 2: RED-Method Dashboard-as-Code for a Multi-Service App

**Level:** Intermediate | **Time:** 2-3 days

Instrument a small multi-service app (e.g. a Node.js API + worker), scrape it with Prometheus, and build the full RED dashboard (Rate, Errors, Duration) as version-controlled JSON/Jsonnet rather than clicked together in the UI.

### Steps

1. Instrument each service with `prometheus-client`, exposing request count, error count, and a latency histogram
2. Write the dashboard in Grafonnet (or hand-authored JSON) — not the UI — so it's diffable in Git
3. Add `$service` and `$environment` template variables so one dashboard covers every service
4. Provision the dashboard and the Prometheus data source via `/etc/grafana/provisioning`, not manual clicks
5. Add panel-level alert rules for error rate and P99 latency, with a Slack contact point
6. Store the dashboard JSON and provisioning YAML in Git; document how to regenerate the JSON from source

### Skills Demonstrated

- Dashboard-as-code (Grafonnet/JSON + provisioning)
- PromQL for the RED method
- Grafana unified alerting

### GitHub Repo Name

`grafana-dashboard-as-code`

---

## Project 3: Unified Observability Stack (LGTM) with Trace-to-Log Correlation

**Level:** Advanced | **Time:** 4-5 days

Stand up the open-source LGTM stack — Loki (logs), Grafana (UI), Tempo (traces), and Prometheus/Mimir (metrics) — for a small instrumented app, and wire them together so a single click moves from a metric spike to the matching trace to the matching log lines.

### Steps

1. Instrument the app with OpenTelemetry (traces) and a Prometheus client library (metrics); ship logs to Loki via Promtail
2. Deploy Prometheus, Loki, Tempo, and Grafana together (Docker Compose or Helm) with Grafana as the shared query UI
3. Configure Grafana's Tempo data source with `tracesToLogs`/`tracesToMetrics` so a trace span links directly to its Loki log lines and Prometheus metrics
4. Build one dashboard combining a metrics panel, a Loki log panel, and a Tempo trace-search panel for the same service
5. Reproduce a real failure (inject latency or errors) and walk the full path: dashboard spike → trace → span → correlated log line
6. Document the correlation setup and the failure walkthrough as a runbook

### Skills Demonstrated

- Multi-signal observability (metrics + logs + traces)
- Grafana data source correlation configuration
- Incident-investigation workflow, not just dashboard-building

### GitHub Repo Name

`grafana-lgtm-observability`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a Kubernetes cluster to deploy my personal blog" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with dashboards provisioned as code (not clicked together in the UI)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
