# AWS EKS Certification Guide

## Primary Certification

**AWS DevOps Engineer Professional (DOP-C02)**

*Format*: 75 questions | 180 minutes | 750/1000 | $300 USD

## Related Certifications

- CKA/CKAD (Kubernetes fundamentals)
- AWS Solutions Architect Professional

## Key Exam Topics

- EKS control plane: managed by AWS, charged separately from worker nodes
- Node groups: Managed (AWS lifecycle) vs Self-managed vs Fargate (serverless pods)
- Karpenter: next-gen node provisioner (right-sizes nodes per pod needs)
- IRSA (IAM Roles for Service Accounts): pod-level AWS permissions
- EKS Add-ons: VPC CNI, CoreDNS, kube-proxy, EBS CSI, AWS LB Controller
- EKS networking: VPC CNI assigns real VPC IPs to pods
- EKS security: OIDC provider, aws-auth ConfigMap, EKS Pod Identity

## Must-Know CLI Commands

```bash
eksctl create cluster --name prod --region us-east-1 --managed
eksctl create nodegroup --cluster prod --name workers --node-type m5.large
aws eks update-kubeconfig --name prod --region us-east-1
eksctl utils associate-iam-oidc-provider --cluster prod --approve
aws eks list-addons --cluster-name prod
```

## Exam Tips

- IRSA: annotate K8s ServiceAccount with role ARN → no static credentials in pods
- EKS Pod Identity (newer): simpler IRSA alternative, no OIDC config needed
- Fargate profile: select pods by namespace/labels → serverless (no node management)
- aws-auth ConfigMap: maps IAM → K8s RBAC (or use EKS access entries)

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
PRIMARY EXAM: AWS DevOps Engineer Professional (DOP-C02)

TOP TOPICS:
  EKS control plane: managed by AWS, charged separately from worker nodes
  Node groups: Managed (AWS lifecycle) vs Self-managed vs Fargate (serverless pods
  Karpenter: next-gen node provisioner (right-sizes nodes per pod needs)
  IRSA (IAM Roles for Service Accounts): pod-level AWS permissions
```
