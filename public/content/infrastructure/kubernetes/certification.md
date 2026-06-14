# Kubernetes — Certification Guide

## CKA — Certified Kubernetes Administrator

| Detail | Info |
|---|---|
| **Provider** | CNCF (Linux Foundation) |
| **Cost** | $395 (includes one free retake) |
| **Validity** | 3 years |
| **Format** | Performance-based, 2 hours, hands-on terminal |
| **Passing score** | 66% |

### Domain Breakdown
- **25%** Cluster Architecture, Installation & Configuration
- **15%** Workloads & Scheduling
- **20%** Services & Networking
- **10%** Storage
- **30%** Troubleshooting

### Exam Tips
- You get access to kubernetes.io/docs, helm.sh/docs, and github.com/kubernetes — use them
- Master `kubectl` speed: aliases (`alias k=kubectl`), `--dry-run=client -o yaml`, `kubectl explain`
- Practice on multiple clusters in the same terminal — `kubectl config use-context`
- `kubectl get events --sort-by=.lastTimestamp` is your best friend for troubleshooting
- Time management: skip hard questions, come back — 66% to pass, not 100%

### Best Study Resources
- **KodeKloud CKA course** — most comprehensive, includes labs
- **killer.sh** — 2 free sessions included with CKA purchase, harder than real exam (good)
- **Kubernetes Documentation** — practice navigating during study, same allowed in exam
- **k8s.io/docs/tasks** — quick reference for common operations

---

## CKAD — Certified Kubernetes Application Developer

| Detail | Info |
|---|---|
| **Cost** | $395 (bundle with CKA saves money) |
| **Format** | Performance-based, 2 hours |
| **Focus** | Application deployment, not cluster admin |

### Domain Breakdown
- **20%** Application Design & Build
- **20%** Application Deployment
- **25%** Application Observability & Maintenance
- **25%** Application Environment, Configuration & Security
- **10%** Services & Networking

### CKA vs CKAD — Which First?
- **DevOps/Ops engineers** → CKA first
- **Developers deploying to K8s** → CKAD first
- **Get both** for maximum job market value

---

## KCNA — Kubernetes and Cloud Native Associate
Entry-level, multiple choice, no hands-on terminal. Good for beginners before CKA/CKAD.
Cost: $250 | No prerequisite | Good for: career changers proving K8s knowledge
