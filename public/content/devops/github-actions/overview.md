# GitHub Actions

> **Cloud-native CI/CD — YAML workflows, reusable actions, matrix builds**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is GitHub Actions?

GitHub Actions is CI/CD built into GitHub — no separate server needed. Workflows are YAML files in .github/workflows/. Triggered by events: push, pull_request, schedule, workflow_dispatch (manual). Jobs run in parallel by default; use needs: to create dependencies. Each job runs on a fresh runner (VM). GitHub-hosted runners are free for public repos. Self-hosted runners for private networks or custom hardware.

## Why GitHub Actions?

Actions are reusable units from the GitHub Marketplace. Always pin actions to a SHA or version tag (not @master) for security. Matrix strategy runs the same job with different parameters in parallel — e.g., test on Node 18, 20, 22 simultaneously. Job outputs pass data between jobs. Artifacts upload/download files between jobs.

---

## Learning Modules

### Module 01 — GitHub Actions Fundamentals
*Workflows, jobs, steps, triggers*

GitHub Actions is CI/CD built into GitHub — no separate server needed. Workflows are YAML files in .github/workflows/. Triggered by events: push, pull_request, schedule, workflow_dispatch (manual). Jobs run in parallel by default; use needs: to create dependencies. Each job runs on a fresh runner (VM). GitHub-hosted runners are free for public repos. Self-hosted runners for private networks or custom hardware.

**Topics covered:**

- Workflow YAML structure — 🟢 Beginner
- on: triggers (push, PR, schedule) — 🟢 Beginner
- Jobs and steps — 🟢 Beginner
- Runners: ubuntu-latest vs self-hosted — 🟡 Intermediate
- Workflow vs Jenkins pipeline — 🟢 Beginner

### Module 02 — Jobs, Steps & Actions
*Reusable actions, marketplace*

Actions are reusable units from the GitHub Marketplace. Always pin actions to a SHA or version tag (not @master) for security. Matrix strategy runs the same job with different parameters in parallel — e.g., test on Node 18, 20, 22 simultaneously. Job outputs pass data between jobs. Artifacts upload/download files between jobs.

**Topics covered:**

- actions/checkout@v4 — 🟢 Beginner
- Marketplace actions — 🟢 Beginner
- Composite actions (reusable) — 🟡 Intermediate
- Job outputs and artifacts — 🟡 Intermediate
- Matrix strategy (parallel builds) — 🟡 Intermediate

### Module 03 — Secrets & Environments
*Secrets, vars, environment protection*

Secrets are encrypted at rest and masked in logs. Environment secrets only accessible when deploying to that environment — add protection rules (required reviewers, wait timer) for production. OIDC is the modern approach — no long-lived cloud credentials needed. The workflow requests a short-lived token from the cloud provider directly via OIDC federation.

**Topics covered:**

- Repository and organisation secrets — 🟢 Beginner
- Environment secrets with protection rules — 🟡 Intermediate
- OIDC for keyless cloud auth — 🔴 Advanced
- github.token automatic token — 🟡 Intermediate

### Module 04 — Reusable Workflows & Composite Actions
*DRY CI/CD patterns*

Reusable workflows (workflow_call trigger) are the equivalent of Jenkins Shared Libraries — define once, call from many repos. Composite actions bundle multiple steps into one action. Best practice: create a central .github repo in your organization with shared workflows that all teams call.

**Topics covered:**

- Reusable workflows (workflow_call) — 🟡 Intermediate
- Composite actions — 🟡 Intermediate
- Calling reusable workflows — 🟡 Intermediate

### Module 05 — Complete Production Pipeline
*Build, scan, push, deploy*

A production GitHub Actions pipeline has: dependency caching (save 60-80% build time), parallel security scanning and tests, image build with cache layers, environment-gated deployments with manual approval for production, and Slack/Teams notifications on failure. Key difference from Jenkins: no infrastructure to manage — runners scale automatically.

**Topics covered:**

- Build and push to ACR/ECR — 🟡 Intermediate
- Trivy security scanning — 🟡 Intermediate
- Deploy to AKS/EKS — 🔴 Advanced
- Slack notifications — 🟢 Beginner
- Cache optimization — 🟡 Intermediate

```bash
1
```

---

## Production Example

```yaml
# .github/workflows/deploy.yml — cached build, parallel scan+test,
# environment-gated deploy with manual approval and Slack alert on failure
name: Deploy
on: { push: { branches: [main] } }

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: 20, cache: npm }   # cache: cuts 60-80% off install time
      - run: npm test

  scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: aquasecurity/trivy-action@0.24.0
        with: { image-ref: "myapp:${{ github.sha }}" }
  # test and scan run in PARALLEL (no needs: between them) — only
  # deploy waits on both, so total pipeline time is max(test, scan),
  # not test + scan

  deploy:
    needs: [test, scan]
    runs-on: ubuntu-latest
    environment:
      name: production          # protection rule requires a manual reviewer
      url: https://app.company.com
    steps:
      - uses: actions/checkout@v4
      - run: |
          docker build -t $ECR_REGISTRY/myapp:${{ github.sha }} .
          docker push $ECR_REGISTRY/myapp:${{ github.sha }}
      - run: kubectl set image deployment/app app=$ECR_REGISTRY/myapp:${{ github.sha }} -n production
      - if: failure()
        uses: slackapi/slack-github-action@v1.27.0
        with: { payload: '{"text":"Production deploy failed: ${{ github.sha }}"}' }
  # environment: production + a required-reviewer protection rule is the
  # manual-approval gate — the job blocks in "Waiting" until approved
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is GitHub Actions and why would you use it in production?**

**A:** **Problem:** stitching CI into a repo host historically needed a separate CI server (Jenkins) with its own auth, webhook wiring, and infrastructure to manage. **Solution:** GitHub Actions runs CI/CD directly inside GitHub — workflows are YAML in `.github/workflows/`, triggered natively by the same push/PR/schedule events GitHub already emits, with GitHub-hosted runners requiring zero infrastructure to provision. **Result:** no separate CI server to patch or scale, and the Marketplace's reusable actions mean common steps (checkout, language setup, security scanning) rarely need custom scripting from scratch.

---

**Q2. How does GitHub Actions work internally? Explain the architecture.**

**A:** **Problem:** not knowing what's actually executing where makes "my job never started" vs. "my job failed" hard to diagnose. **Solution:** GitHub parses the workflow YAML on the triggering event, schedules each job onto a fresh runner (GitHub-hosted VM or self-hosted), and jobs without a `needs:` dependency run in parallel by default; each step within a job executes sequentially in that same runner's filesystem. **Result:** "job stuck queued" is a runner-availability problem (GitHub-hosted concurrency limits, or a self-hosted runner offline), while "job ran and failed" is a script problem inside a specific step — the two point at completely different places to look.

---

**Q3. What are the main components of GitHub Actions?**

**A:** **Problem:** "GitHub Actions" bundles several distinct pieces, and conflating them makes troubleshooting harder. **Solution:** the workflow YAML (triggers, jobs, steps), runners (GitHub-hosted or self-hosted — the actual execution environment), Actions themselves (reusable units from the Marketplace or custom, pinned to a SHA or version), and reusable workflows/composite actions (the DRY layer for sharing steps across repos) are the four pieces. **Result:** a runner-capacity failure, a marketplace-action failure, and a workflow-YAML syntax error are three different components breaking — knowing which is which is what makes triage fast.

---

**Q4. How do you handle failures in GitHub Actions?**

**A:** **Problem:** failures range from a flaky test to an unpinned action changing behavior underneath you to a runner never picking up the job. **Solution:** each step's log in the Actions tab is the first stop for script/test failures; a failure in a marketplace action is often version drift — pinning to a SHA (not `@master`) prevents this; `workflow_dispatch` lets you manually re-run with the same inputs to reproduce; `continue-on-error: true` isolates a known-flaky step from failing the whole job. **Result:** most real failures resolve to one of three causes — a genuine script/test bug, an unpinned action that changed behavior, or a runner/concurrency limit — checkable in that order from the job log.

---

**Q5. What is your production experience with GitHub Actions?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (an unpinned action that changed behavior, a runner concurrency limit hit during a release, a `pull_request_target` misconfiguration exposing secrets), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

---

**Q6. How do you monitor and observe GitHub Actions in production?**

**A:** **Problem:** a workflow showing green doesn't guarantee the deployed application is healthy, and a red workflow doesn't always mean the application broke. **Solution:** the Actions tab's own run-history/duration trends catch pipeline-health regressions (a job that used to take 3 minutes now taking 15); the repo's Deployments view shows exactly which commit is live in each environment; actual application health still needs separate app-level monitoring — the workflow's pass/fail status is not a substitute for it. **Result:** "did the deploy succeed" and "is the app healthy" are two different signals from two different systems.

---

**Q7. What are the security considerations for GitHub Actions?**

**A:** **Problem:** a workflow with write access to secrets and deploy credentials, triggered by anyone who can open a pull request, is a real attack surface — a malicious PR can potentially exfiltrate secrets via a crafted `pull_request_target` trigger. **Solution:** pin every third-party action to a full commit SHA, not a mutable tag; use OIDC federation for cloud credentials instead of long-lived secrets; scope environment secrets with required-reviewer protection rules for production; be deliberate about `pull_request` vs. `pull_request_target` — the latter runs with write-level secrets even on forked-PR triggers, a common real-world misconfiguration. **Result:** most real GitHub Actions security incidents trace back to exactly one of these — an unpinned action or a misused `pull_request_target` — not an exotic attack.

---

**Q8. How does GitHub Actions compare to alternatives?**

**A:** **Problem:** "which CI/CD tool" depends heavily on what's already in the stack. **Solution:** vs. Jenkins — no server to host or patch, at the cost of less exotic pipeline customization; vs. GitLab CI/CD — comparable capability, but GitHub Actions relies on the Marketplace for registry/scanning integrations rather than bundling them natively, which matters most for teams wanting an all-in-one platform; vs. CircleCI — similar hosted model, GitHub Actions wins on being triggered natively by the same platform hosting the code, with zero webhook configuration. **Result:** the right choice tracks whether the team is already on GitHub and how much they value an all-in-one bundled platform vs. GitHub-native simplicity.

---

**Q9. Walk through the difference between a workflow, a job, a step, and an Action.**

**A:** **Problem:** these four terms sound similar and get used interchangeably in casual conversation, but they're distinct concepts with different scopes. **Solution:** a workflow is the whole YAML file, triggered by an event; a job is a unit that runs on its own fresh runner (jobs run in parallel by default, use `needs:` to serialize); a step is one instruction inside a job, executing sequentially in that job's runner; an Action is a specific, reusable implementation of one step, pinned to a SHA or version tag. **Result:** this hierarchy is why matrix strategy operates at the job level (multiple parallel job instances, e.g. testing Node 18/20/22 simultaneously) rather than the step level — matrix multiplies whole jobs, not individual steps.

---

**Q10. How do reusable workflows and composite actions differ, and when would you use each?**

**A:** **Problem:** both reduce duplicated YAML across repos, and picking the wrong one leads to either an overcomplicated composite action or an unnecessarily heavyweight reusable workflow. **Solution:** composite actions bundle multiple steps into one reusable step — used when you want to package "checkout, setup, run this tool" as a single line inside another workflow's job; reusable workflows (triggered via `workflow_call`) are entire jobs called from another workflow — used when the reused logic needs multiple jobs, its own secrets, or its own environment gating. **Result:** the common production pattern is a central `.github` repo holding reusable workflows that every team's repo calls for its deploy pipeline, keeping CD logic in one place instead of copy-pasted across dozens of repos.

---

## Official Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Marketplace — Actions](https://github.com/marketplace?type=actions)
- [Security Hardening for Actions](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions)

---

