# Ansible Interview Questions

## Core Concepts

**Q: What is Ansible? How does it work?**
Ansible is an agentless, push-based configuration management and automation tool. Unlike Chef/Puppet (agent-based, pull model), Ansible connects to nodes over SSH and executes tasks.

**Architecture:**
- **Control node**: Where Ansible runs (your machine or CI server)
- **Managed nodes**: Target servers — NO agents needed, only Python and SSH
- **Inventory**: List of managed nodes (static file or dynamic from cloud APIs)
- **Playbook**: YAML file describing tasks to execute
- **Module**: Unit of work (copy, template, yum, service, shell, etc.)
- **Fact**: Information gathered from managed nodes (`ansible_hostname`, `ansible_os_family`)

**Execution flow:**
Control node → SSH to managed node → Copy Python code → Execute → Return results → Clean up

---

**Q: Explain the Ansible inventory. What is a dynamic inventory?**

**Static inventory:**
```ini
[webservers]
web1.example.com
web2.example.com ansible_user=ubuntu

[databases]
db1.example.com ansible_host=10.0.1.5

[production:children]
webservers
databases
```

**Dynamic inventory**: Scripts or plugins that query cloud APIs and generate inventory in real-time.
```bash
ansible-inventory --list -i aws_ec2.yml  # AWS EC2 dynamic inventory plugin
```

```yaml
# aws_ec2.yml
plugin: aws_ec2
regions: [us-east-1]
filters:
  tag:Environment: production
groups:
  webservers: "'web' in tags.Role"
```

Dynamic inventory ensures you always have current server list without manual updates.

---

**Q: What is a playbook? Explain its structure.**

```yaml
---
- name: Configure web servers
  hosts: webservers
  become: true          # sudo/root
  vars:
    http_port: 80
    app_version: "2.1.0"
  
  pre_tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
        cache_valid_time: 3600

  roles:
    - common
    - nginx

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
      notify: restart nginx   # Trigger handler

    - name: Copy config
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

**Key concepts:**
- `become: true` = privilege escalation (sudo)
- `notify` + `handlers` = triggered once at end of play (idempotent restart)
- `pre_tasks/post_tasks` = run before/after roles
- `vars` = play-level variables

---

**Q: What is idempotency and why is it important in Ansible?**

Idempotency means running a task multiple times produces the same result as running it once. Ansible modules are designed to be idempotent.

Example: `apt: name=nginx state=present`
- First run: installs nginx
- Second run: nginx already installed → no change, no error

Non-idempotent: `shell: echo "configured" >> /etc/config.txt` — appends every run!
Make it idempotent: use `lineinfile` module or check with `creates`/`when` conditionals.

**Why important**: You can run playbooks repeatedly (after failures, for audits, by CI/CD) without side effects.

---

**Q: Explain Ansible Roles. What is the directory structure?**

Roles organise tasks, variables, templates, and files into reusable units.

```
roles/
  nginx/
    tasks/
      main.yml        # Tasks (required)
    handlers/
      main.yml        # Handlers
    templates/
      nginx.conf.j2   # Jinja2 templates
    files/
      index.html      # Static files
    vars/
      main.yml        # Role variables (higher precedence)
    defaults/
      main.yml        # Default variables (lowest precedence — overridable)
    meta/
      main.yml        # Role metadata, dependencies
    README.md
```

Using a role in playbook:
```yaml
roles:
  - common
  - { role: nginx, vars: { http_port: 8080 } }
```

Ansible Galaxy: `ansible-galaxy install geerlingguy.mysql` — community roles.

---

**Q: What is Ansible Vault?**

Ansible Vault encrypts sensitive data (passwords, API keys, certificates) in YAML files.

```bash
# Create encrypted file
ansible-vault create secrets.yml

# Edit encrypted file
ansible-vault edit secrets.yml

# Encrypt existing file
ansible-vault encrypt vars/passwords.yml

# Decrypt
ansible-vault decrypt vars/passwords.yml

# Run playbook with vault
ansible-playbook site.yml --ask-vault-pass
ansible-playbook site.yml --vault-password-file ~/.vault_pass
```

Best practice: Store vault password in CI/CD secrets (not in repo). Use separate vault IDs for different environments.

---

**Q: Difference between `when`, `loop`, `register`, and `with_items`?**

**when** — conditional execution:
```yaml
- name: Install on Debian only
  apt:
    name: nginx
  when: ansible_os_family == "Debian"
```

**loop** (preferred over `with_items`):
```yaml
- name: Install packages
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - nginx
    - git
    - curl
```

**register** — capture task output:
```yaml
- name: Check service status
  command: systemctl is-active nginx
  register: nginx_status

- debug:
    msg: "Nginx is {{ nginx_status.stdout }}"

- name: Start if not running
  service:
    name: nginx
    state: started
  when: nginx_status.stdout != "active"
```

---

**Q: Explain tags in Ansible and when to use them.**

Tags allow running a subset of tasks without running the whole playbook.

```yaml
tasks:
  - name: Install nginx
    apt:
      name: nginx
    tags:
      - install
      - nginx

  - name: Configure nginx
    template:
      src: nginx.conf.j2
      dest: /etc/nginx/nginx.conf
    tags:
      - configure
      - nginx
```

```bash
ansible-playbook site.yml --tags nginx          # Only nginx tasks
ansible-playbook site.yml --tags configure      # Only configuration tasks
ansible-playbook site.yml --skip-tags install   # Skip installation
```

---

**Q: What is the difference between `copy`, `template`, and `fetch` modules?**

`copy`: Copy a static file from control node to managed node.
```yaml
- copy:
    src: files/index.html
    dest: /var/www/html/index.html
    mode: '0644'
```

`template`: Process a Jinja2 template (with variables) and copy to managed node.
```yaml
- template:
    src: templates/nginx.conf.j2   # Contains {{ variables }}
    dest: /etc/nginx/nginx.conf
```

`fetch`: Pull files FROM managed nodes to control node (opposite of copy).
```yaml
- fetch:
    src: /var/log/app/error.log
    dest: logs/{{ inventory_hostname }}/error.log
    flat: no
```

---

**Q: How do you handle errors in Ansible playbooks?**

```yaml
# Ignore errors (task marked failed but play continues)
- name: Check if service exists
  command: systemctl status myapp
  ignore_errors: yes
  register: service_check

# Change what counts as failure
- name: Check disk space
  command: df -h
  failed_when: "'100%' in df_result.stdout"
  register: df_result

# Change what counts as changed
- name: Run script
  command: /opt/script.sh
  changed_when: false   # Never mark as changed

# Block/rescue/always (try/except/finally)
- block:
    - name: Risky task
      command: /opt/risky.sh
  rescue:
    - name: Handle failure
      debug: msg="Task failed, cleaning up"
  always:
    - name: Always run this
      debug: msg="Always executed"
```

## Revision Notes
```
ANSIBLE: Agentless, push-based, SSH, Python on managed nodes
COMPONENTS: Inventory + Playbook + Modules + Roles + Facts + Handlers

INVENTORY: Static INI/YAML or Dynamic (cloud plugins)
PLAYBOOK: hosts + become + vars + pre_tasks + roles + tasks + handlers

IDEMPOTENCY: Same result on repeated runs. Core principle.
HANDLER: Triggered by notify, runs once at end of play.

ROLES: tasks/ + handlers/ + templates/ + files/ + vars/ + defaults/ + meta/
vars/ > playbook vars > defaults/ (precedence order)

VAULT: ansible-vault encrypt/decrypt/edit. --ask-vault-pass to run.

CONDITIONALS: when: (Jinja2 expression)
LOOPS: loop: (preferred over with_items)
REGISTER: capture output. use .stdout, .rc, .failed

ERROR HANDLING:
ignore_errors: yes | failed_when | changed_when
block/rescue/always (try/except/finally pattern)

USEFUL MODULES:
apt/yum: packages | service: service control | template: Jinja2 files
copy: static files | fetch: pull from nodes | lineinfile: edit files
user/group: user management | cron: scheduled tasks
```
