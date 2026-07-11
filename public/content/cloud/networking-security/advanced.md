# Cloud Networking & Security — Advanced

## Network segmentation for compliance: PCI-DSS as the concrete example

Compliance frameworks like PCI-DSS don't just recommend network segmentation as a best practice — they require it as a specific, auditable control, with real scope implications: any system that can communicate with the cardholder-data environment (CDE) is considered *in scope* for the full compliance audit, regardless of whether that system actually touches card data itself. This is the direct, practical reason segmentation quality matters far beyond general security hygiene — a poorly segmented network where the CDE can be reached from broad swaths of general application infrastructure pulls all of that infrastructure into audit scope, with real cost and operational overhead. A tightly segmented CDE — its own VPC or subnet, explicit and minimal Security Group rules permitting only the specific, necessary connections, its own logging and monitoring — keeps the audit boundary as small as the actual card-data-handling components, which is both a security improvement and a direct, measurable reduction in audit cost and scope.

## DDoS protection: layers, and what each actually defends against

A single "DDoS protection" checkbox undersells how layered real DDoS defense needs to be, since different attack types operate at different layers and need different mitigations:

| Layer | Attack type | Mitigation |
|---|---|---|
| L3/L4 | Volumetric flood (SYN flood, UDP reflection) | AWS Shield / Azure DDoS Protection — absorbs and filters at the network edge, largely automatic |
| L7 | Application-layer flood (many legitimate-looking HTTP requests) | WAF rate-limiting rules, since L3/L4 protection can't distinguish this from real traffic |
| DNS | DNS amplification / query flooding | Route 53/Azure DNS's own built-in resilience, plus rate-limiting at the resolver level |

The common gap: teams enable basic DDoS protection (AWS Shield Standard, which is free and automatic) and consider the topic closed, without realizing L7 application-layer attacks — a flood of individually legitimate-looking requests designed to exhaust application resources rather than network bandwidth — require a separate, deliberately configured WAF rate-limiting layer that Shield Standard alone doesn't provide. AWS Shield Advanced adds L7-specific protections and cost protection for scaling-triggered charges during an attack, at real additional cost, worth evaluating specifically for internet-facing services with genuine DDoS risk exposure (public APIs, high-traffic consumer applications) rather than applied blanket to every workload.

## Multi-cloud and hybrid networking: the connectivity patterns

Organizations running workloads across AWS and Azure (or cloud plus on-premises) need explicit connectivity design — there's no default path between separate cloud providers' networks the way there is within a single provider's VPC/VNet peering:

- **Site-to-site VPN** — encrypted tunnel over the public internet between two networks; lower setup cost and complexity, but subject to public internet latency/reliability variance
- **Dedicated connection** (AWS Direct Connect, Azure ExpressRoute) — a private, dedicated physical/logical connection bypassing the public internet entirely; higher cost and longer provisioning lead time, but consistent, predictable latency and bandwidth — the standard choice once traffic volume or latency sensitivity between environments becomes business-critical
- **Cloud-to-cloud direct peering** — increasingly available natively between major providers for specific regions/services, avoiding a VPN/dedicated-connection hop through a third intermediary

The real design decision isn't just "which technology" — it's matching connectivity investment to actual traffic criticality: a low-volume, latency-tolerant integration is fine over VPN; a latency-sensitive, high-volume, business-critical data path (a hybrid on-premises database replicating continuously to a cloud DR target, for instance) genuinely needs the consistency a dedicated connection provides, and VPN's public-internet variance there is a real operational risk, not just a theoretical one.

## Zero Trust at full maturity: beyond the starting checklist

The Fundamentals tab's three-point Zero Trust checklist (verify identity, least privilege, assume breach) is a genuine starting point — full Zero Trust maturity extends it into continuous, automated enforcement rather than point-in-time configuration:

- **Micro-segmentation** — network policy enforced at the individual workload level (a Kubernetes NetworkPolicy, a service mesh's mTLS-enforced policy), not just at the VPC/subnet boundary, so a compromised single service can't laterally reach every other service in the same subnet by default
- **Continuous authorization, not just authentication** — a session that was legitimately authenticated an hour ago is re-evaluated against current context (has the device's health status changed, is the access pattern anomalous) rather than trusted indefinitely until the token expires
- **Full audit trail across every access decision** — not just successful logins, but every authorization decision (allowed and denied), correlated and reviewable, since detecting an actual breach in progress depends on this level of visibility existing before it's needed

This level of maturity is a genuinely significant engineering and organizational investment, not a checkbox — most organizations reasonably implement it incrementally, prioritizing the highest-risk systems (payment processing, systems handling regulated data) first rather than attempting it uniformly across an entire estate at once.
