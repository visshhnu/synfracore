# Cloud Fundamentals

Cloud › Cloud Fundamentals
☁️**Cloud Fundamentals**
BeginnerEngineerProductionArchitectCloud computing concepts — IaaS/PaaS/FaaS, shared responsibility, pricing, architecture patterns
[Service Models](#sec-what)[Pricing & Responsibility](#sec-pricing)[Architecture Patterns](#sec-patterns)[Interview Q&A](#sec-interview)


## ☁️ What is Cloud Computing?›


#### Service models — the most important concept to understand first

Before learning AWS or Azure, understand what cloud computing actually is: renting compute, storage, and networking instead of buying hardware. The key question is always: *what do you manage vs what does the provider manage?*


| Model | You manage | Provider manages | Example |
|---|---|---|---|
| On-Premise | Everything | Nothing | Your data centre |
| IaaS | OS, runtime, app, data | Hardware, network, virtualisation | EC2, Azure VM, GCP Compute |
| CaaS | Containers, data | Everything + K8s control plane | EKS, AKS, GKE |
| PaaS | App code, data | OS, runtime, scaling | Elastic Beanstalk, App Service |
| FaaS | Function code, data | Everything else | Lambda, Azure Functions |
| SaaS | Config, user data | Everything | Gmail, Salesforce |


Service models + key cloud conceptsCopy

```

```


## 💰 Pricing Models & Shared Responsibility›


#### Cost optimisation starts with understanding pricing models

**The Most Important Security Concept in Cloud**The shared responsibility model. AWS/Azure/GCP secure their infrastructure. You secure your configuration. The largest cloud breaches in history — Capital One, Twitch, Toyota — were misconfigurations, not cloud provider failures. Public S3 buckets, overly permissive IAM roles, databases accessible from the internet. Know this model cold for any cloud security interview.


Pricing models + shared responsibility modelCopy

```

```


## 🏗️ Architecture Patterns›


Three-tier, microservices, event-driven, serverless, 12-factorCopy

```

```


## ☁️ Cloud Service Models — IaaS, PaaS, SaaS, FaaS›

#### What you manage vs what the cloud manages
| Layer | On-Premise | IaaS | PaaS | SaaS |
|---|---|---|---|---|
| Application | You | You | You | Provider |
| Runtime/Framework | You | You | Provider | Provider |
| OS | You | You | Provider | Provider |
| Virtualisation | You | Provider | Provider | Provider |
| Servers/Hardware | You | Provider | Provider | Provider |

#### Real examples of each model
| Model | What it is | AWS | Azure | When to use |
|---|---|---|---|---|
| IaaS | Rent raw compute — you manage OS, runtime, app | EC2, VPC | Azure VM, VNet | Full control, legacy migration |
| PaaS | Platform manages OS — you manage app and data | RDS, Beanstalk | App Service, Azure SQL | Devs focus on code not infra |
| SaaS | Fully managed software — you just use it | WorkMail | Office 365, Teams | End-user tools |
| FaaS | Serverless — pay per execution | Lambda | Azure Functions | Event-driven, short tasks |
| CaaS | Managed container platform | EKS, ECS | AKS | Containers without managing masters |

**Memory tip:** IaaS = I manage almost everything. PaaS = Platform manages OS. SaaS = Software delivered, I use it. FaaS = Function on demand.


## 🏗️ Deployment Models — Public, Private, Hybrid, Multi-Cloud›

#### Four ways to deploy cloud infrastructure
| Model | What it is | Who uses it |
|---|---|---|
| Public Cloud | Resources on shared provider infrastructure | Startups, SMEs, enterprises |
| Private Cloud | Dedicated cloud on-premise or hosted | Banks, defence, regulated industries |
| Hybrid Cloud | Public cloud + private/on-premise connected | Most large enterprises |
| Multi-Cloud | Multiple public cloud providers simultaneously | Large enterprises, resilience-focused |

#### Hybrid vs Multi-Cloud
**Hybrid**: one cloud + on-premise. Example: SAP on-prem, web tier in Azure, connected via ExpressRoute. **Multi-Cloud**: multiple public clouds. Example: AWS for ML, Azure for enterprise identity, GCP for analytics.


## 🔐 Shared Responsibility Model›

#### Who is responsible for security — you or the cloud?
| Security area | IaaS (EC2/VM) | PaaS (RDS) | SaaS |
|---|---|---|---|
| Physical data centre | Cloud provider | Cloud provider | Cloud provider |
| Hypervisor/hardware | Cloud provider | Cloud provider | Cloud provider |
| Network controls (VPC, NSG) | You | You | Cloud provider |
| OS patching | You | Cloud provider | Cloud provider |
| Application security | You | You | You |
| Data encryption | You | You | You |
| IAM configuration | You | You | You |

**Key point:** Cloud provider secures the infrastructure. You secure everything built on top. A misconfigured S3 bucket exposing data is YOUR responsibility, not AWS's.


## 🚀 Cloud-Native Principles›

#### The principles of cloud-native design
| Principle | What it means | Example |
|---|---|---|
| Stateless | No local state — any instance handles any request | Session in Redis not in memory |
| Containerised | Package app with all dependencies | Docker image with app + runtime |
| Config from env | No config in code — inject via env vars | DATABASE_URL env var not hardcoded |
| Disposable | Start fast, shut down gracefully | K8s restarts pods in seconds |
| Scale horizontally | Add instances not bigger instances | HPA adds pods not bigger pods |
| Observable | Metrics, logs, traces — cannot manage what you cannot see | Prometheus + Loki + Jaeger |
| Automate everything | No manual deployments or config | GitOps, IaC, CI/CD pipelines |

#### Cloud-native vs traditional
| Traditional | Cloud-Native |
|---|---|
| Monolith — one big deployable | Microservices — independent deployables |
| Deploy monthly or quarterly | Deploy multiple times per day |
| Scale vertically (bigger server) | Scale horizontally (more instances) |
| Manual config, manual deploy | IaC + GitOps — everything automated |
| Failure is exceptional | Failure is expected — design for resilience |


## 🎯 Interview Questions›


All
Architect
Engineer
Production


CLOUD · ENGINEER
Explain the shared responsibility model in cloud security with a real example.
The shared responsibility model defines what the cloud provider secures and what you must secure. The cloud provider is responsible FOR the cloud — physical data centre security, hardware, hypervisor, network infrastructure, the managed service itself (RDS engine, S3 service). You are responsible IN the cloud — everything you configure, your data, your application code, your access control. Real example: S3 data breach. AWS guarantees S3 is available and their systems cannot be breached. But if you create an S3 bucket and configure it with public read access, and sensitive customer data leaks — that is entirely your responsibility. AWS did what they promised. You misconfigured it. Another example: RDS PostgreSQL. AWS patches the PostgreSQL engine — that is their responsibility.
