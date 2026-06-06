# Ansible Interview Questions & Troubleshooting

## Interview Questions

### Beginner

**What is Ansible and how does it work?**
Ansible is an agentless automation tool. You run it from a control node (your laptop or CI server). It SSHs into target servers, executes Python modules, and returns results. No software needed on the managed nodes — just SSH access and Python (which is on every Linux server). You describe WHAT you want (install nginx, start the service) in YAML playbooks, and Ansible figures out how.

---

**What is idempotency and why does it matter?**
Idempotency means running the same task multiple times produces the same result. `apt: name=nginx state=present` installs nginx if not present; if already installed, it does nothing. This matters because: you can safely run playbooks repeatedly without breaking things, you can run playbooks as part of scheduled compliance checks, and playbooks serve as both automation AND documentation of the desired state.

---

**What is the difference between a task, a play, and a playbook?**
A **task** is a single unit of work: "install nginx". A **play** maps a group of hosts to a list of tasks: "on webservers, run these 5 tasks". A **playbook** contains one or more plays. Structure:

```yaml
# playbook.yml
- name: Configure webservers    # Play 1
  hosts: webservers
  tasks:
    - name: Install nginx       # Task 1
    - name: Start nginx         # Task 2

- name: Configure databases     # Play 2
  hosts: databases
  tasks:
    - name: Install postgres    # Task 1
```

---

### Intermediate

**What is Ansible inventory and how does dynamic inventory work?**
Static inventory: a file listing hosts and groups. Dynamic inventory: a script or plugin that queries an external system (AWS, Azure, GCP, VMware) and returns a JSON structure of hosts and groups in real time. When you run against an AWS dynamic inventory, Ansible queries EC2 API and gets the current list of instances — no manual file to maintain.

```yaml
# aws_ec2.yaml — Dynamic inventory plugin
plugin: amazon.aws.aws_ec2
regions:
  - us-east-1
filters:
  tag:Environment: production
  instance-state-name: running
keyed_groups:
  - prefix: env
    key: tags.Environment
  - prefix: role
    key: tags.Role
```

---

**Explain Ansible roles and their directory structure.**
Roles are a way to organize playbooks into reusable units with a standard structure. Instead of one giant playbook, you have roles like `nginx`, `postgres`, `app_deploy`.

```
roles/nginx/
├── tasks/main.yml       # Main task list
├── handlers/main.yml    # Event handlers
├── templates/           # Jinja2 templates (.j2 files)
├── files/               # Static files to copy
├── vars/main.yml        # High-priority variables
├── defaults/main.yml    # Low-priority default variables
├── meta/main.yml        # Dependencies on other roles
└── README.md
```

Benefits: reusable across projects, testable independently (Molecule), shareable via Ansible Galaxy, follows convention → any engineer can understand the structure.

---

**What is Ansible Vault and how do you use it in a CI/CD pipeline?**
Vault encrypts sensitive data (API keys, passwords) using AES-256. The encrypted files can be committed to Git safely. In CI/CD: store the vault password as a CI secret, pass it via `--vault-password-file` or `ANSIBLE_VAULT_PASSWORD_FILE` environment variable.

```bash
# Development: interactive
ansible-vault edit secrets.yml

# CI/CD: password file
echo "$VAULT_PASSWORD" > /tmp/.vault_pass
ansible-playbook site.yml --vault-password-file /tmp/.vault_pass
rm /tmp/.vault_pass

# Or environment variable
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass
ansible-playbook site.yml  # Automatically uses vault password
```

---

**How does Ansible handle errors and what are the error handling strategies?**

```yaml
# 1. Ignore errors for a specific task
- name: Try to stop a service that might not exist
  systemd:
    name: myapp
    state: stopped
  ignore_errors: yes

# 2. Custom failure condition
- name: Check app health
  uri:
    url: http://localhost:8080/health
  register: health_check
  failed_when: health_check.status != 200

# 3. Block/rescue/always (try/catch/finally)
- block:
    - name: Risky operation
      shell: ./deploy.sh

  rescue:
    - name: Rollback on failure
      shell: ./rollback.sh
    - name: Notify team
      slack:
        msg: "Deployment failed on {{ inventory_hostname }}"

  always:
    - name: Always clean up temp files
      file:
        path: /tmp/deploy
        state: absent
```

---

### Advanced

**How do you implement zero-downtime deployments with Ansible?**

```yaml
# Rolling update: update 25% of servers at a time
- name: Rolling deployment
  hosts: webservers
  serial: "25%"          # 25% at a time
  max_fail_percentage: 10

  pre_tasks:
    - name: Remove from load balancer
      haproxy:
        state: disabled
        host: "{{ inventory_hostname }}"
        socket: /var/run/haproxy.sock
      delegate_to: "{{ item }}"
      loop: "{{ groups['loadbalancers'] }}"

    - name: Wait for connections to drain
      wait_for:
        timeout: 30

  roles:
    - app_deploy

  post_tasks:
    - name: Health check
      uri:
        url: "http://{{ ansible_host }}:8080/health"
        status_code: 200
      retries: 10
      delay: 5

    - name: Add back to load balancer
      haproxy:
        state: enabled
        host: "{{ inventory_hostname }}"
        socket: /var/run/haproxy.sock
      delegate_to: "{{ item }}"
      loop: "{{ groups['loadbalancers'] }}"
```

---

## Troubleshooting Guide

### SSH Connection Failed

```bash
# Test manually first
ssh -vvv -i ~/.ssh/key.pem user@hostname

# Common issues:
# 1. Wrong username
ansible all -i inventory -m ping -u ubuntu   # Specify user
# In inventory: ansible_user=ubuntu

# 2. Wrong SSH key
ansible all -i inventory -m ping \
  --private-key=~/.ssh/correct-key.pem

# 3. Firewall blocking port 22
# Check security group / firewall
nc -zv hostname 22

# 4. Host key check fails (new server)
# Either: add to known_hosts
ssh-keyscan hostname >> ~/.ssh/known_hosts
# Or: disable check (only in secure networks)
# ansible.cfg: host_key_checking = False
```

### YAML Syntax Errors

```bash
# Validate syntax before running
ansible-playbook playbook.yml --syntax-check

# Common YAML mistakes:
# 1. Wrong indentation (use 2 spaces, never tabs)
# 2. Missing colon after key
# 3. String starting with special chars needs quoting

# WRONG:
- name: Install {{ package_name }}  # Variable in name is ok
  apt: name={{ package_name }}      # Old style - avoid

# RIGHT:
- name: "Install {{ package_name }}"
  apt:
    name: "{{ package_name }}"
    state: present
```

### Task Not Making Expected Changes (Idempotency Issue)

```bash
# Check what actually happened
ansible-playbook site.yml -v        # Show changed/ok/failed counts
ansible-playbook site.yml --check   # Dry run - see what WOULD change
ansible-playbook site.yml --diff    # Show file content differences

# Use assert to verify state
- name: Verify nginx is running
  assert:
    that:
      - ansible_facts.services['nginx.service']['state'] == 'running'
    fail_msg: "nginx is not running!"
```

### Module Not Found / Python Issues

```bash
# Check Python on managed node
ansible all -m command -a "python3 --version"

# Install missing Python libraries on managed nodes
- name: Install required Python libraries
  pip:
    name:
      - boto3
      - botocore
    executable: pip3
  become: yes

# For older systems without python3
# ansible.cfg:
# [defaults]
# interpreter_python = auto_silent
```

### Variables Not Expanding

```bash
# Debug variables
- name: Show all variables
  debug:
    var: hostvars[inventory_hostname]

- name: Show specific variable
  debug:
    msg: "The port is {{ http_port }}"

# Variable precedence issue?
# Check: ansible-config dump | grep variable
# Order (high to low):
# extra_vars (-e) > task vars > play vars > host_vars > group_vars > role defaults
```

### Playbook Too Slow

```bash
# Enable pipelining (reduces SSH roundtrips)
# ansible.cfg:
[ssh_connection]
pipelining = True

# Enable fact caching (avoid re-gathering facts)
[defaults]
fact_caching = jsonfile
fact_caching_connection = /tmp/ansible_facts
fact_caching_timeout = 3600

# Disable fact gathering if not needed
- hosts: all
  gather_facts: no   # Skip if you don't use ansible_facts

# Increase forks (parallel execution)
# ansible.cfg:
[defaults]
forks = 20  # Default is 5 — safe to increase for large inventories
```
