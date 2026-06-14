# Ansible — Learning Roadmap

## Time to Job-Ready: 6 weeks (2 hours/day)

**Goal:** Automate server configuration, application deployment, and compliance at scale without agents.

## Phase 1 — Basics (Week 1-2)
- Understand agentless architecture: SSH-based, no daemon needed on targets
- Install Ansible: `pip install ansible`
- Inventory files: static hosts, groups, `group_vars/`, `host_vars/`
- Ad-hoc commands: `ansible all -m ping`, `ansible webservers -m command -a "uptime"`
- First playbook: YAML syntax, `hosts`, `tasks`, `handlers`
- Core modules: `copy`, `template`, `service`, `package`, `user`, `file`

## Phase 2 — Playbooks (Week 3-4)
- Variables: `vars`, `vars_files`, `register`, `set_fact`
- Jinja2 templates: `{{ variable }}`, `{% if %}`, `{% for %}`
- Conditionals: `when` clause
- Loops: `loop`, `with_items`, `with_dict`
- Tags: run specific parts of playbooks
- Roles: organize playbooks into reusable, shareable components

## Phase 3 — Production (Week 5)
- Ansible Vault: encrypt secrets, `ansible-vault encrypt/decrypt`
- Error handling: `ignore_errors`, `failed_when`, `block/rescue/always`
- Rolling updates: `serial`, `max_fail_percentage`
- AWX/Ansible Tower: UI for team-based automation
- Performance: `forks`, `pipelining`, `async` tasks

## Phase 4 — Advanced (Week 6)
- Dynamic inventories: AWS EC2, Azure, GCP plugins
- Custom modules: write Python modules for custom logic
- Molecule: test roles with Docker containers
- `ansible-lint`: enforce best practices
- Integration with CI/CD pipelines

## Certifications
- **Red Hat EX407** — Ansible Automation Specialist
- **Red Hat EX294** — Automation with Ansible (RHCE component)

## Jobs After Ansible Mastery
Automation Engineer · DevOps Engineer · Configuration Management Engineer · SRE

## Resources
- **docs.ansible.com** — official documentation
- **Ansible for DevOps** by Jeff Geerling (free PDF at ansiblefordevops.com)
