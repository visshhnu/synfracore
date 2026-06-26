# Azure Complete Guide

Cloud › Azure
**Azure**
BeginnerEngineerProductionArchitectMicrosoft Azure — VNet, AKS, Managed Identity, DevOps pipelines
[Fundamentals](#sec-concepts)[RBAC & Identity](#sec-rbac)[VNet](#sec-vnet)[AKS](#sec-aks)[Monitor & KeyVault](#sec-monitor)[DevOps Pipeline](#sec-devops)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## 🔵 Azure Fundamentals›


#### Azure vs AWS — Naming Map

If you know AWS, Azure concepts map directly — the names are different but the architecture patterns are the same.


| AWS | Azure | Purpose |
|---|---|---|
| Region + AZ | Region + Availability Zone | Geographic + datacenter isolation |
| VPC | VNet (Virtual Network) | Private network |
| EC2 | Virtual Machine | Compute |
| S3 | Azure Blob Storage | Object storage |
| IAM Role | Managed Identity | Service identity, no stored credentials |
| EKS | AKS | Managed Kubernetes |
| ECR | ACR (Container Registry) | Container images |
| KMS | Azure Key Vault | Secrets + key management |
| CloudWatch | Azure Monitor + Log Analytics | Monitoring + logging |
| CloudTrail | Azure Activity Log | API audit trail |
| Route 53 | Azure DNS | DNS management |


Azure resource hierarchy and CLICopy

```

```


## 🔐 RBAC and Managed Identities›


#### Azure RBAC Scope

Azure RBAC is scope-based. Assign a role at a high scope and it inherits down. This is more flexible than AWS IAM where you attach policies to individual identities.


RBAC, managed identity, workload identityCopy

```

```


## 🌐 VNet — Networking›


#### Key difference from AWS

In AWS, a subnet exists in exactly one AZ. In Azure, a subnet spans all AZs in the region — you control AZ placement at the resource level (VM availability zone, not subnet). This makes Azure VNet design simpler but AZ redundancy is controlled differently.


VNet, subnets, NSG, peeringCopy

```

```


## ☸️ AKS — Azure Kubernetes Service›


#### AKS vs EKS — Key Differences

|  | AKS | EKS |
|---|---|---|
| Control plane cost | Free | $0.10/hour per cluster |
| Node identity | Managed Identity (Workload Identity) | IRSA (OIDC) |
| Ingress | Application Gateway Ingress Controller or NGINX | AWS Load Balancer Controller |
| Monitoring | Azure Monitor Container Insights (built-in) | CloudWatch Container Insights |


AKS create + workload identity + ACRCopy

```

```


## 📊 Azure Monitor + Key Vault›


#### Azure Monitoring Stack

| Service | Purpose | Query language |
|---|---|---|
| Azure Monitor | Metrics, alerts, dashboards | Metrics Explorer |
| Log Analytics | Centralised log storage and query | KQL (Kusto Query Language) |
| Application Insights | APM — traces, exceptions, custom metrics | KQL |
| Azure Activity Log | All API calls audit trail (CloudTrail equivalent) | KQL |


Azure Monitor queries + Key VaultCopy

```

```


## ⚡ Azure DevOps Pipeline›


#### Azure DevOps vs GitHub Actions

Azure DevOps Pipelines is Microsoft's enterprise CI/CD. Tightly integrated with Azure — uses service connections for Azure auth, Environments for deployment gates, built-in task library for Azure services. GitHub Actions is simpler and more popular for new projects. Azure DevOps is preferred when: already using Azure Repos or Azure Boards, need enterprise audit trails, working in regulated industries.


Azure DevOps pipeline — Terraform + AKSCopy

```

```





## 🏢 Tenant, Subscription & Resource Group — Azure Hierarchy›




#### The Azure hierarchy — most important concept to understand first


Microsoft Azure (the cloud)

└── **Tenant** (your company's Azure AD instance — e.g. contoso.onmicrosoft.com)

└── **Management Group** (optional — groups subscriptions for enterprise policy)

└── **Subscription** (billing + resource boundary — e.g. "Production Subscription")

└── **Resource Group** (logical container — e.g. "rg-upward-production")

└── **Resources** (AKS, Key Vault, ACR, VNet, etc.)


#### Tenant

Your organisation's dedicated instance of Azure Active Directory (now called Microsoft Entra ID). Created when your company signs up for Azure or Microsoft 365. Every user, group, application, Managed Identity, and Service Principal belongs to a Tenant. Identified by a Tenant ID (GUID): `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`.


**Analogy:** Azure is an apartment building. Your Tenant is your company's floor — your own private space with your own security rules. Other companies are on other floors. Azure AD is the security desk for your floor.


#### Subscription

The billing and resource boundary. One Tenant can have many Subscriptions. Common pattern: Dev Subscription, Staging Subscription, Production Subscription — each with its own cost centre and access controls. Resources like AKS clusters and Key Vaults live inside a Subscription.


#### Resource Group

A logical container for related resources. All resources for the production platform go in `rg-upward-production`. Delete the Resource Group and everything inside is deleted. Apply RBAC at the Resource Group level — a developer can have Contributor on the dev Resource Group but only Reader on production.


| Level | Purpose | Example |
|---|---|---|
| Tenant | Identity boundary — owns all identities | contoso.onmicrosoft.com |
| Management Group | Policy at scale — apply to many subscriptions at once | ENBD-AllSubscriptions |
| Subscription | Billing + resource quota boundary | sub-upward-production |
| Resource Group | Lifecycle container — deploy, manage, delete together | rg-upward-prod-uae |
| Resource | Actual service | aks-upward-prod, kv-upward-prod |





## 🔄 GitOps and ArgoCD — The CD Standard›




#### What GitOps is — one sentence

GitOps means Git is the single source of truth for what runs in production. Every change goes through a Git commit. No one runs `kubectl apply` directly on production.


#### The problem GitOps solves

Without GitOps: someone runs `helm upgrade` manually. Someone changes a ConfigMap in the portal. A pipeline runs with a different image tag than what's in Git. Result: nobody knows the true state of production. This is called **configuration drift**.


Developer pushes code → CI builds image → pushes to ACR → **updates image tag in Git**

ArgoCD watches Git → detects new tag → syncs to AKS cluster automatically

If someone manually changes K8s → ArgoCD detects DRIFT → reverts to Git state (self-healing)


#### ArgoCD — the engine that makes GitOps work

ArgoCD runs inside your AKS cluster as pods. You tell it: "watch this Git repo, deploy to this namespace." Every 3 minutes (or instantly via webhook) it checks whether the cluster matches Git. If not — it syncs.


#### ArgoCD key features


- **App-of-Apps pattern** — one ArgoCD Application manages many child applications. One Git repo change can trigger coordinated updates across 20 microservices.

- **Sync waves** — control deployment order. Wave 0: databases. Wave 1: backend services. Wave 2: frontend. Dependencies respected automatically.

- **Drift detection** — compares Git (desired) with cluster (actual). Shows you a diff before you sync.

- **Rollback** — revert the Git commit → ArgoCD applies previous version. No complex procedures.

- **RBAC** — who can sync which applications. Developers can sync dev. Only release team can sync production.


**💡 Real HPE scenario**For Vodafone DU at HPE, ArgoCD managed 50+ pod environments. Every release was a Git tag — ArgoCD synced all environments in the correct wave order. If a deployment failed, rollback was a single git revert. The team had full visibility of what version was running in each environment from the ArgoCD UI. Manual deployments were completely eliminated.





## 🔑 Azure Key Vault — Secrets Management in AKS›




#### Why Key Vault, not Kubernetes Secrets?

|  | Kubernetes Secret | Azure Key Vault |
|---|---|---|
| Encryption | Base64 only (not encrypted at rest by default) | Hardware-backed HSM encryption |
| Audit trail | None | Full access log — who read what, when |
| Rotation | Manual — edit Secret, restart pods | Automatic — CSI driver picks up on pod restart |
| Compliance | Fails banking/PCI audit | Passes banking/PCI/ISO27001 audit |
| Access control | K8s RBAC only | Azure RBAC + Key Vault policies |


#### What Key Vault stores


- **Secrets** — passwords, API keys, connection strings, tokens

- **Keys** — cryptographic keys for encryption/decryption operations

- **Certificates** — SSL/TLS certificates with automatic renewal


#### CSI Driver — How pods access Key Vault

The Secrets Store CSI Driver is a Kubernetes plugin that mounts secrets from external stores (Key Vault, AWS Secrets Manager, HashiCorp Vault) as volumes inside pods.


```
# Step 1: Enable CSI driver add-on on AKS
az aks enable-addons --addons azure-keyvault-secrets-provider \
--name myaks --resource-group myrg

# Step 2: SecretProviderClass — tell CSI what to fetch
apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
name: payment-secrets
namespace: production
spec:
provider: azure
parameters:
clientID: "<workload-identity-client-id>"
keyvaultName: "kv-upward-prod"
tenantID: "<tenant-id>"
objects: |
array:
- |
objectName: database-connection-string
objectType: secret
- |
objectName: payment-api-key
objectType: secret

# Step 3: Mount in Pod
spec:
serviceAccountName: payment-service-sa  # workload identity SA
volumes:
- name: secrets-store
csi:
driver: secrets-store.csi.k8s.io
readOnly: true
volumeAttributes:
secretProviderClass: payment-secrets
containers:
- name: payment-api
volumeMounts:
- name: secrets-store
mountPath: /mnt/secrets   # secrets appear as files here
```


**💡 Corporate design pattern**One Key Vault per environment: kv-upward-dev, kv-upward-staging, kv-upward-prod. Access via Azure AD groups — dev team reads dev vault only. Production pipeline uses Managed Identity. Soft delete + purge protection always enabled. Every secret access logged for compliance audit.





## 🔐 Managed Identity and Workload Identity›




#### Three types of identity — know all three

| Identity Type | What it is | When to use |
|---|---|---|
| System-Assigned MI | Identity created for and tied to one Azure resource. Deleted when the resource is deleted. | AKS cluster managing its own Azure resources (creating LBs, pulling from ACR). One resource, one identity. |
| User-Assigned MI | Standalone Azure resource. Can be attached to multiple resources. Survives resource deletion. | When multiple resources need the same identity, or when identity must outlive compute resources. |
| Workload Identity | Pod-level identity — links a Kubernetes ServiceAccount to a User-Assigned Managed Identity via OIDC federation. | Pods accessing Azure resources (Key Vault, Storage, SQL). The modern replacement for AAD Pod Identity. |


#### How Workload Identity works — step by step

```
# 1. Create User-Assigned Managed Identity
az identity create --name payment-svc-identity --resource-group myrg

# 2. Give it Key Vault permission
az keyvault set-policy --name kv-upward-prod \
--object-id <identity-object-id> \
--secret-permissions get list

# 3. Create K8s ServiceAccount linked to the identity
kubectl annotate serviceaccount payment-service-sa \
azure.workload.identity/client-id=<identity-client-id>

# 4. Federate — "trust tokens from this AKS cluster for this ServiceAccount"
az identity federated-credential create \
--name payment-federation \
--identity-name payment-svc-identity \
--issuer <aks-oidc-issuer> \
--subject system:serviceaccount:production:payment-service-sa
```


#### Why Workload Identity replaced AAD Pod Identity

The old approach (AAD Pod Identity) let any pod claim any Azure identity using node-level labels. A misconfigured pod could claim a high-privilege identity. Workload Identity ties identity to a Kubernetes ServiceAccount — access controlled by K8s RBAC. Only the pods explicitly using that ServiceAccount can get that identity. Much more secure and auditable.


**💡 Interview answer connecting all three**"System-Assigned MI is for the AKS cluster itself — it creates load balancers and pulls from ACR. User-Assigned MI is for shared identities across resources. Workload Identity is for individual pods — each microservice gets its own identity federated with its ServiceAccount. The payment pod proves its identity through token exchange, gets a short-lived token, accesses Key Vault. No secrets stored anywhere. This is the standard I implement in all production AKS environments."





## 📊 Observability — Application Insights, Monitor, Prometheus›




#### Three tools that solve different problems — use all three together

| Tool | What it does best | Answers the question |
|---|---|---|
| Application Insights | APM — request traces, dependency maps, exceptions, user journeys, failure analysis | Why did this API call fail? Which dependency is slow? |
| Azure Monitor | Infrastructure metrics, resource health, log aggregation, alerts | Is my AKS node healthy? Did a deployment succeed? |
| Log Analytics Workspace | Central log store for all Azure resources — query with KQL | What happened across the entire platform in the last hour? |
| Prometheus + Grafana | Custom K8s metrics, fine-grained pod/node metrics, SLO tracking | What is my pod's exact memory usage? Are SLOs being met? |
| OpenTelemetry | Vendor-neutral SDK — instrument once, export anywhere | How do I avoid vendor lock-in on observability? |


#### OpenTelemetry — why it matters

OpenTelemetry is the CNCF standard for application instrumentation. The three signals: **Traces** (end-to-end request journey across microservices), **Metrics** (numeric measurements over time), **Logs** (structured event records). You instrument the application once with the OTel SDK. You configure where to send the data. Today: Application Insights. Tomorrow: Datadog. The application code never changes.


```
# KQL query example — error rate per 5-minute window in Log Analytics
ContainerLog
| where LogEntry contains "ERROR"
| summarize ErrorCount = count() by bin(TimeGenerated, 5m)
| render timechart

# Application Insights — find slowest dependencies
dependencies
| where timestamp > ago(1h)
| summarize avg(duration) by name, type
| order by avg_duration desc
| take 10
```


#### Troubleshooting with Application Insights

Application Insights → Failures blade → drill into failed operation → see the full end-to-end transaction trace → identify which dependency (database, external API, another microservice) failed. Correlate timestamp with Prometheus pod restart metrics. If pods restarted: check kubectl describe pod for OOMKilled. This multi-tool correlation is what experienced engineers do.


## 🎯 Interview Questions›


All
Architect
Engineer
Production


AZURE · ENGINEER
What is the Azure resource hierarchy and why does it matter?
Four levels from top to bottom: Management Groups (org-level governance), Subscriptions (billing + access boundary), Resource Groups (logical container), Resources (actual VMs, VNets, databases). Why it matters: policies and RBAC assigned at any level cascade downward. Assign a policy at Management Group level = applies to ALL subscriptions in the org. Assign a policy at Subscription level = all resource groups in that subscription. This is how enterprises enforce standards across hundreds of teams — tag requirements, region restrictions, VM SKU limits. Resource Groups are the operational unit: all resources in a resource group share a lifecycle. Delete the resource group = delete everything in it. In production: one resource group per application per environment (rg-telecom-sro-prod, rg-telecom-sro-staging).


AZURE · ARCHITECT
What is Azure Managed Identity and when do you use it over service principals?
Managed Identity is Azure's answer to service principals with auto-managed credentials. Two types: System-assigned is created for and tied to one resource, deleted when the resource is deleted. User-assigned is a standalone identity that can be assigned to multiple resources. Use Managed Identity over service principals whenever possible: no credential rotation needed (Azure manages the underlying certificates), no secret to store or leak, permissions are tied to the resource lifecycle. Service principals still needed when: authenticating from outside Azure (on-premises server, GitHub Actions for non-OIDC auth), cross-tenant access, legacy applications. At HPE on Azure: we replaced all service principal secrets in Azure DevOps pipelines with workload identity federation. Zero credentials stored, automatic rotation, complete audit trail.


AZURE · PRODUCTION
AKS pods cannot reach Azure Key Vault. Walk through troubleshooting.
Layered investigation. First: check if Workload Identity is configured correctly. kubectl describe pod and look for the azure.workload.identity/client-id annotation on the service account. Second: check if the managed identity has Key Vault access. az role assignment list --assignee  should show Key Vault Secrets User or Key Vault Reader. Third: check Key Vault access policies or RBAC depending on which model the vault uses. az keyvault show --name my-vault shows if it uses access policies or RBAC. Fourth: check network — is there a Private Endpoint on the vault? If so, is the AKS subnet able to reach the private endpoint subnet? Fifth: check Key Vault firewall — does it have network rules that block the AKS node IPs? Enable Allow Azure services. Sixth: test from inside the pod manually using the workload identity token to call Key Vault API directly. Common issue at HPE: Key Vault had both access policies AND RBAC enabled, and the role assignment was for RBAC but the application was checking access policies.


AZURE · ENGINEER
Explain Azure NSGs vs Azure Firewall vs Application Gateway.
Three different layers of network security. NSG (Network Security Group): stateful layer 4 firewall applied to a subnet or NIC. Allow/deny rules based on IP, port, protocol. No deep packet inspection. Free. Use for: basic inbound/outbound rules between subnets and internet. Azure Firewall: managed stateful firewall at the VNet level. Supports FQDN filtering (allow outbound to *.ubuntu.com but not other internet). Threat intelligence feed. Centralised policy management. Cost: significant. Use for: centralised outbound internet filtering in hub-and-spoke architecture. Application Gateway (with WAF): layer 7 load balancer with Web Application Firewall. SSL termination, URL-based routing, cookie-based session persistence, OWASP rule sets. Use for: web applications needing WAF, SSL offload, HTTP routing. Architecture: NSGs on every subnet (always), Application Gateway/WAF for inbound web traffic, Azure Firewall for centralised outbound control in large enterprises.


AZURE · ARCHITECT
How does hub-and-spoke network topology work in Azure?
Hub-and-spoke is the standard enterprise Azure network architecture. Hub VNet: contains shared services — Azure Firewall for centralised internet filtering, VPN/ExpressRoute gateway for on-premises connectivity, Azure Bastion for jump server access. Spoke VNets: one per application or environment, peered to the hub. Spoke-to-spoke communication goes through hub firewall (gives visibility and control). Benefits: centralised security policy, one gateway for all on-premises connectivity, each spoke team manages their own VNet independently. Implementation: VNet peering from each spoke to hub with UseRemoteGateways enabled so spokes use hub's VPN gateway. Hub has AllowGatewayTransit enabled. Azure Virtual WAN is the managed version of hub-and-spoke — reduces operational overhead but less customisation. At HPE: hub-spoke with 8 spoke VNets per region. Each product team owns their spoke, central networking team owns the hub.


AKS · ENGINEER
What is the primary advantage of AKS over self-managed Kubernetes on Azure VMs?
AKS is a managed Kubernetes service — Azure manages the control plane entirely. This means Azure handles API server availability, etcd backups, control plane upgrades, and HA for the master nodes at no additional charge. You only pay for the worker nodes. With self-managed Kubernetes on VMs, you are responsible for every aspect: provisioning the control plane VMs, configuring etcd clustering, setting up HA for the API server, managing TLS certificates, and running upgrades manually. The trade-off is control vs operational effort. Self-managed gives you full configuration flexibility — specific Kubernetes versions, custom admission controllers, non-standard networking. AKS constrains some of this but removes weeks of operational work. For most prod
