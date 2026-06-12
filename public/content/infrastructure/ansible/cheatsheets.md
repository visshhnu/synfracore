# Ansible Cheatsheet

## Ad-Hoc Commands

```bash
# Ping all hosts
ansible all -i inventory.yml -m ping

# Run command
ansible webservers -m shell -a "uptime"
ansible all -m command -a "df -h"

# Copy file
ansible webservers -m copy -a "src=./nginx.conf dest=/etc/nginx/nginx.conf"

# Install package
ansible webservers -m yum -a "name=nginx state=present" -b

# Start service
ansible webservers -m service -a "name=nginx state=started" -b

# Get facts
ansible web01 -m setup
ansible web01 -m setup -a "filter=ansible_*_mb"  # only memory facts

# Check syntax
ansible-playbook site.yml --syntax-check

# Dry run
ansible-playbook site.yml --check --diff

# Run with tags
ansible-playbook site.yml --tags deploy
ansible-playbook site.yml --skip-tags backup

# Limit to hosts
ansible-playbook site.yml --limit web01
ansible-playbook site.yml --limit "webservers:!web03"  # exclude web03
```

## Playbook Patterns

```yaml
---
- name: Configure application
  hosts: appservers
  become: true
  gather_facts: true
  serial: "30%"          # Rolling update: 30% at a time
  max_fail_percentage: 0 # Abort if any host fails

  vars:
    app_version: "2.1.0"
    app_port: 8080

  pre_tasks:
    - name: Check disk space
      assert:
        that: ansible_mounts | selectattr('mount','==','/') | map(attribute='size_available') | first > 1073741824
        fail_msg: "Less than 1GB free disk space"

  tasks:
    # Conditional
    - name: Install on Debian
      apt: {name: "{{ item }}", state: present}
      loop: [git, curl, jq]
      when: ansible_os_family == "Debian"

    # Register and use result
    - name: Check if app is running
      command: systemctl is-active myapp
      register: app_status
      changed_when: false
      failed_when: false

    - name: Deploy new version
      block:
        - name: Download app
          get_url:
            url: "https://releases.example.com/app-{{ app_version }}.tar.gz"
            dest: /tmp/app.tar.gz
            checksum: "sha256:{{ app_checksum }}"
        
        - name: Extract app
          unarchive:
            src: /tmp/app.tar.gz
            dest: /opt/app
            remote_src: true
      rescue:
        - name: Rollback on failure
          command: /opt/app/rollback.sh
      always:
        - name: Clean temp files
          file: {path: /tmp/app.tar.gz, state: absent}

    # Template with Jinja2
    - name: Deploy config
      template:
        src: app.conf.j2
        dest: /etc/app/config.conf
        validate: /usr/bin/app --check-config %s
      notify: Restart app

  handlers:
    - name: Restart app
      service: {name: myapp, state: restarted}
```

## Jinja2 Templates

```jinja2
{# app.conf.j2 #}
[server]
host = {{ ansible_default_ipv4.address }}
port = {{ app_port }}
workers = {{ ansible_processor_vcpus * 2 }}

[database]
{% for db_host in groups['databases'] %}
server = {{ hostvars[db_host]['ansible_host'] }}:5432
{% endfor %}

[logging]
level = {% if inventory_hostname in groups['production'] %}WARNING{% else %}DEBUG{% endif %}
```

## Inventory Patterns

```ini
# Static inventory
[webservers]
web[01:05].example.com   # web01 through web05
10.0.1.[10:20]           # range of IPs

[dbservers]
db01 ansible_host=10.0.2.10 pg_version=16

[production:children]
webservers
dbservers

[production:vars]
ansible_user=ec2-user
ansible_become=true
```

```bash
# Dynamic inventory (AWS)
ansible-inventory -i aws_ec2.yml --list
ansible all -i aws_ec2.yml -m ping

# aws_ec2.yml
plugin: amazon.aws.aws_ec2
regions: [us-east-1]
filters:
  tag:Environment: production
keyed_groups:
  - key: tags.Role
    prefix: role
```
