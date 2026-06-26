# ArgoCD

> **Declarative GitOps CD for Kubernetes**

**Category:** GitOps  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is ArgoCD?

ArgoCD implements GitOps — Git is the single source of truth. ArgoCD runs inside Kubernetes, watches your Git repo, and ensures the cluster matches what's in Git. No CI system needs cluster credentials. Automatic drift detection and correction.

## Why ArgoCD?

ArgoCD Application CRD defines source (Git repo + path) and destination (cluster + namespace). Sync policy: auto-sync means ArgoCD immediately applies Git changes. Manual sync for production where humans review. AppProject scopes what repos and clusters a team can deploy to.

---

## Learning Modules

### Module 01 — GitOps & ArgoCD Concepts
*Pull-based CD, desired state*

ArgoCD implements GitOps — Git is the single source of truth. ArgoCD runs inside Kubernetes, watches your Git repo, and ensures the cluster matches what's in Git. No CI system needs cluster credentials. Automatic drift detection and correction.

**Topics covered:**

- GitOps principles — 🟢 Beginner
- Push vs Pull deployment — 🟢 Beginner
- ArgoCD architecture — 🟡 Intermediate

### Module 02 — Applications & AppProjects
*Application CRD, RBAC*

ArgoCD Application CRD defines source (Git repo + path) and destination (cluster + namespace). Sync policy: auto-sync means ArgoCD immediately applies Git changes. Manual sync for production where humans review. AppProject scopes what repos and clusters a team can deploy to.

**Topics covered:**

- Application CRD — 🟢 Beginner
- Sync policy (auto/manual) — 🟡 Intermediate
- AppProject for RBAC — 🟡 Intermediate
- Resource health and status — 🟢 Beginner

### Module 03 — Sync Policies & Drift
*SyncOptions, drift detection, self-heal*

Drift = cluster state differs from Git. ArgoCD detects this and shows OutOfSync. Self-heal automatically corrects drift. For production: enable drift detection but consider manual sync to prevent surprise auto-deploys. Prune removes resources deleted from Git.

**Topics covered:**

- Drift detection — 🟡 Intermediate
- Self-heal vs manual intervention — 🟡 Intermediate
- SyncOptions (prune, replace) — 🔴 Advanced
- Resource hooks — 🔴 Advanced

### Module 04 — ApplicationSets
*Multi-cluster, multi-tenant*

ApplicationSets generate multiple Applications from a template. Deploy the same app to 10 clusters with one ApplicationSet. Git directory generator: each folder in repo becomes an Application. Critical for platform teams managing many clusters.

**Topics covered:**

- Cluster generator — 🔴 Advanced
- Git directory generator — 🔴 Advanced
- Matrix generator — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is ArgoCD and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does ArgoCD work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of ArgoCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in ArgoCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with ArgoCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe ArgoCD in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for ArgoCD?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does ArgoCD compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain GitOps & ArgoCD Concepts in ArgoCD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Applications & AppProjects in ArgoCD."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [ArgoCD ApplicationSets](https://argo-cd.readthedocs.io/en/stable/user-guide/application-set/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*