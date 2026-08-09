# Harbor / Nexus / Artifactory — PYQ (Previously Asked / Practice Questions)

**Framing note:** Harbor (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Harbor behavior.

---

### 1. (Domain: Registry Selection) A team runs entirely on AWS with no air-gap or multi-cloud requirement. Why might they still choose Harbor over ECR?

**Answer:** Primarily for capabilities ECR doesn't provide natively — built-in scan-and-block CVE policy enforcement, content trust (signed-images-only enforcement), and more granular per-project RBAC/retention than ECR's IAM-based model offers. If none of these specific capabilities matter to the team, ECR's zero-ops, IAM-native simplicity is generally the better default — Harbor is the right choice specifically when its added capabilities are needed, not simply because it's more feature-rich in the abstract.

---

### 2. (Domain: Scan-and-Block) A project has `prevent_vul: true` set but images with CRITICAL CVEs are still being pushed successfully. What's the most likely missing configuration?

**Answer:** The `severity` field — `prevent_vul` alone doesn't specify which severity level triggers blocking; it must be paired with an explicit `severity` setting (e.g., `"critical"`) for the block to actually take effect. This mirrors the same "two pieces required together" pattern as Loki's retention configuration — one flag alone silently does nothing without its required companion setting.

---

### 3. (Domain: Robot Accounts) Why does this guide recommend setting an explicit `duration` on every robot account rather than leaving it unset?

**Answer:** An unset or unlimited duration means the robot account's credential effectively lives forever once created, with no forcing function for rotation — a real, avoidable long-lived-credential risk. Setting an explicit `duration` forces a deliberate rotation cadence, ensuring the credential naturally expires and must be renewed, rather than silently persisting indefinitely as an unmonitored standing credential.

---

### 4. (Domain: Webhooks) What's the concrete advantage of a CI pipeline waiting on a `SCANNING_COMPLETED` webhook versus polling Harbor's scan-status API in a loop?

**Answer:** Event-driven waiting is both faster (no polling interval delay — the pipeline is notified the instant the scan completes, rather than discovering it on the next poll) and lighter on Harbor's API (no repeated status-check requests consuming API capacity). This is a general event-driven-vs-poll-based architecture tradeoff, applied concretely to Harbor's own webhook system.

---

### 5. (Domain: Tag Immutability) Why does tag immutability matter specifically for release tags like `v1.2.3`, but not for a `latest` or `dev` tag?

**Answer:** A `latest` or `dev` tag being overwritten repeatedly is expected, normal behavior — nothing depends on that tag always pointing at the same content. A release tag like `v1.2.3` being overwritten is a genuine integrity problem, because deployment tooling and rollback processes assume a specific version tag always refers to the same, unchanging content — a rollback to `v1.2.3` that silently deploys different content than what was originally tested breaks that fundamental assumption.

---

### 6. (Domain: Proxy Cache) How does Harbor's proxy cache protect CI pipelines from Docker Hub's rate limits, concretely?

**Answer:** Pulls go through Harbor instead of directly to Docker Hub — the first pull of a given image/tag goes through to Docker Hub and gets cached locally in Harbor; every subsequent pull of that same image/tag is served entirely from Harbor's cache without touching Docker Hub at all. This means repeated CI pulls of the same base image don't count against Docker Hub's per-IP or per-account rate limits after the initial cache population.

---

### 7. (Domain: High Availability) Why is scaling Harbor's core/registry component replicas alone insufficient for genuine high availability?

**Answer:** Harbor's own bundled PostgreSQL and Redis (the defaults in a basic install) aren't themselves highly available — they're fine for evaluation or single-instance use. Scaling the application-layer components (core, registry) alone doesn't remove the single point of failure if the backing data stores stay single-instance; genuine HA requires those backing stores to be independently HA as well (a managed PostgreSQL cluster, a Redis Sentinel/Cluster setup).

---

### 8. (Domain: Disaster Recovery) A team's DR plan backs up Harbor's PostgreSQL database on a regular schedule and considers DR "handled." What's the real gap in this plan?

**Answer:** The database backup covers project/user/RBAC/scan-result metadata, but not the actual image content (layer data) itself, which lives in object storage or the registry's own storage backend — a genuinely separate concern requiring its own backup or replication mechanism (object-storage-native replication, or Harbor's own replication rules to a DR instance). If the primary registry's storage is lost, database-only backup leaves no recoverable copy of images that were only ever pushed to that one instance.

---

### 9. (Domain: P2P Distribution) Why does Dragonfly-based preheat keep Harbor's registry load roughly flat as node count grows, when a naive pull pattern would scale linearly?

**Answer:** Without preheat, each of N nodes independently pulls the full image from the central registry — registry load scales linearly with node count. With Dragonfly-based P2P preheat, nodes share image chunks with each other directly rather than each pulling the full image from Harbor — the registry's role shifts to seeding the initial distribution rather than serving every node's full pull individually, keeping central registry load roughly constant regardless of how many nodes are pulling.

---

### 10. (Domain: API Automation) What's the practical benefit of provisioning Harbor projects via Terraform rather than manually through the UI?

**Answer:** The same "review in a pull request, not clicked in a UI" philosophy applied throughout this guide's other tools — a new project's RBAC, quota, and scan policy configuration becomes reviewable in a pull request before being applied and provides a durable audit trail of who changed what and when, rather than a manual UI action that's undocumented and unreviewed after the fact. This matters most once project provisioning becomes a routine, frequent event rather than a rare, one-off task.
