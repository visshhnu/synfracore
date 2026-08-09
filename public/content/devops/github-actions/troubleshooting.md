# GitHub Actions — Troubleshooting

## Workflow doesn't trigger at all on push

**Symptom:** code is pushed to a branch that should trigger a workflow, but nothing shows up in the Actions tab — no run, no error, nothing.

**Root cause:** the most commonly missed detail is that GitHub evaluates the workflow file *as it exists on the branch/ref the event fires on* — a workflow that only exists on a feature branch, or was just added in the same push that was supposed to trigger it, won't run for that push, because GitHub reads the workflow definition from the target ref at trigger time, not from whatever's newest. Beyond that, a `branches:` filter that doesn't match the actual branch, or a YAML syntax error in the workflow file itself (which fails silently in the Actions tab rather than showing a clear parse error), are the other two common causes.

**Fix:** confirm the workflow file already existed on the branch *before* the triggering push (for a genuinely new workflow, the first push that adds it won't trigger itself — a second push is needed), validate the YAML with a linter or GitHub's own online workflow editor (it flags syntax errors before commit), and double check the `on.push.branches` filter matches exactly:

```yaml
on:
  push:
    branches: [main]      # a push to "master" or a feature branch will NOT trigger this
```

## `Resource not accessible by integration` on a step that used to work

**Symptom:** a step that writes to the repo, comments on a PR, or otherwise uses `GITHUB_TOKEN` starts failing with a 403-style "Resource not accessible by integration" error, without any change to the workflow itself.

**Root cause:** GitHub changed the default permissions of the automatically-provided `GITHUB_TOKEN` to read-only as a security improvement — a workflow written before this default changed (or one that never explicitly declared `permissions:`) can silently lose write access it used to implicitly have, without any change on the workflow author's side at all.

**Fix:** explicitly declare the exact permissions the workflow needs, rather than relying on repo-wide defaults that can change or vary between repos:

```yaml
permissions:
  contents: write     # needed to push commits/tags
  pull-requests: write  # needed to comment on or label PRs
  issues: write
```

Scope permissions to only what's actually needed — this is also the fix that most directly closes the `pull_request_target` risk described below, since an over-broad default token is what makes that trigger dangerous in the first place.

## Job stuck "Queued" and never starts

**Symptom:** a job sits in a queued state for an unusually long time, with no runner picking it up.

**Root cause:** two distinct causes depending on runner type. For GitHub-hosted runners, this is typically account/org-level concurrency limits being hit (too many jobs running simultaneously across the account). For self-hosted runners, it means no registered runner matching the job's `runs-on:` labels is currently online and idle — a runner that crashed, was deregistered, or simply doesn't have a label the job requests.

**Fix:** for self-hosted runners, check Settings → Actions → Runners for the runner's actual online/offline status and its registered labels — a `runs-on: [self-hosted, gpu]` job stays queued forever if no online runner has the `gpu` label specifically. For GitHub-hosted concurrency limits, check the org's Actions usage/limits page; using a `concurrency:` group to cancel superseded runs (e.g., an old CI run for a branch that's since been force-pushed) reduces unnecessary queue pressure:

```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true   # cancels a stale, superseded run instead of letting it queue/compete
```

## Dependency cache silently isn't being used — builds stay slow

**Symptom:** `actions/cache` is configured, "cache hit" never appears in the logs, and install steps take the same amount of time on every run despite unchanged dependencies.

**Root cause:** the `key:` didn't actually match a previously-saved cache — most commonly because `hashFiles()` is computing over a lockfile that changes on every run for an unrelated reason (a generated file included in the hash pattern, or the lockfile path being wrong), or the `key:` includes something that varies every run (a timestamp, a commit SHA) when it shouldn't.

**Fix:** confirm the exact files being hashed are genuinely stable between runs when dependencies haven't changed, and check the Actions run summary's cache step output directly — it explicitly reports "Cache not found for input keys" versus a restore, which tells you immediately whether this is a key-mismatch problem or something else (like the cache being evicted by GitHub's own size/age limits):

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.npm
    key: ${{ runner.os }}-npm-${{ hashFiles('package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-npm-
    # restore-keys provides a fallback partial match if the exact key misses —
    # without it, any lockfile change means a full cache miss with nothing to fall back to
```

## Matrix build: one combination fails and the entire job is cancelled

**Symptom:** a matrix build testing several versions (Node 18/20/22, for example) shows every other combination cancelled the moment one fails, even though they were still running and might have passed.

**Root cause:** `strategy.fail-fast` defaults to `true` — the first failing matrix combination cancels all other still-running combinations immediately, which is often not what's wanted when the goal is to see the full compatibility picture across every version, not stop at the first failure.

**Fix:** set `fail-fast: false` when the intent is genuinely to see every combination's result (a compatibility matrix), and reserve the default `true` behavior for cases where failing fast on the first bad combination is actually the desired, time-saving behavior:

```yaml
strategy:
  fail-fast: false   # let every matrix combination finish and report, don't cancel on first failure
  matrix:
    node-version: [18, 20, 22]
```

## OIDC cloud authentication fails with an AssumeRole/trust error

**Symptom:** a step using OIDC federation (`aws-actions/configure-aws-credentials` or equivalent) fails with an error like "not authorized to perform sts:AssumeRoleWithWebIdentity," despite the role ARN looking correct.

**Root cause:** two common causes. First, the workflow is missing the `permissions: id-token: write` block — without it, GitHub never issues the OIDC token needed for the exchange at all, regardless of how correctly the cloud-side role is configured. Second, the cloud provider's trust policy on the target role doesn't match the actual repo/branch/environment the workflow is running from — AWS IAM OIDC trust policies commonly scope by `sub` claim (which encodes the exact repo and ref), and a trust policy written for `main` won't authorize a workflow run triggered from a different branch or a pull request context.

**Fix:** confirm both halves independently — the workflow-side permission and the cloud-side trust policy — since either one alone being wrong produces the same generic error:

```yaml
permissions:
  id-token: write    # required — without this, no OIDC token is issued at all
  contents: read
steps:
  - uses: aws-actions/configure-aws-credentials@v4
    with:
      role-to-assume: arn:aws:iam::123456789:role/GitHubActionsRole
      aws-region: ap-south-1
```

On the AWS side, the IAM role's trust policy condition on `token.actions.githubusercontent.com:sub` needs to actually match — a value like `repo:company/myrepo:ref:refs/heads/main` scopes the role to only that repo and branch, and a workflow running from anywhere else will be rejected even with correct workflow-side permissions.

## `pull_request_target` exposes secrets to untrusted fork code

**Symptom:** not a failure exactly — a security incident where a malicious pull request from a fork successfully exfiltrates secrets or performs a write action, discovered after the fact.

**Root cause:** `pull_request_target` runs with the *base* repository's permissions and secrets (unlike `pull_request`, which runs with restricted, read-only permissions for fork-originated PRs) — but it's commonly used specifically to enable actions requiring write access on PR events. If that workflow then checks out and executes the *fork's* code (a common pattern for running tests against the PR's changes), it's executing untrusted code with trusted, full-permission credentials — a well-known, real attack pattern, not a hypothetical one.

**Fix:** avoid checking out and executing fork-supplied code inside a `pull_request_target` workflow at all — if PR code genuinely needs to run (tests, linting), use `pull_request` instead, which restricts the token automatically. If `pull_request_target` is required for a specific reason (labeling, commenting), keep the executed code to trusted content only, never `actions/checkout` of the PR head ref within that same job:

```yaml
# Risky pattern — do not do this:
on: pull_request_target
jobs:
  test:
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ github.event.pull_request.head.sha }}   # checks out untrusted fork code
      - run: npm test    # runs with pull_request_target's elevated, trusted permissions
```

---

## Official Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Security Hardening for GitHub Actions](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)
- [GITHUB_TOKEN Permissions Reference](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)

---
