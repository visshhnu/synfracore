# FluxCD Interview Q&A

**Q: FluxCD vs ArgoCD?**
Both are CNCF GitOps tools. FluxCD: more Kubernetes-native, composable toolkit (Flux controllers), better multi-tenancy. ArgoCD: better UI, application-centric view, richer health checks. Choice depends on team preference — both solve GitOps.

**Q: What is Flux's image automation?**
Image Reflector Controller scans container registry for new tags. Image Automation Controller writes new tag to Git. Flux then deploys updated image automatically. Fully GitOps — no webhooks needed.

**Q: How does Flux handle multi-tenancy?**
Each team gets a Kustomization pointing to their namespace. Network policies + RBAC restrict cross-namespace access. Flux runs per-namespace service accounts with least privilege.
