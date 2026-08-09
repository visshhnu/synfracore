# Ansible — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Ansible usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The "idempotent" playbook that wasn't, and the config drift it silently caused

**The pattern:** A team writes an Ansible playbook using a `shell` task to apply a specific system configuration change, since a proper idempotent module for that exact change didn't obviously exist. The playbook works correctly the first time it runs against each host. Because the `shell` task has no built-in state-checking, it reports "changed" on every subsequent run regardless of whether anything actually needed to change — the team initially dismisses this as cosmetic. Months later, a real configuration drift issue emerges: the "changed" status every run had been masking the fact that the playbook was silently re-applying (and in one case, subtly re-corrupting) a value that had been manually adjusted for a legitimate, host-specific reason after the initial rollout.

**Why this is a genuinely easy trap, not an obvious scripting mistake:** a `shell` task reporting "changed" every run doesn't produce an error — the playbook completes successfully every single time, which reads as "working" from a pure success/failure perspective. The absence of proper idempotency (state-checking before acting) is a subtle correctness gap, not a loud failure, and it took an actual downstream consequence (an unwanted overwrite) before the team investigated why "changed" appeared on literally every run instead of only when something was truly different.

**What actually prevents this:**
- **Treat "changed" appearing on every run as an active investigation trigger, not background noise** — this guide's own Troubleshooting material names this exact symptom directly; a properly idempotent task should report "ok" on repeated runs against an unchanged target.
- **Prefer a proper Ansible module over a raw `shell`/`command` task whenever one exists for the intended change** — built-in modules are specifically designed to check current state before acting, providing genuine idempotency that a raw shell command doesn't inherently have.
- **When a raw `shell`/`command` task is genuinely unavoidable, add an explicit `changed_when` condition** reflecting the actual state check, rather than accepting the default "always report changed" behavior for arbitrary shell execution.

---

## Scenario 2 (illustrative/composite): The playbook that ran successfully against the wrong hosts

**The pattern:** A team runs a playbook intended to apply a configuration update to a specific staging host group. Due to an inventory pattern typo (a group name that closely resembled, but didn't exactly match, the intended group), Ansible executed successfully — no errors, all tasks reported "ok" or "changed" as expected — but against a completely different, unintended set of hosts that happened to match the mistyped pattern, including several production hosts that shouldn't have been touched at all.

**Why "it ran successfully" gave false confidence here:** Ansible correctly executed exactly what it was told to target — the failure was entirely in the human specification of *which* hosts, not in Ansible's execution of the play itself. A successful run against the wrong hosts looks identical, output-wise, to a successful run against the intended hosts; nothing in the standard playbook run output flags "these aren't the hosts you meant" unless the operator specifically double-checks the targeted host list before or during execution.

**What actually addresses this:**
- **Use `--limit` combined with `--list-hosts` (a dry-run flag showing exactly which hosts a play would target) before running any playbook against a potentially sensitive host group**, especially production — this directly surfaces exactly this class of inventory-pattern mistake before any actual change executes.
- **Design inventory group names to be maximally distinct from each other**, avoiding near-identical names (like `staging-web` vs `staging-web2`) that are easy to typo into each other — a naming convention that makes accidental cross-matching structurally harder, not just a documentation reminder to be careful.
- **Require an explicit, separate confirmation step for any playbook run targeting production inventory**, distinct from the staging/dev workflow — making it structurally harder to accidentally run a production-targeting command with the same casual confidence as a staging one.

---

## Scenario 3 (illustrative/composite): The Vault password rotation that broke CI without anyone noticing for a week

**The pattern:** A team rotates their Ansible Vault password as part of a routine credential-hygiene policy, updating the password in their local development environments and documentation. The CI pipeline's vault password (stored as a separate CI secret, referenced by the pipeline's automation) is inadvertently left un-rotated during this change. CI-triggered playbook runs continue "succeeding" in the sense that the pipeline doesn't immediately fail outright — but any task depending on vault-encrypted variables silently fails or uses stale, incorrect values, and this goes unnoticed for roughly a week because the specific playbooks affected weren't part of the team's most frequently monitored CI runs.

**Why this rotation gap is easy to miss during the change itself:** a Vault password rotation feels complete once it's updated everywhere a human directly interacts with it (local dev environments, documentation) — the CI pipeline's separately-stored secret is a different, easy-to-forget location precisely because it's not part of anyone's day-to-day manual workflow. The team's own mental model of "where does the vault password live" didn't include the CI secret store as a location requiring separate, deliberate updating.

**What actually addresses this:**
- **Maintain an explicit, written inventory of every location a Vault password/key is stored** — local dev, CI secrets, any automation server — treating a rotation as incomplete until every location on that list is confirmed updated, not just the ones that come to mind first.
- **Add an explicit CI step that verifies vault decryption succeeds early in the pipeline**, failing loudly and immediately if it doesn't, rather than allowing downstream tasks to silently proceed with stale or missing decrypted values.
- **Test a Vault password rotation against CI deliberately as part of the rotation process itself**, not just local environments — running an actual CI pipeline execution post-rotation as a verification step, rather than assuming CI is fine because local testing succeeded.
