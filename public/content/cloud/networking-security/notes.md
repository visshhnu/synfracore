# Cloud Networking & Security — Notes

## Core mental model

- Network design determines what *can* talk to what; security determines who's *allowed* to and whether the data is encrypted. Both have to be designed together, not layered on separately after the fact.
- Only what genuinely needs direct internet access belongs in a public subnet — everything else should be private (outbound-only via NAT/endpoints) or fully isolated (no internet route at all, like a database tier).
- A private network boundary is not a substitute for encryption in transit — the two are complementary controls, not alternatives.

## Security Groups vs. NACLs

- Security Groups are stateful (return traffic automatically allowed) and scoped per instance; NACLs are stateless (must allow both directions explicitly) and scoped per subnet.
- Most real designs use Security Groups as the primary day-to-day control and NACLs sparingly, for subnet-wide deny rules Security Groups can't express as cleanly.

## Connectivity patterns, by scale and need

- VPC Peering doesn't scale past a handful of VPCs (N² connections) — Transit Gateway solves this via hub-spoke (N attachments).
- VPC Peering does NOT enable DNS resolution across the peering by default — a separate, explicit setting on both sides.
- VPC Endpoints route traffic to AWS services privately, avoiding both NAT Gateway cost and unnecessary public-internet exposure for that traffic.
- Dedicated connections (Direct Connect/ExpressRoute) are worth the cost/lead-time specifically once a cross-network data path is latency-sensitive or business-critical — VPN is fine for lower-stakes integrations.

## Layered defenses, not one control doing everything

- Security Groups/NACLs operate on IP/port only — they cannot see or filter HTTP request content, which is exactly what a WAF exists for (SQL injection, XSS, rate limiting at the application layer).
- DDoS defense is also layered: L3/L4 volumetric protection (Shield/Azure DDoS Protection, largely automatic) is different from L7 application-layer flood protection (needs an explicitly configured WAF rate-limit layer) — enabling only the first is a common, real gap.
- Flow logs (VPC/NSG) are what makes Zero Trust's "assume breach, monitor everything" principle actually actionable — metadata-level visibility into every connection, not full packet capture, but enough to detect real anomalies (unexpected subnet-to-subnet traffic, exfiltration-pattern spikes).

## Compliance-driven segmentation

- PCI-DSS scope isn't just "systems that touch card data" — it's every system that *can communicate with* the cardholder-data environment. Poor segmentation pulls unrelated infrastructure into audit scope.
- Tight segmentation of a regulated environment is both a security improvement and a direct, measurable reduction in audit cost/scope.

## Zero Trust, from starting checklist to full maturity

- Starting point: MFA everywhere sensitive, least-privilege by default, network segmented, breach assumed and monitored.
- Full maturity: micro-segmentation at the workload level (not just VPC/subnet), continuous re-authorization (not just point-in-time authentication), and a full audit trail across every access decision, not just logins.
- Most organizations implement this incrementally, prioritizing highest-risk systems first — not a uniform, all-at-once rollout.

## Common troubleshooting order

- "Rule looks right but traffic is blocked" — check in order: route table → NACL (stateless, both directions) → Security Group → the resource's own OS-level firewall.
- Asymmetric routing (request and response taking different paths through a multi-VPC/hybrid topology) breaks stateful devices that only see half the conversation — trace both directions independently, don't assume one confirmed route means the return path matches.
