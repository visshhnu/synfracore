# Cloud Fundamentals — Fundamentals

## The hook: the table below is the single most-tested cloud concept there is

Almost every cloud interview question — "what's the difference between IaaS and PaaS," "who's responsible if this bucket leaks data," "why did our bill triple" — is really the same underlying question asked a different way: *who manages what, and who's on the hook when it breaks?* Learn the "you manage / provider manages" table below cold, and most cloud fundamentals questions become restatements of it rather than new material.

## Analogy

Think of the service-model spectrum like renting a car versus taking a taxi versus riding a bus. On-premise is owning the car outright — you buy it, insure it, service it, and drive it yourself. IaaS is renting a car — someone else owns and maintains the vehicle, but you're still driving, fueling, and responsible for parking tickets. PaaS is a taxi — you tell the driver where to go (your code/config) and they handle the vehicle entirely. SaaS is the bus — you just get on and ride a route someone else designed end-to-end. As you move from owning to renting to taxi to bus, you give up control over the vehicle but also give up responsibility for maintaining it — exactly the tradeoff in the table below.

## What is Cloud Computing?

Before learning AWS, Azure, or GCP specifically, understand what cloud computing actually is: renting compute, storage, and networking instead of buying hardware. The key question is always — what do you manage versus what does the provider manage?

| Model | You manage | Provider manages | Example |
|---|---|---|---|
| On-Premise | Everything | Nothing | Your own data centre |
| IaaS | OS, runtime, app, data | Hardware, network, virtualisation | EC2, Azure VM, GCP Compute |
| CaaS | Containers, data | Everything + K8s control plane | EKS, AKS, GKE |
| PaaS | App code, data | OS, runtime, scaling | Elastic Beanstalk, App Service |
| FaaS | Function code, data | Everything else | Lambda, Azure Functions |
| SaaS | Config, user data | Everything | Gmail, Salesforce |

```
Memory tip: as you move down the table, you manage progressively LESS —
IaaS = I manage almost everything.
PaaS = Platform manages the OS.
SaaS = Software delivered, I just use it.
FaaS = Function on demand — I only own the function code.
```

## Pricing Models & Shared Responsibility

**The most important security concept in cloud** is the shared responsibility model: AWS, Azure, and GCP secure their own infrastructure — you secure your configuration. The largest cloud breaches in history — Capital One, Twitch, Toyota — were misconfigurations, not cloud provider failures: public S3 buckets, overly permissive IAM roles, databases directly accessible from the internet. Know this model cold for any cloud security interview.

| Security area | IaaS (EC2/VM) | PaaS (RDS) | SaaS |
|---|---|---|---|
| Physical data centre | Cloud provider | Cloud provider | Cloud provider |
| Hypervisor/hardware | Cloud provider | Cloud provider | Cloud provider |
| Network controls (VPC, NSG) | You | You | Cloud provider |
| OS patching | You | Cloud provider | Cloud provider |
| Application security | You | You | You |
| Data encryption | You | You | You |
| IAM configuration | You | You | You |

**Key point:** the cloud provider secures the infrastructure — you secure everything built on top of it. A misconfigured S3 bucket exposing data is *your* responsibility, not AWS's.

## Architecture Patterns

Common patterns worth recognizing by name, since they recur across every cloud provider's documentation and interview questions alike:

- **Three-tier** — presentation, application, and data layers separated, each independently scalable (the classic web app pattern).
- **Microservices** — an application split into small, independently deployable services communicating over the network, trading operational complexity for independent scaling and deployment.
- **Event-driven** — services communicate via events on a queue/bus (SQS, Pub/Sub, EventBridge) rather than direct calls, decoupling producers from consumers.
- **Serverless** — compute (Lambda, Cloud Functions) provisioned automatically per request, with no server management and pay-per-execution billing.
- **12-factor app** — a set of principles (config in environment variables, stateless processes, logs as event streams) for building applications that deploy cleanly to any cloud environment.

## Cloud Service Models — IaaS, PaaS, SaaS, FaaS

| Layer | On-Premise | IaaS | PaaS | SaaS |
|---|---|---|---|---|
| Application | You | You | You | Provider |
| Runtime/Framework | You | You | Provider | Provider |
| OS | You | You | Provider | Provider |
| Virtualisation | You | Provider | Provider | Provider |
| Servers/Hardware | You | Provider | Provider | Provider |

| Model | What it is | AWS | Azure | When to use |
|---|---|---|---|---|
| IaaS | Rent raw compute — you manage OS, runtime, app | EC2, VPC | Azure VM, VNet | Full control, legacy migration |
| PaaS | Platform manages OS — you manage app and data | RDS, Beanstalk | App Service, Azure SQL | Devs focus on code, not infra |
| SaaS | Fully managed software — you just use it | WorkMail | Office 365, Teams | End-user tools |
| FaaS | Serverless — pay per execution | Lambda | Azure Functions | Event-driven, short tasks |
| CaaS | Managed container platform | EKS, ECS | AKS | Containers without managing masters |

## Deployment Models — Public, Private, Hybrid, Multi-Cloud

| Model | What it is | Who uses it |
|---|---|---|
| Public Cloud | Resources on shared provider infrastructure | Startups, SMEs, enterprises |
| Private Cloud | Dedicated cloud on-premise or hosted | Banks, defence, regulated industries |
| Hybrid Cloud | Public cloud + private/on-premise, connected | Most large enterprises |
| Multi-Cloud | Multiple public cloud providers simultaneously | Large enterprises, resilience-focused |

**Hybrid vs. Multi-Cloud:** hybrid means one public cloud plus on-premise — for example, SAP running on-prem with the web tier in Azure, connected via ExpressRoute. Multi-cloud means multiple public clouds — for example, AWS for ML, Azure for enterprise identity, GCP for analytics, each chosen for a specific strength rather than one provider handling everything.

## Cloud-Native Principles

| Principle | What it means | Example |
|---|---|---|
| Stateless | No local state — any instance handles any request | Session data in Redis, not in memory |
| Containerised | Package the app with all dependencies | A Docker image with app + runtime |
| Config from env | No config in code — inject via environment variables | `DATABASE_URL` env var, not hardcoded |
| Disposable | Start fast, shut down gracefully | K8s restarts pods in seconds |
| Scale horizontally | Add instances, not bigger instances | HPA adds pods, not bigger pods |
| Observable | Metrics, logs, traces — can't manage what you can't see | Prometheus + Loki + Jaeger |
| Automate everything | No manual deployments or config | GitOps, IaC, CI/CD pipelines |

| Traditional | Cloud-Native |
|---|---|
| Monolith — one big deployable | Microservices — independent deployables |
| Deploy monthly or quarterly | Deploy multiple times per day |
| Scale vertically (bigger server) | Scale horizontally (more instances) |
| Manual config, manual deploy | IaC + GitOps — everything automated |
| Failure is exceptional | Failure is expected — design for resilience |

## How the responsibility line moves (diagram)

```
                 IaaS (EC2/VM)   PaaS (RDS)    SaaS (Gmail)
Physical DC         Provider       Provider      Provider
Hypervisor          Provider       Provider      Provider
OS patching          YOU           Provider      Provider
App security          YOU            YOU           YOU
Data / access ctrl     YOU            YOU           YOU

The line between "Provider" and "YOU" moves UP as you go IaaS → PaaS → SaaS,
but "Data / access control" is YOUR responsibility at every single layer —
this is the row most real breaches trace back to (public S3 buckets,
over-permissive IAM), not the layers the provider secures.
```

## Try it yourself (2 minutes)

Pick a service you already use — a managed database, a serverless function platform, or even a SaaS tool at work — and fill in the shared-responsibility table above for it from memory before checking the provider's own shared-responsibility documentation. Specifically ask: "if this leaked customer data tomorrow, whose misconfiguration would it most likely be?" For almost any IaaS or PaaS service, the honest answer is usually your own IAM policy or access configuration, not the provider's infrastructure — which is the entire point of internalizing this table.

## Interview Questions

**Explain the shared responsibility model in cloud security with a real example.**
The shared responsibility model defines what the cloud provider secures and what you must secure. The provider is responsible *for* the cloud — physical data centre security, hardware, the hypervisor, network infrastructure, and the managed service itself (the RDS engine, the S3 service). You are responsible *in* the cloud — everything you configure, your data, your application code, your access control. A concrete example: if you create an S3 bucket and configure it with public read access and sensitive customer data leaks, that's entirely your responsibility — AWS did what it promised (kept S3 itself unbreached); you misconfigured it. Another example: AWS patches the underlying PostgreSQL engine on RDS, but you're responsible for the schema, the queries, and who has database credentials.
