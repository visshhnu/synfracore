# Harbor / Nexus / Artifactory — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## When to Choose Harbor Over a Cloud Registry

```
Cloud registries (ECR/ACR/GCR) — zero ops, IAM-native auth, simple
Harbor — open-source, CLOUD-AGNOSTIC, adds: built-in CVE scanning,
  cross-cloud image replication, content trust (signed images only),
  per-project RBAC, retention policies
Choose Harbor when: air-gapped, multi-cloud, need scan-and-block,
  cost at high pull volume
```

## Projects — the RBAC/Scanning/Retention Boundary

```
Project = namespace with its OWN RBAC + scanning policy + retention
Trivy is BUILT IN — configure Harbor to BLOCK push/pull of images
  with CRITICAL CVEs (not just report)
Replication syncs images to other registries (ACR, ECR, another
  Harbor) — multi-cloud or DR
```

## Scan-and-Block — TWO required fields together

```json
{"metadata": {"prevent_vul": "true", "severity": "critical", "auto_scan": "true"}}
```
`prevent_vul` alone is not sufficient — `severity` must also be set.
Same "two pieces configured together" pattern as Loki's retention gotcha.

## Robot Accounts (scoped, non-human CI credentials)

```
- Purpose-built, SCOPED credentials per project, NOT a real user's
- duration field = explicit expiry, forces rotation cadence, not
  optional
- Real anti-pattern avoided: a departing employee's credential
  rotation breaking every pipeline that used their personal login
```

## Webhooks — Event-Driven, Not Poll-Based

```
event_types: SCANNING_COMPLETED, PUSH_ARTIFACT
CI pipeline WAITS on webhook rather than polling scan-status API —
  faster AND lighter on Harbor's API
```

## Tag Immutability — Why It Matters Specifically for Release Tags

```
latest/dev tags being overwritten = expected, fine
v1.2.3 release tag being overwritten = genuine integrity problem —
  anything that redeploys v1.2.3 (a rollback) would silently get
  DIFFERENT content than what was originally tested and released
```

## `tstats`-style Performance Pattern — Proxy Cache

```
Proxy cache protects CI pipelines from Docker Hub rate limits —
  first pull goes through Harbor to Docker Hub, subsequent pulls of
  the SAME image/tag served entirely from Harbor's local cache
```

## HA — What Harbor's Own Bundled Stores DON'T Cover

```
Harbor's BUNDLED PostgreSQL/Redis are fine for evaluation, NOT
  genuinely HA — scaling core/registry replicas alone does NOT
  remove the single point of failure if the backing stores stay
  single-instance
Real HA needs externally-managed, ALREADY-HA PostgreSQL/Redis
```

## DR — Two Genuinely Separate Concerns

```
Database (project/user/RBAC/scan-result metadata) — standard
  PostgreSQL backup/restore
Image content (actual layer data) — object-storage-native
  replication OR Harbor's own replication to a separate DR instance
Backing up ONLY the database and assuming images are "just
  re-pullable from somewhere" is a real, common gap
```

## P2P Distribution (Dragonfly Preheat)

```
Without preheat: N nodes each pull full image independently -> linear
  load on registry as node count grows
With preheat: nodes share chunks P2P -> registry load stays roughly
  FLAT regardless of node count
```
