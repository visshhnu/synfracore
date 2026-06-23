# Ansible Certification Guide

## Certifications Available

| Cert | Full Name | Type | Passing |
|------|-----------|------|---------|
| **EX294** | Red Hat Certified Specialist in Ansible Automation | Performance-based | 210/300 |
| **EX407** | Red Hat Certified Specialist in Ansible Network | Performance-based | 210/300 |
| RHCE includes | Ansible is now core part of RHCE (EX294 = RHCE on RHEL 9) | | |

**No multiple choice** — all Red Hat exams are hands-on lab tasks in real RHEL systems.

---

## EX294 Exam Objectives

**Core tasks you must be able to do:**

```
PLAYBOOKS:
  ✓ Write playbooks with multiple plays
  ✓ Use variables, facts, and magic variables
  ✓ Use conditionals (when) and loops (loop, with_items)
  ✓ Handle errors (ignore_errors, failed_when, block/rescue/always)
  ✓ Use handlers and notifications

FILES & TEMPLATES:
  ✓ Copy files with the copy and template modules
  ✓ Create Jinja2 templates with variables and filters
  ✓ Manage file permissions, ownership, SELinux contexts

ROLES:
  ✓ Create roles with proper directory structure
  ✓ Install roles from Ansible Galaxy
  ✓ Use role dependencies

SECURITY:
  ✓ Encrypt variables and files with Ansible Vault
  ✓ Use vault-encrypted variables in playbooks

ADVANCED:
  ✓ Use dynamic inventory
  ✓ Configure Ansible (ansible.cfg)
  ✓ Manage software (yum/dnf module)
  ✓ Manage services (service/systemd module)
  ✓ Manage users and groups
```

---

## Critical Playbook Patterns

```yaml
---
- name: Configure web servers
  hosts: webservers
  become: true
  vars:
    http_port: 80
    packages:
      - httpd
      - firewalld

  pre_tasks:
    - name: Update package cache
      ansible.builtin.dnf:
        update_cache: true

  roles:
    - common
    - webserver

  tasks:
    - name: Install packages
      ansible.builtin.dnf:
        name: "{{ packages }}"
        state: present

    - name: Start and enable services
      ansible.builtin.systemd:
        name: "{{ item }}"
        state: started
        enabled: true
      loop: "{{ packages }}"

    - name: Template config file
      ansible.builtin.template:
        src: templates/httpd.conf.j2
        dest: /etc/httpd/conf/httpd.conf
        mode: '0644'
      notify: Restart httpd

    - name: Open firewall port
      ansible.posix.firewalld:
        port: "{{ http_port }}/tcp"
        state: enabled
        permanent: true
        immediate: true

  handlers:
    - name: Restart httpd
      ansible.builtin.service:
        name: httpd
        state: restarted
```

---

## Ansible Vault (Always on Exam)

```bash
# Encrypt a file
ansible-vault encrypt secrets.yml
ansible-vault encrypt_string 'my_password' --name 'db_password'

# Edit encrypted file
ansible-vault edit secrets.yml

# Run playbook with vault password
ansible-playbook site.yml --ask-vault-pass
ansible-playbook site.yml --vault-password-file ~/.vault_pass

# Rekey (change vault password)
ansible-vault rekey secrets.yml
```

---

## Role Structure

```
roles/
  webserver/
    tasks/        # main.yml (required)
    handlers/     # main.yml
    templates/    # Jinja2 templates (.j2)
    files/        # Static files
    vars/         # Higher precedence variables
    defaults/     # Lower precedence variables (user can override)
    meta/         # Role dependencies, metadata
    tests/        # Molecule test files
```

---

## Study Resources & Plan

**Official**: Red Hat Training course **RH294** (Ansible Automation with Ansible)

**Week 1**: Install Ansible, ad-hoc commands, inventory
**Week 2**: Write playbooks with modules, variables, conditionals
**Week 3**: Roles (create + Galaxy), handlers, templates
**Week 4**: Vault, dynamic inventory, error handling
**Week 5**: Full mock exam practice

## Revision Notes
```
EX294: RHCE on RHEL 9 | Hands-on | 4 hours | 210/300 pass

MUST MASTER:
  Playbook syntax: hosts, become, vars, tasks, handlers
  Key modules: dnf, service/systemd, copy, template, user, file, firewalld
  Conditionals: when: var == "value" | when: ansible_os_family == "RedHat"
  Loops: loop: "{{ list }}" | loop: "{{ dict | dict2items }}"
  Error handling: block/rescue/always | ignore_errors | failed_when

VAULT: ansible-vault encrypt/decrypt/edit/rekey
  Run with: --ask-vault-pass or --vault-password-file

ROLE CREATION: ansible-galaxy init rolename
  tasks/main.yml is the entry point
  defaults/: overridable | vars/: not easily overridden

IDEMPOTENCY: every task must be safe to run multiple times
  state: present/absent/latest — not commands like "run this script"
```
