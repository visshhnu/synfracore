# Helm — Advanced Charts & Multi-Environment Deployment

SECTION 3: HELM (15 Questions)

---

**Q16. What is Helm and what problem does it solve?**

**A:** Helm is the package manager for Kubernetes. It solves the problem of managing complex applications that require many YAML files across multiple environments.

Without Helm: 10 separate YAML files (Deployment, Service, Ingress, ConfigMap, Secret, HPA, PDB, ServiceAccount, NetworkPolicy, PVC) — multiply by 3 environments = 30 files, all with environment-specific hardcoded values.

With Helm: one chart with templates and a values file per environment.

```
helm upgrade --install payment ./charts/payment \
  -f values.yaml \
  -f values-prod.yaml \
  --set image.tag=v2.1.3 \
  --namespace production --wait
```

**Real challenge:** Helm release "stuck" in pending-upgrade state after a failed upgrade. Solution:
```bash
helm history payment -n production    # see failed release
helm rollback payment 0 -n production # rollback to last good
# OR
kubectl delete secret -n production -l owner=helm,name=payment,status=pending-upgrade
```

---

**Q17. How do you manage secrets in Helm charts? Can you put them in values.yaml?**

**A:** Never put actual secret values in values.yaml — it would end up in Git.

**Correct approaches:**

**1. Reference Key Vault secret names (not values) in values.yaml:**
```yaml
# values.yaml — safe to commit
secrets:
  keyvaultName: "prod-keyvault"
  dbPasswordSecretName: "database-password"   # name only, not value
```

**2. Use --set at deploy time for sensitive values (from pipeline):**
```bash
# In Jenkins/Azure DevOps pipeline — value comes from Key Vault variable group
helm upgrade --install payment ./charts \
  --set secrets.dbPassword=$(DB_PASSWORD)   # injected from pipeline secret
```

**3. Use Sealed Secrets — encrypt in chart:**
```bash
kubeseal --format yaml < secret.yaml > sealed-secret.yaml
# sealed-secret.yaml is safe to commit — encrypted
```

**Where configured:** SecretProviderClass + Workload Identity handles this cleanly in AKS — no secrets in Helm values at all.

**Real challenge:** Junior engineer accidentally committed a values-prod.yaml with real database password to Git. Immediate actions:
1. Rotate the database password immediately
2. Remove from Git history: `git filter-branch` or BFG Repo Cleaner
3. Force push (coordinate with team)
4. Add pre-commit hook: `git-secrets` to detect secrets before commit

---

**Q18. What is a Helm hook and when do you use it?**

**A:** Helm hooks allow running specific jobs at lifecycle points of a release — before or after install/upgrade/delete.

Common hooks:
- `pre-install` / `pre-upgrade` — run before main resources deploy
- `post-install` / `post-upgrade` — run after main resources deploy
- `pre-delete` — run before uninstall
- `test` — run during `helm test`

**Real use cases:**

**Database migration before deployment:**
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: db-migrate
  annotations:
    "helm.sh/hook": pre-upgrade
    "helm.sh/hook-delete-policy": hook-succeeded
spec:
  template:
    spec:
      containers:
      - name: migrate
        image: myapp:v2.1.3
        command: ["python", "manage.py", "migrate"]
```

**Where configured:** In `templates/` directory with hook annotations.

**Real challenge:** Database migration hook runs but application deploys before migration completes — data structure mismatch. Solution: set `helm.sh/hook-weight` to control order, and set `completions: 1` on the job so Helm waits for completion.

---

**Q19. How do you test a Helm chart before deploying to production?**

**A:** Multiple validation layers:

**1. Lint — syntax check:**
```bash
helm lint ./charts/payment
```

**2. Template dry-run — render without deploying:**
```bash
helm template payment ./charts/payment -f values-prod.yaml > rendered.yaml
# Review rendered YAML manually
```

**3. --dry-run — render AND validate against cluster API:**
```bash
helm upgrade --install payment ./charts/payment \
  -f values-prod.yaml --dry-run
# Validates resource schemas against K8s API without creating anything
```

**4. Helm test — run test pods:**
```bash
helm test payment -n production
# Runs jobs annotated with "helm.sh/hook": test
```

**5. Diff plugin — see what will change:**
```bash
helm diff upgrade payment ./charts/payment -f values-prod.yaml
# Shows diff between current and new release
```

**Where configured:** All in CI pipeline as gates before prod deployment.

**Real challenge:** `helm upgrade` succeeds but application is broken. Root cause: chart passed lint and dry-run but application config was wrong. Solution: add integration test job in post-deploy hook that calls `/health` endpoint and fails if not 200.

---

**Q20. What is Helm chart versioning and how do you manage it?**

**A:** Helm chart has two versions:
- `version` in Chart.yaml — chart version (structure changes)
- `appVersion` in Chart.yaml — application version being packaged

```yaml
# Chart.yaml
name: payment-service
version: 1.4.2        # chart vers

## Helm in CI/CD Pipelines

helm = {

      source  = "hashicorp/helm"

      version = "~> 2.11"

    }

  }

}

provider "azurerm" {

  features {}

  subscription_id = var.subscription_id

}

Custom providers are written in Go using the Terraform Plugin SDK. In practice, for Wipro interviews, focus on using existing providers effectively rather than custom development.

# Section 3: Kubernetes & AKS

**Q11: ****Explain Kubernetes resource limits and requests. What happens when they are exceeded?**

**Answer:**

Requests and limits are the foundation of Kubernetes resource management — critical for your AKS migration.

**Requests: Guaranteed resource allocation (used for scheduling)**

**Limits: Maximum allowed usage (enforced by ****cgroups****)**

apiVersion: v1

kind: Pod

spec:

  containers:

  - name: myapp

    resources:

      requests:

        memory: '256Mi'  # Scheduler reserves this

        cpu: '250m'      # 0.25 CPU cores

      limits:

        memory: '512Mi'  # OOMKilled if exceeded

        cpu: '500m'      # Throttled (not killed) if exceeded

**What happens when exceeded:**

- CPU limit exceeded: Container is throttled (CPU cycles are restricted)

- Memory limit exceeded: Container is OOMKilled (killed and restarted)

- Node pressure: Pod eviction based on QoS class (BestEffort first, then Burstable)

**TIP: **From your OCP experience with Kafka: Always set memory requests = limits for JVM workloads (Kafka, Oracle JVM) to prevent OOM kills during GC spikes.

**Q12: ****How do you troubleshoot a ****CrashLoopBackOff**** in Kubernetes?**

**Answer:**

CrashLoopBackOff is one of the most common issues. Here is the systematic diagnosis approach:

**Step 1: Check pod status and events**

kubectl get pod <pod-name> -n <namespace>

kubectl describe pod <pod-name> -n <namespace>

# Look for: Exit Code, Reason, Events section

**Step 2: Check current and previous container logs**

kubectl logs <pod-name> -n <namespace>

kubectl logs <pod-name> -n <namespace> --previous  # Previous crash logs

kubectl logs <pod-name> -n <namespace> -c <container>  # Specific container

**Step 3: Common causes and fixes**

- Exit code 1: Application error — check app logs

- Exit code 137: OOMKilled — increase memory limits

- Exit code 139: Segfault — application/image bug

- CrashLoop after config change: Check ConfigMap/Secret mounting

- Readiness probe failing: Probe hitting before app ready — increase initialDelaySeconds

# Debug by overriding entrypoint

kubectl run debug-pod --image=<same-image> -it --rm \

  --command -- /bin/sh

# Check resource constraints

kubectl top pod <pod-name> -n <namespace>

**Q13: ****Explain Kubernetes networking: Services, Ingress, and Network Policies.**

**Answer:**

**Services — Internal service discovery:**

- ClusterIP: Internal only (default) — for pod-to-pod communication

- NodePort: Exposes on each node's IP — for development/testing

- LoadBalancer: Creates Azure Load Balancer — for external traffic

**Ingress — L7 HTTP routing:
