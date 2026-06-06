# Ansible — Configuration Management & Automation

Ansible is the most widely used configuration management and automation tool in enterprise DevOps. It is **agentless** — no software needs to be installed on managed nodes. Everything runs over SSH using Python modules pushed temporarily to the target.

## What is Ansible?

Ansible is an open-source automation platform that handles:
- **Configuration management** — Ensure servers are configured consistently
- **Application deployment** — Deploy code across many servers simultaneously
- **Orchestration** — Coordinate multi-tier application deployments
- **Patch management** — Update packages across your entire fleet
- **User management** — Create users, manage SSH keys at scale

## Why Ansible Over Other Tools?

| Tool | Agent Required | Language | Learning Curve | Best For |
|------|---------------|----------|----------------|----------|
| **Ansible** | No (agentless) | YAML | Low | General automation, existing infrastructure |
| **Chef** | Yes (chef-client) | Ruby DSL | High | Large enterprises, complex logic |
| **Puppet** | Yes (puppet agent) | Puppet DSL | High | Compliance-heavy environments |
| **SaltStack** | Yes (minion) | YAML/Python | Medium | High-scale, event-driven |

**Why Ansible wins for most teams:**
- Zero agent overhead — just SSH and Python (already on every Linux server)
- Human-readable YAML — ops team can read and write it
- **Idempotent** — running the same playbook 10 times produces the same result
- 5,000+ modules — covers everything from packages to AWS to Kubernetes
- Ansible Galaxy — community roles for everything

## Architecture

```
Control Node (your laptop / CI server)
    │
    ├── Inventory (which servers)
    ├── Playbooks (what to do)
    ├── Roles (reusable structure)
    └── Vault (encrypted secrets)
    │
    SSH ──→ Managed Node 1 (web-01)
    SSH ──→ Managed Node 2 (web-02)
    SSH ──→ Managed Node 3 (db-01)
```

**No daemon on managed nodes.** Ansible SSHs in, copies a Python module, executes it, returns result, and cleans up. Completely stateless from the target perspective.

## Key Concepts

**Inventory** — The list of hosts Ansible manages. Can be static (INI/YAML file) or dynamic (AWS, Azure, GCP plugins that query APIs in real time).

**Playbook** — YAML file containing plays. A play maps hosts to tasks. Tasks call modules. Modules do the actual work.

**Module** — The unit of work. `apt`, `yum`, `copy`, `template`, `service`, `shell`, `aws_ec2`, `k8s` — 5000+ built-in modules.

**Role** — A reusable, structured way to organize playbooks. Has `tasks/`, `handlers/`, `vars/`, `templates/`, `files/` directories.

**Handler** — A task that only runs when notified. Classic use: restart nginx only when its config changes.

**Vault** — Encrypts sensitive data (passwords, API keys) inside YAML files. Decrypted at runtime.

**Idempotency** — The most important Ansible concept. Running `apt: name=nginx state=present` 100 times installs nginx once — subsequent runs do nothing because the desired state already exists. This means you can safely run playbooks repeatedly.

## Real-World Use Cases

1. **Server provisioning** — New EC2 instances auto-configured via Ansible run on first boot
2. **Application deployment** — Deploy new code version to 100 web servers in rolling fashion
3. **Compliance enforcement** — Run weekly playbook ensuring all servers meet CIS benchmark
4. **Kubernetes node setup** — Install container runtime, kubelet, kubeadm on new worker nodes
5. **Certificate rotation** — Replace TLS certs across all services before expiry
6. **Patch management** — Apply security patches with maintenance window controls
