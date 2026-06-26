# Tekton Interview Q&A

**Q: Tekton vs Jenkins vs GitHub Actions?**
Tekton: Kubernetes-native CI/CD — runs as K8s CRDs. No separate server. Pipelines defined as Kubernetes objects. Best for: cloud-native, K8s-centric teams. Jenkins: mature, plugin ecosystem. GitHub Actions: managed SaaS. Tekton has steep learning curve but deep K8s integration.

**Q: What are Tekton's core concepts?**
Task: unit of work (collection of Steps running sequentially). Pipeline: ordered collection of Tasks. TaskRun/PipelineRun: instances of execution. Workspace: shared storage between Tasks. Trigger: start pipeline from external event (GitHub webhook).

**Q: How do workspaces work in Tekton?**
Shared filesystem between tasks. Backed by PVC, ConfigMap, Secret, or emptyDir. Used to pass artifacts between tasks (source code → build → test → deploy).
