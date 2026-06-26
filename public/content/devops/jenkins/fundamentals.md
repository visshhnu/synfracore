# Jenkins Complete Guide

CI/CD › Jenkins
**Jenkins**
BeginnerEngineerProductionArchitectCI/CD automation server — pipelines, agents, shared libraries, production DevOps
[What is Jenkins](#sec-what)[Agents](#sec-agents)[Declarative Pipeline](#sec-pipeline)[Shared Library](#sec-shared-lib)[Credentials](#sec-secrets)[Multibranch](#sec-multibranch)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## ⚙️ What is Jenkins? Why It Still Dominates›


#### Born in 2004, still running millions of pipelines in 2026

Jenkins started as Hudson at Sun Microsystems in 2004. At that time there was no standard way to automatically build, test, or deploy software — teams did it manually, inconsistently, slowly. Jenkins automated the entire process. It became the industry standard for CI/CD and never gave up that position.


Today GitHub Actions, GitLab CI, and Azure DevOps have taken significant share for new projects. But Jenkins dominates in enterprises because: it was there first (millions of Jenkinsfiles already written), its plugin ecosystem (1,800+) covers every integration imaginable, and the migration cost from Jenkins to anything else is enormous.


#### Jenkins vs alternatives — honest assessment


|  | Jenkins | GitHub Actions | GitLab CI | Azure DevOps |
|---|---|---|---|---|
| Who manages infra | You (self-hosted) | GitHub | GitLab | Microsoft |
| Pipeline language | Groovy (Declarative or Scripted) | YAML | YAML | YAML |
| Plugin ecosystem | 1,800+ plugins (unmatched) | GitHub Marketplace | Built-in | Azure Marketplace |
| Free minutes | Unlimited (your server) | 2,000/month | 400/month | 1,800/month |
| Best for | Enterprise, complex pipelines, existing investment | GitHub repos, modern teams | GitLab users | Azure/Microsoft shops |


**HPE Real Scenario**At HPE, Jenkins orchestrated CI/CD for the TeMIP/SRO telecom platform — 15+ microservices. Shared Library functions meant each service Jenkinsfile was 30 lines. Pipeline ran: SonarQube → OWASP check → Maven build → Docker build → Trivy scan → Helm deploy to OpenShift. A change previously taking 2 weeks of manual handoffs deployed in 45 minutes.


Jenkins architecture and terminologyCopy

```

```


## 🖥️ Agents — Where Builds Actually Run›


#### This is the most misunderstood Jenkins concept

The Jenkins **master (controller)** is the brain: reads Jenkinsfiles, schedules builds, serves the UI, stores history. It should NEVER run builds directly in production — it is a single point of failure. The **agents** are the workers: separate machines or containers that actually compile your code, run tests, build Docker images.


Every Jenkins performance problem, every "builds are slow" complaint, traces back to agent configuration. Get agents right and Jenkins scales beautifully. Get them wrong and you have a bottleneck.


#### The four agent types


| Type | How it works | Best for | Main risk |
|---|---|---|---|
| Master node | Runs on the Jenkins master itself | Testing/demos only | Security risk, resource contention |
| Permanent SSH | Jenkins SSHes into a dedicated VM | Simple setups, always-on needs | Idle cost, environment drift |
| Docker | Fresh container per build | Reproducible builds, clean environment | Docker daemon needed on agent |
| Kubernetes pod | K8s pod per build, auto-destroyed | Cloud-native, auto-scale, zero idle | 10-30 second pod startup overhead |


**Why K8s Agents Win at Scale**Zero idle cost. When no builds run, zero agent pods exist. When 30 builds trigger simultaneously, 30 pods spin up across the cluster. Each gets exactly the resources it needs. Combined with KEDA: the Jenkins agent node pool scales from 0 to 20 nodes and back automatically. Monthly compute cost for CI/CD drops by 70% versus always-on VMs.


All four agent types with real configuration codeCopy

```

```


## 🔧 Declarative Pipeline — Production Complete›


#### The Jenkinsfile is your pipeline as code

Your Jenkinsfile lives in the root of your Git repository, versioned alongside your application code. This means: pipeline changes go through PR review, you can blame who broke the pipeline, every branch can have its own pipeline variation, and Jenkins automatically discovers it.


Use **Declarative pipeline** — it has a strict, validated structure that catches errors before running. Scripted pipeline (pure Groovy) is only needed for complex dynamic logic that Declarative cannot handle. 95% of real-world pipelines should be Declarative.


Complete Jenkinsfile: test→quality gate→build→security scan→deploy→approve→productionCopy

```

```


## 📚 Shared Libraries — Eliminate Duplication›


#### 50 microservices, 50 Jenkinsfiles — all doing the same thing

Without Shared Library: Team A wrote their own Docker build. Team B copied it with variations. Team C invented something different. When you need to add Trivy scanning to all 50 services, you update 50 files manually. Half the teams do it wrong. Takes three days.


With Shared Lib
