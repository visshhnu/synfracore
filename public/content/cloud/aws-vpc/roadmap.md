# AWS VPC — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — VPC's core building blocks (subnets, route tables, gateways) are conceptually simple; real proficiency is in designing a network that actually enforces the isolation you intend, and correctly diagnosing which layer (route table, security group, NACL) is causing a connectivity problem.

## Phase 1: Foundation (Week 1-2)

- Core components: VPC, subnets (public vs. private, determined by their route table, not a label), route tables, and CIDR block planning
- Internet Gateway (IGW) for public-subnet internet access vs. NAT Gateway for private-subnet outbound-only access — a genuinely common early point of confusion
- Security groups (stateful, instance-level) vs. NACLs (stateless, subnet-level) — and why most real designs rely primarily on security groups, using NACLs sparingly
- Availability Zones and why spreading subnets across at least 2 AZs is the production baseline, not an optional upgrade

**Checkpoint:** can you explain, precisely, what makes a subnet "public" in AWS terms — is it a setting on the subnet itself, or something else?

## Phase 2: Connectivity Patterns (Week 2-4)

- VPC Peering: private connectivity between two VPCs, and its real, non-obvious limitation — no transitive routing, meaning a peering connection A↔B and B↔C does not let A reach C
- Transit Gateway as the hub-and-spoke solution for connecting many VPCs without needing a full mesh of individual peering connections
- VPC endpoints (Gateway endpoints for S3/DynamoDB, Interface endpoints for other services) for reaching AWS services privately, without traffic leaving the VPC via a NAT Gateway
- Site-to-Site VPN and Direct Connect for connecting a VPC to on-premises infrastructure, and the real latency/cost/reliability tradeoff between them

**Checkpoint:** given three VPCs where A is peered with B and B is peered with C, can you explain exactly why A still can't reach C, and what you'd need to add to fix it?

## Phase 3: Troubleshooting and Diagnostics (Week 4-5)

- VPC Flow Logs for capturing actual accepted/rejected traffic at the ENI level — the real evidence-based tool for diagnosing "why can't this reach that"
- VPC Reachability Analyzer for tracing the specific hop where a connectivity path breaks, rather than manually checking every route table and security group by hand
- The distinct failure signatures of a missing route, an overly-restrictive security group, and a misconfigured NACL rule — being able to tell which one you're looking at from the symptoms alone
- Complete Portfolio Project 3 (troubleshooting with Flow Logs) from this course's Projects section

**Checkpoint:** given a Flow Log entry showing a REJECT record for traffic that should be allowed, can you list the specific places you'd check next, in order?

## Phase 4: Production Architecture and Interview Readiness (Week 5-7)

- Multi-account VPC strategies (shared VPCs via AWS RAM, or per-account VPCs connected via Transit Gateway) for organizations beyond a single team/account
- IPv6 considerations and dual-stack VPC design, increasingly relevant as IPv4 address space becomes a real constraint
- Cost awareness: NAT Gateway hourly + per-GB charges as a genuinely significant line item at scale, and VPC endpoints as a cost-reduction lever for high-volume S3/DynamoDB traffic
- Review this course's Interview Q&A material, particularly the security-group-vs-NACL and peering-transitivity questions

## Common Pitfalls Specific to VPC

- **Assuming VPC Peering supports transitive routing** — it explicitly doesn't; this is one of the most commonly tested VPC networking facts precisely because the non-technical intuition suggests otherwise
- **Treating NACLs as the primary access control instead of security groups** — NACLs being stateless means every allowed direction needs an explicit rule, a common source of "I opened the port but it's still not working" confusion
- **Routing all AWS service traffic through a NAT Gateway instead of using VPC endpoints** — this is both a real cost and a real latency cost for high-volume S3/DynamoDB access that a Gateway endpoint avoids entirely
- **Debugging connectivity issues by guessing instead of using Flow Logs/Reachability Analyzer** — these tools exist specifically to replace manual security-group-by-security-group guesswork with actual evidence

## Getting Your First VPC-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core VPC skill (multi-tier architecture, peering/Transit Gateway connectivity, evidence-based troubleshooting)
2. **Resume:** be specific — "diagnosed and resolved a cross-VPC connectivity failure using Reachability Analyzer, tracing the root cause to a missing route table entry" is far stronger than "experience with AWS VPC"
3. **Know the security-group-vs-NACL distinction cold:** this is one of the most consistently tested practical VPC concepts across AWS interviews at every level
4. **Certifications, if pursuing one:** VPC is foundational across nearly every AWS certification, especially Advanced Networking Specialty — see this course's own Certification Guide for current format and pricing
