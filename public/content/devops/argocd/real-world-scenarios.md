# ArgoCD — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production ArgoCD usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The emergency fix that `selfHeal` quietly erased

**The pattern:** During a production incident, an on-call engineer makes a fast, manual `kubectl edit` to a Deployment's resource limits, resolving an immediate, user-facing outage. The fix works. Fifteen minutes later, the same outage symptom reappears, causing real confusion — the engineer is certain they fixed it. Investigation reveals `selfHeal: true` was enabled on the affected Application, and ArgoCD, detecting the manual `kubectl edit` as drift from Git, automatically reverted it back to the Git-declared (and now known-to-be-wrong) resource limits within minutes of the fix being applied.

**Why this is a genuinely easy trap for a team new to `selfHeal`'s implications:** `selfHeal` is a genuinely valuable feature for its intended purpose — enforcing that Git really is the source of truth, preventing configuration from silently drifting via undocumented manual changes. The specific interaction with an active incident response — where a fast manual fix is entirely reasonable and often necessary — isn't something `selfHeal`'s general value proposition obviously warns against, especially for a team that hasn't yet experienced this exact interaction firsthand.

**What actually prevents this:**
- **This guide's own material makes the point directly: some teams deliberately leave `selfHeal` off in production specifically to avoid this exact scenario** — an emergency `kubectl` fix shouldn't be silently reverted before the same fix is also properly committed to Git. Making this an explicit, deliberate choice for production Applications, rather than defaulting to whatever `selfHeal` setting was convenient at setup time, is the direct fix.
- **Establish an incident-response runbook step: "commit the emergency fix to Git immediately, not just apply it to the cluster"** — treating the Git commit as part of completing the fix, not an optional follow-up, closes the gap regardless of `selfHeal`'s setting.
- **If `selfHeal` remains enabled for good reasons in other Applications, ensure on-call engineers know which specific Applications have it enabled**, so an emergency response can account for this behavior rather than being surprised by it mid-incident.

---

## Scenario 2 (illustrative/composite): The AppProject boundary that was narrower than everyone assumed

**The pattern:** A platform team sets up a shared ArgoCD instance for multiple application teams, each with their own `AppProject` scoping their allowed repos and namespaces. One team, needing a genuinely cross-cutting change (updating a shared ConfigMap used by multiple services across namespace boundaries), discovers their `AppProject` doesn't permit their Application to target the other namespace at all — a legitimate, necessary change is blocked by the multi-tenancy boundary that was working correctly, but nobody had anticipated this specific cross-cutting need when the `AppProject` scopes were originally designed.

**Why this is an easy gap to have, not a design flaw:** `AppProject` scoping was correctly designed around the assumption that each team's changes stay within their own namespace boundary — a reasonable default assumption for most day-to-day changes. The specific cross-cutting case (a shared resource genuinely needed by multiple teams) is a real but less common pattern that doesn't fit neatly into per-team namespace isolation, and wasn't necessarily anticipated during initial `AppProject` design, since most changes genuinely don't need to cross that boundary.

**What actually addresses this:**
- **Establish an explicit "shared resources" `AppProject` and namespace, owned by the platform team itself**, for genuinely cross-cutting resources multiple teams need — rather than trying to grant broader cross-namespace access to individual teams' own `AppProject`s, which would weaken the isolation boundary for everyone.
- **Treat a blocked, legitimate cross-cutting change as a signal to review whether the resource genuinely belongs in a shared space**, rather than simply widening one team's `AppProject` permissions as a quick fix — the latter risks eroding the multi-tenancy boundary the `AppProject` model exists to enforce.
- **Document the `AppProject` design's underlying assumptions explicitly** (each team stays within its own namespace; genuinely shared resources live in a separate, platform-owned space) so future teams encountering a similar cross-cutting need understand the intended pattern rather than reaching for an ad hoc permission widening.

---

## Scenario 3 (illustrative/composite): The Application that stayed "Synced" while the actual service was down

**The pattern:** A team relies heavily on ArgoCD's UI, treating a Synced status as their primary signal that a deployment succeeded and the service is healthy. During a deployment, the newly-deployed image has a bug causing the application to crash on startup — the Deployment resource itself is correctly created exactly as declared in Git (Synced), but the actual pods are in `CrashLoopBackOff` (clearly Degraded). The team, checking only Sync Status in a quick glance at the dashboard, believes the deployment succeeded and moves on, only discovering the real outage through a separate alerting system minutes later.

**Why "Synced" alone gave false confidence:** Sync Status and Health Status are structurally separate signals in ArgoCD, but a team's habitual workflow (a quick glance confirming "Synced" and moving on) can easily collapse that distinction in practice, especially under normal circumstances where a Synced deployment usually is healthy too. The gap only becomes visible in exactly the scenario where they diverge — a bad deployment that's technically Synced but not Healthy — which is precisely the moment accurate signal-reading matters most.

**What actually addresses this:**
- **Train the team to check both Sync Status and Health Status explicitly as part of any deployment verification**, not just Sync Status alone — this guide's own material is direct about these being two separate dimensions specifically because conflating them is a common, easy mistake.
- **Configure alerting on Health Status degradation directly**, rather than relying on a team member's manual dashboard check to catch a Degraded Application — an automated alert closes the gap between "the dashboard shows the problem" and "someone actually looked at the dashboard at the right moment."
- **Treat a deployment as verified only once Health Status confirms Healthy, not the moment Sync Status shows Synced** — building this into the team's actual deployment checklist/runbook, rather than relying on individual awareness of the distinction to catch it consistently under time pressure.
