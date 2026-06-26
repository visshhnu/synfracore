# GitHub Actions Interview Q&A

**Q: GitHub Actions vs Jenkins?**
GitHub Actions: native to GitHub, no server to manage, free for public repos, YAML in repo. Jenkins: self-hosted, maximum flexibility, plugin ecosystem, better for complex enterprise pipelines. GitHub Actions is preferred for cloud-native projects; Jenkins for complex legacy environments.

**Q: What are reusable workflows?**
Workflows that can be called from other workflows using `workflow_call` trigger. Eliminates copy-paste across repos. Define once in a central repo, call with `uses: org/repo/.github/workflows/deploy.yml@main`.

**Q: How do you handle secrets in GitHub Actions?**
Store in Settings → Secrets (repo) or org-level secrets. Access as `${{ secrets.MY_SECRET }}`. For dynamic secrets: use OIDC with cloud providers — no long-lived credentials needed (AWS/Azure/GCP support OIDC).
