# Azure DevOps Certification Guide

## Primary Certification

**AZ-400 Designing and Implementing Microsoft DevOps Solutions**

*Format*: 40-60 MCQ | 3 hours | 700/1000 | $165 USD

## Related Certifications

- GitHub Actions Certification
- AZ-204 Azure Developer Associate

## Key Exam Topics

- Azure Pipelines: YAML pipeline structure (trigger, pool, stages, jobs, steps)
- Service connections: authenticate pipelines to external services (Azure, GitHub, Docker)
- Environments: track deployments; approval gates before prod deployment
- Branch policies: require reviews, build validation, work item linking before merging
- Variable groups and Azure Key Vault: share variables across pipelines securely
- Azure Artifacts: private package feeds (npm, NuGet, Maven, Python, Universal)
- Test Plans: manual + exploratory testing; integrate test results from CI pipeline

## Must-Know CLI Commands

```bash
az devops configure --defaults organization=https://dev.azure.com/myorg project=myproject
az pipelines create --name my-pipeline --yaml-path azure-pipelines.yml --repository myrepo
az pipelines run --name my-pipeline --branch main
az pipelines variable-group create --name my-vars --authorize --variables MY_VAR=value
az artifacts universal download --feed myfeed --name mypackage --version 1.0.0 --path ./output
```

## Exam Tips

- YAML pipelines > Classic pipelines: version controlled, reviewable, reusable
- Template syntax: extends template for standardized pipelines across teams
- Deployment gates: invoke Azure Function or REST API to check conditions before deploy
- Service connections: use managed identity (not service principal) for Azure resources

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AZ-400 Designing and Implementing Microsoft DevOps Solutions

TOP TOPICS:
  Azure Pipelines: YAML pipeline structure (trigger, pool, stages, jobs, steps)
  Service connections: authenticate pipelines to external services (Azure, GitHub,
  Environments: track deployments; approval gates before prod deployment
  Branch policies: require reviews, build validation, work item linking before mer
```
