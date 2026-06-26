# FluxCD Interview Q&A

**Q: FluxCD vs ArgoCD?**
Both are CNCF GitOps tools. FluxCD: more Kubernetes-native, composable toolkit (Flux controllers), better multi-tenancy. ArgoCD: better UI, application-centric view, richer health checks. Choice depends on team preference — both solve GitOps.

**Q: What is Flux's image automation?**
Image Reflector Controller scans container registry for new tags. Image Automation Controller writes new tag to Git. Flux then deploys updated image automatically. Fully GitOps — no webhooks needed.

**Q: How does Flux handle multi-tenancy?**
Each team gets a Kustomization pointing to their namespace. Network policies + RBAC restrict cross-namespace access. Flux runs per-namespace service accounts with least privilege.

## Quick Reference — Fluxcd

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

**Q: What is the GitOps reconciliation loop?**
Flux constantly compares desired state (Git) with actual state (cluster). On divergence, it applies the difference. Default interval: 1-5 minutes. Manual sync: `flux reconcile kustomization myapp`.

**Q: How does Flux handle secret management?**
Flux does not manage secrets directly. Use: SOPS (encrypt secrets in Git with age/PGP keys), Sealed Secrets (Kubeseal encrypts, cluster decrypts), or External Secrets Operator (fetch from Vault/AWS SM at runtime). Never commit plaintext secrets to GitOps repo.

**Q: What is a Flux Kustomization vs Kubernetes Kustomize?**
They are different: Kubernetes Kustomize is the kubectl native tool for customising manifests. Flux Kustomization (capital K) is a Flux CRD that watches a Git source and applies manifests. Flux uses Kustomize under the hood but adds health checks, dependency ordering, and automatic sync.

**Q: How do you roll back with Flux?**
Revert the Git commit — Flux will detect the change and apply the previous state. Unlike ArgoCD's rollback command, Flux rollback is always done via Git history. This maintains the GitOps principle: Git is the single source of truth.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
