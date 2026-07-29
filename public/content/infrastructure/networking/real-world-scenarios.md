# Networking for DevOps — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production networking incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The health check that lied

**The pattern:** A Kubernetes readiness probe checks `GET /health` and gets a 200 OK, so the pod stays in the load balancer's rotation. The application is technically running — the process is alive and the web server responds — but a downstream database connection pool has silently exhausted, meaning every *real* request from a user fails while the shallow health check keeps reporting green. The service shows 100% "healthy" pods in Kubernetes while actual user-facing error rates climb.

**Why this is a networking-adjacent problem, not just an application bug:** the load balancer and readiness probe are doing exactly what they were configured to do — routing traffic to pods that respond on the health endpoint. The networking layer has no way to know the health check itself is shallow; from `kube-proxy`'s perspective, every pod behind the Service is a valid, healthy endpoint. This is exactly the gap between "the process is alive" and "the thing depending on this pod is actually healthy" that a Service's endpoint list can't capture on its own.

**What actually prevents this:**
- **A deep health check that verifies the actual dependency**, not just that the HTTP server itself responds — `GET /health/db` that performs a real (lightweight) database query, distinct from the shallow liveness check.
- **Separate liveness and readiness probes with different depth** — liveness should stay shallow (restart the pod only if the process itself is actually broken), but readiness should be deep enough to pull a pod out of rotation the moment it can't serve real requests, without triggering an unnecessary restart.
- **Alert on the gap itself** — a monitoring rule comparing "% of pods reporting healthy" against actual request error rate; a divergence between the two (healthy probes, rising real errors) is the leading indicator that the health check itself has become the blind spot.

---

## Scenario 2 (illustrative/composite): The NetworkPolicy that blocked the fix for the outage it was meant to prevent

**The pattern:** A team implements a default-deny NetworkPolicy for a production namespace, following exactly the zero-trust pattern this course's own material recommends, with an explicit allow rule for the application's normal traffic. Weeks later, during an actual incident, the on-call engineer needs to exec into a pod and run a diagnostic tool that reaches out to an external service (a Slack webhook for alerting, or a package repository to pull a debugging tool) — and the NetworkPolicy, correctly enforcing its default-deny egress rule, blocks it. The incident response itself gets slowed down by the same control that was meant to improve security posture.

**Why this is a genuinely common tradeoff, not a sign the NetworkPolicy was wrong to implement:** default-deny egress is good practice specifically because it limits what a compromised pod can reach — but "good security practice" and "convenient during an incident" are in real tension, and a team that only ever tests a NetworkPolicy's *ingress* behavior (does traffic reach the app correctly) without testing its *egress* behavior under incident conditions discovers this gap at the worst possible time.

**What actually addresses this:**
- **Explicitly plan and test egress rules for known operational needs** (alerting webhooks, package repositories for emergency debugging, log shipping) as part of implementing the policy, not as an afterthought discovered during a live incident.
- **Have a documented, pre-approved "break glass" path** — a specific, narrowly-scoped temporary policy change (or a separate debug pod with different network policy applied) that's ready to apply quickly during an incident, rather than improvising a broader policy loosening under pressure that's harder to remember to revert afterward.
- **This is exactly why this course's own Project 2 (Kubernetes Zero-Trust Network Policies) includes testing what's blocked, not just what's allowed** — a NetworkPolicy's failure mode under real operational conditions is as important to understand as its success mode under normal traffic.

---

## Scenario 3 (illustrative/composite): The certificate that expired on a Saturday

**The pattern:** A production TLS certificate, issued and renewed manually rather than through cert-manager (an older service predating the team's automation rollout), expires on a weekend with no on-call alert configured for certificate expiry specifically. Users start seeing browser security warnings and API clients start failing TLS handshakes entirely. The on-call engineer, paged for "elevated error rate," spends the first 20 minutes checking application logs and database health — the actual layers their usual troubleshooting habits start with — before someone thinks to check the certificate itself.

**Why this specific delay happens repeatedly:** TLS certificate expiry produces a failure mode (connection/handshake errors) that looks, from a generic "elevated error rate" alert, similar to several other more commonly-suspected causes — which means a team's default troubleshooting order (check the app, check the database) can genuinely delay reaching the actual cause if certificate expiry isn't a habitual early check. This is exactly why this course's own Production Example runbook lists "SSL certificate expired" as an explicit, named branch in the troubleshooting sequence rather than leaving it to be discovered by process of elimination.

**What actually prevents this:**
- **Automate certificate issuance and renewal wherever possible** (cert-manager, as covered in this course's own material and Project 3) — the majority of certificate-expiry incidents happen specifically on certificates that were issued manually and fell outside whatever automated renewal process covers everything else.
- **Alert on certificate expiry directly, independent of automation** — a scheduled check (`openssl x509 -noout -enddate`, or a dedicated monitoring exporter) that pages *before* expiry, as a defense-in-depth measure even for certificates that are supposed to auto-renew, since automation can itself fail silently.
- **Put "check certificate expiry" early in the standard troubleshooting sequence** for any TLS-fronted service experiencing connection errors — not last, after other more commonly-suspected causes have been ruled out first.
