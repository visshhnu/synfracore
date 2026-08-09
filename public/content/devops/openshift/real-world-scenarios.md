# OpenShift OCP 4.x — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production OpenShift usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The team that reached for `privileged` SCC to unblock a deploy

**The pattern:** A team migrating an existing application to OCP hits the "unable to validate against any security context constraint" error on their first deploy. Under deadline pressure, they search for the fastest fix, find that granting the `privileged` SCC to the pod's ServiceAccount makes the error disappear, and ship it — planning to "fix it properly later." Months later, a security audit flags the workload as running with far broader privileges than it actually needs, and untangling which specific capability the application genuinely requires (as opposed to what `privileged` happened to grant wholesale) takes considerably longer than the original SCC investigation would have.

**Why the quick fix was so tempting in the moment:** `privileged` genuinely does resolve the SCC validation error for almost any pod, regardless of what it actually needs — it's the path of least resistance precisely because it works for every case, not just the specific one the pod requires. Diagnosing the actual, narrower requirement (does this pod need `anyuid`, a specific capability, or something else entirely) takes real investigation time that a deadline doesn't always allow for.

**What actually prevents this:**
- **Treat "unable to validate against any SCC" as a diagnostic starting point, not a signal to reach for `privileged`** — this guide's own material is explicit that `privileged` should never be used in production; the error message itself doesn't tell you which SCC you need, only that none currently matches.
- **Investigate what the pod's security context is actually requesting** (a specific UID, particular Linux capabilities) before choosing an SCC — `anyuid` is frequently the correct, much narrower fix for legacy applications that simply need to run as a fixed non-root UID, without granting the broader privilege set `privileged` includes.
- **Build SCC review into the deploy pipeline itself**, flagging any workload requesting `privileged` for explicit review before it reaches production, rather than relying on a later, disconnected security audit to catch it after the fact.

---

## Scenario 2 (illustrative/composite): The MachineConfig change that triggered an unplanned rolling reboot during business hours

**The pattern:** A platform engineer applies a MachineConfig change to add a kernel argument needed for a new workload, expecting a quick, low-impact update. The change triggers the Machine Config Operator's standard behavior — a rolling drain and reboot of every node in the affected MachineConfigPool — which the engineer hadn't specifically planned for, having focused on the kernel argument itself rather than MCO's actual mechanism for applying it. The rolling reboot, occurring during business hours, causes a series of brief pod evictions and reschedules across the affected pool, visible to users as intermittent latency spikes.

**Why the operational impact wasn't obviously anticipated:** the actual content of the change (a single kernel argument) seemed minor, and it's easy to reason about a MachineConfig change primarily in terms of "what config is changing" rather than "what OCP actually has to do to apply an OS-level change" — which, for any MachineConfig update, is a real node drain and reboot, regardless of how small the underlying change is.

**What actually prevents this:**
- **Treat every MachineConfig change as inherently triggering a rolling node drain and reboot**, regardless of how minor the specific config value seems — this guide's own material states this directly, and internalizing it as a standing rule (not something to re-derive each time) prevents exactly this kind of surprise.
- **Schedule MachineConfig changes for a maintenance window**, the same way any change with a known, real infrastructure-level impact should be scheduled, rather than applying them ad hoc whenever the underlying config need arises.
- **Verify the MachineConfigPool's node count and the workload's own tolerance for brief pod evictions before applying** — a pool with sufficient node count and workloads with proper PodDisruptionBudgets absorb a rolling reboot far more gracefully than a tightly-resourced pool without those safeguards.

---

## Scenario 3 (illustrative/composite): The Automatic-approval Operator upgrade that broke a dependent workload

**The pattern:** A team installs a monitoring Operator with Automatic approval strategy for convenience, reasoning that staying current with the latest version is generally a good default. Weeks later, the Operator publishes a new version to its subscribed channel introducing a breaking change to its CRD schema. OLM applies the upgrade automatically per the Automatic strategy, and the team's own dashboards — which depended on the Operator's previous CRD schema — break without warning, discovered only when someone notices the dashboards are no longer populating.

**Why Automatic approval's convenience carried a real, unadvertised cost here:** Automatic approval is a genuinely reasonable choice for many Operators, and "stay current automatically" is a sensible general default — but it implicitly assumes every published upgrade is safe to apply without review, an assumption that specifically breaks down for an Operator with dependent workloads sensitive to its exact CRD schema or API version.

**What actually addresses this:**
- **Use Manual approval strategy for any Operator that other workloads directly depend on** (via its CRDs, its API), reserving Automatic for Operators with no such dependents — this guide's own material frames this exact tradeoff directly: Manual gives control over upgrade timing precisely because an Operator upgrade can introduce breaking changes.
- **Review an Operator's release notes for breaking changes before manually approving an upgrade**, rather than approving reflexively just to stay current — the whole value of Manual approval is lost if approval happens without actually reading what's changing.
- **Monitor for schema/API-version drift between an Operator's CRDs and whatever depends on them**, so an unexpected upgrade's downstream impact is caught quickly regardless of which approval strategy was in use, rather than being discovered only when a dependent workload visibly breaks.
