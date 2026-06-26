# ArgoCD — Multi-Cluster, App of Apps & Progressive Delivery

: deployments
notifications.argoproj.io/subscribe.on-sync-failed.slack: alerts
notifications.argoproj.io/subscribe.on-health-degraded.slack: alerts
```


#### Git webhook for instant sync (not polling)

By default ArgoCD polls Git every 3 minutes. For instant sync on push: configure a webhook in GitHub/GitLab pointing to `https://argocd.example.com/api/webhook`. ArgoCD receives the push event and syncs immediately — sub-second response to Git changes.


## 🌐 Multi-Cluster Management with ArgoCD›


#### One ArgoCD managing many clusters

ArgoCD runs in one cluster (the management cluster) but can deploy to many target clusters. This is the standard enterprise pattern — one ArgoCD instance manages dev, staging, production, and regional clusters.


#### Register a cluster

```
# Login to ArgoCD
argocd login argocd.example.com

# Add a new cluster (must have kubeconfig context set up)
argocd cluster add production-cluster-context --name production

# List registered clusters
argocd cluster list
```


#### Hub-and-spoke architecture


Management Cluster

└── ArgoCD (the hub)

├── deploys to → Dev Cluster (spoke)

├── deploys to → Staging Cluster (spoke)

├── deploys to → Production EU Cluster (spoke)

└── deploys to → Production US Cluster (spoke)


#### Security for multi-cluster

ArgoCD creates a ServiceAccount in each target cluster with the minimum permissions needed to deploy the resources defined in Applications. The credentials are stored as Kubernetes Secrets in the ArgoCD namespace. Use ArgoCD Projects to restrict which Applications can deploy to which clusters — Production project can only deploy to production cluster, accessed only by the release team.


## 🎯 Interview Questions›


All
Architect
Engineer
Production


ARGOCD · ARCHITECT
What is GitOps and how does ArgoCD implement it?
GitOps is an operational model where Git is the single source of truth for infrastructure and application state. Every change to a production system happens through a Git commit and PR review — no direct kubectl apply, no console clicks, no shell scripts run manually. ArgoCD implements GitOps by continuously watching a Git repository. Every 3 minutes (default), ArgoCD fetches the desired state from Git and compares it with the actual state of the Kubernetes cluster. If they differ (sync needed), ArgoCD can automatically apply the Git state to the cluster. The critical shift: developers push to Git. ArgoCD pulls and applies. Nobody needs direct cluster credentials. Every deployment is a commit with author, timestamp, and review. Rollback is git revert — takes 2 minutes instead of 30. Drift detection: if someone manually kubectl applies something, ArgoCD marks the app as OutOfSync and can revert it automatically with selfHeal: true. At HPE: ArgoCD manages all telecom platform deployments. When a microservice update causes issues, rollback is git revert the image tag change. ArgoCD applies it within 3 minutes.

ARGOCD · ENGINEER
What is the App of Apps pattern in ArgoCD?
App of Apps is a pattern where a parent ArgoCD Application watches a directory in Git that contains other Application YAML files. The parent app manages the child apps. When you commit a new Application YAML file to that directory, ArgoCD automatically creates and manages that new application. Use App of Apps when: you have many services (10+) and want to manage them consistently, you want a single sync to bootstrap an entire environment, or you want ArgoCD to manage its own applications (self-managing). The directory structure: argocd/production/ contains: sro-app.yaml, com-app.yaml, monitoring.yaml. The parent app watches that directory. Adding a new service is just adding a new YAML file. Promoted from HPE design: we bootstrap staging with one parent app sync that creates 15 child applications in the right order using sync waves. Complete environment up in under 10 minutes.

ARGOCD · PRODUCTION
ArgoCD application is OutOfSync. Walk through diagnosis and fix.
OutOfSync means the actual cluster state differs from what is in Git. Step 1: identify what is different. argocd app diff app-name shows the exact diff — like git diff but for Kubernetes resources. Step 2: determine cause. Common causes: someone ran kubectl apply manually (config drift), Kubernetes mutated a resource (annotations, status fields), the app changed its own config at runtime (bad practice), or a new commit to Git changed something. Step 3: if the diff is intentional Git change — sync it. argocd app sync app-name. Step 4: if the diff is manual drift — the Git version is correct, revert the manual change. With selfHeal: true, ArgoCD does this automatically. Without it: argocd app sync --force. Step 5: if neither — investigate what changed. kubectl describe resource shows last-applied-configuration. Check audit logs. Step 6: prevent recurrence. Enable selfHeal: true in sync policy. Restrict direct kubectl access using Kubernetes RBAC or admission webhooks. Rule: in production, Git is always right. Manual changes should be exceptions with immediate follow-up to update Git.

ARGOCD · ARCHITECT
How do you manage multi-cluster deployments with ArgoCD?
ArgoCD can manage multiple Kubernetes clusters from one ArgoCD instance. Register each cluster: argocd cluster add context-name. Each Application's destination.server points to the cluster API endpoint. For environment promotion: three clusters (dev, staging, prod), separate Application objects pointing to each cluster, same Git repo but different branches or folder paths (environments/dev/, environments/staging/, environments/prod/). Promotion flow: merge PR to dev branch → ArgoCD syncs dev cluster. After QA approval: PR to update image tag in environments/staging/ → ArgoCD syncs staging cluster. After approval: PR to update environments/prod/ → ArgoCD syncs prod cluster. Each environment has its own ArgoCD Project with RBAC. Dev cluster: auto-sync allowed for all. Prod cluster: sync windows restrict deployments to business hours, requires manual sync approval. ApplicationSets (ArgoCD feature): generate Applications for multiple clusters from one template — useful when you have 10+ clusters following the same pattern (multi-region or multi-tenant).

Continue Learning
[🔧 Jenkins](/devops/jenkins.html)[⚡ GitHub Actions](/devops/github-actions.html)[☸️ Kubernetes](/devops/kubernetes.html)[🏠 All Topics](/)


ARGOCD · ENGINEER
What is ArgoCD drift detection and self-healing? How do you control it?
Drift detection: ArgoCD continuously compares the desired state in Git (the Helm chart or YAML manifests) with the actual state in the Kubernetes cluster. If someone runs kubectl edit deployment manually, or a HPA changes the replica count, ArgoCD detects the difference and shows the Application as OutOfSync. Self-healing (selfHeal: true): when enabled, ArgoCD automatically reverts any manual changes back to what Git says. This is the GitOps principle — Git is the only source of truth. If a developer runs kubectl scale deployment to 10, ArgoCD reverts it back to 3 (what values.yaml says) within seconds. Control: sync policies are configured per Application. For production, some teams prefer selfHeal: false — drift is detected and alerted, but not automatically reverted, requiring human approval to sync. For development environments, selfHeal: true gives full automation. Prune: controls whether resources deleted from Git are also deleted from the cluster. prune: true means removing a Kubernetes resource from your Git repo removes it from the cluster on next sync. prune: false means orphaned resources are left in the cluster — useful during migration periods.


ARGOCD · ENGINEER
Explain ArgoCD sync waves and hooks with a real deployment example.
Sync waves control the ORDER in which resources are applied during a sync. By default all resources sync simultaneously — this causes issues when a database Job must complete before application Pods start. Waves use the annotation: argocd.argoproj.io/sync-wave: "N". Lower number = earlier. Example: wave -1: Namespace and RBAC resources. Wave 0: Database migration Job (must complete first). Wave 1: Backend API Deployment and Service. Wave 2: Frontend Deployment. Wave 3: Ingress. ArgoCD waits for each wave to be healthy before proceeding to the next. Sync hooks are actions that run at specific points in the sync lifecycle: PreSync (runs before sync begins — take a DB backup), Sync (runs during sync — custom deploy logic), PostSync (runs after sync completes — run smoke tests), SyncFail (runs if sync fails — rollback or notify). Example PostSync hook: a Kubernetes Job that runs integration tests after deployment. If the Job fails, ArgoCD marks the sync as failed and notifies the team. This is how you implement automated smoke testing as part of your GitOps pipeline without any separate CI step for post-deploy validation.


ARGOCD · PRODUCTION
ArgoCD Application is stuck in Degraded health. How do you troubleshoot?
Degraded means the Application deployed (Synced) but the Kubernetes resources are not healthy. Step 1: ArgoCD UI → click the Application → Resource Tree view. Find the degraded resource (red icon). Usually a Deployment, StatefulSet, or Pod. Step 2: click on the Pod resource in ArgoCD — it shows the pod status directly. Or: kubectl get pods -n namespace and kubectl describe pod for the degraded pod. Common causes: CrashLoopBackOff — application is crashing on startup. kubectl logs pod-name --previous shows logs from the crashed container. Check application startup errors, missing environment variables, failed DB connection. OOMKilled — pod exceeds memory limit. kubectl describe pod shows OOMKilled in Last State. Increase memory limit in Helm values, commit to Git, ArgoCD syncs the new limit. ImagePullBackOff — image tag does not exist or registry credentials missing. Check image tag in ArgoCD Application details vs what actually exists in the registry. Readiness probe failing — app starts but fails the HTTP health check. Check if the /health endpoint is responding on the correct port. Wrong Secret or ConfigMap — app cannot start because required secret does not exist in the namespace. Check ArgoCD notification alerts to get immediate visibility. In production at HPE, 90% of Degraded states were either CrashLoopBackOff from a misconfigured env var in the values file, or ImagePullBackOff from a failed image push earlier in the pipeline.


ARGOCD · ARCHITECT
How do you use ArgoCD Projects for multi-team isolation?
ArgoCD Projects provide multi-tenant isolation — different teams can use the same ArgoCD instance without interfering with each other. A Project defines: which Git repositories the team can use as sources, which clusters and namespaces they can deploy to, which Kubernetes resource types they can manage, who has access (RBAC). Example: payment-team Project — source: github.com/company/payment-* repos only, destination: production cluster, payment-prod namespace only, resources: all standard K8s resources but NOT ClusterRole (cannot escalate privileges), RBAC: payment engineers can Sync, payment leads can promote to production. If a payment engineer tries to deploy to the logistics namespace, ArgoCD rejects it at the Project policy level. Default project allows everything — never use it in production. Create dedicated projects for each team or application domain. Combined with AppProjects and OIDC-based SSO (GitHub teams mapped to ArgoCD roles), you get enterprise-grade multi-tenant GitOps without running separate ArgoCD instances.

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤

## GitOps Q&A from Real Interviews

SECTION 1: GITOPS & ARGOCD (20 Questions)

---

**Q1. What is GitOps and how is it different from traditional CI/CD?**

**A:** GitOps is a deployment methodology where Git is the single source of truth for the desired state of infrastructure and applications. Every change to production goes through a Git commit — no direct kubectl or manual changes allowed.

Traditional CI/CD pushes changes to the cluster when pipeline runs. GitOps pulls — an operator inside the cluster continuously reconciles the live state with Git.

Key differences:
- Traditional CI/CD: pipeline pushes, one-time event, no drift detection
- GitOps: operator continuously reconciles, self-heals drift, full Git audit trail

**Where configured:** ArgoCD Application YAML defines the Git repo, path, and target cluster/namespace. Stored in a dedicated GitOps repository.

**Real challenge:** Teams resist because they lose "quick fixes" via kubectl. Solution: educate that Git reverts ARE quick — `git revert + push = ArgoCD applies in 60 seconds.`

---

**Q2. What is ArgoCD and how does it implement GitOps?**

**A:** ArgoCD is a declarative GitOps continuous delivery tool for Kubernetes. It runs as pods inside your cluster, watches a Git repository, and ensures the cluster state always matches what Git defines.

How it works:
1. You define an ArgoCD Application pointing to a Git repo path
2. ArgoCD polls Git every 3 minutes OR receives a webhook for instant detection
3. If Git changed — ArgoCD syncs (applies the change)
4. If cluster drifted from Git (manual kubectl change) — ArgoCD detects OutOfSync
5. With selfHeal: true — ArgoCD automatically reverts the drift

**Where configured:** ArgoCD runs in its own namespace (argocd). Applications defined as YAML CRDs. Deployed via Helm chart or operator.

**Real challenge:** ArgoCD sync order matters for dependent resources. If a ConfigMap must exist before a Deployment — use sync waves:
```yaml
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "1"   # deploy this first
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
