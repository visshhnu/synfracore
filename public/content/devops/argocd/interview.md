# ArgoCD & GitOps Interview Q&A

eploy this first
```

---

**Q3. What is the difference between ArgoCD Sync and ArgoCD Health?**

**A:**
- **Sync status** — does the live cluster state match what Git says?
  - Synced = cluster matches Git
  - OutOfSync = difference detected (manual change or new Git commit not applied)

- **Health status** — is the deployed application actually working?
  - Healthy = all resources running correctly (pods Running, deployments available)
  - Degraded = something is wrong (pods CrashLooping, deployment stalled)
  - Progressing = currently rolling out

**Critical point:** An app can be Synced but Degraded — ArgoCD applied the manifests successfully but the pods are crashing. These are separate concerns.

**Where configured:** Health checks are built-in for standard K8s resources. Custom health checks can be defined in argocd-cm ConfigMap.

**Real challenge:** A deployment is Synced + Degraded — pods CrashLooping. Root cause: new image has a bug. Solution: `git revert` the image tag change → ArgoCD auto-syncs back to previous working version.

---

**Q4. What is App-of-Apps pattern in ArgoCD? When do you use it?**

**A:** App-of-Apps is a pattern where a root ArgoCD Application points to a Git directory containing multiple other Application YAML files. When ArgoCD syncs the root, it creates all child applications automatically.

Use when:
- Managing 10+ microservices
- Bootstrapping a new cluster (one command deploys everything)
- Multi-team environments where each team owns their Application YAML

**Where configured:**
```
gitops-repo/
├── apps/                          ← root app points here
│   ├── payment-service-app.yaml   ← ArgoCD Application for payment
│   ├── order-service-app.yaml     ← ArgoCD Application for orders
│   └── user-service-app.yaml      ← ArgoCD Application for users
```

**Real challenge:** Deletion cascade. If root app is deleted with cascade delete enabled — ALL child apps and their K8s resources are deleted. Always verify cascade delete setting before removing root app.

---

**Q5. How do you handle secrets in a GitOps workflow? You cannot put secrets in Git.**

**A:** Three patterns — in order of preference for enterprise:

**Pattern 1 — Sealed Secrets (most GitOps-friendly):**
- Encrypt secret with cluster's public key → commit encrypted SealedSecret to Git
- Sealed Secrets controller in cluster decrypts it → creates K8s Secret
- Safe to commit encrypted value — only the cluster can decrypt

**Pattern 2 — External Secrets Operator:**
- ExternalSecret CRD in Git references Azure Key Vault secret by NAME (not value)
- External Secrets Operator fetches actual value from Key Vault at runtime
- Secret value never in Git — only the reference

**Pattern 3 — Key Vault CSI Driver:**
- SecretProviderClass in Git references Key Vault secret name
- CSI driver fetches secret when pod starts
- Best for AKS environments

**Where configured:** SecretProviderClass or ExternalSecret YAML in GitOps repo. Actual secret values in Azure Key 

**Q: ArgoCD vs FluxCD?**
Both are CNCF GitOps tools. ArgoCD: better UI, application-centric, pull-based, rich health checks, multi-cluster from one control plane. FluxCD: more Kubernetes-native, GitOps toolkit composable, better multi-tenancy. ArgoCD is more popular for teams wanting UI visibility.

**Q: What is App of Apps pattern?**
A root ArgoCD Application manages a set of ArgoCD Applications. Enables bootstrapping entire clusters from Git. The root app watches a directory of Application manifests — ideal for multi-team environments.

**Q: How does ArgoCD handle secrets?**
ArgoCD itself doesn't manage secrets — it applies what's in Git. For secrets: use Sealed Secrets (encrypt in Git, decrypt in cluster), External Secrets Operator (fetch from Vault/AWS SM), or SOPS. Never commit plaintext secrets to the GitOps repo.
