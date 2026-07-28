# GitHub Actions Interview Q&A

**Q: GitHub Actions vs Jenkins?**
GitHub Actions: native to GitHub, no server to manage, free for public repos, YAML in repo. Jenkins: self-hosted, maximum flexibility, plugin ecosystem, better for complex enterprise pipelines. GitHub Actions is preferred for cloud-native projects; Jenkins for complex legacy environments.

**Q: What are reusable workflows?**
Workflows that can be called from other workflows using `workflow_call` trigger. Eliminates copy-paste across repos. Define once in a central repo, call with `uses: org/repo/.github/workflows/deploy.yml@main`.

**Q: How do you handle secrets in GitHub Actions?**
Store in Settings → Secrets (repo) or org-level secrets. Access as `${{ secrets.MY_SECRET }}`. For dynamic secrets: use OIDC with cloud providers — no long-lived credentials needed (AWS/Azure/GCP support OIDC).


**Q: What are GitHub Actions environments and how do they help?**
Environments (Settings > Environments) add protection rules to deployments: required reviewers (manual approval), deployment branch restrictions, environment-specific secrets. A production environment might require two approvals — the job pauses until approved. Provides audit trail of who approved each deployment.

**Q: What is OIDC in GitHub Actions and why prefer it over stored secrets?**
OpenID Connect allows GitHub Actions to authenticate directly to cloud providers (AWS, Azure, GCP) without storing long-lived credentials. Workflow requests a short-lived token from GitHub's OIDC provider; cloud provider validates the token and grants temporary access. No secrets stored, tokens expire automatically, tied to specific repo/branch conditions.

**Q: How do you speed up GitHub Actions workflows?**
1. Cache dependencies: `actions/cache` for npm, pip, Maven, Gradle
2. Run jobs in parallel (separate jobs, no `needs:`)
3. Use smaller runner images (ubuntu-latest vs custom large)
4. Conditional steps: `if: github.ref == 'refs/heads/main'` skip on PRs
5. Matrix builds for multi-version testing
6. Self-hosted runners for specific hardware needs

**Q: What is the difference between a job and a step in GitHub Actions?**
Jobs run on separate virtual machines (or runners) — isolated environments, can run in parallel. Steps run sequentially within a job — share the same filesystem and environment. Data passes between jobs via artifacts or outputs; data passes between steps via environment files or outputs.

