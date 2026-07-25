# Azure DevOps — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Multi-Stage YAML Pipeline with Test Gates

**Level:** Beginner | **Time:** 2 days

Build a YAML pipeline for a small app that runs tests, publishes results and coverage, and only builds a container image if tests pass — with everything defined as code in `azure-pipelines.yml`, not the Classic visual editor.

### Steps

1. Pick a small app (even a "hello world" API) and push it to an Azure Repos or GitHub repo connected to Azure Pipelines
2. Write a `Build` stage: install dependencies, run the test suite, publish results with `PublishTestResults@2` and coverage with `PublishCodeCoverageResults@1`
3. Make the Docker build/push step conditional on the test stage succeeding (`condition: succeeded()`, or simply sequential stage `dependsOn`)
4. Add a `pr:` trigger so the same checks run automatically on every pull request, before merge
5. Deliberately break a test, push, and confirm the pipeline fails and blocks the build stage — then fix it and confirm it goes green
6. Document, in the README, why YAML pipelines-as-code are preferred over Classic (version-controlled, reviewable in PRs, reusable as templates)

### Skills Demonstrated

- YAML pipeline authoring (stages, jobs, conditions)
- Test/coverage publishing and using pipeline results as a real gate
- PR-triggered validation

### GitHub Repo Name

`azure-devops-pipeline-test-gates`

---

## Project 2: Multi-Environment Deployment with Approval Gates

**Level:** Intermediate | **Time:** 3 days

Extend the pipeline from Project 1 into a real staging → production flow, using Azure Environments with a manual approval gate in front of production and a canary rollout once approved.

### Steps

1. Create two Environments in Azure Pipelines (`staging`, `production`); leave `staging` open and add a required approver to `production`
2. Add a `DeployStaging` stage that deploys automatically after `Build` succeeds (to AKS, App Service, or even a simple VM — whatever you have available)
3. Add a smoke test step after the staging deploy (a `curl` health check) that fails the stage if the app doesn't respond
4. Add a `DeployProduction` stage referencing the `production` environment with a `canary` strategy (`increments: [10, 25, 100]`), gated behind the approval
5. Run the pipeline, confirm it pauses at the approval gate and sends a notification, approve it, and watch the canary increments roll out
6. Check the Environment's deployment history — confirm the approval and who approved it are recorded there, not just in your memory

### Skills Demonstrated

- Environments, approvals, and checks as a real deployment gate
- Canary deployment strategy in Azure Pipelines
- Auditable deployment history

### GitHub Repo Name

`azure-devops-approval-gated-deploy`

---

## Project 3: Reusable Pipeline Templates Across Multiple Services

**Level:** Advanced | **Time:** 4 days

Extract a shared, parameterized deploy template into its own repo and consume it from at least two different application pipelines — so a change to the deployment pattern (e.g. adding a new smoke test) updates every consuming pipeline without editing each one individually.

### Steps

1. Create a `pipeline-templates` repo with a `templates/deploy-to-aks.yml` file taking parameters for `environment`, `aksCluster`, `namespace`, and `helmValues`
2. Register that repo as a resource in each application pipeline (`resources: repositories:`) and reference the template with `- template: templates/deploy-to-aks.yml@shared-templates`
3. Wire up at least two separate application pipelines to consume the same template with different parameters
4. Add a variable group (`Library → Variable Groups`), optionally linked to Azure Key Vault, and reference it from the shared template so secrets aren't duplicated per app
5. Make one change to the shared template (e.g. add a post-deploy smoke test step) and confirm — without touching either application pipeline's YAML — that both pick up the change on their next run
6. Document the versioning strategy: are consumers pinned to a template repo ref/tag, or always on the latest commit, and what the tradeoff is

### Skills Demonstrated

- Pipeline template reuse across multiple repos/pipelines
- Centralized secret management via Variable Groups / Key Vault
- Understanding template versioning tradeoffs (pinned vs. floating)

### GitHub Repo Name

`azure-devops-shared-pipeline-templates`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. A pipeline that actually gates a real deployment behind a real approval is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
