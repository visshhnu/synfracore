# Harbor / Nexus / Artifactory — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Harbor usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The scan policy that looked like it was blocking, but wasn't

**The pattern:** A security-conscious team enables `prevent_vul: true` on their production project, confirms the change saved successfully, and considers CVE-based blocking enabled. Months later, a security audit discovers an image with a known CRITICAL CVE was pushed and pulled repeatedly during that entire period — the blocking policy never actually stopped it, despite `prevent_vul` genuinely being set to `true` the whole time.

**Why this is a genuinely easy trap, not an obvious oversight:** `prevent_vul: true` reads like a complete, self-sufficient setting — nothing about the field name or the UI signals that a second, separate `severity` field is required for blocking to actually take effect. The project's configuration page shows the toggle enabled, which looks like confirmation the policy is active, when in fact the severity threshold that determines *what actually gets blocked* was never set.

**What actually prevents this:**
- **Verify scan-and-block is actually working by deliberately testing it** — push a known-vulnerable test image (in a non-production project) and confirm it's genuinely rejected, rather than trusting the configuration UI's toggle state alone.
- **Treat `prevent_vul` and `severity` as a single logical setting in documentation and onboarding materials**, explicitly naming both fields together, the same discipline this guide recommends for Loki's retention configuration two-piece gotcha.
- **Periodically re-audit project scan policies**, especially after any Harbor version upgrade, since configuration schema or default behavior can shift between versions in ways that silently affect an existing, previously-correct configuration.

---

## Scenario 2 (illustrative/composite): The robot account that outlived its purpose by two years

**The pattern:** A robot account is created for a one-time migration project, scoped with push access to a specific project, with no explicit `duration` set at creation. The migration completes within a week, but the robot account is never deactivated — it simply continues existing, unused but valid, for over two years, until a security review discovers it and can find no owner or documented purpose for its continued existence.

**Why this is a common, easy-to-accumulate risk, not a dramatic one-time mistake:** creating a robot account without an explicit expiry is the path of least resistance in the moment — nothing forces a decision about cleanup at creation time, and once the immediate task is done, there's no natural trigger prompting someone to revisit and deactivate it. This is exactly the kind of slow, invisible credential-sprawl risk that accumulates silently across many small decisions rather than one obvious failure.

**What actually addresses this:**
- **Set an explicit `duration` on every robot account at creation, as a hard default rather than an optional best practice** — this guide's own recommendation is precisely the mechanism that would have prevented this specific two-year gap, forcing a deliberate renewal decision rather than indefinite silent persistence.
- **Maintain a periodic audit of all active robot accounts against their documented purpose** — a robot account with no clear, current owner or use case is a real, actionable finding worth investigating and likely deactivating.
- **Tie robot account creation to a ticket or change record** documenting its intended purpose and expected lifetime, so a future audit has something concrete to check the account's continued existence against, rather than needing to reconstruct intent after the fact.

---

## Scenario 3 (illustrative/composite): The DR plan that recovered the database but not a single image

**The pattern:** A team's disaster recovery runbook, tested and rehearsed regularly, correctly restores Harbor's PostgreSQL database from backup after a simulated primary-instance loss. The rehearsal is marked successful — projects, users, and RBAC all come back correctly. During a real incident months later, the same recovery process runs successfully, but the team discovers every project is now empty of actual images — the database backup covered metadata perfectly, but the underlying object storage holding the actual image layer data had never been part of any backup or replication strategy at all.

**Why this gap survived a "successful" rehearsal:** the rehearsal tested exactly what it was designed to test — database restoration — and that portion worked flawlessly, producing genuine confidence in "our DR plan works." The image-content gap was invisible specifically because the rehearsal's success criteria never included verifying that a real image could actually be pulled after recovery, only that the Harbor application itself came back up with its metadata intact.

**What actually addresses this:**
- **Explicitly separate DR planning into the two genuinely different concerns this guide names directly — database metadata and image content — with independent backup/replication strategies for each**, rather than assuming a database backup constitutes complete DR coverage.
- **Rehearse DR with a success criterion that includes actually pulling a real image post-recovery**, not just confirming the application and its metadata came back — this is precisely the test that would have caught the gap during rehearsal instead of during a real incident.
- **For the image-content layer specifically, use either object-storage-native replication (if using S3/GCS as the registry backend) or Harbor's own replication rules targeting a genuinely separate DR instance** — and verify that replication is actually current, not just configured, as part of every DR rehearsal cycle.
