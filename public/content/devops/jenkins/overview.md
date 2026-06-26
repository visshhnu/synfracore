# Jenkins

> **The leading open-source automation server**

**Category:** CI/CD  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Jenkins?

Jenkins has a master (controller) that schedules jobs and a fleet of agents that run them. The controller should never run build jobs — agent isolation is critical. Plugins extend everything, but also cause upgrade complexity.

## Why Jenkins?

Declarative Pipeline is the modern way to write Jenkinsfiles. Always store Jenkinsfile in source control (Pipeline as Code). post block ensures cleanup/notification regardless of build result.

---

## Learning Modules

### Module 01 — Jenkins Architecture
*Master, Agents, Plugins*

Jenkins has a master (controller) that schedules jobs and a fleet of agents that run them. The controller should never run build jobs — agent isolation is critical. Plugins extend everything, but also cause upgrade complexity.

**Topics covered:**

- Master-Agent architecture — 🟢 Beginner
- Controller vs Agent — 🟢 Beginner
- Plugin ecosystem — 🟡 Intermediate

### Module 02 — Declarative Pipelines
*Jenkinsfile as Code*

Declarative Pipeline is the modern way to write Jenkinsfiles. Always store Jenkinsfile in source control (Pipeline as Code). post block ensures cleanup/notification regardless of build result.

**Topics covered:**

- Pipeline syntax (stages, steps, agent) — 🟢 Beginner
- post conditions (always, success, failure) — 🟢 Beginner
- Environment and credentials — 🟡 Intermediate
- Parallel stages — 🟡 Intermediate

### Module 03 — Shared Libraries
*DRY pipelines across teams*

Shared Libraries prevent copy-paste pipelines across 50 teams. Create a central library Git repo, define common functions in vars/. Teams import with @Library. Pin to tagged versions for stability.

**Topics covered:**

- Library structure (vars/, src/) — 🟡 Intermediate
- @Library annotation — 🟡 Intermediate
- Implicit vs explicit loading — 🟡 Intermediate
- Versioned libraries — 🔴 Advanced

### Module 04 — Production Patterns
*High availability, security, scaling*

Production Jenkins runs agents on Kubernetes (dynamic provisioning). Credentials stored in Jenkins Credentials Store or HashiCorp Vault. Job DSL or CasC (Configuration as Code) for reproducible setup.

**Topics covered:**

- Jenkins HA with active/standby — 🔴 Advanced
- Credentials management (Vault) — 🔴 Advanced
- Agent autoscaling on Kubernetes — 🔴 Advanced
- Pipeline optimization — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Jenkins and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Jenkins work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Jenkins?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Jenkins?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Jenkins?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Jenkins in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Jenkins?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Jenkins compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Jenkins Architecture in Jenkins."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Declarative Pipelines in Jenkins."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Jenkins User Documentation](https://www.jenkins.io/doc/)
- [Pipeline Syntax Reference](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Shared Libraries Guide](https://www.jenkins.io/doc/book/pipeline/shared-libraries/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*