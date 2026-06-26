# Tekton Interview Q&A

**Q: Tekton vs Jenkins vs GitHub Actions?**
Tekton: Kubernetes-native CI/CD — runs as K8s CRDs. No separate server. Pipelines defined as Kubernetes objects. Best for: cloud-native, K8s-centric teams. Jenkins: mature, plugin ecosystem. GitHub Actions: managed SaaS. Tekton has steep learning curve but deep K8s integration.

**Q: What are Tekton's core concepts?**
Task: unit of work (collection of Steps running sequentially). Pipeline: ordered collection of Tasks. TaskRun/PipelineRun: instances of execution. Workspace: shared storage between Tasks. Trigger: start pipeline from external event (GitHub webhook).

**Q: How do workspaces work in Tekton?**
Shared filesystem between tasks. Backed by PVC, ConfigMap, Secret, or emptyDir. Used to pass artifacts between tasks (source code → build → test → deploy).

## Quick Reference — Tekton

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

**Q: How does Tekton handle multi-repo pipelines?**
Tekton ClusterTasks and Tasks are Kubernetes CRDs — reusable across namespaces. Tekton Hub provides community tasks. For multi-repo: define tasks in a shared namespace or Tekton catalog, reference from Pipelines in any namespace. EventListeners with Triggers can start PipelineRuns from webhooks across repositories.

**Q: What is Tekton Chains?**
Tekton Chains is a Kubernetes controller for supply chain security. Automatically signs Tekton TaskRun results using Sigstore/Cosign. Creates attestations (provenance) for built artifacts. Stores signatures and attestations in OCI registries or transparency logs. Enables SLSA (Supply chain Levels for Software Artifacts) compliance.

**Q: How do Tekton Triggers work?**
EventListener exposes a webhook endpoint. TriggerTemplate defines what PipelineRun to create. TriggerBinding extracts parameters from the webhook payload. When GitHub sends a push event: EventListener receives it, TriggerBinding extracts branch/commit, TriggerTemplate creates a PipelineRun with those params.

**Q: What are workspaces in Tekton and why are they needed?**
Tasks run in isolated containers — they cannot share files directly. Workspaces provide shared storage: PVC (persistent, multi-task), ConfigMap (read-only config), Secret (credentials), emptyDir (ephemeral within TaskRun). The git-clone task writes to a workspace; the build task reads from the same workspace via PVC.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
