# Ansible Fundamentals

## Installation & Setup

```bash
# Install Ansible (control node only)
pip install ansible          # Any platform
sudo apt install ansible     # Ubuntu/Debian
sudo dnf install ansible     # RHEL/Fedora

# Verify
ansible --version
# ansible [core 2.17.x]

# Install commonly needed collections
ansible-galaxy collection install community.general
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install azure.azcollection
```

## Inventory

```ini
# inventory.ini — Static inventory

# Ungrouped hosts
192.168.1.10
server-01.example.com

# Groups
[webservers]
web-01.prod.example.com
web-02.prod.example.com
web-03.prod.example.com

[databases]
db-01.prod.example.com
db-02.prod.example.com

[production:children]   # Group of groups
webservers
databases

[webservers:vars]       # Variables for a group
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/prod.pem
http_port=80
```

```yaml
# inventory.yaml — YAML format (preferred)
all:
  children:
    production:
      children:
        webservers:
          hosts:
            web-01:
              ansible_host: 10.0.1.10
            web-02:
              ansible_host: 10.0.1.11
          vars:
            ansible_user: ubuntu
            http_port: 80
        databases:
          hosts:
            db-01:
              ansible_host: 10.0.2.10
          vars:
            ansible_user: postgres
```

```bash
# Test inventory connectivity
ansible all -i inventory.ini -m ping

# List all hosts
ansible-inventory -i inventory.yaml --list

# AWS Dynamic Inventory (queries EC2 in real time)
ansible-inventory -i aws_ec2.yaml --list
# aws_ec2.yaml:
# plugin: amazon.aws.aws_ec2
# regions: [us-east-1]
# filters:
#   tag:Environment: production
```

## Your First Playbook

```yaml
# site.yml — Install and configure nginx
---
- name: Configure web servers
  hosts: webservers
  become: yes              # Run as sudo
  vars:
    http_port: 80
    server_name: "{{ inventory_hostname }}"

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
        cache_valid_time: 3600   # Only update if cache older than 1 hour

    - name: Install nginx
      apt:
        name: nginx
        state: present           # Idempotent — does nothing if already installed

    - name: Deploy nginx config from template
      template:
        src: templates/nginx.conf.j2
        dest: /etc/nginx/nginx.conf
        owner: root
        group: root
        mode: '0644'
        validate: nginx -t -c %s  # Validate before copying!
      notify: Restart nginx        # Only restart if this task changed

    - name: Ensure nginx is running and enabled
      systemd:
        name: nginx
        state: started
        enabled: yes

    - name: Open firewall port
      ufw:
        rule: allow
        port: "{{ http_port }}"
        proto: tcp

  handlers:
    - name: Restart nginx
      systemd:
        name: nginx
        state: restarted
```

```bash
# Run the playbook
ansible-playbook -i inventory.ini site.yml

# Dry run — check mode (no changes made)
ansible-playbook -i inventory.ini site.yml --check

# Verbose output (see what changed)
ansible-playbook -i inventory.ini site.yml -v      # Basic
ansible-playbook -i inventory.ini site.yml -vvv    # Debug level

# Limit to specific hosts
ansible-playbook -i inventory.ini site.yml --limit web-01

# Only run specific tags
ansible-playbook -i inventory.ini site.yml --tags "deploy,config"

# Skip tags
ansible-playbook -i inventory.ini site.yml --skip-tags "restart"

# Prompt for sudo password (when no key-based sudo)
ansible-playbook -i inventory.ini site.yml --ask-become-pass
```

## Jinja2 Templates

```jinja2
{# templates/nginx.conf.j2 #}
server {
    listen {{ http_port }};
    server_name {{ server_name }};
    
    location / {
        proxy_pass http://{{ backend_host }}:{{ backend_port }};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
    
    {% if ssl_enabled %}
    listen 443 ssl;
    ssl_certificate /etc/ssl/{{ domain }}.crt;
    ssl_certificate_key /etc/ssl/{{ domain }}.key;
    {% endif %}
    
    {% for backend in backend_servers %}
    # Backend: {{ backend.name }}
    {% endfor %}
}
```

## Variables & Precedence

```yaml
# Variables can come from many places (higher = wins):
# 1. Extra vars: ansible-playbook ... -e "version=2.0"         (HIGHEST)
# 2. Task vars
# 3. Block vars
# 4. Role vars (roles/myrole/vars/main.yml)
# 5. set_fact / registered vars
# 6. Play vars_files
# 7. Play vars
# 8. Host vars (host_vars/web-01.yml)
# 9. Group vars (group_vars/webservers.yml)
# 10. Role defaults (roles/myrole/defaults/main.yml)         (LOWEST)

# group_vars/webservers.yml
nginx_version: "1.25"
max_workers: 4
document_root: /var/www/html

# host_vars/web-01.yml
nginx_version: "1.24"   # Override for this specific host
```

## Ansible Vault — Secrets Management

```bash
# Encrypt a file
ansible-vault encrypt secrets.yml
# New Vault password: ...

# Edit encrypted file
ansible-vault edit secrets.yml

# View without decrypting to file
ansible-vault view secrets.yml

# Encrypt a single value (inline)
ansible-vault encrypt_string 'my_secret_password' --name 'db_password'
# Result:
# db_password: !vault |
#   $ANSIBLE_VAULT;1.1;AES256
#   ...

# In playbook — use with vault variable
- name: Create database user
  mysql_user:
    name: app
    password: "{{ db_password }}"  # Decrypted at runtime

# Run playbook with vault
ansible-playbook site.yml --vault-password-file ~/.vault_pass
ansible-playbook site.yml --ask-vault-pass
```

## Roles — Reusable Structure

```bash
# Create role scaffold
ansible-galaxy role init roles/nginx

# Structure:
# roles/nginx/
# ├── tasks/main.yml      — Main task list
# ├── handlers/main.yml   — Event handlers
# ├── templates/          — Jinja2 templates
# ├── files/              — Static files
# ├── vars/main.yml       — Role variables (high priority)
# ├── defaults/main.yml   — Default variables (low priority)
# ├── meta/main.yml       — Role metadata, dependencies
# └── README.md

# Use role in playbook
- hosts: webservers
  roles:
    - nginx
    - { role: ssl, when: ssl_enabled }
    - role: app
      vars:
        app_version: "2.1.0"

# Download roles from Ansible Galaxy
ansible-galaxy role install geerlingguy.nginx
ansible-galaxy role install -r requirements.yml
```

## Rolling Updates Pattern

```yaml
# Update servers 25% at a time — zero downtime
- name: Rolling deployment
  hosts: webservers
  serial: "25%"          # Process 25% of hosts at a time
  max_fail_percentage: 10  # Abort if >10% fail

  tasks:
    - name: Remove from load balancer
      uri:
        url: "http://lb/api/drain/{{ inventory_hostname }}"
        method: POST

    - name: Wait for connections to drain
      wait_for:
        timeout: 30

    - name: Deploy new version
      copy:
        src: app-{{ app_version }}.jar
        dest: /opt/app/app.jar

    - name: Restart application
      systemd:
        name: myapp
        state: restarted

    - name: Wait for app to be healthy
      uri:
        url: "http://{{ inventory_hostname }}:8080/health"
        status_code: 200
      retries: 10
      delay: 5

    - name: Add back to load balancer
      uri:
        url: "http://lb/api/enable/{{ inventory_hostname }}"
        method: POST
```
