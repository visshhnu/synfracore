# Ansible — Advanced Playbooks, Roles & Production Patterns

## Production Ansible Patterns

art application
      ansible.builtin.service:
        name: "{{ app_name }}"
        state: restarted
```

### Jinja2 Template Example
```
# templates/app.conf.j2
[server]
host     = {{ ansible_default_ipv4.address }}
port     = {{ app_port }}
env      = {{ env | default('dev') }}
version  = {{ app_version }}

[database]
host     = {{ db_host }}
port     = {{ db_port | default(5432) }}
name     = {{ db_name }}
```

### Berribot Questions
**Q: What is idempotency in Ansible and why does it matter?**
> A: Idempotency means running the same playbook multiple times produces the same result — no duplicate actions or unintended side effects. If nginx is already installed, the `yum` module skips the task (reports "ok" not "changed"). If a config file already has the correct content, `copy` skips it. This is critical for production — you can safely re-run a playbook to fix drift, or run it as a scheduled compliance check, without worrying about breaking things. The `shell` module is NOT idempotent by default — it always runs. That is why specific modules are preferred over shell.

**Q: What is the difference between `pre_tasks`, `tasks`, and `post_tasks`?**
> A: `pre_tasks` run before roles and tasks — use for validation (check disk space, verify prerequisites). `tasks` are the main work. `post_tasks` run after everything — use for logging, notifications, verification steps. Handlers run after all tasks complete, triggered by notify.

**Q: What does `register` do in Ansible?**
> A: `register` saves a task's output to a variable for use in later tasks. `register: result` captures the command's stdout, stderr, return code, and changed status. Then `when: result.rc == 0` or `when: "'error' in result.stdout"` conditionally executes the next task based on the output. Essential for tasks that check a condition before proceeding.

---

## Topic 4 — Key Modules Reference

### The 12 Modules That Cover 90% of DevOps Automation

```yaml
# 1. yum / apt — package management
- ansible.builtin.yum:
    name: [nginx, java-11-openjdk, git]
    state: present     # or: absent, latest

# 2. copy — copy file as-is
- ansible.builtin.copy:
    src: files/nginx.conf
    dest: /etc/nginx/nginx.conf
    owner: root
    group: root
    mode: '0644'
    backup: yes        # keep backup of old file

# 3. template — Jinja2 file with variable substitution
- ansible.builtin.template:
    src: templates/app.conf.j2
    dest: /etc/app/app.conf
    mode: '0644'
  notify: Restart app  # trigger handler on change

# 4. service — manage systemd services
- ansible.builtin.service:
    name: nginx
    state: started      # stopped / restarted / reloaded
    enabled: yes        # start on boot

# 5. file — create dirs, set permissions, symlinks
- ansible.builtin.file:
    path: /var/log/myapp
    state: directory    # file / absent / link / touch
    owner: appuser
    mode: '0755'
    recurse: yes

# 6. shell — run shell command (use sparingly — not idempotent)
- ansible.builtin.shell:
    cmd: kubectl rollout status deployment/sro -n telecom-prod
  register: rollout_result
  changed_when: false   # tell Ansible this is read-only

# 7. command — run command without shell (safer than shell)
- ansible.builtin.command:
    cmd: /opt/app/migrate.sh
    creates: /opt/app/.migrated    # skip if file exists (idempotent)

# 8. lineinfile — add/replace a specific line in a file
- ansible.builtin.lineinfile:
    path: /etc/sysctl.conf
    regexp: '^vm.max_map_count'
    line: 'vm.max_map_count=262144'
    state: present

# 9. blockinfile — add a block of lines to a file
- ansible.builtin.blockinfile:
    path: /etc/hosts
    block: |
      10.0.0.1 web-01
      10.0.0.2 web-02
    marker: "# {mark} ANSIBLE MANAGED BLOCK"

# 10. uri — HTTP request (health checks, API calls)
- ansible.builtin.uri:
    url: http://localhost:8080/health
    method: GET
    status_code: 200
    return_content: yes
  register: health_resp

# 11. debug — print variable or message
- ansible.builtin.debug:
    msg: "Deployed {{ app_name }} version {{ app_version }}"
- ansible.builtin.debug:
    var: health_resp.json    # print variable content

# 12. assert — validate a condition, fail with message if false
- ansible.builtin.assert:
    that:
      - health_resp.status == 200
      - health_resp.json.status == "UP"
    fail_msg: "Health check failed: {{ health_resp.json }}"
    success_msg: "Application healthy"
```

---

## Topic 5 — Variables and Precedence

### Key Concept
Ansible has 22 levels of variable precedence. For interviews, know the most important levels — **extra vars always win, role defaults always lose**.

```
Lowest                                    Highest
  ↓                                          ↓
role defaults → inventory vars → playbook vars → host_vars → extra vars
```

```yaml
# Variable sources (from lowest to highest priority):

# 1. Role defaults (role/defaults/main.yml) — baseline values
app_port: 8080
log_level: INFO

# 2. Inventory vars — server-specific overrides
# inventory.ini: web-01 app_port=9090

# 3. Group vars (group_vars/webservers.yml)
nginx_worker_processes: 4

# 4. Host vars (host_vars/web-01.yml)
app_port: 9090   # overrides group and role defaults

# 5. Playbook vars
vars:
  app_version: "2.1.0"

# 6. Extra vars (HIGHEST — always wins)
# ansible-playbook deploy.yml -e "app_version=2.2.0 env=prod"
```

### Vault — Encrypted Variables
```bash
# Encrypt a sensitive file
ansible-vault encrypt vars/secrets.yml

# Edit encrypted file
ansible-vault edit vars/secrets.yml

# Run playbook with vault password
ansible-playbook deploy.yml --ask-vault-pass
ansible-playbook deploy.yml --vault-password-file ~/.vault_pass

# Encrypt a single string (for inline use)
ansible-vault encrypt_string 'mypassword' --name 'db_password'
```

---

## Topic 6 — Roles

### Key Concept
A **role** is a reusable, structured collection of tasks, vars, templates, and handlers. Instead of one giant playbook, roles make automation modular and shareable. **This is what separates junior from senior Ansible usage.**

### Role Directory Structure
```
roles/
└── java-app/
    ├── tasks/
    │   ├── main.yml        # main task list (always executed)
    │   ├── install.yml     # subtask file (imported from main)
    │   └── configure.yml
    ├── handlers/
    │   └── main.yml        # handlers (restart, reload)
    ├── templates/
    │   └── app.conf.j2     # Jinja2 config templates
    ├── files/
    │   └── logrotate.conf  # static files to copy
    ├── vars/
    │   └── main.yml        # vars (high precedence)
    ├── defaults/
    │   └── main.yml        # default vars (low precedence, override-able)
    ├── meta/
    │   └── main.yml        # role metadata, dependencies
    └── README.md
```

### Using Roles in a Playbook
```yaml
---
- name: Deploy full telecom stack
  hosts: webservers
  become: yes
  roles:
    - common              # OS hardening, NTP, SSH config
    - java                # Java installation
    - { role: java-app, app_name: telecom-sro, app_port: 8080 }
    - monitoring-agent    # Prometheus node exporter

# Or with include_role for dynamic execution
  tasks:
    - name: Deploy app role
      ansible.builtin.include_role:
        name: java-app
      vars:
        app_name: "{{ item }}"
      loop:
        - telecom-sro
        - telecom-sd
```

### Ansible Galaxy — Download Community Roles
```bash
# Install a role from Ansible Galaxy
ansible-galaxy install geerlingguy.java
ansible-galaxy install geerlingguy.nginx

# Install from requirements file
ansible-galaxy install -r requirements.yml

# requirements.yml
roles:
  - name: geerlingguy.java
    version: "6.5.1"
  - src: https://github.com/internal/ansible-role-nginx
    version: main
```

---

## Topic 7 — CLI Commands Reference

```bash
# ── CONNECTIVITY TEST ────────────────────────────────────
# Test SSH connectivity to all servers
ansible all -i inventory.ini -m ping

# Test specific group
ansible webservers -i inventory.ini -m ping

# ── AD-HOC COMMANDS ──────────────────────────────────────
# Run one-off command on all servers
ansible all -i inventory.ini -m shell -a "df -h"
ansible all -i inventory.ini -m shell -a "systemctl status nginx"

# Copy a file to all servers (ad-hoc)
ansible webservers -i inventory.ini -m copy \
  -a "src=fix.conf dest=/etc/app/fix.conf"

# ── PLAYBOOK EXECUTION ───────────────────────────────────
# Basic run
ansible-playbook deploy.yml -i inventory.ini

# Dry run — show what WOULD change, no actual changes
ansible-playbook deploy.yml -i inventory.ini --check

# Dry run with diff — show exact file content changes
ansible-playbook deploy.yml -i inventory.ini --check --diff

# Run only specific tags
ansible-playbook deploy.yml -i inventory.ini --tags "install,configure"

# Skip specific tags
ansible-playbook deploy.yml --skip-tags "restart"

# Limit to specific host or group
ansible-playbook deploy.yml --limit web-01
ansible-playbook deploy.yml --limit "webservers:!web-01"  # exclude web-01

# Pass extra variables (highest precedence)
ansible-playbook deploy.yml -e "env=production app_version=2.1.0"
ansible-playbook deploy.yml -e "@vars/prod.yml"   # from file

# Verbose output (add more v's for more detail)
ansible-playbook deploy.yml -v    # basic
ansible-playbook deploy.yml -vvv  # connection details

# Syntax check (no execution)
ansible-playbook deploy.yml --syntax-check

# List all tasks without running
ansible-playbook deploy.yml --list-tasks

# List all hosts that would be targeted
ansible-playbook deploy.yml --list-hosts

# Start from a specific task
ansible-playbook deploy.yml --start-at-task="Deploy config"

# Step through tasks interactively
ansible-playbook deploy.yml --step
```

---

## Topic 8 — Ansible Tower / AAP (Ansible Automation Platform)

### Key Concept
**AAP (Ansible Automation Platform)** = enterprise Ansible. It adds: Web UI, REST API, RBAC, job scheduling, audit logs, and credential management on top of standard Ansible. This was directly asked in your Berribot interview.

### Core AAP Objects

| Object | Purpose |
|---|---|
| **Organization** | Top-level tenant grouping. Multiple orgs per AAP (Telecom Org, Healthcare Org). |
| **Inventory** | Server lists — static or dynamic (synced from AWS/Azure). Scoped to an org. |
| **Credential** | SSH keys, vault passwords, cloud credentials — stored encrypted. Never in playbooks. |
| **Project** | Link to a Git repo containing playbooks. AAP auto-syncs on commit or schedule. |
| **Job Template** | Defines: which playbook, which inventory, which credentials, which extra vars. The "run button" for a playbook. |
| **Workflow Template** | Chain multiple Job Templates in sequence or parallel. E.g. backup → deploy → verify. |
| **Schedule** | Run a Job Template on a recurring schedule (cron-like) without Jenkins. |
| **Notification** | Email/Slack/Teams notification on job success or failure. |

### RBAC in AAP — Detailed

```
Organization
├── Teams
│   ├── Dev Team
│   │   ├── Execute on: dev Job Templates
│   │   ├── Use: dev Inventory
│   │   └── Use: dev Credentials
│   ├── Ops Team
│   │   ├── Execute on: ALL Job Templates
│   │   ├── Admin: prod Inventory
│   │   └── Use: ALL Credentials
│   └── Auditors
│       └── Read: everything (no execute)
└── Users (assigned to teams or directly)
```

**Role levels per object:**

| Role | Permissions |
|---|---|
| Admin | Full control — create, edit, delete, execute |
| Execute | Can run Job Templates — cannot edit them |
| Use | Can reference Credential/Inventory in templates — cannot view secret values |
| Update | Can sync Projects and Inventories |
| Read | View only — can see job history |

### Migration from CLI Ansible to AAP

```
BEFORE (CLI Ansible)              AFTER (AAP)
─────────────────────────         ────────────────────────
Manual inventory.ini files    →   Dynamic Inventory synced from AWS/Azure
SSH keys on engineer laptops  →   Credentials stored in AAP vault
"ssh vishnu@web-01 && ansible" →  Job Templates with one-click execute
No audit trail                →   Full job history: who, what, when, output
Cron jobs on control node     →   Schedules in AAP with notifications
No access control             →   RBAC: Dev team can't run prod templates
Manual playbook updates       →   Projects auto-sync from Git on every push
```

### Berribot Questions
**Q: What is Ansible Tower / AAP and why would you use it over CLI Ansible?**
> A: AAP is the enterprise platform built on top of Ansible. CLI Ansible is fine for individual use — but in a team, you need: centralised credential management (SSH keys not on laptops), RBAC (Dev team can't run prod playbooks), audit trails (who ran what playbook against which servers and when), scheduling (run compliance playbooks nightly), and notifications. AAP provides all of this through a web UI and REST API. It also enables non-DevOps team members to run approved playbooks safely via the UI without CLI access.

**Q: How do you migrate from CLI Ansible to AAP?**
> A: Step by step: (1) Move inventory files to AAP Inventory sources — configure dynamic inventory plugins for AWS/Azure so servers are auto-discovered. (2) Move SSH keys and vault passwords to AAP Credentials — stored encrypted, never visible after entry. (3) Link Git repos as AAP Projects — auto-sync on commit so AAP always has the latest playbooks. (4) Create Job Templates for each playbook — defines the playbook+inventory+credentials combination. (5) Configure RBAC — assign teams to job templates with appropriate roles. (6) Set up Notifications — Slack webhook for job completion. (7) Replace cron jobs with AAP Schedules.

---

## Topic 9 — Ansible in CI/CD Pipelines

### Key Concept
Ansible integrates into Jenkins as a pipeline step — Jenkins handles the app build and image push, Ansible handles the server/environment configuration. They complement each other.

```groovy
// Jenkinsfile — calling Ansible from Jenkins
pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package'
        sh 'docker build -t nexus.internal/sro:${BUILD_NUMBER} .'
        sh 'docker push nexus.internal/sro:${BUILD_NUMBER}'
      }
    }
    stage('Configure Environment') {
      steps {
        // Inject SSH key from Jenkins credentials
        withCredentials([sshUserPrivateKey(
          credentialsId: 'ansible-ssh-key',
          keyFileVariable: 'SSH_KEY'
        )]) {
          sh """
            ansible-playbook configure-env.yml \\
              -i inventory/${params.ENV}.ini \\
              -e "app_version=${BUILD_NUMBER}" \\
              -e "env=${params.ENV}" \\
              --private-key=${SSH_KEY} \\
              --check   # dry-run first
          """
          // Apply after dry-run confirms ok
          sh """
            ansible-playbook configure-env.yml \\
              -i inventory/${params.ENV}.ini \\
              -e "app_version=${BUILD_NUMBER}" \\
              -e "env=${params.ENV}" \\
              --private-key=${SSH_KEY}
          """
        }
      }
    }
  }
}
```

### AAP API — trigger from Jenkins
```bash
# Trigger AAP Job Template via REST API from Jenkins
curl -X POST \
  -H "Authorization: Bearer ${AAP_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"extra_vars": {"env": "prod", "app_version": "2.1.0"}}' \
  https://aap.internal/api/v2/job_templates/42/launch/
```

---

## Topic 10 — Ansible Best Practices

```yaml
# ✅ DO — best practices

# 1. Use FQCN (Fully Qualified Collection Name)
- ansible.builtin.copy:       # not just: copy:
- ansible.builtin.service:    # explicit, avoids ambiguity

# 2. Always name every task
- name: "Install nginx web server"   # descriptive name
  ansible.builtin.yum:
    name: nginx
    state: present

# 3. Use changed_when for read-only shell commands
- ansible.builtin.shell: df -h /opt
  register: disk_info
  changed_when: false           # this never 'changes' anything

# 4. Use failed_when for custom failure conditions
- ansible.builtin.shell: check-service.sh
  register: svc_check
  failed_when: "'ERROR' in svc_check.stdout"

# 5. Tag everything for selective execution
- name: Install packages
  ansible.builtin.yum:
    name: nginx
  tags: [install, packages]

# 6. Use vault for ALL secrets
# ❌ NEVER:
db_password: "mypassword123"
# ✅ ALWAYS:
db_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  ...encrypted content...

# 7. Validate with assert before risky operations
- ansible.builtin.assert:
    that: ansible_memtotal_mb >= 2048
    fail_msg: "Server needs at least 2GB RAM"
```

---

## Interview Answer — Your Ansible Story

**When asked: "Describe your Ansible experience at HPE"**

> "At HPE I used Ansible for configuration management of the Linux infrastructure supporting the DU/Vodafone telecom provisioning platform. We used Ansible playbooks for: Java application installation and service management, application config deployment using Jinja2 templates for environment-specific values, and post-deployment verification steps.
>
> We integrated Ansible into our Jenkins CI/CD pipelines — after Jenkins built and pushed the container image, an Ansible playbook ran to configure the target Linux environment and verify the deployment. Credentials were managed via Jenkins Credentials Store injected as environment variables — SSH keys were never stored in playbooks.
>
> I'm also familiar with Ansible Automation Platform (Tower) — the enterprise layer that adds RBAC, audit trails, job scheduling, and centralised credential management. For a team environment, AAP is essential — it gives governance that CLI Ansible cannot provide."

---

## Quick Reference

| Command | Purpose |
|---|---|
| `ansible all -m ping` | Test connectivity to all hosts |
| `ansible-playbook deploy.yml` | Run playbook |
| `ansible-playbook deploy.yml --check` | Dry run |
| `ansible-playbook deploy.yml --diff` | Show file changes |
| `ansible-playbook deploy.yml --tags install` | Run only tagged tasks |
| `ansible-playbook deploy.yml --limit web-01` | Run on one host |
| `ansible-playbook deploy.yml -e "env=prod"` | Pass extra vars |
| `ansible-playbook deploy.yml -vvv` | Verbose debug output |
| `ansible-vault encrypt secrets.yml` | Encrypt secrets file |
| `ansible-galaxy install geerlingguy.java` | Download community role |

---

*End of Ansible Study Guide | B. Vishnu | Wipro Berribot Prep*


---

## Tool Deep Dive (Production Reference)

Ansible — Production Usage**

# Production playbook with best practices

---

- name: Deploy application servers

  hosts: app_servers

  become: yes

  vars_files:

    - vault/secrets.yml    # Ansible Vault encrypted

  

  pre_tasks:

  - name: Verify connectivity

    ping:

  

  roles:

    - role: common          # Base OS hardening

    - role: docker          # Container runtime

    - role: app-config      # Application configuration

  

  tasks:

  - name: Deploy app config

    template:

      src: app.conf.j2

      dest: /etc/myapp/app.conf

      mode: '0640'

      owner: app

      group: app

    notify: restart app    # Only restart if config changed

  

  handlers:

  - name: restart app

    systemd:

      name: myapp

      state: restarted

      daemon_reload: yes

# Run with limit and check mode first

ansible-playbook -i inventory/prod deploy.yml \

  --limit "app_servers[0]" \

  --check              # Dry run — shows what would change

  --diff               # Shows actual diff in files

**Ansible Vault for secrets:**

# Encrypt secrets file

ansible-vault encrypt vault/secrets.yml

# Edit encrypted file

ansible-vault edit vault/secrets.yml

# Run playbook with vault

ansible-playbook deploy.yml --ask-vault-pass

# Or use vault password file (for CI)

ansible-playbook deploy.yml --vault-password-file ~/.vault_pass

**Q: Ansible vs Chef vs Puppet — which and when?**

| **Feature** | **Ansible** | **Chef** | **Puppet** |
| --- | --- | --- | --- |
| Agent required | No (agentless SSH) | Yes | Yes |
| Language | YAML | Ruby (DSL) | Puppet DSL |
| Learning curve | Low | High | Medium |
| Push vs Pull | Push | Pull | Pull |
| Best for | Ad-hoc tasks, simple CM | Complex config | Large enterprise |
| Industry trend | Most popular now | Declining | Declining |

"In 2026, Ansible is the standard. Chef and Puppet are legacy — you'll still see them in enterprises that adopted them 10 years ago. If asked about Chef/Puppet in an interview, say 'I know Ansible deeply and understand the agent-based model of Chef/Puppet — same desired-state concept, different execution model.'"

**PART 3 — MONITORING, SECURITY, NETWORKING ****&**** SCRIPTING**

**PROMETHEUS ****&**** GRAFANA — Production Observability**

**Prometheus — Deep Dive**

# PromQL — the language interviewers test

# Error rate (last 5 minutes)

sum(rate(http_requests_total{status=~"5.."}[5m])) /

sum(rate(http_requests_total[5m])) * 100

# P99 latency

histogram_quantile(0.99,

  sum(rate(http_request_duration_seconds_bucket[5m])) by (le, service))

# CPU usage per pod

sum(rate(container_cpu_usage_seconds_total{container!=""}[5m])) by (pod, namespace)

# Memory usage vs limit

container_memory_working_set_bytes /

container_spec_memory_limit_bytes * 100

# Kafka consumer lag

kafka_consumergroup_lag_sum{consumergroup="payment-processor"}

**Q: Alert is firing but nothing looks wrong. What do you do?**

# Step 1: Check if alert is silenced in Alertmanager

# Alertmanager UI → Silences

# Step 2: Check the actual metric value vs threshold

# In Prometheus UI query the exact metric

# Step 3: Check if labels changed (alert selector no longer matches)

# If metric labels changed, alert rule needs updating

# Step 4: Check Alertmanager config — is it routing correctly?

amtool check-config alertmanager.yml

amtool config routes test --verify-receivers \

  --config.file=alertmanager.yml \

  <label-set>

# Step 5: Check recording rules (if using them)

# Recording rules pre-compute expensive queries

# If the underlying metric changed, recording rule may be stale

**Grafana — Advanced Usage**

# Grafana as code with Grafonnet/Terraform

# Avoid manual dashboard creation — store dashboards as JSON in Git

# Import dashboard via API

curl -X POST \

  -H "Content-Type: application/json" \

  -d @dashboard.json \

  http://admin:password@grafana:3000/api/dashboards/import

# Key panels I build for every service:

# 1. Request rate (RPS)

# 2. Error rate (%)

# 3. P50/P95/P99 latency

# 4. Active connections

# 5. Pod restarts

# 6. Memory/CPU vs limits

# 7. Business metric (orders/min, payments/min)

**ELK STACK — Deep Troubleshooting**

**Elasticsearch**

# Cluster health

curl -X GET "localhost:9200/_cluster/health?pretty"

# Check shard allocation issues

curl -X GET "localhost:9200/_cluster/allocation/explain?pretty"

# Common issue: RED cluster (unassigned shards)

# Check why shards are unassigned

curl -X GET "localhost:9200/_cat/shards?v&h=index,shard,prirep,state,unassigned.reason"

# Fix: retry allocation

curl -X POST "localhost:9200/_cluster/reroute?retry_failed=true"

# Index too large — reindex to new index

curl -X POST "localhost:9200/_reindex" -H 'Content-Type: application/json' -d '{

  "source": {"index": "logs-2024-old"},

  "dest": {"index": "logs-2024-new"}

}'

# Delete old indices (ILM is better for this)

curl -X DELETE "localhost:9200/logs-2024-01-*"

**Logstash Pipeline**

# logstash.conf — parsing telecom SOM
