# CI/CD Pipelines — Troubleshooting

## "Works locally, fails in the pipeline"

The single most common CI/CD complaint, and almost always caused by an environment difference the pipeline correctly exposes rather than a pipeline bug. Check, in order:
1. **Dependency versions** — did you run `npm ci`/`pip install -r requirements.txt` from a lockfile, or did the pipeline resolve slightly different dependency versions than your local `node_modules`/venv, which has drifted from the lockfile over time?
2. **Environment variables** — does your local setup have a `.env` file with values the pipeline's environment doesn't have configured as secrets?
3. **Case sensitivity** — most CI runners use Linux; if you develop on macOS or Windows, a filesystem-case mismatch in an import path (`Component.tsx` vs `component.tsx`) can pass locally and fail in CI.
4. **Implicit local state** — a database with existing seed data, a globally-installed CLI tool, a cached build artifact from a previous run — anything present on your machine "by accident" that the pipeline's clean, ephemeral environment doesn't have.

## Pipeline hangs or times out with no clear error

Usually one of: a step waiting on interactive input (a command that would normally prompt for confirmation, which has no terminal to prompt in a CI environment and just hangs), a genuine deadlock in a test (a database connection pool exhausted by a test that doesn't close its connections), or a network call to a service that's unreachable from the CI runner's network (an internal service only reachable from your office/VPN). Add explicit timeouts to every job/step so a hang fails loudly within a bounded time instead of consuming your entire pipeline time budget silently.

## Flaky tests — passing sometimes, failing other times, same code

Flaky tests are a distinct category from broken tests, and treating them the same way (just re-running until it passes) is a trap that erodes trust in the whole pipeline over time. Common real causes: tests that depend on execution order or shared mutable state (parallel test execution exposes this immediately, even if it "worked" when run serially), tests with a hardcoded sleep/timeout that's occasionally too short under CI runner load, and tests that depend on real network calls to an external service instead of a mock. The fix is never "just retry it" as a permanent solution — quarantine genuinely flaky tests, fix the root cause, and only then return them to the blocking suite.

## Secrets not available in the pipeline

Most commonly: the secret is scoped to the wrong environment or branch (many CI platforms let you scope secrets to specific branches/environments, and it's easy to add a secret to "production" scope while your pipeline branch is running as "staging"), or a secret is defined at the repo level but the specific job/workflow references it under a different, misspelled name. Second most common: the secret genuinely isn't available to pipelines triggered from a forked repository's pull request — most CI platforms deliberately withhold secrets from fork-triggered pipelines as a security measure, since anyone could otherwise open a PR from a fork and read your secrets via a modified pipeline file.

## Cache not actually speeding anything up

Check the cache key first — if it includes something that changes on every run (a timestamp, a commit SHA) instead of something stable like a lockfile hash, you'll get a "cache miss" every single time and pay the caching overhead for zero benefit. Also check cache size limits — most platforms cap cache size, and a cache that silently gets evicted for being too large will quietly stop helping without an obvious error.

## Deployment succeeded in the pipeline but the app is still serving the old version

Usually a caching layer downstream of the deploy itself: a CDN still serving cached responses, a load balancer with stale health-check state still routing to old instances, or (in container orchestration) a rolling update that hasn't finished replacing old pods yet even though the deploy step itself reported success. "Pipeline says success" and "users are seeing the new version" are two different claims — verify the second one explicitly (a smoke test hitting the real production URL post-deploy) rather than trusting the first as proof of the second.
