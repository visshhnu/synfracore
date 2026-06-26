# Terraform

> **Infrastructure as Code with HCL**

**Category:** Infrastructure as Code  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Terraform?

Terraform is HashiCorp's open-source IaC tool. You describe your desired infrastructure in HCL (HashiCorp Configuration Language), and Terraform creates it. Declarative: you define WHAT, Terraform figures out HOW.

## Why Terraform?

Providers are plugins for cloud platforms. Resources are infrastructure objects. State file tracks what Terraform has created. Remote state (S3, Azure Blob) is mandatory for teams — enables locking and sharing.

---

## Learning Modules

### Module 01 — What is Terraform?
*IaC concepts and why Terraform*

Terraform is HashiCorp's open-source IaC tool. You describe your desired infrastructure in HCL (HashiCorp Configuration Language), and Terraform creates it. Declarative: you define WHAT, Terraform figures out HOW.

**Topics covered:**

- Infrastructure as Code principles — 🟢 Beginner
- Terraform vs Ansible vs Pulumi — 🟢 Beginner
- Declarative vs Imperative — 🟢 Beginner

### Module 02 — Core Concepts
*Providers, Resources, State*

Providers are plugins for cloud platforms. Resources are infrastructure objects. State file tracks what Terraform has created. Remote state (S3, Azure Blob) is mandatory for teams — enables locking and sharing.

**Topics covered:**

- Providers and registry — 🟢 Beginner
- Resources and data sources — 🟢 Beginner
- State file and remote backends — 🟡 Intermediate
- Plan, Apply, Destroy lifecycle — 🟢 Beginner

### Module 03 — Variables & Outputs
*Input vars, locals, outputs*

Variables make configurations reusable. Use terraform.tfvars or .auto.tfvars for environment-specific values. Never hardcode secrets — use environment variables or Vault integration.

**Topics covered:**

- Input variables and tfvars — 🟢 Beginner
- Local values — 🟢 Beginner
- Output values — 🟢 Beginner
- Variable validation — 🟡 Intermediate

### Module 04 — Modules
*DRY code, reusable modules*

Modules are reusable packages of Terraform configuration. Best practice: create a module library (VPC, AKS, RDS patterns) that teams use through approved templates. Pin module versions for production stability.

**Topics covered:**

- Creating modules — 🟡 Intermediate
- Module sources (local, Git, registry) — 🟡 Intermediate
- Module versioning — 🟡 Intermediate
- Enterprise module library — 🔴 Advanced

### Module 05 — State Management
*Remote state, workspaces, locking*

State is the most critical part of Terraform in teams. Remote state with locking prevents concurrent modifications. Separate state per environment, per module. Never commit state files to Git.

**Topics covered:**

- Remote backends (S3, Azure Blob) — 🟡 Intermediate
- State locking with DynamoDB — 🟡 Intermediate
- Terraform workspaces — 🟡 Intermediate
- State manipulation commands — 🔴 Advanced

### Module 06 — CI/CD Integration
*Terraform in pipelines*

Terraform should run in CI/CD, not locally. Plan in PRs so reviewers see infrastructure changes before apply. Atlantis automates this workflow. Sentinel (Terraform Enterprise) enforces policies before apply.

**Topics covered:**

- Terraform in Jenkins/GitLab — 🟡 Intermediate
- Atlantis for PR-based workflow — 🔴 Advanced
- Sentinel policies — 🔴 Advanced
- Drift detection — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Terraform and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Terraform work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Terraform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Terraform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Terraform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Terraform in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Terraform?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Terraform compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is Terraform? in Terraform."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Core Concepts in Terraform."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Azure Terraform Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*