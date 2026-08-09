# Harbor / Nexus / Artifactory — Troubleshooting

## `docker push` fails with "unauthorized: unauthorized to access repository"

**Symptom:** `docker login` succeeds, but a subsequent `docker push` to a specific project fails with an authorization error.

**Root cause:** Harbor's RBAC is per-project — a successful login only confirms valid credentials, not that the account has *push* rights to the specific project being targeted. This is especially common with robot accounts, which are frequently created scoped to pull-only, or scoped to a different project than the one the CI pipeline is actually pushing to.

**Fix:** check the account's actual role on the specific project (Project → Members in the Harbor UI, or via the API), not just whether login succeeds — login succeeding only proves the credential itself is valid:

```bash
curl -u ci-robot:$ROBOT_TOKEN https://harbor.company.com/api/v2.0/projects/production/members
```

For CI robot accounts specifically, confirm the account was created with push permission on the *exact* project being pushed to — a robot account scoped to `project/staging` will authenticate fine but be rejected pushing to `project/production`, and the error message doesn't distinguish "wrong project" from "wrong permission level" — both surface as the same unauthorized error.

## Image push is rejected with a vulnerability-related error — working as intended vs. genuinely broken

**Symptom:** a push (or a pull, depending on configuration) is rejected with an error referencing image vulnerabilities.

**Root cause:** if `prevent_vul` is enabled on the project with a severity threshold, this is Harbor's scan-and-block policy correctly doing its job — the image genuinely contains a CVE at or above the configured severity. This is not a bug to work around; treat it as the control functioning as designed. The only genuine failure mode to distinguish from this is the scan itself never completing (see the next entry) — a scan that hasn't finished can also block a push/pull depending on policy configuration, which looks similar but has a different fix.

**Fix:** check the project's Vulnerability report for the specific image to see the actual flagged CVEs before assuming this is a false positive or a bug — most of the time the fix is rebuilding from an updated base image or patching the flagged dependency, not adjusting the policy:

```bash
curl -u admin:$PASSWORD https://harbor.company.com/api/v2.0/projects/production/repositories/myapp/artifacts/v1.2.3/additions/vulnerabilities
```

If the finding is a genuine false positive (a CVE that doesn't actually apply to how the package is used), Harbor supports per-project CVE allowlisting — a scoped, documented exception, rather than disabling `prevent_vul` project-wide, which removes the control for every future image too.

## Vulnerability scan stuck "queued" or "running" indefinitely

**Symptom:** a pushed image never completes its scan — the status stays "queued" or "running" well past when it should have finished, and (if `prevent_vul` requires a completed scan) this can block deployment even without any actual CVE being found yet.

**Root cause:** Harbor's scanning is handled asynchronously via its job service, backed by Redis for the queue — a stuck scan is most commonly either the job service itself being down/unresponsive, or Redis being unreachable/overloaded, not a problem with the specific image being scanned.

**Fix:** check the job service's own health and the scan job's actual status via the API rather than just waiting longer, since a genuinely stuck job service won't resolve on its own:

```bash
kubectl get pods -n harbor -l component=jobservice
kubectl logs -n harbor -l component=jobservice --tail=100

curl -u admin:$PASSWORD https://harbor.company.com/api/v2.0/projects/production/repositories/myapp/artifacts/v1.2.3/additions/vulnerabilities
```

A jobservice pod that's running but not processing anything (rather than crashed outright) often points at a Redis connectivity problem — confirm the Redis component is healthy and reachable from the jobservice pod specifically, not just that Redis itself is up.

## Registry storage fills up, all pushes start failing

**Symptom:** pushes across every project start failing with storage-related errors, seemingly all at once.

**Root cause:** Harbor's registry component stores image layers on a PVC (or object storage backend) with a fixed size — without retention policies actively pruning old tags, every CI build pushing a new tag grows storage indefinitely, and once the volume fills, every push fails cluster-wide regardless of which project it's for. This is a predictable, gradual failure that becomes sudden and total once the volume actually hits capacity.

**Fix:** check current utilization first, then address both the immediate blockage and the underlying cause — running out again without retention configured is not a matter of if, only when:

```bash
kubectl exec -n harbor <registry-pod> -- df -h /storage
```

Run garbage collection to reclaim space from already-deleted-but-not-yet-purged layers (deleting a tag in Harbor doesn't immediately free the underlying layer storage — GC is a separate step):

```bash
curl -u admin:$PASSWORD -X POST https://harbor.company.com/api/v2.0/system/gc/schedule \
  -H "Content-Type: application/json" -d '{"schedule": {"type": "Manual"}}'
```

Then configure retention policies going forward (keep last N tags per repo) so this doesn't recur — GC alone without retention just delays the next full-storage incident rather than preventing it.

## A retention policy deletes a tag that's still actively deployed

**Symptom:** an image tag that a running Deployment still references gets pruned by a retention policy, and the next time that pod is rescheduled (a node drain, a rollout), the pull fails because the tag no longer exists.

**Root cause:** retention policies match by pattern (e.g. "keep the last 10 tags matching `**`") with no awareness of what's actually deployed and running in any cluster — a tag can be both "old by the retention policy's count-based rule" and "still the exact tag a running Deployment references," and Harbor has no visibility into Kubernetes to know the difference.

**Fix:** this is a process gap, not a Harbor bug — retention policies need to be scoped conservatively (excluding tags matching a semver release pattern, for instance, via a separate rule that retains all `v[0-9]*.[0-9]*.[0-9]*`-matching tags regardless of count) so that release tags specifically are never subject to count-based pruning, only untagged/dev-build churn is:

```json
{
  "rules": [
    {"action": "retain", "params": {"latestK": 10}, "tag_selectors": [{"pattern": "dev-**"}]},
    {"action": "retain", "params": {}, "tag_selectors": [{"pattern": "v[0-9]*.[0-9]*.[0-9]*"}]}
  ]
}
```

Before enabling a new or changed retention policy against a production project, dry-run it against the current tag list and cross-check the result against what's actually deployed — Harbor's retention UI supports a dry-run mode specifically for this.

## Replication rule shows failed executions

**Symptom:** the Administration → Replications execution history shows a rule repeatedly failing, and the destination registry (a DR Harbor, or a cloud registry) is silently falling behind.

**Root cause:** most commonly either the destination registry's credentials have expired/rotated without updating Harbor's replication endpoint config, or a network path between the two registries is blocked (firewall, the DR Harbor being temporarily unreachable) — both produce a generic "failed" status without always making the specific cause obvious from the summary view alone.

**Fix:** check the specific execution's detailed log, not just the pass/fail status in the summary list:

```bash
curl -u admin:$PASSWORD https://harbor.company.com/api/v2.0/replication/executions
curl -u admin:$PASSWORD https://harbor.company.com/api/v2.0/replication/executions/{id}/tasks
```

Because a failing replication rule fails silently from an application-availability perspective (nothing user-facing breaks immediately — only DR posture quietly degrades), treat replication execution history as something to check on a schedule proactively, not just when a DR failover is actually needed and the destination turns out to be stale.

---

## Official Resources

- [Harbor Documentation](https://goharbor.io/docs/)
- [Harbor Troubleshooting Guide](https://goharbor.io/docs/latest/install-config/troubleshoot-installation/)
- [Nexus Repository Documentation](https://help.sonatype.com/en/nexus-repository.html)

---
