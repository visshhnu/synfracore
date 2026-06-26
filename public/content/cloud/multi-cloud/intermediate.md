Consistent tagging and policy enforcement. |
| Operational overhead | Separate on-call runbooks, separate monitoring, double the expertise required | Unified observability (Datadog or Prometheus federation). Standardised runbook format. |
| Networking latency | Cross-cloud API calls add significant latency compared to intra-cloud | Design workloads as self-contained within one cloud. Use async patterns for cross-cloud. |


#### The honest answer for interviews

Multi-cloud adds significant operational complexity. Only adopt it deliberately when the business benefit (best-of-breed services, resilience, compliance) clearly outweighs the cost. Most medium-sized organisations are better served by one cloud done excellently than two clouds done adequately. If you inherit a multi-cloud situation, standardise with cloud-agnostic tools as the priority.


## 🎯 Interview Questions›


All
Architect
Engineer
Production


MULTI-CLOUD · ARCHITECT
When does multi-cloud make sense and when is it over-engineering?
Multi-cloud makes sense in specific, well-defined scenarios. First: DR with vendor diversity. Primary on AWS, DR on Azure. If AWS has a major regional outage (it has happened), you fail over to Azure. This gives genuine resilience that multi-AZ within one cloud does not provide. Second: regulatory requirements. Some governments mandate data stored with multiple providers, or require geographic distribution across different legal jurisdictions. Third: best-of-breed services. Your analytics team needs BigQuery (GCP). Your K8s runs on AWS. Your enterprise identity is Azure Active Directory. You are already multi-cloud by necessity. Fourth: large enterprise with existing contracts on multiple clouds, separate teams, and the engineering maturity to manage complexity. Multi-cloud is over-engineering when: you are a startup or small team and should master one cloud first. You want to avoid vendor lock-in theoretically but have no concrete plan. Kubernetes does not fully abstract cloud differences — networking, storage, load balancers, IAM all differ significantly. The operational overhead of running two cloud environments is real: two sets of tooling expertise, two sets of monitoring dashboards, two incident response playbooks. My recommendation: start with one cloud, do it excellently. Add a second cloud only when you have a specific documented business requirement that justifies the added complexity.


MULTI-CLOUD · ENGINEER
What is multi-cloud and what are the main reasons organisations adopt it?
Multi-cloud means using services from multiple public cloud providers simultaneously. Different from hybrid cloud (which is on-premise + one cloud). Main reasons: Best-of-breed services — GCP BigQuery has no equivalent in AWS or Azure for analytics speed. Azure Active Directory integrates best with Microsoft 365. AWS has the widest range of managed services. Using each for its strength is rational. Avoid vendor lock-in — with one cloud, the provider controls your pricing. Negotiating is hard when migration would take years. Two clouds creates leverage. Regulatory — some regions require data to be processed by specific providers or kept in country, forcing multi-cloud. Resilience — a major cloud outage (AWS us-east-1 has had multi-hour outages) can take down the entire business if you are single-cloud. Multi-cloud provides geographic and provider redundancy. M&A — after acquisition, two companies on different clouds. Consolidation takes years. The reality: most organisations are multi-cloud by accident (different teams chose different clouds) rather than by strategy. The challenge is managing the complexity: separate IAM systems, different billing models, different CLI tools, double the ops runbooks. Use cloud-agnostic tools (Kubernetes, Terraform, Datadog) to reduce this overhead.


MULTI-CLOUD · ARCHITECT
How do you use Terraform to manage infrastructure across multiple clouds?
Terraform supports multi-cloud through its provider system. Each cloud has a provider (hashicorp/aws, hashicorp/azurerm, hashicorp/google) and each is configured separately in the providers block. In one Terraform codebase you can create an AKS cluster in Azure and an EKS cluster in AWS, manage DNS in Route53, and deploy a GCS bucket — all in the same plan. Structure for multi-cloud Terraform: separate module directories per cloud (modules/aws/, modules/azure/, modules/gcp/). Each module is self-contained and uses only its cloud provider. Root modules compose them together. Separate state per cloud and per environment — azure/production has its own state file, aws/production has its own. Cross-cloud references: Terraform outputs from one module can be used as inputs to another. Example: output the Azure AKS endpoint, use it as the ArgoCD target cluster URL in a Kubernetes provider block. Credentials: each provider gets its own auth — AWS via IAM role/env vars, Azure via service principal, GCP via service account key or application default credentials. In CI/CD: pipelines authenticate to all three clouds, Terraform plan shows changes across all. The risk: a single plan can accidentally destroy resources in multiple clouds. Always review plan output carefully before apply.


MULTI-CLOUD · ARCHITECT
What are the main challenges of multi-cloud and how do you address them?
Skills and knowledge: teams need expertise in multiple clouds. Address by investing in cloud-agnostic skills (Kubernetes, Terraform, Prometheus work the same everywhere) and accepting some cloud-specific expertise per team. Security complexity: each cloud has different IAM models, security services, compliance tools. A misconfiguration in one cloud is harder to detect when you are monitoring multiple dashboards. Address with a CSPM (Cloud Security Posture Management) tool like Prisma Cloud or Wiz — unified security view across all clouds. Data egress costs: moving data between clouds is expensive ($0.08-0.09 per GB). Address by keeping compute close to data — process where data lives, minimise cross-cloud data movement. Operational overhead: separate alerting, separate runbooks, separate on-call procedures. Address with unified observability — Datadog, New Relic, or Prometheus federation pulling from all clouds into one dashboard. Networking latency: cross-cloud API calls add latency. Design so each workload is self-contained within one cloud. Only use cross-cloud for async operations (event queues, batch jobs). The honest answer for interviews: multi-cloud adds significant complexity. Only adopt it when the business benefit (resilience, best-of-breed, compliance) outweighs the operational cost. For most medium-sized organisations, one cloud done well is better than two clouds done poorly.


Continue Learning
[☁️ Cloud Fundamentals](/cloud/cloud-fundamentals.html)[☁️ AWS](/cloud/aws.html)[🏠 Home](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
