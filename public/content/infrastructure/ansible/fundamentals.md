# Ansible — Fundamentals

## Inventory

```ini
# inventory/hosts.ini

[webservers]
web01 ansible_host=10.0.1.10
web02 ansible_host=10.0.1.11

[databases]
db01 ansible_host=10.0.2.10

[production:children]
webservers
databases

[production:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=~/.ssh/prod.pem
ansible_python_interpreter=/usr/bin/python3
```

```yaml
# inventory/hosts.yml — YAML format (preferred)
all:
  vars:
    ansible_user: ec2-user
  children:
    webservers:
      hosts:
        web01:
          ansible_host: 10.0.1.10
        web02:
          ansible_host: 10.0.1.11
    databases:
      hosts:
        db01:
          ansible_host: 10.0.2.10
          pg_version: 16
```

## Core Playbook Structure

```yaml
---
- name: Configure web servers
  hosts: webservers
  become: true          # sudo
  gather_facts: true    # collect system info into ansible_facts
  vars:
    app_port: 8080
    nginx_version: 1.24
  vars_files:
    - vars/secrets.yml  # encrypted with ansible-vault
  
  pre_tasks:
    - name: Update apt cache
      apt:
        update_cache: true
        cache_valid_time: 3600
      when: ansible_os_family == "Debian"

  tasks:
    - name: Install nginx
      package:
        name: "nginx={{ nginx_version }}*"
        state: present

    - name: Deploy nginx configuration
      template:
        src: templates/nginx.conf.j2
        dest: /etc/nginx/conf.d/app.conf
        owner: root
        group: root
        mode: '0644'
        validate: nginx -t -c %s
      notify: Reload nginx

    - name: Ensure nginx is running
      service:
        name: nginx
        state: started
        enabled: true

    - name: Create app directory
      file:
        path: /var/www/app
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'

  handlers:
    - name: Reload nginx
      service:
        name: nginx
        state: reloaded
```

## Key Modules

```yaml
# File management
- name: Create file
  file:
    path: /etc/app/config
    state: touch
    mode: '0600'

- name: Copy file
  copy:
    src: files/app.conf
    dest: /etc/app/app.conf
    backup: true

- name: Template (Jinja2)
  template:
    src: templates/config.j2
    dest: /etc/app/config.yml

# Package management
- apt:    # Ubuntu/Debian
    name: [git, curl, htop]
    state: present

- yum:    # RHEL/CentOS/Amazon Linux
    name: nginx
    state: latest

- package: # Works on both (slower)
    name: nginx
    state: present

# Service
- service:
    name: nginx
    state: started   # started/stopped/restarted/reloaded
    enabled: true

# Command execution
- command: /usr/bin/app --init     # No shell — use when no pipes/redirects needed
- shell: echo "hello" >> /tmp/log  # Shell — when you need pipes, variables

# Idempotent pattern for shell
- shell: app --version
  register: app_version
  changed_when: false   # Don't report as changed

- shell: app --init
  args:
    creates: /var/app/initialized  # Only run if file doesn't exist

# Conditional
- name: Install on Ubuntu only
  apt:
    name: apache2
  when:
    - ansible_distribution == "Ubuntu"
    - ansible_distribution_version is version('20.04', '>=')

# Loop
- name: Create users
  user:
    name: "{{ item.name }}"
    groups: "{{ item.groups }}"
    state: present
  loop:
    - { name: alice, groups: sudo }
    - { name: bob, groups: docker }
```

## Roles

```
roles/
  nginx/
    tasks/
      main.yml      # Main task list
    handlers/
      main.yml      # Handlers (e.g. reload nginx)
    templates/
      nginx.conf.j2 # Jinja2 templates
    files/
      ssl.conf      # Static files
    vars/
      main.yml      # Role variables (high priority)
    defaults/
      main.yml      # Default variables (low priority, easily overridden)
    meta/
      main.yml      # Dependencies on other roles
```

```yaml
# Use role in playbook
- name: Configure servers
  hosts: webservers
  roles:
    - common
    - nginx
    - { role: app, app_version: "2.1.0" }
```

## Ansible Vault

```bash
# Encrypt sensitive file
ansible-vault encrypt vars/secrets.yml

# Edit encrypted file
ansible-vault edit vars/secrets.yml

# Run playbook with vault password
ansible-playbook site.yml --ask-vault-pass
# Or use password file (for CI/CD)
ansible-playbook site.yml --vault-password-file .vault_pass

# Encrypt a single string (inline)
ansible-vault encrypt_string 'supersecret' --name 'db_password'
# Output:
# db_password: !vault |
#   $ANSIBLE_VAULT;1.1;AES256
#   ...
```

## Running Playbooks

```bash
# Full run
ansible-playbook -i inventory/hosts.yml site.yml

# Limit to specific hosts or groups
ansible-playbook site.yml --limit webservers
ansible-playbook site.yml --limit web01,web02

# Check mode (dry run — no changes made)
ansible-playbook site.yml --check

# Run only specific tags
ansible-playbook site.yml --tags "nginx,ssl"
ansible-playbook site.yml --skip-tags "deploy"

# Verbose output for debugging
ansible-playbook site.yml -vvv

# Ad-hoc command
ansible webservers -i inventory/hosts.yml -m shell -a "uptime"
ansible all -m ping
```
