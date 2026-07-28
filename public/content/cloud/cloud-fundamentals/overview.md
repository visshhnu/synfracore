# Cloud Fundamentals

> **From on-premise to cloud — core concepts and models**

**Category:** Cloud  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

**Before you start:** no prior cloud experience is required — this is the conceptual entry point for the entire Cloud academy, and every platform-specific course (AWS, Azure, GCP) builds on the vocabulary introduced here.

---

## What is Cloud Fundamentals?

Public cloud: someone else's data center (AWS, Azure, GCP). Private cloud: your own data center with cloud-like operations. Hybrid: both connected. Multi-cloud: intentional use of multiple public clouds. Multi-cloud adds complexity — only adopt for specific strategic reasons.

## Why Cloud Fundamentals?

IaaS: you manage OS upward (EC2, Azure VM). PaaS: you manage only your code (App Service, Cloud Run). SaaS: you use the software (Gmail, Salesforce). Serverless: you manage only functions, no servers. Higher abstraction = less control but less operational burden.

## Why this exists (the hook)

Imagine a company that, every time it needs more office space, has to buy land, get permits, and construct a building — a process taking years, sized for a guess about how big the company will be by the time it's finished. That's what infrastructure looked like before cloud computing: buying servers years ahead of actual demand, racking and patching them yourself, and living with whatever capacity mismatch resulted. Cloud computing is the equivalent of switching to renting flexible office space that expands or shrinks with headcount overnight — the building was already built by someone else, and you only pay for the desks you're actually using this month.

## Analogy

Think of the four deployment models as different ways of getting workspace: **public cloud** is renting desks in a shared coworking space (AWS/Azure/GCP's building, their maintenance staff, you just show up and work). **Private cloud** is leasing your own private floor with cloud-style flexible desk booking, but nobody else's company is in the building. **Hybrid cloud** is keeping your archive room in your own building (on-premise) while your day-to-day team works from the coworking space, connected by a private courier route between the two. **Multi-cloud** is deliberately renting desks in two different coworking chains at once — not because one building isn't good enough, but because one chain has the best conference rooms (a specific service) and the other has a location required by a client contract (a regulatory requirement) — and you accept paying two membership fees and learning two different booking apps for that specific reason.

## How it fits together (diagram)

```
                     DEPLOYMENT MODEL (whose infrastructure?)
   Public Cloud  |  Private Cloud  |  Hybrid  |  Multi-Cloud
   (AWS/Azure/GCP  (your own dedi-   (public +   (2+ public
    shared infra)   cated infra)     on-prem)     clouds)

                     ×

                     SERVICE MODEL (how much do YOU manage?)
   IaaS          PaaS            SaaS           FaaS/Serverless
   (OS upward)   (code + data)   (config only)  (function code only)
   ─────────────────────────────────────────────────────────────►
   MORE control, MORE burden           LESS control, LESS burden

Every real cloud service is one point on this grid:
EC2 = Public Cloud × IaaS.   Gmail = Public Cloud × SaaS.
On-prem SAP + Azure web tier = Hybrid × (IaaS + PaaS mixed).
```

## Try it yourself (2 minutes)

Pick any application you use daily (email, a banking app, a note-taking app) and try to place it on the grid above: is it public/private/hybrid, and is it IaaS/PaaS/SaaS/FaaS from your perspective as a user? For most consumer apps the answer is "public cloud, SaaS" — you have zero visibility into the servers underneath. Now do the same for a hypothetical internal company tool your team might build: would you default to IaaS (a VM you fully control), PaaS (a managed runtime), or FaaS (serverless functions)? There's no single right answer — the exercise is noticing that the decision is really "how much operational burden do we want to own," not a technology preference.

---

## Learning Modules

### Module 01 — Cloud Models
*Public, Private, Hybrid, Multi-Cloud*

Covered above: the four deployment models (public, private, hybrid, multi-cloud) and the coworking-space analogy for how they differ. This module covers each model's actual use cases and tradeoffs in more depth.

**Topics covered:**

- Public cloud advantages — 🟢 Beginner
- Private cloud use cases — 🟢 Beginner
- Hybrid cloud architecture — 🟡 Intermediate
- Multi-cloud strategy — 🔴 Advanced

### Module 02 — Service Models
*IaaS, PaaS, SaaS, Serverless*

Covered above: the IaaS/PaaS/SaaS/FaaS spectrum and the "more control vs. less operational burden" tradeoff underneath it. This module covers each service model's actual boundaries in more depth.

**Topics covered:**

- IaaS — Infrastructure as a Service — 🟢 Beginner
- PaaS — Platform as a Service — 🟢 Beginner
- SaaS — Software as a Service — 🟢 Beginner
- FaaS — Serverless/Functions — 🟡 Intermediate

### Module 03 — Core Concepts
*Elasticity, HA, DR, Cost*

Elasticity: scale up/down automatically based on demand. HA: design for component failure (multi-AZ minimum). DR: business continuity when a region fails. RTO (Recovery Time Objective) = how fast you recover. RPO (Recovery Point Objective) = how much data loss is acceptable.

**Topics covered:**

- Elasticity and auto-scaling — 🟢 Beginner
- High Availability architecture — 🟡 Intermediate
- Disaster Recovery and RTO/RPO — 🔴 Advanced
- Cost optimization strategies — 🟡 Intermediate

---

## Production Example

A team migrating an on-premise, single-data-center monolith runs a phased assessment before touching anything: (1) categorize each workload as rehost ("lift and shift" a VM as-is), replatform (same app, swap to a managed database), or refactor (rearchitect into containers/microservices) — most first migrations should default to rehost for anything not actively being redesigned, since combining a cloud migration with an architecture rewrite multiplies risk. (2) Pick the deployment model deliberately: a regulated workload with data-residency requirements might land on hybrid (keep the database on-premise, move the stateless web tier to the cloud); a workload with no such constraint goes fully public-cloud. (3) Design for the shared responsibility model from day one — encrypt data at rest and in transit, apply least-privilege IAM, and never assume "the cloud provider secures it" covers anything you configured yourself. (4) Only after the first workload is stable and the team has real operational experience does a second cloud provider (multi-cloud) become worth evaluating, and only for a specific driver (regulatory, DR, or a genuinely best-of-breed service) — not by default.

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Cloud Fundamentals and why would you use it in production?"
    **Problem:** Before an engineer can reason about any specific service (EC2, App Service, Compute Engine), they need a vendor-neutral vocabulary for what "the cloud" actually is — otherwise every new provider looks like a completely different subject. **Solution:** cloud computing is renting compute, storage, and networking on demand from someone else's data center, instead of buying and operating your own hardware — the deployment model (public/private/hybrid/multi-cloud) says *whose* infrastructure you're using, and the service model (IaaS/PaaS/SaaS/FaaS) says *how much of the stack* you personally manage versus the provider. **Result:** with those two axes fixed, any specific service on any cloud is just a point on that grid — EC2 and Azure VMs are both "public cloud, IaaS," which is why skills transfer across providers far more than the differing console UIs suggest.

??? question "How does Cloud Fundamentals work internally? Explain the architecture."
    **Problem:** "The cloud" sounds abstract until you can describe the physical/logical layers underneath it. **Solution:** every major provider organizes physical infrastructure into regions (independent geographic areas) containing multiple, physically-isolated availability zones, connected by low-latency private links; on top of that physical layer sits virtualization (the hypervisor that lets one physical machine run many isolated tenants' VMs), and on top of virtualization sit the actual services — IaaS exposes raw compute/storage/network, PaaS adds a managed runtime, SaaS is a finished application. **Result:** this layered architecture is exactly what makes elasticity possible — a provider can pool physical capacity across many customers and allocate it on demand, which no single organization's own data center can do as efficiently at that scale.

??? question "What are the main components of Cloud Fundamentals?"
    **Problem:** A beginner needs the handful of concepts that every cloud provider's documentation assumes you already know. **Solution:** the components are (1) deployment models — public, private, hybrid, multi-cloud, describing whose infrastructure is used and how; (2) service models — IaaS, PaaS, SaaS, FaaS/serverless, describing the management boundary; (3) the shared responsibility model — a fixed line between what the provider secures and what you must secure, which does not move regardless of service model; (4) core operational concepts — elasticity, high availability, disaster recovery (RTO/RPO), and cost optimization, which apply across every provider and every service model. **Result:** these four groupings are the lens for evaluating any new cloud service without having to relearn the whole subject from scratch.

??? question "How do you handle failures in Cloud Fundamentals?"
    **Problem:** Individual components — a VM, a disk, a network link, even an entire data center — will eventually fail; a system designed as if they won't is fragile by construction. **Solution:** high availability means designing for failure rather than trying to prevent it: spread redundant instances across multiple availability zones (not just multiple instances in one zone, which shares a single failure domain), use health checks to detect a failed component automatically, and automate replacement/failover instead of relying on a human noticing. For failures larger than a single AZ, disaster recovery defines explicit RTO (how long you can be down) and RPO (how much data you can afford to lose) targets, and picks a strategy — backup/restore, pilot light, warm standby, or active-active — sized to match those targets rather than "as resilient as possible" with no defined number. **Result:** a well-designed cloud system degrades gracefully under partial failure instead of going fully down.

??? question "What is your production experience with Cloud Fundamentals?"
    **Problem:** This question is really asking whether you've operated a cloud workload under real constraints, not whether you've read about IaaS/PaaS definitions. **Solution (framework to answer with your own specifics):** describe an actual workload's deployment model and service model choices, a real constraint you hit (an unplanned single-AZ deployment that went down during an AZ-level incident, a cost surprise from over-provisioned reserved capacity, a shared-responsibility gap that caused a misconfiguration), and the concrete change you made. **Result:** name the measurable outcome the change produced — this is what separates real operational experience from tutorial-level familiarity; adapt this with your own actual experience rather than fabricating one.

??? question "How do you monitor and observe Cloud Fundamentals in production?"
    **Problem:** Without visibility, elasticity and failure-handling are theoretical — you can't verify a system is actually scaling correctly or failing over correctly without instrumentation. **Solution:** at minimum, track the signals tied directly to the core concepts above — utilization/request metrics to verify elasticity is triggering at the right thresholds, health-check and failover event logs to verify HA is actually kicking in during a real failure (not just passing a synthetic test), and cost/usage dashboards to catch the over-provisioning that erodes elasticity's cost advantage. **Result:** this turns "we designed for HA and elasticity" into something you can actually demonstrate happened, not just something you configured and hoped works.

??? question "What are the security considerations for Cloud Fundamentals?"
    **Problem:** The shared responsibility model is the single most important security concept in cloud computing, and it's also the most commonly misunderstood — some of the largest publicized cloud breaches (Capital One, for example) were customer-side misconfigurations, not provider infrastructure failures. **Solution:** the provider secures *of* the cloud — physical data centers, hardware, hypervisor, and the managed service's own internals; you secure *in* the cloud — everything you configure: IAM permissions, network rules, encryption settings, and application-level access control. This line doesn't move with service model — even in SaaS, you're still responsible for your own configuration and user access, just not the underlying application code. **Result:** treating "the provider will secure it" as covering your own configuration is the single most common root cause of real cloud security incidents.

??? question "How does Cloud Fundamentals compare to alternatives?"
    **Problem:** "The alternative" to cloud computing is running your own infrastructure (on-premise), and the tradeoff is frequently mischaracterized as cloud being unconditionally better. **Solution:** on-premise gives full control and, at sufficiently large and stable scale, can be cheaper than cloud's pay-as-you-go premium — but requires large upfront capital investment, multi-year hardware refresh cycles, and staffing to operate it. Cloud trades that upfront cost and operational burden for elasticity, faster provisioning, and a variable operating cost — at the price of a new failure mode (cost sprawl, misconfiguration) that has to be actively managed. **Result:** the right choice depends on workload predictability, existing capital investment, compliance/data-residency constraints, and team expertise — not a blanket rule that one is always better.

??? question "Explain Cloud Models in Cloud Fundamentals."
    **Problem:** "Cloud" is not one thing — public, private, hybrid, and multi-cloud describe fundamentally different infrastructure arrangements with different tradeoffs, and conflating them causes real architectural mistakes. **Solution:** public cloud runs on shared, provider-owned infrastructure (AWS, Azure, GCP) — the default for most startups and enterprises. Private cloud is dedicated infrastructure, either self-hosted or hosted by a provider exclusively for one organization — common in banking, defense, and other heavily regulated industries with strict control requirements. Hybrid cloud connects one public cloud to an organization's own on-premise infrastructure (for example, SAP running on-prem with a web tier in the public cloud, linked via a private connection). Multi-cloud deliberately uses multiple public cloud providers simultaneously, for a specific reason — best-of-breed services, regulatory data residency, or avoiding a single point of vendor failure — not as a default. **Result:** most organizations should start public-cloud-only and only add hybrid or multi-cloud complexity when a specific, named requirement demands it.

??? question "Explain Service Models in Cloud Fundamentals."
    **Problem:** IaaS, PaaS, SaaS, and FaaS are frequently listed as a memorized sequence without the underlying logic of what actually changes between them. **Solution:** what changes is exactly one thing — how much of the stack you manage versus the provider does. IaaS (EC2, Azure VMs): you manage the OS upward, provider manages the physical hardware and virtualization. PaaS (App Service, Cloud Run): you manage only your application code and data, provider manages the OS, runtime, and scaling. SaaS (Gmail, Salesforce): you configure and use finished software, provider manages everything underneath it. FaaS/serverless (Lambda, Cloud Functions): you manage only individual function code, provider manages everything else, including scaling to zero. **Result:** higher up this stack means less operational control but also less operational burden — the right layer for a given workload depends on how much of that control is actually needed versus how much undifferentiated operational work you'd rather not own.

---

## Official Resources

- [AWS Well-Architected](https://aws.amazon.com/architecture/well-architected/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Google Cloud Architecture](https://cloud.google.com/architecture)