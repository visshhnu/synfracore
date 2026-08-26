# Trivy — FAQ

## Does Trivy replace the need for a separate secrets manager like Vault?

No — Trivy DETECTS secrets that have been accidentally committed somewhere they shouldn't be (a config file, a Git repo); it doesn't manage, generate, or store secrets the way Vault does. They're complementary: Vault reduces the need for static secrets to exist at all, while Trivy catches cases where a secret still ended up somewhere it shouldn't.

## If Trivy scans an image and finds zero vulnerabilities, does that mean the image is genuinely secure?

Not entirely — a zero-CVE result means no KNOWN vulnerabilities matched the current database at scan time. It doesn't cover misconfigurations (unless config scanning is also run), zero-day vulnerabilities not yet in any database, or application-logic security flaws Trivy has no way to detect. "Clean scan" is a meaningful, real signal, but not a complete security guarantee on its own.

## Why would the same image show different vulnerability counts on two different days if nothing was rebuilt?

Trivy's vulnerability database is a real, periodically-updated dependency — a CVE affecting an already-installed package can be discovered and added to the database after the image was originally scanned. The image's actual content hasn't changed; the database's knowledge about known vulnerabilities has.

## Is Trivy only useful for containerized applications?

No — while image scanning is a major use case, `trivy fs` scans any local filesystem/directory (useful for non-containerized applications too), `trivy repo` scans Git repositories directly, and `trivy config` scans IaC configuration regardless of whether the resulting infrastructure runs containers at all.

## Should every single Trivy finding block a CI pipeline?

Generally not — blocking on every LOW/MEDIUM finding tends to produce noise that teams learn to bypass or ignore, undermining the gate's actual effectiveness. The common practical pattern is severity-filtered gating (commonly HIGH/CRITICAL) combined with a documented `.trivyignore` for specific, reviewed exceptions — balancing genuine risk reduction against gate fatigue.

## What's the difference between scanning an image at build time versus scanning a running Kubernetes cluster?

Build-time scanning (`trivy image`) reflects what's known at that specific moment — it can't catch a vulnerability discovered in an already-installed package AFTER that image is built and deployed. Cluster scanning (`trivy k8s`, or the Trivy Operator's continuous scanning) re-checks already-running workloads against the CURRENT database on an ongoing basis, catching that "discovered after deployment" class of issue that a one-time build-time gate structurally can't.

## Can Trivy scan private/authenticated registries and repositories?

Yes — Trivy supports authentication for private container registries (via standard Docker credential mechanisms) and private Git repositories (via configured credentials/tokens) — it's not limited to only public, unauthenticated targets.

## What's a reasonable way to introduce Trivy into an existing pipeline without immediately blocking every current build?

A common rollout pattern: start in report-only mode (no `--exit-code` gating) to establish a baseline of existing findings without blocking anything, review and triage that baseline (accepting/ignoring what's genuinely not actionable), THEN enable `--exit-code` gating going forward — this avoids the disruptive "suddenly every build fails" experience of turning on strict gating against a codebase that's never been scanned before.
