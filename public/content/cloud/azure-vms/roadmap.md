# Azure Virtual Machines — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — VM provisioning itself is quick to learn; real proficiency is in availability design (zones, scale sets), secure access patterns (Bastion, no public IPs), and cost-aware capacity planning (Spot, right-sizing).

## Phase 1: Foundation (Week 1-2)

- VM series and sizing (D/E/F/L/N/B) and matching series to actual workload shape (general purpose, memory-optimized, compute-optimized, GPU, burstable)
- Managed disks (Ultra/Premium/Standard) and the real latency/IOPS/cost tradeoff between them
- Provisioning via CLI/Terraform (not just the Portal, for reproducibility) and connecting via SSH/RDP
- Availability Sets vs. Availability Zones — and why Zones (spreading across physically separate datacenters) provide stronger protection than Sets (spreading across fault/update domains within one datacenter)

**Checkpoint:** can you explain the real difference in failure-domain protection between an Availability Set and Availability Zones — what specifically does Zones protect against that Sets doesn't?

## Phase 2: Secure Access and Golden Images (Week 2-4)

- Azure Bastion for SSH/RDP access with zero public IPs on the VMs themselves — the current recommended pattern over exposing management ports directly
- Managed Identity on a VM for accessing other Azure services without embedded credentials
- Custom images via Azure Compute Gallery — building a "golden image" with your application pre-installed, versus a stock marketplace image plus a slow startup script every time
- Custom Script Extension / cloud-init for bootstrapping, and why baking more into the golden image beats a longer, more fragile boot-time script

**Checkpoint:** can you explain why a VM with no public IP address, reachable only via Bastion, is meaningfully more secure than one with a public IP locked down by an NSG rule?

## Phase 3: Scale Sets and Autoscaling (Week 4-6)

- VM Scale Sets for running a fleet of identical VMs with autoscaling rules based on real metrics (CPU, custom metrics)
- Load Balancer health probes and how a scale set actually removes an unhealthy instance from rotation, then restores it once healthy again
- Complete Portfolio Project 1 (zone-redundant web tier) and Project 2 (autoscaling scale set with golden image) from this course's Projects section
- Scale-out and scale-in rules tuned to real load patterns, not arbitrary thresholds copied from a tutorial

**Checkpoint:** given a scale set configured to scale out at 70% CPU (5-minute average) and scale in at 30% CPU (10-minute average), can you explain why the scale-in threshold uses a longer averaging window than scale-out?

## Phase 4: Cost Optimization and Interview Readiness (Week 6-7)

- Spot VMs for interruption-tolerant workloads, and the real eviction-handling work required (polling the Scheduled Events endpoint, checkpointing before eviction) — not just enabling Spot and hoping
- Mixed On-Demand/Spot allocation policies in a Scale Set for balancing cost against reliability
- Right-sizing based on actual Azure Monitor utilization data, not initial provisioning guesses
- Complete Portfolio Project 3 (cost/resilience-optimized mixed fleet) and review this course's Interview Q&A material, particularly the Availability Set vs. Zone and Spot eviction-handling questions

## Common Pitfalls Specific to Azure VMs

- **Giving every VM a public IP by default** — Azure Bastion (or a jump host) with zero public IPs on workload VMs is the current recommended pattern, not a default public IP plus NSG rules
- **Enabling Spot VMs without implementing real eviction handling** — a workload that doesn't checkpoint or requeue on the 30-second eviction warning will simply lose work when evicted, defeating the cost savings with a reliability cost
- **Confusing Availability Sets and Availability Zones** — Sets protect within one datacenter's fault/update domains; Zones protect across physically separate datacenters, a meaningfully stronger guarantee
- **Rebuilding from a stock marketplace image plus a slow startup script every time** — a golden image via Azure Compute Gallery is both faster to boot and more consistent across instances

## Getting Your First Azure VM-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (zone-redundant Bastion-only access, golden-image autoscaling, cost-optimized Spot/On-Demand mixed fleet)
2. **Resume:** be specific — "reduced batch workload compute cost 55% using a mixed Spot/On-Demand Scale Set with real eviction handling, verified against actual billing data" is far stronger than "experience with Azure VMs"
3. **Know the Availability Set vs. Zone distinction cold:** this is one of the most consistently tested practical Azure infrastructure concepts across interviews
4. **Certifications, if pursuing one:** VMs are foundational to Azure Administrator Associate and Solutions Architect Expert — see this course's own Certification Guide for current format and pricing
