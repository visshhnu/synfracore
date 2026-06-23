# Azure AKS Certification Guide

## Primary Certification

**AZ-104 Microsoft Azure Administrator**

*Format*: 40-60 MCQ | 3 hours | 700/1000 | $165 USD (AZ-104)

## Related Certifications

- AZ-305 Azure Solutions Architect Expert
- CKA/CKAD (Kubernetes fundamentals)

## Key Exam Topics

- AKS managed control plane: free; pay for worker nodes and other resources
- Networking: Kubenet (overlay, node IPs) vs Azure CNI (pod IPs from VNet subnet)
- Workload Identity: federation between K8s ServiceAccount and Azure AD managed identity
- Node pools: System (critical pods) + User (app workloads); spot node pools for cost
- AKS autoscaler: cluster autoscaler (node scale) + KEDA (pod scale by event)
- Container Insights: AKS monitoring via Azure Monitor Log Analytics workspace
- AKS security: Azure Policy add-on (OPA Gatekeeper), Defender for Containers, private cluster

## Must-Know CLI Commands

```bash
az aks create --name prod-aks --resource-group myRG --node-count 3 --enable-managed-identity --enable-workload-identity --enable-oidc-issuer
az aks get-credentials --name prod-aks --resource-group myRG
az aks nodepool add --cluster-name prod-aks --resource-group myRG --name spotpool --priority Spot --node-vm-size Standard_D4s_v3
az aks upgrade --name prod-aks --resource-group myRG --kubernetes-version 1.29.0
az aks check-acr --name prod-aks --resource-group myRG --acr myregistry
```

## Exam Tips

- Azure CNI recommended: real VNet IPs per pod, better network policy support
- Workload Identity: replaces Pod Identity (deprecated); simpler, more secure
- Upgrade strategy: Blue-green node pools or surge upgrades to minimize downtime
- AKS + ACR: az aks update --attach-acr — grants AKS pull access to container registry

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AZ-104 Microsoft Azure Administrator

TOP TOPICS:
  AKS managed control plane: free; pay for worker nodes and other resources
  Networking: Kubenet (overlay, node IPs) vs Azure CNI (pod IPs from VNet subnet)
  Workload Identity: federation between K8s ServiceAccount and Azure AD managed id
  Node pools: System (critical pods) + User (app workloads); spot node pools for c
```
