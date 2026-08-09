# GitLab CI/CD — FAQ

## Do I need self-hosted GitLab to learn CI/CD pipelines properly?

No — GitLab.com's free tier includes shared runners, which is sufficient for Fundamentals through most of Intermediate. Self-managed runners (Installation section) become relevant once you're learning about runner executor tradeoffs specifically, or need custom infrastructure/network access a shared runner can't provide — not a prerequisite for getting started.

## What's the actual difference between `only:`/`except:` and `rules:`?

`only:`/`except:` is the deprecated, older conditional-execution syntax. `rules:` is the modern replacement, offering more expressive conditional logic (multiple conditions, `if:` expressions referencing CI/CD variables) than `only:`/`except:` supported. Any pipeline still using `only:`/`except:` should be considered for migration to `rules:` — new pipelines should use `rules:` from the start.

## Why does my `needs:`-based job still seem to wait for the full previous stage?

Check that `needs:` is actually declared correctly on that specific job — if a job in a mostly-DAG pipeline has no `needs:` entry at all, it defaults back to standard stage-sequential behavior, waiting for the entire previous stage to complete rather than just its specific dependencies. This is a common, easy-to-miss gap during a DAG migration, not expected `needs:` behavior malfunctioning.

## Is caching dependencies the same as using artifacts to pass files between stages?

No, and conflating them is a common early mistake. Cache persists dependencies *between separate pipeline runs* purely for speed (re-downloading the same packages every run is wasteful) — it's best-effort and not guaranteed to be present. Artifacts persist specific files *between stages of the same pipeline run* as a deliberate, reliable hand-off (build output needed by the test stage). Don't rely on cache for correctness-critical data transfer within a single pipeline run.

## Why would I use the Kubernetes executor instead of the faster Shell executor?

The Shell executor's speed comes at the cost of no isolation between jobs — state can leak from one job to the next since they all run directly on the same runner VM. The Kubernetes executor runs every job in a fresh pod, guaranteeing clean isolation, and can autoscale to zero when idle, avoiding paying for constantly-running infrastructure. For production CI/CD, reliability and cost efficiency generally outweigh the Shell executor's raw per-job speed advantage.

## Does including GitLab's SAST/DAST security templates automatically block a pipeline from merging if a vulnerability is found?

Not by default — including a security scanning template runs the scan and surfaces findings in the Merge Request security widget and Security Dashboard, but doesn't itself enforce a pipeline failure. Actually blocking on findings requires a separate, deliberate policy (a scan result policy or custom pipeline logic checking the scan's output) configured on top of the scanning template itself.

## What problem do merge trains actually solve that I can't get from just requiring a green pipeline before merge?

A standard "green pipeline required before merge" check only verifies a change against `main`'s state at the moment that specific pipeline ran — it says nothing about whether the change will still be correct after other queued merge requests also merge ahead of it. Merge trains test each queued merge request against the state that will exist *after* prior queued merges apply, catching conflicts between individually-correct changes that a simple "green pipeline" gate structurally can't detect.

## Is a self-hosted runner always more secure than GitLab's shared runners, since I control the infrastructure?

Not automatically, and in one specific scenario it's meaningfully riskier: self-hosted runners on a *public* repository are a real security exposure, since a malicious pull request's pipeline could run arbitrary code on infrastructure your org controls — GitLab-hosted shared runners are ephemeral and isolated per run by design in a way a self-hosted runner isn't automatically. Controlling the infrastructure yourself is only a security advantage if you also apply the isolation and review controls that a shared runner gets by default.
