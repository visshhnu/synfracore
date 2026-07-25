# Virtual Machines — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Zone-Redundant Web Tier with Bastion Access

**Level:** Beginner | **Time:** 2 days

Deploy a small web application across two Availability Zones, behind a Load Balancer, with SSH access exclusively through Azure Bastion — no VM in the deployment ever has a public IP address.

### Steps

1. Draw the network diagram first: VNet, an app subnet, a dedicated `AzureBastionSubnet` (/26 minimum), and where the Load Balancer sits
2. Provision the VNet and subnets, then deploy Azure Bastion into its dedicated subnet
3. Create two Linux VMs, one per Availability Zone, each with `--public-ip-address ""` and a system-assigned Managed Identity, bootstrapped via a Custom Script Extension or cloud-init
4. Put a Standard Load Balancer in front of both VMs with a health probe on your app's port
5. Connect to each VM only via `az network bastion ssh` and confirm neither VM is reachable by any other path
6. Kill one VM's web process and confirm the Load Balancer's health probe removes it from rotation, then restores it once the process is back

### Skills Demonstrated

- Availability Zone deployment
- Azure Bastion / zero-public-IP VM access
- Load Balancer health probes

### GitHub Repo Name

`azure-vms-zone-redundant-bastion`

---

## Project 2: Auto-Scaling VM Scale Set with a Golden Image

**Level:** Intermediate | **Time:** 3 days

Build a VM Scale Set that scales automatically on CPU load, where every new instance boots from a custom image you built and versioned in an Azure Compute Gallery — not a stock marketplace image plus a slow startup script.

### Steps

1. Provision a template VM, install and configure your application on it, then generalize it (deprovision + `az vm generalize`)
2. Create an Azure Compute Gallery, an image definition, and capture an image version from the template VM
3. Create a VM Scale Set that deploys from that gallery image (not the marketplace), and confirm boot time is meaningfully faster than a fresh marketplace image plus a Custom Script Extension run
4. Configure autoscale rules: scale out on CPU > 70% (5-minute average), scale in on CPU < 30% (10-minute average), with a `--min-count`/`--max-count` range
5. Load-test the scale set and observe the scale-out event actually happen in the Activity Log, then let load drop and confirm scale-in

### Skills Demonstrated

- Golden-image pipeline (Azure Compute Gallery)
- VM Scale Set autoscaling rules
- Load testing and verifying real scaling behavior, not just configuring it

### GitHub Repo Name

`azure-vms-scaleset-golden-image`

---

## Project 3: Cost- and Resilience-Optimized Mixed Fleet

**Level:** Advanced | **Time:** 5 days

Design a VM Scale Set that mixes On-Demand and Spot instances for a fault-tolerant batch workload, with graceful eviction handling, plus a cost comparison against a same-capacity all-On-Demand deployment.

### Steps

1. Analyze the workload: which parts can tolerate a Spot eviction (batch jobs that can be requeued) and which cannot (anything holding open state)
2. Build a scale set with a mixed allocation policy — a baseline of On-Demand instances plus burst capacity from Spot instances with a `--max-price` cap and `Deallocate` eviction policy
3. Implement eviction handling: poll the Azure Metadata Service's Scheduled Events endpoint (`169.254.169.254/metadata/scheduledevents`) and have the workload checkpoint or requeue its current task on the 30-second eviction warning
4. Set up Azure Monitor alerting on eviction events and scale-set capacity, plus a budget alert in Cost Management
5. Document a real cost comparison: capacity delivered vs. cost for the mixed fleet against a same-capacity all-On-Demand equivalent, using your subscription's actual billing data

### Skills Demonstrated

- Spot VM eviction handling (not just enabling Spot — actually handling the eviction)
- Mixed On-Demand/Spot capacity planning
- Cost governance with real billing data, not estimated figures

### GitHub Repo Name

`azure-vms-spot-mixed-fleet`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. A VM Scale Set that actually scaled out under real load and was witnessed doing it is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
