# Harbor / Nexus / Artifactory — Portfolio Projects

Build these 3 projects to prove Harbor mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Scan-and-Block Project With RBAC

**Level:** Beginner | **Time:** 1 day | **GitHub:** `harbor-scan-block-rbac`

**What you build:** A Harbor project configured to block pushes/pulls of images with CRITICAL CVEs, with two RBAC roles (Developer, Guest) demonstrating actual access differences.

### Project scan policy (via API)
```bash
curl -u admin:$PASSWORD -X PUT \
  https://harbor.company.com/api/v2.0/projects/my-team \
  -H "Content-Type: application/json" \
  -d '{"metadata": {"prevent_vul": "true", "severity": "critical", "auto_scan": "true"}}'
```

### Interview points
- `prevent_vul` + `severity` together is what actually enforces block-on-critical — being able to name both required fields (not just "I turned on scanning") demonstrates real configuration depth
- Explaining Projects as the RBAC boundary — a Developer role can push; a Guest role can only pull, enforced at the project level, not per-image
- Why this matters concretely: an image with a CRITICAL CVE never reaches a downstream deploy pipeline at all, versus being caught only after it's already running in production

### Steps
1. Create a project with scan-and-block enabled for CRITICAL severity
2. Attempt to push a known-vulnerable image and confirm it's blocked
3. Push a clean image and confirm it succeeds
4. Add a second user with Guest role and confirm they can pull but not push
5. Document both the blocked-push and the RBAC-denial evidence in the README

---

## Project 2: CI Pipeline With Robot Account and Webhook-Driven Deploy

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `harbor-ci-robot-webhook`

**What you build:** A CI pipeline (any CI tool) authenticating with a scoped robot account, and a webhook that triggers a downstream job the moment scanning completes.

### Robot account creation
```bash
curl -u admin:$PASSWORD -X POST https://harbor.company.com/api/v2.0/robots \
  -H "Content-Type: application/json" \
  -d '{
    "name": "ci-pipeline", "duration": 90,
    "permissions": [{"kind": "project", "namespace": "my-team",
      "access": [{"resource": "repository", "action": "push"}]}]
  }'
```

### Webhook configuration
```json
{
  "target": [{"type": "http", "address": "https://ci.company.com/webhooks/harbor-scan-complete",
    "auth_header": "Bearer webhook-secret-token"}],
  "event_types": ["SCANNING_COMPLETED", "PUSH_ARTIFACT"]
}
```

### Interview points
- Using a scoped robot account instead of a real user's credentials in CI — being able to explain the specific risk it avoids (a departing employee's credential rotation breaking every pipeline that used it, or a pipeline having broader access than it actually needs)
- Event-driven (`SCANNING_COMPLETED` webhook) vs. poll-based CI design — explaining why waiting on a webhook is both faster and lighter on the Harbor API than a polling loop
- Setting an explicit `duration` on the robot account as a deliberate rotation-forcing decision, not an oversight

### Steps
1. Create a scoped, push-only robot account with an explicit expiry
2. Configure your CI pipeline to authenticate using the robot account, not a personal credential
3. Configure a webhook for `SCANNING_COMPLETED` pointing at a real (even if simple) receiving endpoint
4. Push an image via CI and confirm the webhook fires and the downstream job receives it
5. Document the robot account's exact permission scope and expiry policy in the README

---

## Project 3: HA Deployment With Terraform-Managed Projects

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `harbor-ha-terraform-provisioning`

**What you build:** A highly-available Harbor deployment with external PostgreSQL/Redis, and project provisioning managed entirely via Terraform.

### HA-oriented Helm values
```yaml
core: { replicas: 3 }
registry: { replicas: 3 }
database: { type: external, external: { host: postgres-ha.company.com } }
redis: { type: external, external: { addr: redis-ha.company.com:6379 } }
```

### Terraform-managed project
```hcl
resource "harbor_project" "team_project" {
  name = "team-b"
  vulnerability_scanning = true
}
resource "harbor_project_member_group" "team_b_access" {
  project_id = harbor_project.team_project.id
  ldap_group_dn = "cn=team-b,ou=groups,dc=company,dc=com"
  role = "developer"
}
```

### Interview points
- Explaining specifically why Harbor's own bundled PostgreSQL/Redis aren't sufficient for genuine HA — scaling the Harbor application components alone doesn't remove the single point of failure if the backing stores stay single-instance
- Terraform-managed project provisioning as the same "review in a pull request, not clicked in a UI" philosophy applied to registry administration specifically
- Being able to articulate Harbor's own two-part DR story (database metadata vs. image content, covered in Advanced) as a genuinely separate concern from HA — HA is about surviving a component failure; DR is about recovering after data loss

### Steps
1. Deploy Harbor with external PostgreSQL/Redis and multiple replicas of core/registry
2. Write Terraform for at least one project with group-based RBAC mapping
3. Confirm a component (one core replica) can be killed without an outage, demonstrating real HA
4. Document your DR plan for both the database and image-content layers separately, even if not fully implemented
5. Write up in the README what backing up "just the database" would have missed, using this project's own architecture as the concrete example

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the API/Terraform configuration used and how to reproduce the setup
- [ ] Can explain the scan-and-block mechanism (both required config fields) without notes in an interview
- [ ] Project 2 documents the robot account's exact scope and the webhook payload received, not just the configuration
- [ ] Project 3 demonstrates an actual component-failure test, not just the HA configuration in isolation
