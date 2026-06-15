# Ansible — Interview Questions

Real questions from DevOps interviews — based on O'Reilly book content and 5 years of production experience notes.

---

## Core Concepts

**What is Ansible and how does it differ from Puppet/Chef?**
Ansible is an agentless configuration management and automation tool. The key difference: Ansible uses SSH and Python — no agent needed on managed nodes. Puppet and Chef require an agent daemon installed and running on every managed node, which adds overhead and a separate update lifecycle. Ansible is push-based (control node pushes to managed nodes); Puppet/Chef are pull-based (agents check in with server). Ansible is easier to start with (lower learning curve, just YAML) but Puppet/Chef can be better at large-scale enforcing desired state continuously.

**What is the difference between a playbook, play, and task?**
Playbook is the entire YAML file containing one or more plays. Play is a top-level unit mapping a set of tasks to a group of hosts (has `name`, `hosts`, `tasks` keys). Task is a single action within a play — calls one module. One playbook → many plays → each play → many tasks.

**What is idempotency in Ansible?**
Idempotency means running a playbook multiple times gives the same result as running it once. If nginx is already installed, `state: present` won't reinstall it — it reports `ok` (no change). This is critical: you can safely run playbooks repeatedly — even in CI/CD — without fear of breaking things. `command` and `shell` modules are NOT idempotent by default (they always run). Use `creates` or `removes` arguments or `when` conditions to make them idempotent.

**What is the difference between `command` and `shell` module?**
`command` executes a simple command directly — no shell features (no pipes `|`, no redirects `>`, no `&&`). `shell` runs the command through `/bin/sh` — supports pipes, redirects, glob patterns, and shell variables. Use `command` when possible (safer, more predictable). Use `shell` only when you need shell features.

---

## Inventory and Variables

**What is the Ansible inventory and how do you organize it?**
Inventory lists all hosts Ansible manages, organized into groups. Static inventory is an INI or YAML file. Dynamic inventory fetches hosts from cloud APIs (AWS EC2, Azure, GCP) at runtime. Best practices: group by function (webservers, databases), by environment (production, staging), and by location. Use `group_vars/` directory for group-specific variables and `host_vars/` for host-specific variables.

**What is variable precedence in Ansible? (from highest to lowest)**
1. Extra vars (`-e` from command line) — highest, always wins
2. Task vars (set_fact, register)
3. Play vars, vars_files, vars prompt
4. Host vars (host_vars/ directory)
5. Group vars (group_vars/ directory)
6. Role defaults — lowest

**What are Ansible facts and how do you use them?**
Facts are system information gathered automatically at playbook start (Gathering Facts task). Includes: `ansible_distribution`, `ansible_os_family`, `ansible_memory_mb`, `ansible_interfaces`, `ansible_processor_cores`, IP addresses, etc. Access as `{{ ansible_facts['distribution'] }}` or shorthand `{{ ansible_distribution }}`. Disable fact gathering when not needed with `gather_facts: no` to speed up playbooks.

**What is the difference between `vars`, `vars_files`, and `include_vars`?**
`vars`: inline in playbook, static. `vars_files`: load from external YAML file, static (preprocessed at parse time, loaded at playbook start). `include_vars`: load from file dynamically at task execution time — useful when filename is determined by a variable. For Vault-encrypted files: use `vars_files` (Ansible decrypts automatically at load time).

---

## Modules and Playbooks

**What is a Handler in Ansible?**
A handler is a task that only runs when notified by another task using `notify`. Handlers run once at the end of the play, regardless of how many tasks notify them. Common use: restart nginx only if config file changed. If config didn't change, handler never runs — avoids unnecessary restarts.
```yaml
- name: Update nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: Restart nginx      # notify handler

handlers:
  - name: Restart nginx      # only runs if template task changed something
    service:
      name: nginx
      state: restarted
```

**How do you run a task only on specific hosts?**
```yaml
# Method 1: when condition with facts
- name: RHEL-specific task
  yum: { name: httpd, state: present }
  when: ansible_facts['os_family'] == "RedHat"

# Method 2: when with inventory group
- name: DB task only on database hosts
  mysql_db: { name: myapp, state: present }
  when: inventory_hostname in groups['databases']

# Method 3: delegate_to — run task on different host
- name: Run on control node
  shell: echo "running locally"
  delegate_to: localhost
```

**What is `become` and when do you need it?**
`become: yes` enables privilege escalation (run as sudo/root). Required for: installing packages, managing services, writing to system directories. Can be set at play level (applies to all tasks), task level, or role level. `become_user: postgres` escalates to a specific user instead of root.

**What is the difference between Roles and regular Playbooks?**
Roles are reusable, structured packages of tasks, handlers, variables, templates, and files organized into a standard directory layout. Regular playbooks are flat YAML files. Use roles when: (1) the same configuration applies to multiple playbooks, (2) you want to share via Ansible Galaxy, (3) a logical grouping of related tasks deserves its own namespace. `ansible-galaxy init my-role` creates the structure automatically.

---

## Vault and Security

**How do you manage secrets in Ansible?**
Ansible Vault encrypts files with AES256. `ansible-vault create secrets.yml` creates encrypted file. `ansible-vault encrypt existing.yml` encrypts existing file. Run playbook with `--ask-vault-pass` or `--vault-password-file ~/.vault_pass`. Best practices: keep vault password in a secrets manager (HashiCorp Vault, AWS Secrets Manager), never commit plaintext passwords, use separate vault password per environment (dev, staging, prod).

**What is `ansible-vault rekey`?**
Changes the vault password of an encrypted file. Requires the old password first, then sets a new password. Used when: rotating credentials, team member with vault access leaves, password compromise suspected.

---

## Performance and Production

**How do you speed up Ansible playbooks?**
1. `gather_facts: no` — skip if facts not needed (saves 2-3 seconds per host)
2. `pipelining = True` in ansible.cfg — reuses SSH connection for multiple tasks
3. Increase `forks` (default 5) — `forks = 20` runs on 20 hosts in parallel
4. Use `async` and `poll` for long-running tasks to run them in parallel
5. `serial` keyword for rolling updates — update N hosts at a time
6. `--limit` to target specific hosts during development

**What is `serial` and why do you use it?**
`serial` controls how many hosts to process at a time (rolling update):
```yaml
- name: Rolling update
  hosts: webservers
  serial: 2             # update 2 hosts at a time (not all at once)
  tasks:
    - name: Update app
      ...
```
Ensures you don't take down all servers simultaneously. Can also use percentage: `serial: "25%"`.

**How do you handle failures in Ansible?**
`ignore_errors: yes` — task fails but playbook continues. `failed_when` — define custom failure condition. `block/rescue/always` — structured error handling (like try/catch/finally). `max_fail_percentage` at play level — tolerate a percentage of host failures before aborting.

---

## Troubleshooting Questions

**A playbook worked yesterday but fails today. How do you debug?**
1. Run with `-vvv` for verbose output and see exact SSH commands
2. Check if the managed node is reachable: `ansible hostname -m ping`
3. Check if the module works manually: `ansible hostname -m yum -a "name=httpd state=present" --become`
4. Run with `--check` to see what would change without changing anything
5. Add `- debug: var=variable_name` tasks to print variable values
6. Check `ansible_facts` to verify the system state

**What does "UNREACHABLE" mean in Ansible output?**
Ansible could not connect to the host via SSH. Common causes: host is down, SSH service not running, firewall blocking port 22, wrong SSH key, wrong username, IP changed. Fix: test SSH manually first — `ssh -i ~/.ssh/id_rsa user@hostname`. If SSH works manually but Ansible fails, check `ansible_user` and `ansible_port` in inventory.
