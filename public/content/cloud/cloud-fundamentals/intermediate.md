But if you configure the database to allow connections from 0.0.0.0/0 (the internet), or you choose not to enable encryption at rest, or you use default admin credentials — those are your responsibilities. The model gets more complex with PaaS and SaaS. With Lambda (FaaS), AWS manages the runtime environment and OS patching — you only manage your function code and the IAM permissions you configure. Understanding this model is critical for security architecture: before blaming a cloud breach on the provider, first check what YOU configured.

CLOUD · ARCHITECT
What is the difference between IaaS, PaaS, CaaS, and FaaS? Give a real example of choosing between them.
IaaS gives you virtual machines — you manage the OS, runtime, and everything above. Maximum control, maximum responsibility. Use when: you need specific OS configuration, legacy apps that cannot be containerised, or need direct hardware access. PaaS gives you a runtime platform — deploy code, platform handles OS, scaling, load balancing. Use when: your team should not spend time on infrastructure, simple web apps. CaaS gives you managed Kubernetes — deploy containers, the control plane is managed. Use when: containerised microservices, need K8s capabilities but do not want to manage masters. FaaS gives you function execution — write code, platform handles everything. Use when: event-driven tasks, API endpoints with variable traffic (scales to zero). Real decision example: a payment processing API. IaaS (EC2): team manages OS patches, load balancer config, auto-scaling — significant ops overhead. PaaS (Elastic Beanstalk): simpler, but less control, hard to customise. CaaS (EKS): team deploys Docker containers, K8s handles scheduling and scaling. AWS manages control plane. Right choice for microservices with >3 services. FaaS (Lambda): works for simple stateless APIs but payment processing often has >15 second transactions and stateful requirements. For HPE telecom SRO platform: CaaS (EKS/AKS/OpenShift) is the right choice — complex multi-service system needing full K8s capabilities but managed control plane.


CLOUD · BEGINNER
What is the difference between IaaS, PaaS, and SaaS?
IaaS (Infrastructure as a Service): the cloud provides raw compute, storage, and networking. You manage OS, runtime, and application. You patch the OS, configure security, and handle scaling. Examples: AWS EC2, Azure VMs, GCP Compute Engine. PaaS (Platform as a Service): cloud manages OS, runtime, and middleware. You deploy only your application code. No OS patching. Examples: AWS Elastic Beanstalk, Azure App Service, Google App Engine. Best for developers who want to focus on code not infrastructure. SaaS (Software as a Service): fully managed software over the internet. You configure and use it. Examples: Office 365, Salesforce, Gmail. DevOps relevance: databases should be PaaS (RDS, Azure SQL). Web apps can be PaaS or containers on IaaS. End-user tools are SaaS. The decision is: how much control do you need vs how much management overhead can you offload?


CLOUD · ENGINEER
What is the shared responsibility model and why does it matter?
The shared responsibility model defines what the cloud provider secures versus what the customer secures. The provider is always responsible for physical data centres, hardware, hypervisor, and global network. The customer is always responsible for data, IAM configuration, application security, and encryption. What sits between depends on the service: IaaS — customer also manages OS patching and OS-level firewall. PaaS — provider manages OS, customer manages database access controls and data. SaaS — provider manages almost everything, customer manages user access and data governance. Why it matters: most cloud security breaches are customer-side. Misconfigured S3 buckets, leaked IAM credentials on GitHub, open security groups — these are customer failures. AWS was not breached. The customer misconfigured their setup. In security audits and compliance reviews (PCI-DSS, ISO 27001, HIPAA), you must explicitly document this boundary — what your team is responsible for securing and what the provider handles.


CLOUD · ENGINEER
What are the key principles of cloud-native application design?
Cloud-native means exploiting cloud capabilities fully, not just moving a traditional app to the cloud. Core principles: Stateless services — any instance handles any request, no local state. Session data in Redis. Enables horizontal scaling and zero-downtime deploys. Containerisation — same image runs identically in dev, staging, and production. No more "works on my machine." Config from environment — no hardcoded config. Inject database URLs and API keys via env vars or K8s Secrets. Same image deploys everywhere with different configs. Disposability — design for crash recovery. Start fast, handle SIGTERM gracefully, drain connections before shutdown. Design for failure — any component can fail at any time. Circuit breakers, retries with backoff, multi-AZ redundancy. Observable — metrics, structured logs, distributed traces. Automate everything — IaC, GitOps, CI/CD. No manual steps. The litmus test: can you deploy to production at 2am with full confidence? If yes, you are cloud-native.


CLOUD · ARCHITECT
What is hybrid cloud and when would you design for it?
Hybrid cloud connects on-premise infrastructure with public cloud as one unified platform. Typically connected via dedicated network (AWS Direct Connect, Azure ExpressRoute) not public internet. Main use cases: Data residency compliance — regulations require certain data stays on-premise or in-country. App runs in cloud, sensitive data stays on-premise. Burst to cloud — baseline on owned hardware (cheaper for stable load), peak periods burst to cloud for elastic capacity. Legacy integration — mainframe or ERP cannot move to cloud. New cloud-native apps integrate with it via private connectivity. Gradual migration — some services moved, others not yet, both communicate as one system. Tools: Azure Arc extends Azure management to on-premise VMs and K8s clusters. AWS Outposts runs AWS infrastructure physically in your data centre. GCP Anthos manages on-premise K8s with Google Cloud tools. Difference from multi-cloud: hybrid = on-premise + one cloud. Multi-cloud = multiple public clouds. Most large enterprises are both — legacy on-premise (hybrid) and multiple clouds chosen by different teams (multi-cloud by accident).

Continue Learning
[🟠 AWS](/cloud/aws.html)[🔵 Azure](/cloud/azure.html)[🟡 GCP](/cloud/gcp.html)[🏠 All Topics](/)

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
