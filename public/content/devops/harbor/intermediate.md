# Harbor / Nexus / Artifactory — Intermediate

## Robot Accounts — Scoped, Non-Human Credentials

Using a real user's credentials for CI/CD pipeline pushes is a real, common anti-pattern — it ties automation to an individual's account (breaking when they leave or rotate their password) and typically grants broader access than a pipeline actually needs. Harbor's **robot accounts** are purpose-built, scoped, non-human credentials created per-project with explicit, minimal permissions:

```bash
# Create a robot account scoped to push-only access on one project,
# via the API — the standard pattern for a CI pipeline's credentials
curl -u admin:$PASSWORD -X POST https://harbor.company.com/api/v2.0/robots \
  -H "Content-Type: application/json" \
  -d '{
    "name": "ci-pipeline",
    "duration": 90,
    "permissions": [{
      "kind": "project",
      "namespace": "production",
      "access": [{"resource": "repository", "action": "push"}]
    }]
  }'
```

`duration` sets an expiry (in days) — a robot account isn't meant to be a permanent credential by default, and setting an explicit expiry forces a deliberate rotation cadence rather than a credential that silently lives forever once created. This is precisely the mechanism that should have prevented the Troubleshooting scenario where a robot account scoped to the wrong project caused a push failure — auditing exactly what permissions a specific robot account has (rather than assuming) is a direct, quick diagnostic step.

## Webhooks — Reacting to Registry Events

Harbor can notify an external system the moment a specific event happens — a push, a scan completing, a specific vulnerability severity being found — which is the mechanism behind automated downstream workflows (triggering a deploy pipeline the moment a scan passes, for instance) rather than a pipeline needing to poll Harbor for status:

```json
{
  "target": [{
    "type": "http",
    "address": "https://ci.company.com/webhooks/harbor-scan-complete",
    "auth_header": "Bearer webhook-secret-token"
  }],
  "event_types": ["SCANNING_COMPLETED", "PUSH_ARTIFACT"]
}
```

A common real pattern this enables: a CI pipeline pushes an image and then *waits* on the `SCANNING_COMPLETED` webhook rather than polling the scan-status API in a loop — event-driven rather than poll-based, which is both faster (no polling interval delay) and lighter on the Harbor API.

## Tag Immutability — Preventing Tag Overwrites

A tag like `v1.2.3` being silently overwritten with different image content breaks a core assumption most deployment tooling relies on — that a specific tag always refers to the same, unchanging content. Tag immutability rules enforce this at the registry level:

```json
{
  "rule": {
    "template": "immutable_template",
    "tag_selectors": [{"kind": "doublestar", "pattern": "v[0-9]*.[0-9]*.[0-9]*"}],
    "scope_selectors": {"repository": [{"kind": "doublestar", "pattern": "**"}]}
  }
}
```

This matters specifically for release tags — a `latest` or `dev` tag being overwritten repeatedly is expected and fine; a `v1.2.3` release tag being overwritten is a genuine integrity problem, since anything that deployed `v1.2.3` yesterday and redeploys it today (for a rollback, for instance) would silently get different content than what was originally tested and released.

## Proxy Cache — Configuration in Depth

Overview covered the concept (Harbor caching upstream registries locally); the practical configuration scopes exactly which upstream images get cached and how:

```bash
curl -u admin:$PASSWORD -X POST https://harbor.company.com/api/v2.0/registries \
  -H "Content-Type: application/json" \
  -d '{"name": "dockerhub-proxy", "type": "docker-hub", "url": "https://hub.docker.com"}'

# Pulling through the proxy cache instead of directly from Docker Hub —
# transparent to the client, just a different registry URL
docker pull harbor.company.com/dockerhub-proxy/library/nginx:latest
```

The direct operational value: this is what protects CI pipelines from Docker Hub's own rate limits (referenced in Overview) — every pull goes through Harbor's cache instead of counting against Docker Hub's per-IP or per-account pull limits, and after the first pull, subsequent pulls of the same image/tag are served entirely from Harbor's local cache without touching Docker Hub at all.

## Project Quotas — Preventing One Project From Exhausting Shared Storage

In a multi-tenant Harbor instance (multiple teams sharing one registry), an unbounded project can consume disk space that starves other projects — quotas cap storage and/or artifact count per project:

```bash
curl -u admin:$PASSWORD -X PUT https://harbor.company.com/api/v2.0/quotas/1 \
  -H "Content-Type: application/json" \
  -d '{"hard": {"storage": 107374182400}}'   # 100Gi hard limit for this project
```

This is the project-scoped complement to the cluster-wide storage-full failure mode covered in Troubleshooting — a quota turns "the whole registry ran out of space because one team pushed excessively" into "that one team's pushes started failing at their own quota," containing the failure to the project actually responsible rather than affecting every team sharing the instance.
