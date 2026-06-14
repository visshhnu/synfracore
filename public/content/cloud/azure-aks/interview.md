# Azure AKS — Interview Questions

**What is AKS and how does it differ from self-managed Kubernetes?**
AKS (Azure Kubernetes Service) is a managed Kubernetes service where Azure handles the control plane — API server, etcd, scheduler, controller manager — you don't manage or pay for these directly. You only manage worker nodes (or use Autopilot-like AKS with node pools). Azure handles: control plane upgrades, health monitoring, OS patching (with node image upgrades), integration with Azure services (AAD, Monitor, ACR, Load Balancer). Self-managed: you run everything, full control, but responsible for all upgrades, HA, and operational overhead.

**How does workload identity work in AKS?**
Workload Identity replaces pod identity and uses OIDC federation. AKS issues OIDC tokens for each service account. Azure Workload Identity validates these tokens and exchanges them for Azure AD tokens. Pods annotated with the correct service account get automatic access to Azure services without storing credentials. Setup: enable OIDC issuer on AKS cluster, create federated identity credential linking the K8s service account to an Azure managed identity, annotate the K8s service account. The Azure SDK auto-discovers and uses the token.

**What are AKS node pools and when would you use multiple?**
Node pools allow different VM sizes, OS types, and configurations in the same cluster. Use cases: system node pool (Standard_D2s_v3, runs Kubernetes system pods), app node pool (Standard_D8s_v3, general workloads), GPU pool (Standard_NC6s_v3, ML training), spot pool (cheap preemptible VMs for batch jobs), Windows pool (for .NET apps needing Windows containers). Use taints and tolerations to control which pods schedule on which pools.
