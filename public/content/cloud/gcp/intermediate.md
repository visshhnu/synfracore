ice account can access. Setup: enable workload pool on cluster, create GCP service account, bind it to the K8s service account, annotate the K8s service account. This is exactly equivalent to AWS IRSA and Azure Workload Identity — the same concept implemented by each cloud provider.

GCP · ARCHITECT
Compare GKE Autopilot vs Standard mode. When do you choose each?
GKE Standard: you configure and manage node pools. You choose machine types, set autoscaling parameters, can SSH to nodes, can run privileged DaemonSets, full control over node-level configuration. You pay per node even when pods are not running. Best for: workloads needing specific node configuration, GPU nodes, needing node-level access for debugging, cost optimisation with custom machine types. GKE Autopilot: Google manages all nodes. No node configuration, no node SSH. You define only pod specs and resource requests. GKE provisions nodes as needed. You pay per pod CPU and memory, not per node — zero cost when no pods running. Best for: teams that do not want to manage nodes, variable workloads that benefit from true scale-to-zero, teams focused on application development not infrastructure. Limitations of Autopilot: some privileged operations not allowed (cannot run DaemonSets, cannot use hostPath volumes), limited to specific machine types. At a startup: Autopilot. At HPE-scale with specific node requirements: Standard.


GCP · ENGINEER
What is the difference between GKE Standard and Autopilot modes?
GKE Standard: you manage the node pools — choose VM type (e2-standard-4, n2-highmem-8), number of nodes, disk size, and OS. Cluster Autoscaler adds and removes nodes based on pending pods. You pay for the VM instances whether pods use them fully or not. Full control: choose GPUs, spot VMs, preemptible instances. GKE Autopilot: Google manages all infrastructure. You never see or configure nodes. You only define pods and their resource requests. Google automatically provisions the right resources for your pods. You pay per pod CPU and memory request — no wasted capacity. Autopilot enforces resource requests on all pods (mandatory), runs pods in a hardened environment, and handles node upgrades transparently. Choose Standard when: you need specific VM types (GPUs, large memory), you run DaemonSets, you have workloads that do not specify resource requests, you want to optimise VM costs with committed use discounts. Choose Autopilot when: you want zero node management, your team is small, you are fine with pod-based pricing, you want automatic security hardening.


GCP · ENGINEER
How does GCP Workload Identity work and how does it compare to AWS IRSA?
GCP Workload Identity links a Kubernetes ServiceAccount to a GCP Service Account, allowing pods to access GCP services without key files. The setup: enable Workload Identity on the GKE cluster (--workload-pool flag). Create a GCP Service Account with the needed permissions. Annotate the Kubernetes ServiceAccount with the GCP SA email (iam.gke.io/gcp-service-account annotation). Add a binding on the GCP SA: allow the K8s SA to impersonate it (roles/iam.workloadIdentityUser). When the pod runs with that K8s SA: GKE automatically injects credentials. The GCP SDK in the pod uses Application Default Credentials (ADC) which queries the GKE metadata server, gets a short-lived token for the GCP SA, and uses it. Comparison with AWS IRSA: identical concept — both use OIDC federation between K8s ServiceAccounts and cloud IAM systems. GCP uses IAM binding on the GCP Service Account. AWS IRSA uses a trust policy on the IAM Role. Azure Workload Identity uses federated credentials on the Managed Identity. All three: zero stored credentials, short-lived tokens, per-pod identity, auditable access.


GCP · ENGINEER
What is Cloud Run and when do you use it instead of GKE?
Cloud Run is a fully managed serverless container platform. You provide a container image, Cloud Run handles: servers, scaling (0 to N, back to 0), load balancing, SSL, custom domains, and upgrades. You pay only when requests are being processed — zero cost when idle. Deploy in seconds with gcloud run deploy. GKE is a managed Kubernetes cluster. You manage node pools, configure networking, install add-ons, and handle pod scheduling. More control, more complexity, more cost. When to choose Cloud Run: stateless HTTP services (REST APIs, webhooks, web apps), event-driven functions (triggered by Pub/Sub, Cloud Storage events), teams that want zero infrastructure management, workloads with variable or bursty traffic where scale-to-zero matters. When to choose GKE: complex microservices with inter-service communication (service mesh), workloads needing DaemonSets, StatefulSets, or Kubernetes-specific features, multi-cloud portability (Kubernetes runs everywhere), teams with existing Kubernetes expertise, GPU workloads (Cloud Run does not support GPUs). The decision is about team complexity tolerance: Cloud Run is simpler but less flexible. GKE is more powerful but requires Kubernetes expertise.


GCP · ARCHITECT
Compare GCP, AWS, and Azure for a multi-cloud Kubernetes deployment.
All three offer managed Kubernetes with similar core capabilities. Key differences for multi-cloud: Networking: GCP VPC is global (one VPC spans all regions). AWS and Azure VPC/VNet are regional (need VPC peering for cross-region). GCP makes multi-region networking simpler. Control plane cost: GCP GKE Standard and Azure AKS are free. AWS EKS charges $0.10/hr per cluster (~$73/month). For many clusters, EKS cost adds up. Identity for pods: GCP has Workload Identity, AWS has IRSA, Azure has Workload Identity — all equivalent in concept, all require configuration. Managed services: GCS, S3, Azure Blob — equivalent. GCP BigQuery (no equivalent — fastest analytics data warehouse). GCP Pub/Sub vs SQS vs Azure Service Bus — similar. Tooling: all three have Terraform providers and Helm chart support. All three work with ArgoCD and FluxCD. For a true multi-cloud deployment using Kubernetes: use the same Kubernetes manifests/Helm charts across all three. Use Terraform with separate provider configs per cloud. Use one ArgoCD instance managing clusters in all three. Service account/identity setup is cloud-specific and the most complex part. Networking between clouds requires either VPN or dedicated interconnect.

Continue Learning
[🟠 AWS](/cloud/aws.html)[🔵 Azure](/cloud/azure.html)[☸️ Kubernetes](/devops/kubernetes.html)[🏠 All Topics](/)

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
