# Azure Virtual Networks — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — VNet basics (address space, subnets) are quick to learn; real proficiency is in security segmentation (NSGs/ASGs), hub-spoke topology design, and Private Endpoint architecture for PaaS isolation.

## Phase 1: Foundation (Week 1-2)

- VNet address space (CIDR block) planning and subnetting — deciding this upfront, since re-architecting a live production VNet's address space later is genuinely painful
- Network Security Groups (NSGs) for subnet/NIC-level traffic filtering, and default rules (like `DenyAllInbound`) as the actual starting security posture
- Application Security Groups (ASGs) for identity-based segmentation — writing NSG rules that reference an ASG rather than hand-maintained IP lists
- Basic connectivity testing: confirming a rule actually blocks/allows traffic, not just assuming the configuration is correct

**Checkpoint:** can you explain why referencing an Application Security Group in an NSG rule is more maintainable than referencing a specific VM's IP address directly?

## Phase 2: Segmentation and Verification (Week 2-4)

- 3-tier network segmentation (web/app/db subnets) with NSG rules that only allow the traffic each tier genuinely needs from the tier before it
- `az network nic show-effective-nsg` (or the portal equivalent) for confirming what rules are actually in effect on a given NIC — the real verification step, not just reading the rules you wrote
- VNet Peering for private connectivity between VNets, and its real, non-transitive limitation (A↔B and B↔C peering does not let A reach C)
- Complete Portfolio Project 1 (segmented 3-tier network) from this course's Projects section

**Checkpoint:** given three peered VNets in a line (A↔B, B↔C), can you explain precisely why A still can't reach C, and what architecture would actually fix it?

## Phase 3: Hub-Spoke Architecture (Week 4-6)

- Hub-spoke topology: a central hub VNet (often containing Azure Firewall, VPN/ExpressRoute gateways) with spoke VNets peered to it — the standard pattern most enterprise Azure landing zones use
- User-defined routes (UDRs) for forcing spoke traffic through a central firewall or network virtual appliance, rather than relying on default system routes
- Azure Firewall rules (network and application) for centralized, policy-driven egress filtering across every spoke
- Complete Portfolio Project 2 (hub-spoke with centralized egress firewall)

**Checkpoint:** can you explain what a `0.0.0.0/0` route pointing to a firewall's private IP as next hop actually accomplishes, and why it needs to be associated with the spoke's subnet specifically?

## Phase 4: Private Endpoints and Interview Readiness (Week 6-7)

- Private Endpoints for reaching PaaS services (Storage, SQL Database) via a private IP inside your VNet, instead of over the public internet
- Private DNS Zones and confirming they actually resolve a service's hostname to the private IP, not just that the zone exists
- Private Endpoint vs. Service Endpoint — the real difference (a genuine private IP and full public-access removal, versus a more limited routing optimization) and when each fits
- Complete Portfolio Project 3 (Private Endpoint PaaS isolation) and review this course's Interview Q&A material, particularly the peering-transitivity and Private-vs-Service-Endpoint questions

## Common Pitfalls Specific to Azure VNets

- **Writing NSG rules against specific IP addresses instead of Application Security Groups** — this becomes unmaintainable as VMs are added/removed/rebuilt, and ASGs exist specifically to solve this
- **Assuming VNet Peering supports transitive routing** — it explicitly doesn't; this trips up even experienced engineers designing multi-VNet topologies
- **Leaving PaaS services (Storage, SQL) reachable over the public internet after adding a Private Endpoint** — the Private Endpoint alone doesn't remove public access; that requires explicitly disabling public network access on the resource itself
- **Assuming NSG rules work without verifying effective rules** — the rule you wrote and the rule actually in effect on a given NIC (after considering all associated NSGs) aren't automatically the same thing without checking

## Getting Your First Azure Networking-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (verified NSG/ASG segmentation, hub-spoke centralized firewall egress, Private Endpoint PaaS isolation with DNS verification)
2. **Resume:** be specific — "eliminated public internet exposure for a production Storage Account and SQL Database by implementing Private Endpoints with verified Private DNS resolution" is far stronger than "experience with Azure networking"
3. **Know the peering-transitivity limitation cold:** this is one of the most consistently tested practical Azure networking facts, precisely because it's counterintuitive
4. **Certifications, if pursuing one:** VNets are covered extensively in Azure Network Engineer Associate — see this course's own Certification Guide for current format and pricing
