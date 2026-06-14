# Azure VNets — Interview Questions

**What is the difference between NSG and Azure Firewall?**
NSG (Network Security Group): basic L4 (IP/port) filtering, free, applied to subnet or NIC level, stateful, no logging by default, no threat intelligence. Azure Firewall: managed L4-L7 firewall, supports FQDN filtering (allow/deny by domain name), TLS inspection, threat intelligence-based filtering, centralized logging to Log Analytics, DNAT for inbound, costs ~$1/hr. Use NSG for basic traffic control within VNets; Azure Firewall for centralized egress inspection in hub-spoke topology.

**Explain VNet peering vs VPN Gateway.**
VNet peering: direct private connection between VNets in same or different regions/subscriptions, low latency (backbone network), non-transitive (A↔B and B↔C doesn't mean A↔C), no bandwidth limits, charged per GB. VPN Gateway: connects VNets or on-premises networks via encrypted tunnel over internet, transitive routing possible, bandwidth limited by gateway SKU, costs $0.04/hr. Use peering for Azure-to-Azure; use VPN Gateway for on-premises connectivity or when transitivity is needed.

**What is a private endpoint and why is it needed?**
Private endpoints bring Azure PaaS services (Storage, SQL, Key Vault, etc.) into your VNet via a private IP address. Without private endpoints, PaaS services are accessed over the public internet even from within Azure — your traffic leaves Azure's backbone. With private endpoints: traffic stays completely within Azure's private network, PaaS service is accessible only from within VNet (or peered VNets), public access can be disabled entirely. Required for compliance and security in regulated industries.
