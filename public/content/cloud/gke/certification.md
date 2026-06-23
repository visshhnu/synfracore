# Google GKE & Kubernetes Certification Guide

## Primary Certification

**Google Cloud Professional Cloud DevOps Engineer**

*Format*: 50-60 MCQ | 2 hours | 70%+ | $200 USD

## Related Certifications

- Google Associate Cloud Engineer
- CKA/CKAD (Kubernetes fundamentals)

## Key Exam Topics

- GKE Standard vs Autopilot: Standard (manage nodes) vs Autopilot (pay per pod, Google manages nodes)
- Workload Identity: bind K8s ServiceAccount to GCP service account (no static keys)
- GKE networking: VPC-native clusters (alias IP), private clusters, shared VPC
- Node pools: system (K8s components) + user (app workloads); Spot nodes for cost
- GKE Autopilot: enforces security constraints, optimizes bin packing, no node management
- Cloud Armor: WAF + DDoS protection integrated with GKE Ingress/Load Balancer
- Anthos: hybrid/multi-cloud management (GKE on-premises, AWS, Azure)

## Must-Know CLI Commands

```bash
gcloud container clusters create prod --region us-central1 --enable-ip-alias --workload-pool=PROJECT.svc.id.goog
gcloud container clusters get-credentials prod --region us-central1
gcloud container node-pools create spot-pool --cluster prod --spot --enable-autoscaling --min-nodes 0 --max-nodes 20
gcloud iam service-accounts add-iam-policy-binding gsa@PROJECT.iam.gserviceaccount.com --role roles/iam.workloadIdentityUser --member "serviceAccount:PROJECT.svc.id.goog[NAMESPACE/KSA]"
gcloud container clusters upgrade prod --master
```

## Exam Tips

- Autopilot: best for most teams — no node sizing decisions, enforced best practices
- Spot nodes: 60-91% cheaper; evicted after 24hr or when Spot market needs capacity
- Node auto-provisioning: Standard mode only; creates new node pool sized to pending pod
- Private clusters: no external node IPs; requires Cloud NAT for outbound internet

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
PRIMARY EXAM: Google Cloud Professional Cloud DevOps Engineer

TOP TOPICS:
  GKE Standard vs Autopilot: Standard (manage nodes) vs Autopilot (pay per pod, Go
  Workload Identity: bind K8s ServiceAccount to GCP service account (no static key
  GKE networking: VPC-native clusters (alias IP), private clusters, shared VPC
  Node pools: system (K8s components) + user (app workloads); Spot nodes for cost
```
