# VNets — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Segmented 3-Tier Network with NSGs and ASGs

**Level:** Beginner | **Time:** 2 days

Build a single VNet with web, app, and database subnets, and lock down traffic between tiers using NSGs and Application Security Groups instead of hand-maintained IP lists.

### Steps

1. Draw the network diagram first: one VNet (`10.0.0.0/16`), three subnets (`web`, `app`, `db`), each roughly `/24`
2. Create the VNet and subnets, then deploy one VM per tier (or a VM Scale Set for `web`)
3. Create Application Security Groups (`web-asg`, `app-asg`, `db-asg`) and add each VM's NIC to its tier's ASG
4. Write NSG rules referencing ASGs, not IPs: `web-nsg` allows 443 from `Internet`; `app-nsg` allows its app port only from `web-asg`; `db-nsg` allows its DB port only from `app-asg`
5. Confirm the default `DenyAllInbound` rule blocks everything else, then verify with `az network nic show-effective-nsg` on the `db` VM's NIC that only the `app-asg` rule is in effect
6. Try to connect directly from the `web` VM to the `db` VM's port and confirm it's blocked — only `app` can reach `db`

### Skills Demonstrated

- NSG rule design and priority ordering
- Application Security Groups for identity-based (not IP-based) segmentation
- Verifying effective security rules, not just assuming rules work

### GitHub Repo Name

`azure-vnets-segmented-3tier`

---

## Project 2: Hub-Spoke Topology with Centralized Egress Firewall

**Level:** Intermediate | **Time:** 3 days

Build a hub VNet containing Azure Firewall and two spoke VNets peered to the hub, with all spoke egress traffic forced through the firewall via user-defined routes — the pattern most enterprise Azure landing zones use.

### Steps

1. Create a hub VNet with an `AzureFirewallSubnet` (minimum `/26`) and deploy Azure Firewall with a Firewall Policy
2. Create two spoke VNets (`spoke-a`, `spoke-b`), each with a workload subnet, and peer both to the hub (remember: peering is not transitive, and each direction needs its own peering resource)
3. Create a route table for each spoke workload subnet with a `0.0.0.0/0` route pointing to the firewall's private IP as `VirtualAppliance` next hop, and associate it with the subnet
4. Add firewall network/application rules: allow HTTPS outbound to specific FQDNs only (e.g. `*.ubuntu.com` for updates), deny everything else by default
5. From a VM in `spoke-a`, confirm outbound HTTPS to an allowed FQDN works and outbound to a non-allowed destination is blocked, then check the traffic showed up in Firewall logs
6. Confirm `spoke-a` cannot reach `spoke-b` directly (spokes aren't peered to each other) — only through routes you explicitly add via the hub, if you choose to allow it

### Skills Demonstrated

- Hub-spoke VNet architecture with non-transitive peering
- User-defined routes (UDR) forcing traffic through a network virtual appliance
- Centralized, policy-driven egress filtering

### GitHub Repo Name

`azure-vnets-hub-spoke-firewall`

---

## Project 3: Private Endpoint Architecture for PaaS Isolation

**Level:** Advanced | **Time:** 4 days

Take a Storage Account and an Azure SQL Database that are normally reachable over the public internet and put both fully behind Private Endpoints, with Private DNS Zones resolving their hostnames to VNet-private IPs — no public network access at all.

### Steps

1. Deploy a Storage Account and an Azure SQL Database, initially with public network access enabled, and confirm you can reach both from outside the VNet
2. Create a dedicated subnet for private endpoints, then create a Private Endpoint for the Storage Account (`group-id blob`) and one for the SQL server, both landing in that subnet
3. Create the matching Private DNS Zones (`privatelink.blob.core.windows.net`, `privatelink.database.windows.net`), link each to the VNet, and confirm the DNS records were auto-registered when the private endpoints were created
4. From a VM inside the VNet, resolve the storage account and SQL server hostnames and confirm they now resolve to private IPs in your subnet, not public ones
5. Disable public network access on both the Storage Account and the SQL server, then confirm the VM inside the VNet still connects fine while a client outside the VNet is now rejected
6. Document the difference this made versus using Service Endpoints instead (no private IP, no complete removal of public exposure) and when you'd choose one over the other

### Skills Demonstrated

- Private Endpoint provisioning for PaaS services
- Private DNS Zone integration and verification (not just creation)
- Reasoning about Private Endpoint vs. Service Endpoint tradeoffs with evidence, not assumption

### GitHub Repo Name

`azure-vnets-private-endpoint-isolation`

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
