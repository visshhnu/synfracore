# Tekton Interview Q&A

**Q: Tekton vs Jenkins vs GitHub Actions?**
Tekton: Kubernetes-native CI/CD — runs as K8s CRDs. No separate server. Pipelines defined as Kubernetes objects. Best for: cloud-native, K8s-centric teams. Jenkins: mature, plugin ecosystem. GitHub Actions: managed SaaS. Tekton has steep learning curve but deep K8s integration.

**Q: What are Tekton's core concepts?**
Task: unit of work (collection of Steps running sequentially). Pipeline: ordered collection of Tasks. TaskRun/PipelineRun: instances of execution. Workspace: shared storage between Tasks. Trigger: start pipeline from external event (GitHub webhook).

**Q: How do workspaces work in Tekton?**
Shared filesystem between tasks. Backed by PVC, ConfigMap, Secret, or emptyDir. Used to pass artifacts between tasks (source code → build → test → deploy).


**Q: How does Tekton handle multi-repo pipelines?**
Tekton ClusterTasks and Tasks are Kubernetes CRDs — reusable across namespaces. Tekton Hub provides community tasks. For multi-repo: define tasks in a shared namespace or Tekton catalog, reference from Pipelines in any namespace. EventListeners with Triggers can start PipelineRuns from webhooks across repositories.

**Q: What is Tekton Chains?**
Tekton Chains is a Kubernetes controller for supply chain security. Automatically signs Tekton TaskRun results using Sigstore/Cosign. Creates attestations (provenance) for built artifacts. Stores signatures and attestations in OCI registries or transparency logs. Enables SLSA (Supply chain Levels for Software Artifacts) compliance.

**Q: How do Tekton Triggers work?**
EventListener exposes a webhook endpoint. TriggerTemplate defines what PipelineRun to create. TriggerBinding extracts parameters from the webhook payload. When GitHub sends a push event: EventListener receives it, TriggerBinding extracts branch/commit, TriggerTemplate creates a PipelineRun with those params.

**Q: What are workspaces in Tekton and why are they needed?**
Tasks run in isolated containers — they cannot share files directly. Workspaces provide shared storage: PVC (persistent, multi-task), ConfigMap (read-only config), Secret (credentials), emptyDir (ephemeral within TaskRun). The git-clone task writes to a workspace; the build task reads from the same workspace via PVC.


