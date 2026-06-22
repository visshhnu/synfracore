# Azure DevOps Interview Questions

## Core Concepts

**Q: What is Azure DevOps? What are its components?**

Azure DevOps is Microsoft's end-to-end DevOps platform providing tools for planning, development, testing, and deployment.

**Five components:**
1. **Azure Boards**: Agile planning — backlogs, sprints, Kanban boards, work items (Epics → Features → User Stories → Tasks)
2. **Azure Repos**: Git repositories (or TFVC legacy). Pull requests, branch policies, code review.
3. **Azure Pipelines**: CI/CD — build and release pipelines for any language/platform/cloud.
4. **Azure Test Plans**: Manual and exploratory testing, test case management.
5. **Azure Artifacts**: Package management — NuGet, npm, Maven, PyPI feeds.

---

**Q: Azure Pipelines YAML — explain the structure.**

```yaml
trigger:
  branches:
    include: [main, develop]
  paths:
    exclude: [docs/*, README.md]

pool:
  vmImage: 'ubuntu-latest'   # Microsoft-hosted agent
  # OR:
  # name: 'MyPool'           # Self-hosted agent pool

variables:
  buildConfiguration: 'Release'
  imageTag: $(Build.BuildId)

stages:
- stage: Build
  displayName: 'Build and Test'
  jobs:
  - job: BuildJob
    steps:
    - task: Docker@2
      displayName: 'Build Docker image'
      inputs:
        command: build
        dockerfile: Dockerfile
        tags: $(imageTag)

    - task: PublishTestResults@2
      inputs:
        testResultsFormat: JUnit
        testResultsFiles: '**/test-results.xml'

- stage: Deploy
  displayName: 'Deploy to Production'
  dependsOn: Build
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: DeployToAKS
    environment: 'production'   # Requires approval if configured
    strategy:
      runOnce:
        deploy:
          steps:
          - task: KubernetesManifest@0
            inputs:
              action: deploy
              manifests: k8s/*.yaml
```

---

**Q: Service connections and environments.**

**Service connections**: Connect Azure DevOps to external services.
- Azure Resource Manager (ARM): Deploy to Azure subscriptions
- Docker Registry: Push/pull images from ACR or Docker Hub
- Kubernetes: Deploy to AKS/on-prem clusters
- GitHub/GitLab: Source code integration

**Environments**: Named deployment targets (dev, staging, prod) with approval gates and history.
```yaml
environment: 'production'  # Track deployments, require approval
```

Configure approval: Environment → Approvals and Checks → Add approver.

---

**Q: Azure Pipelines vs GitHub Actions.**

| Feature | Azure Pipelines | GitHub Actions |
|---|---|---|
| Trigger | Git events, schedules, API | Git events, schedules, webhooks |
| Agents | Microsoft-hosted + self-hosted | GitHub-hosted + self-hosted |
| Marketplace | Azure DevOps Extensions | GitHub Actions Marketplace |
| Pricing | Free tier + parallel job pricing | Free minutes + pay per minute |
| Integration | Deep Azure integration | Deep GitHub integration |
| Best for | Enterprise, multi-cloud, Azure-heavy | GitHub-native, open source |

---

**Q: Branch policies and code quality gates.**

```
Azure Repos → Branch Policies → main branch:
✓ Require minimum 2 reviewers
✓ Check for linked work items
✓ Require comment resolution
✓ Build validation (PR triggers CI pipeline must pass)
✓ Require up-to-date branch (rebase/merge before merge)
✗ Allow direct push (force review process)
```

## Revision Notes
```
AZURE DEVOPS: Boards + Repos + Pipelines + Test Plans + Artifacts

PIPELINE YAML STRUCTURE:
trigger → pool → variables → stages → jobs → steps
stages: Build → Test → Deploy (with dependsOn and conditions)
environment: named target with approval gates
condition: only deploy from main, on success

SERVICE CONNECTIONS: ARM, Docker Registry, Kubernetes, GitHub
ENVIRONMENTS: deployment history + approval gates per target

BRANCH POLICIES:
Minimum reviewers | Build validation (CI must pass)
Work item linking | Comment resolution | Up-to-date branch required

vs GITHUB ACTIONS: Azure DevOps = enterprise/Azure-heavy | GH Actions = GitHub-native
```
