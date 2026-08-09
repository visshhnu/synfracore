# Harbor / Nexus / Artifactory — Advanced

## High-Availability Deployment

A single-replica Harbor instance is a single point of failure for every team's ability to push or pull images cluster-wide — a real HA deployment scales each Harbor component independently, backed by externally-managed, already-HA data stores rather than Harbor's own bundled (single-instance-oriented) PostgreSQL/Redis:

```yaml
# values.yaml — HA-oriented Harbor Helm install
core:
  replicas: 3
portal:
  replicas: 2
registry:
  replicas: 3
jobservice:
  replicas: 2

# External, already-HA data stores — NOT Harbor's bundled single-instance
# PostgreSQL/Redis, which aren't designed to be the durability layer
# for a production HA deployment
database:
  type: external
  external:
    host: postgres-ha.company.com
redis:
  type: external
  external:
    addr: redis-ha.company.com:6379
```

The specific thing worth being deliberate about: Harbor's own bundled PostgreSQL and Redis (the defaults in a basic install) are fine for evaluation or single-instance use, but aren't themselves highly available — a genuine HA Harbor deployment needs those backing stores to be independently HA (a managed PostgreSQL cluster, a Redis Sentinel/Cluster setup), or scaling the Harbor application components alone doesn't actually remove the single point of failure, it just moves it to the database layer.

## Enterprise Auth Integration — OIDC and LDAP

Managing Harbor-local user accounts separately from an organization's existing identity provider doesn't scale past a small team — Harbor supports both OIDC and LDAP/AD integration, so access is managed through the organization's existing identity system rather than a parallel Harbor-specific one:

```yaml
# OIDC configuration (via Harbor UI: Administration > Configuration > Authentication,
# or the equivalent API) — delegates authentication to an existing IdP
auth_mode: oidc
oidc_endpoint: https://sso.company.com
oidc_client_id: harbor
oidc_scope: openid,profile,email,groups
```

Group-based RBAC mapping (via the `groups` scope) is what makes this actually useful at organizational scale — a user's project-level Harbor permissions can be driven directly by their IdP group membership, so onboarding/offboarding a user from Harbor access happens automatically as part of the org's existing identity lifecycle process, rather than needing a separate manual step in Harbor specifically.

## API Automation at Scale — Project Provisioning as Code

Manually creating a project, configuring its RBAC, scan policy, and retention rules through the UI doesn't scale once onboarding new teams/projects is a routine, frequent event — the same "self-service platform" logic from Platform Engineering's golden-path pattern applies directly here, using Harbor's Terraform provider (or direct API calls) to make project provisioning declarative and repeatable:

```hcl
resource "harbor_project" "team_project" {
  name       = "team-b"
  vulnerability_scanning = true
}

resource "harbor_project_member_group" "team_b_access" {
  project_id = harbor_project.team_project.id
  ldap_group_dn = "cn=team-b,ou=groups,dc=company,dc=com"
  role       = "developer"
}
```

This is the direct application of "provision infrastructure via code review, not manual UI clicks" to Harbor specifically — a new project's RBAC, quota, and scan policy are all reviewable in a pull request before being applied, rather than configured once by hand and undocumented afterward.

## P2P Image Distribution — Preheat for Large-Scale Pulls

A large cluster (hundreds of nodes) all pulling the same new image simultaneously after a deploy can genuinely saturate a single registry's network bandwidth — **preheat**, via Harbor's Dragonfly P2P integration, pre-distributes an image across nodes using peer-to-peer transfer rather than every node pulling independently from the central registry:

```json
{
  "policy": {
    "name": "preheat-payment-service",
    "filters": [{"type": "repository", "value": "production/payment-service"}],
    "trigger": {"type": "event_based"},
    "providers_id": [1]
  }
}
```

The practical effect at real scale: instead of N nodes each independently pulling the full image from Harbor (linear load on the registry as node count grows), Dragonfly-based preheat has nodes share chunks of the image with each other P2P-style, so registry load stays roughly flat regardless of how many nodes are pulling — a meaningful difference for a large cluster's rollout speed and the central registry's bandwidth cost.

## Disaster Recovery for Harbor Itself

Harbor's own DR story has two genuinely separate concerns: the **database** (project/user/RBAC/scan-result metadata — PostgreSQL) and the **image content** (the actual layer data — object storage or the registry's own storage backend). A DR plan needs both covered, and they typically need different backup mechanisms — standard PostgreSQL backup/restore tooling for the database, and either object-storage-native replication (if using S3/GCS as the registry backend) or Harbor's own replication rules (covered in Overview/Intermediate) targeting a genuinely separate DR Harbor instance for the image content. A DR plan that backs up only the database and assumes image content is "just re-pullable from somewhere" is a real, common gap — if the primary registry's storage is lost, there may be no other copy of images that were only ever pushed to that one instance.
