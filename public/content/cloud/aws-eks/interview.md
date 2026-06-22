# AWS EKS Interview Questions

## Core Concepts

**Q: What is EKS? Node options?**

EKS is AWS's managed Kubernetes service. AWS manages the control plane. Cost: $0.10/hr per cluster + EC2 nodes.

Three node options:
- **Managed Node Groups**: AWS manages EC2 lifecycle (patching, replacement on failure). You define instance types.
- **Fargate**: Serverless — no nodes. Pay per pod vCPU+memory. No DaemonSets, limited storage.
- **Karpenter**: Smart node provisioner. Creates right-sized nodes on demand. Spot+On-Demand. Faster than Cluster Autoscaler.

---

**Q: IRSA — IAM Roles for Service Accounts.**

```bash
# Enable OIDC provider
eksctl utils associate-iam-oidc-provider --cluster my-cluster --approve

# Create IAM role bound to K8s service account
eksctl create iamserviceaccount \
  --cluster my-cluster --namespace default \
  --name s3-reader-sa \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
  --approve

# Pods using s3-reader-sa automatically get temporary AWS credentials
# No access keys stored anywhere
```

---

**Q: EKS VPC CNI networking.**

AWS VPC CNI: every pod gets a real VPC IP from the node's ENI (no overlay). Pods are directly routable from VPC.

Limit: pods per node = (ENIs × IPs per ENI) - 1. Enable prefix delegation for more pods:
```bash
aws eks update-addon --cluster-name my-cluster --addon-name vpc-cni \
  --configuration-values '{"env":{"ENABLE_PREFIX_DELEGATION":"true"}}'
# Each ENI slot = /28 prefix = 16 IPs -> many more pods per node
```

---

**Q: EKS security checklist.**

```
Control plane:  Private API endpoint | Audit logging enabled
Nodes:          Private subnets | IMDSv2 required | No SSH (use SSM)
Workloads:      IRSA for AWS access | Pod Security Standards
                Network policies | External Secrets Operator
                ECR image scanning + Falco runtime
```

---

**Q: Karpenter vs Cluster Autoscaler.**

| | Cluster Autoscaler | Karpenter |
|---|---|---|
| Node type | Pre-defined node groups | Any instance type on demand |
| Speed | 2-10 min scale-up | ~30 seconds |
| Spot | Manual mixed groups | Native, automatic fallback |
| Right-sizing | Fixed size groups | Picks optimal size per workload |

## Revision Notes
```
EKS: managed K8s, $0.10/hr control plane + EC2 costs
NODE OPTIONS: Managed Groups (EC2 lifecycle) | Fargate (serverless) | Karpenter (smart provisioner)
IRSA: K8s SA + OIDC -> assume IAM role -> no credentials stored
VPC CNI: real VPC IPs per pod | prefix delegation for more pods per node
KARPENTER: right-sized nodes on demand, fast (~30s), native Spot+OD
SECURITY: private endpoint + private nodes + IMDSv2 + IRSA + network policies
```
