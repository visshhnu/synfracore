# Ansible — Fundamentals

## Agentless, over SSH, idempotent by design

Ansible needs no agent installed on managed hosts — it connects over standard SSH (or WinRM for Windows), pushes a small Python payload, executes it, and cleans up. This is a real, practical advantage over agent-based tools (Chef, Puppet): nothing to install, upgrade, or troubleshoot on every managed node beyond SSH access itself. **Idempotency is the other core design principle**: a well-written Ansible task, run twice, produces the same end state as running it once — it checks current state before acting, and only makes a change if one is actually needed. This is what makes safely re-running a playbook (rather than tracking exactly what already ran) the normal, expected workflow.

## Playbooks, tasks, and modules

```yaml
---
- name: Configure web servers
  hosts: webservers
  become: true
  tasks:
    - name: Install nginx
      package:
        name: nginx
        state: present

    - name: Deploy config
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf
      notify: restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted
```

A **playbook** is a YAML file describing what to do; **tasks** are individual steps within it; each task calls a **module** (`package`, `template`, `service`, and hundreds more) that actually does the work in an idempotent way. **Handlers** run only when explicitly notified by a task that made a real change — `restart nginx` here only fires if the config template actually changed, not on every playbook run.

## Inventory: static and dynamic

```ini
# static inventory (inventory.ini)
[webservers]
web1.example.com
web2.example.com

[webservers:vars]
ansible_user=deploy
```

Static inventory works for fixed infrastructure. For cloud environments with autoscaling — where servers are created and destroyed regularly — a static file goes stale within minutes. **Dynamic inventory** queries the cloud provider's API at runtime instead:

```yaml
# aws_ec2 dynamic inventory plugin
plugin: aws_ec2
regions: [us-east-1]
filters: { tag:Environment: production }
```

This returns the *current* list of matching instances every run, not a snapshot from whenever someone last edited a file.

## Variables and facts

Ansible gathers **facts** automatically at the start of a playbook run — real, discovered information about each managed host (OS, IP addresses, memory, disk). Combined with explicitly-defined **variables** (in inventory, playbooks, or separate `vars` files), this lets one playbook adapt its behavior per host without hardcoding per-host logic:

```yaml
- name: Install package for this OS family
  package:
    name: "{{ 'httpd' if ansible_facts['os_family'] == 'RedHat' else 'apache2' }}"
```

## Tags: running a subset of a playbook

```bash
ansible-playbook site.yml --tags "nginx,config"
ansible-playbook site.yml --skip-tags "slow-tests"
```

Tags let you run (or skip) specific tasks within a larger playbook without editing the file — genuinely useful for iterating quickly on one part of a long playbook during development, rather than re-running every task every time.

## `check` mode: dry-run before you trust a new playbook

```bash
ansible-playbook site.yml --check --diff
```

`--check` reports what *would* change without actually changing anything; `--diff` shows the actual before/after content for changed files. Running a new or modified playbook in check mode first — especially against production hosts — is the direct equivalent of `terraform plan`, and worth treating with the same discipline before a real run.
