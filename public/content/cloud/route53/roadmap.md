# AWS Route 53 — Learning Roadmap

## Estimated Time to Job-Ready
**4-6 weeks** of consistent learning (2-3 hours/day) — DNS fundamentals plus Route 53's specific record types and routing policies are genuinely quick to learn; the real depth is in routing-policy selection and health-check-driven failover design for real production traffic patterns.

## Phase 1: Foundation (Week 1-2)

- Hosted zones and core record types: A, AAAA, CNAME, ALIAS, MX, TXT — and specifically why a plain CNAME is rejected at a zone's apex/root while an ALIAS record is Route 53's AWS-specific workaround
- DNS resolution flow: how a query travels from a browser through a recursive resolver to the authoritative name servers for a zone
- TTL and caching behavior — the real tradeoff between a low TTL (faster propagation of changes, more query volume) and a high TTL (cheaper, slower to update)
- Domain registration vs. DNS hosting as two distinct Route 53 capabilities that are often used together but don't have to be

**Checkpoint:** can you explain precisely why `CNAME` isn't allowed at a zone apex (e.g. `example.com` itself, not `www.example.com`), and what ALIAS records do differently to work around that limitation?

## Phase 2: Routing Policies (Week 2-3)

- Simple routing (one record, one set of values) as the default, versus the more sophisticated policies that solve real production problems
- Weighted routing for gradual traffic shifting (blue/green, canary releases) — assigning percentages across multiple records for the same name
- Latency-based and geolocation routing for directing users to the geographically/network-nearest healthy endpoint
- Failover routing (PRIMARY/SECONDARY) paired with health checks for automatic disaster recovery, without any client-side logic needed

**Checkpoint:** given a requirement to gradually shift traffic from an old version to a new one while being able to instantly roll back, can you explain why weighted routing (not failover routing) is the correct policy to reach for?

## Phase 3: Health Checks and Complex Routing (Week 3-4)

- Health checks: what Route 53 actually monitors (HTTP/HTTPS/TCP endpoint health), and how a failing health check automatically removes a record from rotation
- Combining routing policies — e.g. weighted records each with their own health check, so traffic shifting and automatic failure exclusion work together
- Private hosted zones for internal-only DNS resolution scoped to a VPC, distinct from public hosted zones, and split-view DNS (the same domain name resolving differently inside vs. outside the VPC)
- Complete Portfolio Project 2 (weighted blue/green with health checks) from this course's Projects section

**Checkpoint:** can you explain what specifically happens to a weighted record's traffic share when its associated health check starts failing, even while its configured weight is still nonzero?

## Phase 4: Advanced DNS and Interview Readiness (Week 4-6)

- DNSSEC for cryptographically signing DNS responses, and the real chain-of-trust mechanics (KSK, DS record at the registrar) that make it more operationally involved than enabling a checkbox
- Multi-region active-passive architecture combining failover routing, health checks, and (if relevant) a private hosted zone for internal service discovery
- Route 53 Resolver for hybrid DNS scenarios connecting on-premises DNS to VPC-based resolution
- Complete Portfolio Project 3 (multi-region failover with private zones) and review this course's Interview Q&A material, particularly the routing-policy-selection and CNAME-vs-ALIAS questions

## Common Pitfalls Specific to Route 53

- **Attempting to use a CNAME at a zone's apex** — this is disallowed by the DNS standard itself, not an AWS-specific limitation; ALIAS records exist specifically to provide apex-record flexibility within that constraint
- **Choosing a routing policy without matching it to the actual traffic-management goal** — weighted, latency-based, geolocation, and failover each solve a genuinely different problem, and picking the wrong one produces the wrong behavior, not just a suboptimal one
- **Setting a high TTL on a record expected to change soon** — this directly slows down how quickly a planned change (like a failover or a cutover) actually takes effect for cached resolvers
- **Assuming DNSSEC is a simple toggle** — the actual chain-of-trust setup (key management, DS record coordination with the registrar) is genuinely more involved than enabling a single setting

## Getting Your First Route 53-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (record-type/TTL fundamentals, health-check-driven weighted traffic shifting, multi-region failover architecture)
2. **Resume:** be specific — "implemented health-check-driven automatic failover reducing observed recovery time from a regional outage to under 90 seconds" is far stronger than "experience with Route 53"
3. **Know the routing-policy decision tree cold:** being able to quickly match a stated requirement (canary release, disaster recovery, nearest-endpoint routing) to the correct Route 53 policy is one of the most commonly tested practical DNS skills
4. **Certifications, if pursuing one:** Route 53 is covered across most AWS certifications, especially Solutions Architect Associate — see this course's own Certification Guide for current format and pricing
