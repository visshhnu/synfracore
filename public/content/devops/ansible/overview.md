# Ansible

> **Agentless configuration management and automation**

**Category:** Infrastructure as Code  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Ansible?

Ansible is a simple, agentless automation tool that uses SSH to connect to managed nodes. No agent installation required. Uses YAML playbooks. Idempotent by design — running the same playbook twice produces the same result.

## Why Ansible?

Inventory defines managed hosts. Use dynamic inventory with cloud plugins to auto-discover instances. Group vars allow different configurations per environment. Never hardcode hostnames — use dynamic discovery in production.

---

## Learning Modules

### Module 01 — What is Ansible?
*Agentless automation with YAML*

Ansible is a simple, agentless automation tool that uses SSH to connect to managed nodes. No agent installation required. Uses YAML playbooks. Idempotent by design — running the same playbook twice produces the same result.

**Topics covered:**

- Ansible vs Chef vs Puppet — 🟢 Beginner
- Agentless architecture — 🟢 Beginner
- Push vs Pull model — 🟢 Beginner

### Module 02 — Inventory
*Static and dynamic inventory*

Inventory defines managed hosts. Use dynamic inventory with cloud plugins to auto-discover instances. Group vars allow different configurations per environment. Never hardcode hostnames — use dynamic discovery in production.

**Topics covered:**

- INI and YAML inventory — 🟢 Beginner
- Dynamic inventory (AWS, Azure) — 🟡 Intermediate
- Groups and variables — 🟢 Beginner
- Host patterns — 🟡 Intermediate

### Module 03 — Playbooks & Tasks
*YAML playbooks, modules, handlers*

Playbooks are Ansible's configuration language. Tasks call modules. Handlers run only when notified (e.g., restart nginx after config change). Facts are auto-discovered system information. Tags allow running subsets of tasks.

**Topics covered:**

- Playbook structure — 🟢 Beginner
- Common modules (package, service, file, template) — 🟢 Beginner
- Variables and facts — 🟡 Intermediate
- Handlers and notify — 🟡 Intermediate
- Tags — 🟢 Beginner

### Module 04 — Roles
*Reusable, shareable units*

Roles are the Ansible equivalent of Terraform modules — reusable, structured, shareable. Galaxy is the community role repository. Always test roles with Molecule before production use.

**Topics covered:**

- Role structure (tasks, vars, templates, files) — 🟡 Intermediate
- Ansible Galaxy — 🟡 Intermediate
- Role dependencies — 🟡 Intermediate
- Testing roles with Molecule — 🔴 Advanced

### Module 05 — Ansible Vault
*Encrypting secrets*

Ansible Vault encrypts sensitive data in playbooks and variable files. Use vault-id for multiple vault passwords (per environment). For enterprise: integrate with HashiCorp Vault for dynamic secrets.

**Topics covered:**

- encrypt/decrypt files — 🟡 Intermediate
- vault-id and multiple vaults — 🔴 Advanced
- Integration with HashiCorp Vault — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Ansible and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Ansible work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Ansible?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Ansible?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Ansible?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Ansible in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Ansible?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Ansible compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is Ansible? in Ansible."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Inventory in Ansible."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*