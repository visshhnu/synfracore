# AWS EC2 — Elastic Compute Cloud

**Before you start:** basic AWS familiarity (Regions, AZs, IAM roles) is assumed — see the AWS Core Services Overview and IAM courses first if those are new. No prior virtual-machine administration experience is needed.

EC2 is the backbone of AWS compute. It gives you virtual machines (instances) in the cloud that you can provision in minutes, scale automatically, and pay for only what you use.

## What is EC2?

Amazon EC2 (Elastic Compute Cloud) provides resizable compute capacity in the cloud. An EC2 instance is essentially a virtual machine running on AWS infrastructure, but with cloud-native superpowers: auto-scaling, spot pricing, placement groups, elastic IPs, and deep integration with every other AWS service.

**Analogy** — Think of EC2 like renting a car instead of buying one. Buying a server (on-prem hardware) means paying the full price up front, maintaining it yourself, and being stuck with its capacity even when you don't need it. Renting from EC2's "car lot" means you pick the size you need right now (a `t3.medium` for a quick errand, an `r6i.4xlarge` for hauling a database), return it the moment you're done (stop or terminate the instance, stop paying for compute), and can swap to a bigger or smaller model tomorrow without buying new hardware. AWS owns and maintains the physical fleet; you just check out what you need, when you need it.

**Try it (2 minutes)** — Reason through EC2's stop-vs-terminate distinction without needing console access: if you **stop** an instance overnight and start it again in the morning, its EBS root volume (and therefore your installed software and files) survives — you're just not billed for compute while it's off. If you **terminate** it instead, that same volume is gone by default. Now ask yourself: if you were running a nightly batch job that only needs to exist for 10 minutes a day, would stopping or terminating the instance between runs be the cheaper, safer choice — and why does the answer change if the instance also holds data nothing else has a copy of?

## Instance Types

EC2 has hundreds of instance types organized into families *(needs verification — exact current count grows regularly as AWS releases new generations)*:

| Family | Optimized For | Example | Use Case |
|--------|--------------|---------|----------|
| **t3/t4g** | General (burstable) | t3.medium | Dev/test, small web apps |
| **m6i/m7i** | General balanced | m6i.xlarge | Web servers, app servers |
| **c6i/c7i** | Compute | c6i.2xlarge | CI/CD, batch, web frontends |
| **r6i/r7i** | Memory | r6i.4xlarge | Databases, in-memory cache |
| **i3/i4i** | Storage (NVMe) | i3.xlarge | High I/O databases |
| **p3/p4d** | GPU | p3.2xlarge | ML training, graphics |
| **g4dn/g5** | GPU (inference) | g4dn.xlarge | ML inference, video |

**Naming convention:** `c6i.2xlarge`
- `c` = compute optimized family
- `6` = 6th generation
- `i` = Intel processor (a = AMD, g = Graviton/ARM)
- `2xlarge` = size (8 vCPU, 16 GB RAM)

## EC2 Pricing Models

| Model | Savings vs On-Demand | Commitment | Best For |
|-------|---------------------|------------|----------|
| **On-Demand** | 0% (baseline) | None | Unpredictable, short-term |
| **Reserved (1yr)** | ~40% | 1 year | Steady-state workloads |
| **Reserved (3yr)** | ~60% | 3 years | Long-term stable workloads |
| **Savings Plans** | ~40-60% | 1 or 3 years | Flexible (compute or EC2) |
| **Spot** | ~70-90% | None (interruptible) | Batch jobs, stateless apps |
| **Dedicated Host** | — (premium) | On-demand or reserved | Licensing, compliance |

> 💡 **FinOps tip:** Use Reserved Instances or Savings Plans for your baseline, Spot for burst/batch. Never run all On-Demand in production.

## Core Concepts

```conceptgrid
{
  "boxes": [
    { "title": "AMI", "description": "Template: OS + pre-installed software + config. Custom AMIs can be created from running instances", "color": "blue" },
    { "title": "Security Groups", "description": "Stateful instance-level firewall. Allow-only rules, changes apply immediately", "color": "purple" },
    { "title": "Key Pairs", "description": "SSH public/private key for Linux access. Lose the private key, lose SSH access", "color": "amber" },
    { "title": "Elastic IP", "description": "Static IPv4 that persists across stop/start, unlike the default public IP", "color": "green" }
  ]
}
```

**AMI (Amazon Machine Image)** — Template containing OS, pre-installed software, and configuration. AWS provides official AMIs (Amazon Linux 2023, Ubuntu, Windows Server). You can create custom AMIs from running instances.

**Security Groups** — Stateful virtual firewall at the instance level. Rules are allow-only (no explicit deny). Inbound and outbound rules control traffic. Changes apply immediately.

**Key Pairs** — SSH public/private key pair for Linux instance access. AWS stores the public key, you keep the private (.pem) file. If you lose it, you can't SSH in.

**Elastic IP** — Static IPv4 address for your account. Instances get public IPs by default but they change on stop/start. Elastic IPs persist. Free when attached to running instance, charged when unattached.

**User Data** — Shell script or cloud-init that runs once when instance first boots. Use it to install packages, configure the instance, download code.

## Instance Lifecycle

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Launch", "sublabel": "AMI + instance type chosen", "color": "blue" },
    { "label": "Pending", "sublabel": "AWS provisions the instance", "color": "amber" },
    { "label": "Running", "sublabel": "Billed for compute, can SSH in", "color": "green" },
    { "label": "Stopped", "sublabel": "No compute bill, EBS storage still billed", "color": "slate" },
    { "label": "Terminated", "sublabel": "Permanently deleted, cannot recover", "color": "red" }
  ]
}
```

- **Running** — Billed for compute, can SSH in
- **Stopped** — Not billed for compute (still billed for EBS storage)
- **Terminated** — Permanently deleted, cannot recover
