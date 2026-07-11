# CI/CD Pipelines — Intermediate

## Pipeline caching — the single biggest speed lever most teams underuse

A pipeline that reinstalls every dependency from scratch on every single run is slow by choice, not necessity. Every major CI/CD platform supports caching dependency directories (`node_modules`, `.m2`, `~/.cache/pip`, Docker layer caches) keyed by a hash of the relevant lockfile — if the lockfile hasn't changed, the cache is reused and the install step drops from minutes to seconds. The practical impact compounds: a team running 50 pipeline executions a day with a 3-minute unnecessary reinstall each time is burning over 2 hours of pipeline time daily for nothing.

```yaml
# GitHub Actions example — cache keyed by lockfile hash
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: npm-${{ hashFiles('package-lock.json') }}
```

## Parallelizing test suites

Once a test suite takes more than a few minutes, running it as one serial job is the wrong default. Most CI platforms support **matrix builds** — splitting a test suite across multiple parallel runners by test file, by shard index, or by browser/OS combination for cross-platform testing — turning a 20-minute serial run into a 4-minute parallel one across 5 runners. This is where "fast feedback" (the actual point of CI) starts requiring deliberate pipeline design, not just more automation.

```yaml
strategy:
  matrix:
    shard: [1, 2, 3, 4]
steps:
  - run: npm test -- --shard=${{ matrix.shard }}/4
```

## Environment promotion: dev → staging → production

A mature pipeline doesn't deploy straight to production from a merge — it promotes the *same, already-built artifact* through a sequence of environments, with increasing confidence gates at each stage:

- **Dev/preview** — deployed automatically on every push, often to a per-branch ephemeral environment. Fast, low-stakes, meant for the developer's own verification.
- **Staging** — deployed automatically after merge to the main branch, running the full integration/E2E test suite against production-like infrastructure and data.
- **Production** — deployed after an explicit gate (manual approval, or an automated gate like "staging has been stable for N hours with no alerts").

The critical detail people get wrong: it should be the *same built artifact* promoted through each stage, not a fresh build per environment — rebuilding per environment reintroduces the exact "it worked in staging but not prod" risk that environment promotion exists to eliminate (different dependency resolution, different build-time environment variables baked in, etc.).

## Secrets management beyond "just use the platform's secrets store"

Basic secrets usage (GitHub Secrets, GitLab CI/CD variables) is fine for a single team on a single platform. It gets harder at intermediate scale:

- **Secret scoping** — not every job needs every secret. Scope production deployment credentials to only the deploy job, not the whole pipeline, so a compromised test-stage dependency can't exfiltrate production credentials it never needed access to.
- **Short-lived credentials over long-lived keys** — where supported (most cloud providers now support OIDC-based federation from CI/CD platforms), use OIDC to mint a short-lived token per pipeline run instead of storing a long-lived cloud access key as a static secret. A leaked long-lived key is a standing liability; a leaked 15-minute OIDC token expires before it's useful to an attacker.
- **Never echo secrets in logs, even for debugging** — a masked secret in a CI platform's UI is masked based on knowing the exact string value; if you transform it (base64-encode it, concatenate it into a URL) before printing, the masking can fail to catch it, leaking it into logs that may be visible to a wider audience than the secret's intended scope.

## Rollback strategy — the part most beginner pipelines skip entirely

Deploying is only half the pipeline design problem; "how do we undo this in under 2 minutes if it's bad" is the other half, and it needs to be designed *before* you need it, not improvised during an incident. Two common approaches: keep the previous artifact version available and support a one-click "redeploy previous artifact" pipeline (not a rebuild — a redeploy of something already known-good), or use a deployment strategy (blue-green, canary) where rollback is just "route traffic back to the previous, still-running version" rather than a redeploy at all.
