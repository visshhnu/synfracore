# Ansible — Advanced

## Ansible Vault — Encrypting Secrets

Ansible Vault encrypts sensitive files (passwords, keys, certificates) so you can safely commit them to version control.

```bash
# Create a new encrypted file
ansible-vault create secret.txt
# New Vault password: mypassword
# Confirm New Vault password: mypassword
# Opens editor — type your secret content and save

# View encrypted file — it looks like this:
cat secret.txt
$ANSIBLE_VAULT;1.1;AES256
64633234613936303336
32363332373562333736...  (encrypted gibberish)

# Edit an encrypted file
ansible-vault edit secret.txt

# Encrypt an existing file
ansible-vault encrypt secret2.txt
# New Vault password:
# Confirm New Vault password:
# Encryption successful

# Decrypt a file permanently
ansible-vault decrypt secret.txt

# Change the vault password (rekey)
ansible-vault rekey secret2.txt
# Vault password: (old password)
# New Vault password: (new password)
# Confirm New Vault password:
# Rekey successful
# Note: must enter old password before entering new one
```

### Using Vault in Playbooks

```yaml
# vars/secrets.yml (encrypted with ansible-vault)
db_password: "myS3cr3tP@ssw0rd"
api_key: "sk-abc123def456"

# playbook.yml
---
- name: Deploy app with secrets
  hosts: webservers
  vars_files:
    - vars/secrets.yml    # Ansible decrypts this at runtime

  tasks:
    - name: Configure database
      template:
        src: db.conf.j2
        dest: /etc/myapp/db.conf
```

```bash
# Run playbook with vault password
ansible-playbook playbook.yml --ask-vault-pass

# Or use a password file (better for automation)
echo "mypassword" > ~/.vault_pass
chmod 600 ~/.vault_pass
ansible-playbook playbook.yml --vault-password-file ~/.vault_pass

# Or set in ansible.cfg
[defaults]
vault_password_file = ~/.vault_pass
```

## Ansible Roles

Roles are the standard way to organize playbooks into reusable, shareable components.

### Role Directory Structure

```
roles/
└── httpd-role/
    ├── tasks/
    │   └── main.yml       # main task list
    ├── handlers/
    │   └── main.yml       # handlers
    ├── templates/
    │   └── index.j2       # Jinja2 templates
    ├── files/
    │   └── httpd.conf     # static files to copy
    ├── vars/
    │   └── main.yml       # role variables (high priority)
    ├── defaults/
    │   └── main.yml       # default variables (lowest priority)
    ├── meta/
    │   └── main.yml       # role metadata, dependencies
    └── README.md
```

### Creating a Role

```bash
# Create role structure automatically
ansible-galaxy init httpd-role
cd httpd-role
```

```yaml
# tasks/main.yml
---
- name: Install httpd
  yum:
    name: httpd
    state: latest

- name: Start and enable httpd
  service:
    name: httpd
    state: started
    enabled: true

- name: Create index.html using Jinja2
  template:
    src: index.j2
    dest: /var/www/html/index.html
```

```jinja2
{# templates/index.j2 #}
Welcome to {{ inventory_hostname }}

This is an Apache Web Server.

Please contact {{ sysadmin }} for any questions or concerns.
```

```yaml
# defaults/main.yml — default variable values (can be overridden)
---
sysadmin: elliot@linuxhandbook.com
```

```yaml
# handlers/main.yml
---
- name: Restart httpd
  service:
    name: httpd
    state: restarted
```

### Using Roles in Playbooks

```yaml
# apache-role.yml
---
- name: Use the httpd-role
  hosts: webservers
  roles:
    - httpd-role              # apply the role

# Override role defaults
- name: Use role with custom vars
  hosts: webservers
  roles:
    - role: httpd-role
      vars:
        sysadmin: admin@mycompany.com

# Static import (processed at parse time)
- name: Apply roles
  hosts: all
  tasks:
    - import_role:
        name: httpd-role

# Dynamic include (processed at runtime)
- name: Apply role conditionally
  hosts: all
  tasks:
    - include_role:
        name: db_role
      when: inventory_hostname in groups['dbservers']
```

### Ansible Galaxy — Public Roles

```bash
# Search for community roles
ansible-galaxy search nginx

# Install a role from Galaxy
ansible-galaxy install geerlingguy.nginx
ansible-galaxy install geerlingguy.mysql

# Install multiple roles from requirements file
cat requirements.yml
---
- name: geerlingguy.nginx
  version: 3.0.0
- name: geerlingguy.mysql
  version: 4.3.2

ansible-galaxy install -r requirements.yml

# List installed roles
ansible-galaxy list

# Roles are installed to ~/.ansible/roles/ by default
```

## Managing Software — Module Reference

From the book's Chapter 11 — modules for package management:

```yaml
# package — distro-agnostic (auto-detects yum/apt/dnf)
- package:
    name: vim
    state: present

# yum — RHEL/CentOS specific
- yum:
    name: httpd
    state: latest        # present, absent, latest

# apt — Debian/Ubuntu specific
- apt:
    name: nginx
    state: present
    update_cache: yes    # run apt update first

# yum_repository — add YUM repos
- yum_repository:
    name: zabbix-monitoring
    description: Zabbix 5.2 Repo
    baseurl: https://repo.zabbix.com/zabbix/5.2/rhel/8/x86_64/
    enabled: yes
    gpgcheck: no

# package_facts — get info about installed packages
- package_facts:
    manager: auto

- debug:
    msg: "nginx version: {{ ansible_facts.packages['nginx'][0]['version'] }}"

# rpm_key — GPG key management
- rpm_key:
    key: https://packages.chef.io/chef.asc
    state: present

# redhat_subscription — RHEL subscription management
- redhat_subscription:
    state: present
    username: user@redhat.com
    password: "{{ rhsm_password }}"
```

### Real Example: Add Zabbix Repo and Install Agent

```yaml
---
- name: Manage Software
  hosts: node1
  become: yes
  tasks:
    - name: Add Zabbix repository
      yum_repository:
        name: zabbix-monitoring
        description: "Zabbix 5.2 Repo"
        baseurl: https://repo.zabbix.com/zabbix/5.2/rhel/8/x86_64/
        enabled: yes
        gpgcheck: no

    - name: Install zabbix-agent
      yum:
        name: zabbix-agent
        state: present

    - name: Display zabbix-agent info
      package_facts:
        manager: auto

    - name: Show installed version
      debug:
        msg: "zabbix-agent version: {{ ansible_facts.packages['zabbix-agent'][0]['version'] }}"
```

## RHEL System Roles (NTP Example)

RHEL System Roles are pre-built roles from Red Hat:

```bash
# Install RHEL System Roles
dnf install rhel-system-roles -y
# Roles installed to: /usr/share/ansible/roles/
```

```yaml
# Configure NTP with timesync role
---
- name: Configure NTP using timesync role
  hosts: node1
  vars:
    timesync_ntp_servers:
      - hostname: 0.north-america.pool.ntp.org
        iburst: yes
      - hostname: 1.north-america.pool.ntp.org
        iburst: yes
      - hostname: 2.north-america.pool.ntp.org
        iburst: yes
      - hostname: 3.north-america.pool.ntp.org
        iburst: yes
  roles:
    - rhel-system-roles.timesync
```

```bash
# Verify NTP is configured on node1
ansible node1 -m command -a "cat /etc/chrony.conf"
# node1 | CHANGED | rc=0 >>
# # Ansible managed
# server 0.north-america.pool.ntp.org iburst
# ...

ansible node1 -m command -a "timedatectl"
# Local time:     Sat 2020-11-14 21:08:46 CST
# System clock synchronized: yes
```

## Ansible Troubleshooting

```bash
# Verbose mode — see exactly what Ansible is doing
ansible-playbook playbook.yml -v     # basic
ansible-playbook playbook.yml -vv    # more detail
ansible-playbook playbook.yml -vvv   # connection debug (SSH level)
ansible-playbook playbook.yml -vvvv  # maximum (plugin level)

# Check mode (dry run) — shows what WOULD change, makes no changes
ansible-playbook playbook.yml --check

# Start at a specific task
ansible-playbook playbook.yml --start-at-task="Install nginx"

# Run only specific tags
ansible-playbook playbook.yml --tags "install,configure"
ansible-playbook playbook.yml --skip-tags "restart"

# List tasks without running them
ansible-playbook playbook.yml --list-tasks

# List hosts that would be targeted
ansible-playbook playbook.yml --list-hosts

# Syntax check
ansible-playbook playbook.yml --syntax-check

# Limit to specific hosts
ansible-playbook playbook.yml --limit node1
ansible-playbook playbook.yml --limit "node1,node2"
ansible-playbook playbook.yml --limit webservers

# Step through tasks one at a time (confirm each)
ansible-playbook playbook.yml --step
```

### Common Errors and Fixes

```bash
# Error: "UNREACHABLE" 
# Fix: Check SSH connectivity and host key
ssh -i ~/.ssh/id_rsa user@nodeIP
# If first time: accept fingerprint manually, then Ansible works

# Error: "Missing sudo password"
# Fix: Add become_pass or configure NOPASSWD in sudoers
ansible-playbook playbook.yml --ask-become-pass

# Error: "Python not found on managed node"  
# Fix: Install Python or specify interpreter
ansible all -m ping -e "ansible_python_interpreter=/usr/bin/python3"

# Error: "Permission denied reading /etc/shadow"
# Fix: Add become: yes to play or task
- name: Read shadow file
  command: cat /etc/shadow
  become: yes

# Error: Module fails but want to continue
# Fix: ignore_errors on that specific task
- name: Task that might fail
  command: might-fail
  ignore_errors: yes
```

## Dynamic Inventory

Instead of static inventory files, generate inventory dynamically from cloud APIs:

```bash
# AWS EC2 dynamic inventory
pip install boto3
cat aws_ec2.yml:
---
plugin: aws_ec2
regions:
  - ap-south-1
keyed_groups:
  - key: tags.Environment
    prefix: env
  - key: instance_type
    prefix: type

ansible-inventory -i aws_ec2.yml --list    # show all hosts
ansible-playbook -i aws_ec2.yml playbook.yml

# Azure dynamic inventory
pip install azure-cli-core azure-mgmt-compute
ansible-playbook -i azure_rm.yml playbook.yml
```

## ansible-doc — Built-in Documentation

```bash
# List all available modules
ansible-doc -l

# Get full documentation for a module
ansible-doc yum
ansible-doc copy
ansible-doc template
ansible-doc user
ansible-doc service
ansible-doc file
ansible-doc blockinfile    # add a block of text to a file
ansible-doc lineinfile     # manage single lines in a file

# Short synopsis only
ansible-doc -s yum
```
