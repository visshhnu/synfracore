# Azure Virtual Networks Interview Questions

## Core Concepts

**Q: Azure VNet architecture.**

VNet is Azure's private network — isolated, logically. Divided into subnets. Spans one region.

Key components:
- **Subnets**: Divide VNet (public/private/gateway subnets)
- **NSG (Network Security Group)**: Stateful firewall at subnet or NIC level (allow rules)
- **Route Table (UDR)**: Custom routing — force traffic through NVA or VPN
- **VNet Peering**: Connect VNets (same or cross-region) — private, low-latency
- **Private Endpoint**: Private IP for PaaS services (Storage, SQL) within VNet
- **Service Endpoint**: Route PaaS traffic over Azure backbone (no private IP)

---

**Q: NSG vs Azure Firewall.**

**NSG**: Basic stateful filtering at subnet/NIC. Allow rules by port/IP. Free.
**Azure Firewall**: Managed, stateful, full FQDN filtering, threat intelligence. Premium. Central hub.

Use NSG for basic network segmentation. Azure Firewall for centralised, enterprise-grade filtering.

---

**Q: VNet Peering vs VPN Gateway vs ExpressRoute.**

| | VNet Peering | VPN Gateway | ExpressRoute |
|---|---|---|---|
| Connection | VNet-to-VNet (Azure) | On-prem to Azure (internet) | On-prem to Azure (private) |
| Latency | Very low | Higher (internet) | Low (dedicated) |
| Bandwidth | High | Up to 10Gbps | Up to 100Gbps |
| Cost | Per GB transferred | Gateway + data | Circuit + gateway |
| Transitive | No (Hub-spoke with NVA) | No by default | No by default |

Hub-and-spoke: central hub VNet peered to all spokes. Shared services in hub (firewall, DNS, VPN).

---

**Q: Private Endpoint vs Service Endpoint.**

**Service Endpoint**: Traffic to PaaS stays on Azure backbone. Source IP is VNet IP. Resource can restrict to specific VNets. No private IP created.

**Private Endpoint**: Creates NIC with private IP in your subnet. PaaS service gets private IP. DNS resolves to private IP. No internet exposure at all.

Use Private Endpoint for sensitive workloads — completely removes internet exposure.

## Revision Notes
```
VNET: private isolated network. Subnets divide it.
NSG: stateful allow-rules at subnet/NIC (free, basic)
Azure Firewall: managed, centralised, FQDN filtering (premium)

CONNECTIVITY:
VNet Peering: VNet-to-VNet (fast, non-transitive)
VPN Gateway: on-prem over internet
ExpressRoute: on-prem private dedicated circuit (low latency)

Hub-spoke: central hub (shared services) + spoke VNets peered to hub

Private Endpoint: private IP in VNet for PaaS (no internet, DNS resolves private)
Service Endpoint: Azure backbone routing (no private IP, VNet-restricted access)
Use Private Endpoint for sensitive data — complete network isolation
```
