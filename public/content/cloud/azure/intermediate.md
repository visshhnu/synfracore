uction workloads: AKS is the right choice. Only choose self-managed if you have specific compliance requirements or need control-plane-level customisation that AKS does not support.


AKS · ENGINEER
What are AKS Node Pools and when do you use multiple node pools?
A Node Pool is a group of virtual machines with identical configuration in an AKS cluster — same VM size, same OS, same Kubernetes version. Every AKS cluster has at least one system node pool (runs kube-system components) and optionally one or more user node pools (runs your workloads). You use multiple node pools when: 1. Different workloads need different VM sizes — ML training needs GPU VMs (NC-series), web APIs need general-purpose VMs (D-series). Put each in its own pool. 2. Cost optimisation — batch/non-critical workloads go on Spot node pools (60-80% cheaper, can be evicted). Critical workloads go on regular (on-demand) pools. 3. OS separation — some workloads need Windows nodes (legacy .NET apps), others need Linux. 4. Isolation — security-sensitive workloads on dedicated nodes using node selectors and taints. In practice: system pool (2-3 nodes, Standard_D2s_v3), app pool (auto-scales 2-20, Standard_D4s_v3), spot pool (batch jobs, 0-10 nodes). Each pool scales independently.


AKS · ENGINEER
What is Workload Identity in AKS and why is it better than using Service Principal credentials?
Workload Identity allows a Kubernetes pod to authenticate to Azure services (Key Vault, Storage, SQL) using a Managed Identity — without any stored credentials. How it works: create a User Assigned Managed Identity in Azure, federate it with a Kubernetes Service Account, annotate the Service Account with the managed identity client ID. When a pod using that Service Account makes an Azure SDK call, it gets a token from the Azure OIDC endpoint automatically. The pod never has a secret, password, or client secret. Why it is better than Service Principal credentials: Service Principal approach stores a client_id and client_secret as a Kubernetes Secret. That secret can be read by anyone with kubectl access to the namespace, can appear in logs, and must be manually rotated. Workload Identity has zero stored credentials — nothing to rotate, nothing to leak, nothing to accidentally commit to Git. If a pod is compromised, the attacker cannot steal a long-lived credential — they can only make calls that the managed identity is authorised for, and only while the pod runs. This is the current Microsoft-recommended approach for AKS-to-Azure authentication.


AKS · PRODUCTION
How do you troubleshoot ImagePullBackOff errors when AKS pulls from Azure Container Registry?
Systematic diagnosis. Step 1: get the exact error. kubectl describe pod pod-name -n namespace — look at Events section. It will say either ImagePullBackOff (retrying after failure) or ErrImagePull (initial failure). The message shows the exact error: unauthorized, manifest not found, or connection refused. Step 2: verify the image reference. Check that the image name and tag in the pod spec exactly match what exists in ACR. Common mistake: image tag does not exist (pushed as v1.2.3, pod spec says latest). az acr repository show-tags --name myregistry --repository myapp confirms available tags. Step 3: check ACR permissions. AKS uses either a managed identity or service principal to pull from ACR. Run: az aks check-acr --name myakscluster --resource-group myrg --acr myregistry.azurecr.io. If permission is missing: az role assignment create --assignee AKS-CLIENT-ID --role AcrPull --scope ACR-RESOURCE-ID. Step 4: check network. If AKS is private and ACR is behind a private endpoint, ensure the AKS subnet can reach the ACR private endpoint. Step 5: check imagePullSecret. If using imagePullSecrets in the pod spec, verify the secret exists and has valid credentials: kubectl get secret regcred -n namespace -o yaml.


AKS · ENGINEER
Explain the difference between System Assigned and User Assigned Managed Identity in Azure.
Both Managed Identity types allow Azure resources to authenticate to other Azure services without credentials. System Assigned: created automatically when you enable it on a resource (VM, AKS, Function App). Its lifecycle is tied to the resource — when you delete the VM, the identity is deleted. Cannot be shared across resources. Good for single-resource scenarios where you want automatic cleanup. User Assigned: created as a standalone Azure resource, independent of any compute resource. Can be assigned to multiple VMs, AKS clusters, or Function Apps simultaneously. Its lifecycle is independent — deleting the VM does not delete the identity. Good for: sharing the same identity across multiple resources (e.g., 10 AKS pods all use the same identity to access Key Vault), pre-creating identities before compute resources exist, and AKS Workload Identity (which requires User Assigned). In AKS: system-assigned identity is used for the cluster itself to manage Azure resources (create load balancers, assign IPs). User-assigned identity is used for pods to access Azure services via Workload Identity.


AKS · ENGINEER
What is the relationship between ACR and AKS? How does AKS authenticate to ACR?
ACR (Azure Container Registry) is where your container images are stored. AKS pulls images from ACR to run as containers in pods. The authentication between them can work three ways. Method 1 — Managed Identity attachment (recommended): az aks update --attach-acr myregistry assigns the AcrPull role to the AKS kubelet managed identity. Nodes pull images automatically without any credentials stored anywhere. Method 2 — Service Principal: AKS authenticates using a service principal that has AcrPull role on the registry. Requires managing and rotating the SP credentials. Method 3 — imagePullSecret: create a Kubernetes Secret containing ACR credentials, reference it in pod spec. Most manual approach, credentials stored in etcd. In production always use Method 1. The flow: pod spec references an image in ACR, kubelet on the node needs to pull it, kubelet uses its managed identity to get an ACR token from Azure AD, pulls the image. The developer never manages any credentials. Common ACR features used with AKS: geo-replication (ACR in same region as AKS for fast pulls), content trust (signed images only), vulnerability scanning (Defender for Containers).


AKS · ARCHITECT
How do you structure Terraform for AKS across multiple environments (Dev, Staging, Production)?
The correct structure uses modules + environment workspaces or directories. Recommended approach — separate environment directories with shared modules. Root structure: modules/aks/ (reusable AKS module), modules/acr/, modules/networking/. Environment directories: environments/dev/main.tf, environments/staging/main.tf, environments/production/main.tf. Each environment's main.tf calls the modules with environment-specific variables: module aks { source = ../../modules/aks, cluster_name = aks-production, node_count = 5, vm_size = Standard_D4s_v3 }. Environment-specific tfvars files hold the variable values. Remote state: each environment has its own state file in Azure Blob Storage — never share state between environments. Separate storage accounts per environment prevents a corrupted dev state from affecting production. CI/CD: separate pipelines per environment. Dev pipeline runs on every push. Staging on merge to main. Production requires manual approval. State locking prevents concurrent applies. Never run terraform apply manually on production — always through the pipeline with audit trail.


AKS · ENGINEER
Which Kubernetes workload type is best for a database like MongoDB and why?
StatefulSet. Databases require two things that regular Deployments cannot provide: stable network identity and persistent storage per pod. With a Deployment, when a pod restarts it gets a new name (app-7d8f9-xyz → app-9k3m-abc) and potentially attaches to a different PVC. MongoDB replica sets identify members by hostname — if the hostname changes, the replica set breaks and data can be lost or the replica set cannot re-form. With a StatefulSet: pods get stable, predictable names (mongo-0, mongo-1, mongo-2) that persist across restarts. Each pod gets its own PVC (volumeClaimTemplate creates a dedicated PVC per pod). Pods start and terminate in order — mongo-0 starts before mongo-1, which matters for MongoDB primary election. When mongo-1 restarts, it comes back as mongo-1 with the same PVC containing its data. The headless service (clusterIP: None) provides DNS entries per pod: mongo-0.mongo-svc.namespace.svc.cluster.local — MongoDB uses these to find replica set members. In production: use a StatefulSet with 3 replicas (1 primary, 2 secondaries), dedicated SSD storage class, pod disruption budget allowing maximum 1 unavailable, and pod anti-affinity to spread replicas across availability zones.


id="sec-roadmap">

## 🗺️ Roadmap›





Week 1
Foundations

Azure free account
Resource hierarchy: MG > Sub > RG > Resource
RBAC: Owner, Contributor, Reader
Create VM, VNet, NSG



Week 2
Core Services

AKS cluster + kubectl access
Managed Identity + Key Vault
ACR — build and push container
Azure Monitor + Log Analytics



Week 3-4
Production Patterns

Workload Identity for pods
Hub-spoke VNet architecture
Azure DevOps pipeline
Terraform for Azure infra



AZURE · BEGINNER

What is an Azure Tenant and why does it matter?

A Tenant is your organisation's dedicated instance of Azure Active Directory (Microsoft Entra ID). When your company signs up for Azure, Microsoft creates a Tenant — your private space for managing all identities (users, groups, Managed Identities, Service Principals). Everything in Azure is tied to a Tenant. Identified by a Tenant ID (GUID). Where Tenant ID is used: Workload Identity federation setup, Service Principal authentication, Key Vault CSI SecretProviderClass, Azure CLI login with az login --tenant. The Tenant contains Subscriptions (billing boundaries), which contain Resource Groups (logical containers), which contain Resources (AKS, Key Vault, ACR). Understanding this hierarchy is critical — RBAC is applied at any level, and permissions flow down.



AZURE · ENGINEER

What is the difference between Application Insights and Azure Monitor?

Azure Monitor is the platform — it collects metrics and logs from all Azure infrastructure: AKS nodes, VMs, databases, network. It is the foundation. Application Insights is built on top of Azure Monitor and focuses on application performance monitoring — request rates, failure rates, response times, dependency tracking (which database call is slow?), exception details, and user journey analysis. In practice: I use Azure Monitor for infrastructure health questions (is my AKS node healthy? did a deployment succeed?) and Application Insights for application health questions (why did this API fail? what is the P99 latency of the checkout endpoint?). Both feed into a Log Analytics workspace where I query everything with KQL. In a production incident: Application Insights shows me the failed request with full stack trace, Azure Monitor shows me whether any infrastructure event (node restart, scaling) coincides with the failure time.



AZURE · ENGINEER

How do Workload Identity, Managed Identity, and Service Principal differ? When do you use each?

Service Principal is an application identity in Azure AD with a client_id and client_secret. The secret must be stored, rotated, and can leak. Use when Managed Identity is not available — GitHub Actions, on-premises tools, third-party services. System-Assigned Managed Identity is tied to a specific Azure resource (one AKS cluster, one VM). Azure manages the lifecycle — created and deleted with the resource. No secret to manage. Use for the AKS cluster itself accessing ACR or creating load balancers. User-Assigned Managed Identity is a standalone Azure resource that can be attached to multiple resources. Survives resource deletion. Use when multiple resources share an identity, or when identity must persist independently. Workload Identity is pod-level identity — it federates a Kubernetes ServiceAccount with a User-Assigned Managed Identity through Azure AD OIDC. When a pod needs to access Key Vault, it uses its ServiceAccount token, exchanges it for an Azure AD token, and accesses the resource. Zero stored credentials anywhere. This is the production standard for pods accessing Azure services.



AZURE · ENGINEER

Explain the full Azure + AKS integration architecture for a production platform.

Developer pushes code to GitHub or Azure Repos. Azure DevOps Pipeline or GitHub Actions runs CI: build → test → scan (Trivy for CVEs) → push Docker image to ACR → update image tag in Git (Helm values file). ArgoCD running inside AKS detects the Git change and syncs: pulls new image from ACR using the kubelet Managed Identity (no credentials), deploys to the correct namespace. The pod starts: CSI driver authenticates to Key Vault using the pod's Workload Identity, fetches secrets, mounts as files at /mnt/secrets. Application runs, its calls flow through the Application Gateway Ingress Controller. HPA scales pods based on CPU/memory. Cluster Autoscaler adds nodes when pods are Pending. Application Insights collects traces. Azure Monitor collects infrastructure metrics. Prometheus collects K8s-specific metrics. Everything feeds into a Log Analytics workspace. Security: Azure AD controls cluster access, Key Vault CSI for secrets, Defender for Containers scans images and monitors runtime.



AZURE · PRODUCTION

How do you set up zero-downtime deployments in AKS?

Three layers working together. Layer 1 — rolling update strategy: set maxUnavailable: 0 (no pod goes down until replacement is ready) and readinessProbe on every container. Kubernetes only routes traffic to pods that pass the readiness check. The new pod must be ready before the old pod is terminated. Layer 2 — PodDisruptionBudget: ensures minimum number of pods stay alive during node maintenance or cluster upgrades. Prevents all pods being evicted simultaneously. Layer 3 — graceful shutdown: lifecycle.preStop hook with a sleep of 5-15 seconds before the pod stops. This gives the load balancer time to drain existing connections before the pod accepts no new ones. For higher-risk releases: use ArgoCD Rollouts or Flagger for canary deployments — send 10% of traffic to new version, monitor error rate in Application Insights, auto-progress if below threshold or auto-rollback if above. This is what I implement for production releases.



AZURE · ENGINEER

What is NSG and Application Gateway? How are they used with AKS?

NSG (Network Security Group) operates at Layer 3/4 — it is Azure's firewall for network traffic. It contains allow/deny rules based on source/destination IP, port, and protocol. Applied to subnets or individual network interfaces. In AKS: NSG on the node subnet controls what traffic reaches the nodes. Typical rules: allow HTTPS from internet to Application Gateway subnet, deny all direct access to node subnet from internet, allow internal VNet communication. Application Gateway operates at Layer 7 — it understands HTTP/HTTPS. It provides: SSL termination (certificate managed in Key Vault), URL-based routing (/api/payments to payment service, /api/orders to order service), Web Application Firewall (WAF blocks OWASP Top 10 attacks), health probes, session affinity. Application Gateway Ingress Controller (AGIC) integrates Application Gateway as the Kubernetes Ingress controller — Kubernetes Ingress rules automatically configure Application Gateway routing rules. The combination: internet traffic → Application Gateway (WAF + SSL + routing) → AKS pods. NSG protects the perimeter, Application Gateway handles intelligent routing.



AZURE · ARCHITECT

How do you design secrets management for a production AKS platform?

Defence in depth with five layers. Layer 1: no secrets in code or Git — enforce with git-secrets or truffleHog in pre-commit hooks and pipeline scans. Layer 2: Azure Key Vault as the single secrets store — one vault per environment (kv-prod, kv-staging, kv-dev), soft delete and purge protection enabled, RBAC via Azure AD groups. Layer 3: Workload Identity for pod authentication to Key Vault — no stored credentials anywhere. Each microservice has its own User-Assigned Managed Identity with minimum permissions — payment service can read payment secrets only, not database admin passwords. Layer 4: CSI driver mounts secrets as files (not environment variables where possible — env vars can leak into logs). Layer 5: secret rotation — when a secret rotates in Key Vault it is picked up on the next pod restart, and I configure automatic rotation policies. Every secret access is logged in Key Vault audit logs — satisfying compliance requirements. Variable Groups in Azure DevOps linked to Key Vault for pipeline secrets — no copy-paste.



AZURE · PRODUCTION

AKS pod is in ImagePullBackOff. Walk through your troubleshooting steps.

Step 1: kubectl describe pod pod-name -n namespace — look at Events section. It shows the exact error: unauthorized (permission issue), manifest unknown (wrong tag), no such host (network issue). Step 2: Verify the image reference exactly matches what exists in ACR — wrong tag is the most common cause. Use az acr repository show-tags --name myregistry --repository myapp to list actual tags. Step 3: Check ACR permissions. Run az aks check-acr --name myakscluster --resource-group myrg --acr myregistry.azurecr.io. If permission missing: az role assignment create --assignee AKS-KUBELET-IDENTITY-ID --role AcrPull --scope ACR-RESOURCE-ID. Step 4: Check network. If AKS is private and ACR has private endpoint, verify the AKS subnet can reach the ACR private endpoint. Check NSG rules. Step 5: If using imagePullSecrets: kubectl get secret regcred -n namespace and verify it contains valid credentials. Step 6: If image was recently pushed, wait 60 seconds — ACR geo-replication needs time to sync.



AZURE · ENGINEER

How do you integrate Azure DevOps Variable Groups with Key Vault?

In Azure DevOps: Pipelines → Library → Variable Groups → Link secrets from Azure Key Vault. Select the Key Vault and the subscription service connection. Choose which secrets to expose as pipeline variables. Every secret in Key Vault becomes available in the pipeline as a variable — no manual copy-paste, no hardcoded values. When the secret rotates in Key Vault, the pipeline picks it up on the next run automatically. The pipeline accesses the Variable Group with: variables: - group: production-secrets. Secrets are masked in pipeline logs. For the service connection authenticating to Key Vault, I use Workload Identity Federation — Azure DevOps proves its identity using OIDC tokens, no stored client secret. This is the cleanest secrets pattern for Azure DevOps pipelines — Key Vault is the single source of truth for all secrets in both the application and the pipeline.



AZURE · PRODUCTION

AKS cluster nodes are at 90% CPU. What do you do?

Immediate diagnosis: kubectl top nodes to confirm which nodes are saturated. kubectl top pods --all-namespaces --sort-by=cpu to find the culprit pod. kubectl describe pod for the top consumer — check if it has resource limits set. If no resource limits: the pod can consume all CPU on the node, starving other pods. Immediate fix if one pod is consuming everything: kubectl delete pod (it respawns with fresh state, usually resolves runaway processes). Check HPA status: kubectl get hpa --all-namespaces — is HPA trying to scale out and hitting a max replicas limit? Check Cluster Autoscaler: kubectl logs -n kube-system -l app=cluster-autoscaler — is CA failing to provision new nodes? Check Azure VM quota — might have hit subscription limit. Short-term: add resource requests and limits to the runaway deployment. Long-term: tune HPA min/max replicas, verify CA max node count is appropriate, add node pool with larger VMs if workload genuinely needs more capacity. Enable Azure Monitor alerts on node CPU > 80% so you get alerted before it hits 90%.


Continue Learning
[🟠 AWS](/cloud/aws.html)[☸️ Kubernetes](/devops/kubernetes.html)[🔷 Terraform](/devops/terraform.html)[🏠 All Topics](/)

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
