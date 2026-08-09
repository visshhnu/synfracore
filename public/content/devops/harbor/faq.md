# Harbor / Nexus / Artifactory — FAQ

## Is Harbor always better than a cloud-native registry like ECR or ACR?

No — for a team fully committed to one cloud with no air-gap, multi-cloud, or advanced scan-and-block requirements, a cloud-native registry's zero-ops simplicity and IAM-native auth are genuinely the better fit. Harbor earns its added operational complexity specifically when its capabilities (cross-cloud replication, built-in scan-and-block, content trust, granular project-level RBAC) are actually needed — it's not a strictly superior choice in every scenario.

## I enabled `prevent_vul` but a vulnerable image still got pushed. What went wrong?

`prevent_vul: true` alone doesn't specify a severity threshold — it must be paired with an explicit `severity` field for blocking to actually take effect. This is a common, easy-to-miss two-piece configuration requirement; verify both fields are set, and test the block by deliberately attempting to push a known-vulnerable image in a non-production project.

## Why does this guide insist on setting an explicit `duration` on every robot account?

Because an unset duration means the credential lives forever once created, with nothing forcing a rotation decision — this is exactly the kind of silent credential sprawl that accumulates real risk over time as forgotten, unused-but-still-valid accounts pile up. An explicit expiry forces a deliberate renewal decision, converting an indefinite standing risk into a periodically-reviewed one.

## What's the actual difference between a webhook and Harbor's replication feature — don't they both move data to another system?

They solve different problems. Webhooks notify an external system that an event happened (a push, a scan completing) — no data is transferred, just an event notification a downstream system can act on. Replication actually copies image data to another registry (another Harbor instance, ACR, ECR) for multi-cloud availability or DR. A webhook is an event trigger; replication is the actual data-movement mechanism.

## Does tag immutability mean I can never delete or update a tagged image?

No — immutability specifically prevents a tag from being *overwritten with different content* while it remains tagged the same name; it doesn't prevent deletion of the tag/image entirely (a genuinely different operation, typically governed by retention policy instead). The distinction matters: immutability protects the integrity guarantee that "this tag always means this exact content" while it exists, separate from whether it can eventually be removed.

## Why would I need a proxy cache if my CI pipeline already caches Docker layers locally?

Local CI layer caching helps within a single CI runner/agent's own repeated builds, but doesn't help across separate, independent pipeline runs or different runners each pulling the same base image fresh — Harbor's proxy cache sits centrally, so every pipeline run and every runner benefits from a shared cache, meaningfully reducing total pulls against Docker Hub's rate-limited API compared to per-runner local caching alone.

## Is Harbor's own database/Redis setup sufficient for a small production deployment, or do I always need external HA stores?

For a genuinely small deployment where some downtime risk is acceptable, Harbor's bundled PostgreSQL/Redis can be a reasonable starting point — they're not broken, just not independently HA. The decision point is how much downtime risk is acceptable if that single database/Redis instance fails; for anything where registry availability is business-critical, external, independently-HA stores are the right investment, not an optional upgrade.

## If I back up Harbor's database regularly, is my registry's data actually protected?

Only partially, and this is a real, common gap this guide flags directly — the database backup covers project/user/RBAC/scan-result metadata, but not the actual image layer content, which lives in a separate storage backend. A complete DR strategy needs both pieces covered independently; database-only backup leaves no recoverable copy of the actual images if the storage backend is lost.
