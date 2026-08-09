# Harbor / Nexus / Artifactory Learning Roadmap

**Goal**: From zero private-registry experience to production Harbor operations

## Learning Phases

### Phase 1: Registry Fundamentals (1-2 days)

- Cloud-native registries (ECR/ACR/GCR) vs. Harbor — when each fits
- Air-gapped environments, multi-cloud, and cost-at-scale as decision drivers
- Basic push/pull workflow against Harbor

### Phase 2: Projects, RBAC, and Scanning (2-3 days)

- Projects as namespaces with their own RBAC, scanning policy, and retention rules
- Trivy-based CVE scanning and scan-and-block policies
- Replication to other registries for multi-cloud/DR

### Phase 3: Intermediate Operations (3-4 days)

- Robot accounts — scoped, non-human CI/CD credentials
- Webhooks for event-driven downstream workflows
- Tag immutability for release-tag integrity
- Proxy cache configuration and project quotas

### Phase 4: Advanced Production Architecture (1 week)

- High-availability deployment with external PostgreSQL/Redis
- OIDC/LDAP enterprise auth integration
- API automation at scale — Terraform-based project provisioning
- P2P image distribution via Dragonfly preheat
- Disaster recovery for Harbor's own database and image content

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing robot-account scope mismatches
- Storage-full and quota-related failure modes
- Practice explaining the cloud-registry-vs-Harbor tradeoff clearly — this is Overview's own framing and a near-certain interview topic

## Job Roles This Enables

- Platform Engineer
- DevOps Engineer
- Release Engineer
- Security Engineer (container supply-chain focus)

## Target Certifications

`(needs verification — recheck against current source for CNCF's current Harbor-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's robot accounts and webhooks assume Phase 2's Projects/RBAC model is already solid, and Phase 4's HA/DR material builds on understanding the architecture from earlier phases
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real Harbor instance (Docker Compose is sufficient for learning) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — a real CI pipeline using robot-account credentials and reacting to webhooks demonstrates meaningfully more than manual `docker push`
4. Use the Troubleshooting section's real scenarios (robot-account scope mismatches, storage-full failures) as active study material once Phase 3 is solid
5. Phase 4's DR material is worth taking seriously even for a portfolio project — being able to articulate the database-vs-image-content DR distinction is a genuine differentiator in interviews

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 2-3 weeks (part-time)
Robot-account scoping mistakes and the retention_period-style "two
pieces configured together" gotchas (tag immutability + scope
selectors) are worth deliberately practicing, not just reading about —
they're exactly the kind of subtle misconfiguration interviewers probe
for at senior levels
```
