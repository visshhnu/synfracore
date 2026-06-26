# Helm + Kustomize

> **Kubernetes package manager + configuration overlays**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Helm + Kustomize?

Helm is the package manager for Kubernetes — think apt/yum for K8s. A Chart is a package of K8s YAML templates. A Release is a running instance of a Chart. values.yaml provides configuration; --set overrides values on the command line. Helm tracks releases in the cluster, enabling upgrades and rollbacks with version history.

## Why Helm + Kustomize?

Helm templates use Go templating. .Values references values.yaml. .Release.Name is the Helm release name. _helpers.tpl defines named templates reused across the chart. Use if/else for optional features. range iterates over lists. Always use helm lint before pushing a chart.

---

## Learning Modules

### Module 01 — Helm Fundamentals
*Charts, releases, values*

Helm is the package manager for Kubernetes — think apt/yum for K8s. A Chart is a package of K8s YAML templates. A Release is a running instance of a Chart. values.yaml provides configuration; --set overrides values on the command line. Helm tracks releases in the cluster, enabling upgrades and rollbacks with version history.

**Topics covered:**

- Chart structure (templates, values, Chart.yaml) — 🟢 Beginner
- helm install / upgrade / rollback — 🟢 Beginner
- values.yaml and --set overrides — 🟢 Beginner
- helm repo add / search — 🟢 Beginner
- Release management — 🟡 Intermediate

### Module 02 — Writing Helm Charts
*Templates, helpers, conditionals*

Helm templates use Go templating. .Values references values.yaml. .Release.Name is the Helm release name. _helpers.tpl defines named templates reused across the chart. Use if/else for optional features. range iterates over lists. Always use helm lint before pushing a chart.

**Topics covered:**

- Chart.yaml and directory structure — 🟡 Intermediate
- Template syntax ({{ .Values }}) — 🟡 Intermediate
- _helpers.tpl and named templates — 🟡 Intermediate
- if/else, range, with — 🟡 Intermediate
- NOTES.txt post-install messages — 🟢 Beginner

### Module 03 — Production Helm Patterns
*Diff, secrets, CI/CD integration*

Production Helm usage: always use --atomic to auto-rollback on failure. Use helm diff before upgrade to see exactly what will change. helm-secrets with SOPS encrypts sensitive values and stores them in Git safely. Helmfile declares multiple Helm releases in one file — deploy your entire platform with helmfile sync.

**Topics covered:**

- helm-diff plugin (preview changes) — 🟡 Intermediate
- helm-secrets with SOPS — 🔴 Advanced
- Chart testing with ct — 🔴 Advanced
- Helmfile for multiple releases — 🔴 Advanced

### Module 04 — Kustomize
*Overlay patches, no templating*

Kustomize uses pure YAML overlays — no templating language. Built into kubectl (kubectl apply -k). Base holds the common config; overlays patch it for each environment. Use for your OWN apps where you control the YAML. Use Helm for third-party apps (Prometheus, Nginx) where the chart is provided. Many teams use both: Helm for third-party, Kustomize for their own services.

**Topics covered:**

- Base + overlays pattern — 🟡 Intermediate
- patchesStrategicMerge — 🟡 Intermediate
- kustomization.yaml structure — 🟡 Intermediate
- Images transformer — 🟡 Intermediate
- Helm vs Kustomize decision — 🟢 Beginner

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Helm + Kustomize and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Helm + Kustomize work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Helm + Kustomize?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Helm + Kustomize?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Helm + Kustomize?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Helm + Kustomize in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Helm + Kustomize?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Helm + Kustomize compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Helm Fundamentals in Helm + Kustomize."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Writing Helm Charts in Helm + Kustomize."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Helm Documentation](https://helm.sh/docs/)
- [Artifact Hub — Helm Charts](https://artifacthub.io/)
- [Kustomize Documentation](https://kustomize.io/)
- [Kustomize Reference](https://kubectl.docs.kubernetes.io/references/kustomize/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*