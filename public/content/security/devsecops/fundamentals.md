# DevSecOps

Security › DevSecOps
🛡️**DevSecOps**
BeginnerEngineerProductionArchitectSecurity in DevOps — shift-left, SAST, container scanning, secrets, IaC security
[What is DevSecOps](#sec-what)[Secrets Detection](#sec-secrets)[SAST](#sec-sast)[Container Security](#sec-container)[IaC Scanning](#sec-iac)[Full Pipeline](#sec-pipeline)[Interview Q&A](#sec-interview)


## 🛡️ What is DevSecOps?›


#### The Security as Code Philosophy

Traditional approach: developers build, security team reviews at the end, finds vulnerabilities, sends back for fixes. This creates a bottleneck, a blame culture, and late-stage expensive fixes.


DevSecOps approach: security tools run automatically in every pipeline stage. Developers get feedback in their pull request, not in a report three months later.


| Stage | Security Tool | What it finds | When |
|---|---|---|---|
| Pre-commit | Gitleaks, git-secrets | Secrets before they reach Git | Every save |
| Code | Semgrep, SonarQube | Injection, insecure patterns | Every PR |
| Dependencies | Trivy, Dependabot, Snyk | Known CVEs in libraries | Every PR |
| Container | Trivy, Grype | Vulnerabilities in Docker image | Every build |
| IaC | Checkov, tfsec | Cloud misconfigurations | Every PR |
| Runtime | Falco | Suspicious activity in prod | Continuous |


DevSecOps concepts and pipeline overviewCopy

```

```


## 🔑 Secrets Detection›


#### The #1 DevSecOps incident cause

Developers accidentally commit API keys, database passwords, and private keys to Git. Once in Git history, the secret is compromised — even after deletion, it is in every clone ever made. Prevention is the only solution.


Gitleaks pre-commit hooks + history scanningCopy

```

```


## 🔍 SAST — Code Scanning›


Semgrep, SonarQube, OWASP Top 10 explainedCopy

```

```


## 🐳 Container Security›


#### Four layers of container security


- **Minimal base image** — distroless or Alpine. Less software = smaller attack surface

- **Non-root user** — USER 1001 in Dockerfile. Limits blast radius if compromised

- **CVE scanning** — Trivy before pushing to registry

- **Image signing** — Cosign for supply chain security


Dockerfile security + Trivy + FalcoCopy

```

```


## 🔷 IaC Security Scanning›


Checkov + tfsec + OPA GatekeeperCopy

```

```


## ⚡ Complete DevSecOps Pipeline›


Full GitHub Actions DevSecOps pipelineCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


DEVSECOPS · ENGINEER
What is DevSecOps and what does shift-left mean?
DevSecOps integrates security into every stage of the software delivery lifecycle rather than treating it as a separate phase at the end. Shift-left means moving security checks to earlier stages of development — left on the timeline. The economic argument: fixing a vulnerability in a developer's editor costs almost nothing (minutes of developer time). Fixing the same vulnerability after it reaches production costs orders of magnitude more — incident response, customer notification, regulatory fines, reputation damage. Practical shift-left: pre-commit hooks detect secrets before they reach Git. SAST scans code on every commit. Dependency scanning checks for known CVEs in libraries on every build. Container scanning checks Docker images before they are pushed. IaC scanning checks Terraform and Helm for misconfigurations before they deploy. The goal is for security findings to appear in the developer's pull request, not in a penetration test report three months later.

DEVSECOPS · ARCHITECT
How do you build a DevSecOps pipeline that does not slow down development?
Speed is the enemy of security adoption. Developers disable slow security checks. Design for speed. Order tools by speed and fail fast: gitleaks secrets scan runs in 10 seconds — first in
