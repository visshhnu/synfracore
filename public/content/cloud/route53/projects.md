# Route53 — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Multi-Record Hosted Zone with Terraform

**Level:** Beginner | **Time:** 1-2 days

Stand up a hosted zone and manage every common record type (A, ALIAS, CNAME, MX, TXT) as code — the DNS equivalent of "hello world," but with the gotchas that actually trip people up in production (apex records, TTL tradeoffs).

### Steps

1. Register or use an existing test domain (or a subdomain you control) and create a Route 53 hosted zone for it via Terraform
2. Add an apex `A`/`ALIAS` record (prove to yourself why a plain `CNAME` is rejected at the zone apex)
3. Add a `www` `CNAME` pointing at the apex, an `MX` record, and a `TXT` record (e.g. for domain verification)
4. Deliberately set a low TTL (60s) on one record, change its value, and time how long `dig` takes to reflect the change from a resolver that already cached it
5. Document, in the README, the exact difference between what a `CNAME` and an `ALIAS` record resolve to when queried with `dig`

### Skills Demonstrated

- Route 53 record types and apex-record constraints
- Terraform for DNS as code
- TTL/caching behavior in practice

### GitHub Repo Name

`route53-hosted-zone-terraform`

---

## Project 2: Blue/Green Deployment with Weighted Routing + Health Checks

**Level:** Intermediate | **Time:** 2-3 days

Deploy two versions of a simple app behind two endpoints, then use Route 53 weighted routing plus a health check to shift traffic gradually — and to prove automatic rollback works when the "new" version starts failing its health check.

### Steps

1. Stand up two backends (two EC2 instances, or two Lambda functions behind API Gateway/ALB) — call them blue and green
2. Create two weighted `A`/`ALIAS` records for the same name, each with a distinct `SetIdentifier`, starting at 100/0
3. Attach a Route 53 health check to the green record's endpoint
4. Shift weight gradually (100/0 → 90/10 → 50/50 → 0/100) while watching `dig` results change across repeated queries
5. Deliberately break the green endpoint's `/health` path and confirm Route 53 stops returning it even while its weight is still nonzero
6. Document the rollback: instantly reset weight to 100/0 on blue

### Skills Demonstrated

- Weighted routing policy mechanics
- Health-check-driven automatic exclusion from rotation
- Real blue/green traffic-shifting, not just a diagram of one

### GitHub Repo Name

`route53-weighted-bluegreen`

---

## Project 3: Multi-Region Active-Passive Failover with Private + Public Zones

**Level:** Advanced | **Time:** 4-5 days

Design a DNS layer for an application running in two regions — one primary, one standby — with automatic failover, plus a private hosted zone so internal services resolve each other without touching the public internet.

### Steps

1. Deploy a minimal app in two AWS regions (or simulate two endpoints if a full multi-region deploy isn't feasible)
2. Create PRIMARY/SECONDARY failover records with a health check on the primary
3. Kill or block the primary endpoint and confirm Route 53 fails over to secondary within the health check's failure-threshold window — measure and document the actual observed failover time
4. Create a private hosted zone associated with your VPC(s) for internal service-to-service DNS (e.g. `db.internal`) and confirm it does NOT resolve from outside the VPC
5. If you have a spare domain, attempt DNSSEC signing end-to-end (KSK creation → activation → enable signing → DS record at the registrar) and document every step, including anything that didn't work as expected

### Skills Demonstrated

- Failover routing + health-check-driven DR
- Private vs public hosted zone separation (split-view DNS)
- DNSSEC chain-of-trust mechanics

### GitHub Repo Name

`route53-multiregion-failover`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a Kubernetes cluster to deploy my personal blog" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
