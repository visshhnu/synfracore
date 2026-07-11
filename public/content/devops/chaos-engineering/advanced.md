# Chaos Engineering — Advanced

## Automated chaos in CI/CD: from manual game days to a continuous gate

A game day run once a quarter tells you the system survived the specific scenario tested, on that specific day, against that specific version — it says nothing about whether a deploy shipped last Tuesday quietly broke the same resilience property. Mature chaos programs move a subset of well-understood, low-risk experiments into the deployment pipeline itself, run automatically against every release before it reaches production:

```yaml
# A CI stage running a known-safe chaos experiment against a staging deploy
chaos-gate:
  stage: post-deploy-staging
  script:
    - kubectl apply -f chaos/pod-delete-experiment.yaml
    - litmusctl get chaosresult pod-delete-nginx --namespace=staging
    - |
      if [ "$(kubectl get chaosresult pod-delete-nginx -o jsonpath='{.status.experimentStatus.verdict}')" != "Pass" ]; then
        echo "Chaos gate failed — resilience regression detected"
        exit 1
      fi
  only: [main]
```
The scope here matters — only experiments with a well-understood, previously-validated blast radius belong in an automated gate; the exploratory, higher-risk experiments (a full AZ failure, a genuinely novel failure combination) stay as deliberate, human-supervised game days. Automating the wrong experiment into a blocking CI gate turns "discover unknown weaknesses safely" into "randomly break the pipeline," which is exactly the outcome that gets a chaos program disabled by a frustrated team within a month.

## Multi-region and full-AZ failure: the experiments that need genuine organizational buy-in

Killing one pod carries essentially no real business risk if done correctly. Simulating an entire Availability Zone failure, or a full region failover, is categorically different — it's testing infrastructure investment (multi-AZ redundancy, cross-region failover automation) that was specifically built for a scenario the organization is implicitly betting will be rare. Running this class of experiment requires explicit executive sign-off, a defined and tested rollback path *before* the experiment starts (not designed reactively if things go wrong), and — practically — a maintenance-window-style schedule communicated well in advance, not a surprise. The actual payoff is proportionate to the risk: this is the only way to know whether a DR/multi-AZ architecture that looks correct on a design diagram actually fails over correctly under real conditions, since most multi-AZ setups are never genuinely tested end-to-end outside of an actual, unplanned outage.

## Security chaos engineering: applying the same method to security controls

The same discover-unknown-weaknesses methodology applies directly to security posture, not just availability — the practice sometimes called "security chaos engineering" deliberately tests whether security controls actually work as designed, rather than assuming they do because they're configured:

- **Simulate a compromised credential** — rotate/revoke a service account's key mid-flow and confirm dependent systems actually fail closed (deny access) rather than silently falling back to an insecure default
- **Simulate a Network Policy misconfiguration** — deliberately deploy a pod violating an expected `NetworkPolicy` and confirm it's genuinely blocked, not just assumed blocked because the policy YAML looks correct
- **Test alerting itself** — deliberately trigger a condition a security monitor (Falco, a SIEM rule) is supposed to catch, and confirm the alert actually fires and actually reaches someone, since an alerting pipeline that's silently broken is functionally identical to having no alerting at all until the moment it matters

This is a genuinely underused extension of chaos engineering's core insight: a security control that has never been tested against a real triggering condition is a hypothesis, not a verified fact, in exactly the same way an untested failover path is.

## Chaos maturity: a rough model for where a team actually is

| Level | What it looks like | Typical gap to the next level |
|---|---|---|
| Ad hoc | A handful of manual experiments run once, no repeat cadence | No steady-state metrics defined, no scheduled recurrence |
| Structured | Regular game days with defined hypotheses and blameless retros | Findings aren't systematically tracked/actioned; experiments stay manual only |
| Automated | Known-safe experiments run automatically in CI/CD against every release | Coverage limited to well-understood failure modes; no exploratory chaos beyond the automated set |
| Continuous | Automated gates plus regular exploratory game days for novel/high-risk scenarios (multi-AZ, security chaos) | Genuinely mature — the gap left is usually organizational, not technical: sustaining executive buy-in for higher-risk experiments over time |

Most teams that adopt chaos engineering plateau at "Structured" — the jump to "Automated" requires enough trust in a specific experiment's safety to let it block a pipeline, which itself typically requires a track record of that exact experiment having been run manually, successfully, many times first. Treating that plateau as a normal, expected stage — not a failure to reach some idealized end state — is a more realistic way to frame program maturity than expecting a fast progression through all four levels.
