# Helm Interview Q&A

secrets in Helm values at all.

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

**Q: Helm vs raw Kubernetes manifests?**
Helm templates one chart for multiple environments via values.yaml. Raw manifests require copy-paste per environment. Helm also manages rollback (`helm rollback`) and tracks release history.

**Q: What is a Helm hook?**
Jobs that run at specific points in release lifecycle: pre-install, post-install, pre-upgrade, post-upgrade, pre-delete, post-delete. Used for database migrations, smoke tests, cleanup tasks.

**Q: How do you store sensitive values securely in Helm?**
Never commit secrets to values.yaml. Options: helm-secrets plugin (encrypts with SOPS), sealed-secrets (encrypt with Kubeseal, commit encrypted YAML), External Secrets Operator (fetch from Vault/AWS SM at runtime), inject via CI/CD pipeline variables.

**Q: What is helm diff and why use it?**
`helm diff upgrade myapp ./chart` shows diff between current and new release before applying. Like `terraform plan` — essential for review in production.
