# Ansible — Cheatsheet

```bash
# ── AD-HOC COMMANDS ──────────────────────────────────────────
ansible all -m ping
ansible webservers -m shell -a "uptime"
ansible webservers -m command -a "df -h"          # No shell expansion
ansible webservers -m shell -a "free -m | awk 'NR==2{print $3}'"  # With pipe
ansible webservers -m service -a "name=nginx state=restarted"
ansible all -m setup                               # Gather facts
ansible all -m setup -a "filter=ansible_os_family"
ansible webservers -b -m yum -a "name=nginx state=present"  # -b = become (sudo)

# ── PLAYBOOK EXECUTION ───────────────────────────────────────
ansible-playbook site.yml
ansible-playbook site.yml -i inventory/prod/
ansible-playbook site.yml --limit webservers
ansible-playbook site.yml --limit web01,web02
ansible-playbook site.yml --check              # Dry run
ansible-playbook site.yml --diff               # Show file changes
ansible-playbook site.yml --check --diff       # Dry run + show changes
ansible-playbook site.yml --tags deploy        # Only run tagged tasks
ansible-playbook site.yml --skip-tags restart  # Skip tagged tasks
ansible-playbook site.yml -v                   # Verbose
ansible-playbook site.yml -vvv                 # Very verbose (debug)
ansible-playbook site.yml --start-at-task "Install nginx"
ansible-playbook site.yml --ask-vault-pass
ansible-playbook site.yml --vault-password-file .vault_pass

# ── VAULT ─────────────────────────────────────────────────────
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
ansible-vault view secrets.yml
ansible-vault encrypt existing.yml
ansible-vault decrypt encrypted.yml
ansible-vault rekey secrets.yml               # Change password
ansible-vault encrypt_string 'supersecret' --name 'db_password'

# ── INVENTORY ────────────────────────────────────────────────
ansible-inventory -i inventory/ --list        # Show all inventory as JSON
ansible-inventory -i inventory/ --graph       # Show group hierarchy
ansible -i inventory/ all --list-hosts        # List all hosts

# ── ROLES ─────────────────────────────────────────────────────
ansible-galaxy role init my_role              # Create role skeleton
ansible-galaxy install geerlingguy.nginx      # Install from Galaxy
ansible-galaxy install -r requirements.yml    # Install from file
ansible-galaxy list                           # List installed roles
```

## Key Module Reference

```yaml
# File operations
- file: path=/etc/app state=directory mode='0755' owner=app
- copy: src=files/app.conf dest=/etc/app/app.conf backup=yes
- template: src=nginx.conf.j2 dest=/etc/nginx/conf.d/app.conf validate='nginx -t -c %s'
- fetch: src=/var/log/app.log dest=./logs/ flat=yes
- lineinfile: path=/etc/ssh/sshd_config regexp='^PermitRootLogin' line='PermitRootLogin no'
- blockinfile: path=/etc/hosts block="10.0.0.1 db01\n10.0.0.2 db02"

# Packages
- apt: name={{ packages }} state=present update_cache=yes
  vars: { packages: [nginx, git, curl] }
- yum: name=nginx state=latest
- package: name=nginx state=present   # OS-agnostic

# Services
- service: name=nginx state=started enabled=yes
- systemd: name=myapp daemon_reload=yes state=restarted

# Users and groups
- user: name=deploy shell=/bin/bash groups=sudo append=yes
- authorized_key: user=deploy key="{{ lookup('file', '~/.ssh/id_rsa.pub') }}"

# Commands
- command: /opt/app/migrate.sh creates=/opt/app/.migrated  # skip if file exists
- shell: echo "{{ env }}" >> /var/log/deploys.log
- script: scripts/init.sh  # run local script on remote

# Conditionals
- apt: name=apache2
  when: ansible_os_family == "Debian"

- name: Run only on first run
  command: /opt/setup.sh
  args: { creates: /opt/.initialized }

# Register and use results
- shell: cat /opt/app/VERSION
  register: app_version
- debug: msg="App version is {{ app_version.stdout }}"
- fail: msg="Wrong version" when: app_version.stdout != "2.0"
```

## Jinja2 Templates Quick Reference

```jinja2
{# Variable #}
{{ variable }}
{{ dict.key }} or {{ dict['key'] }}
{{ list[0] }}

{# Default value #}
{{ variable | default('fallback') }}

{# Conditions #}
{% if env == 'prod' %}
worker_processes {{ ansible_processor_vcpus }};
{% else %}
worker_processes 1;
{% endif %}

{# Loops #}
{% for server in groups['webservers'] %}
    server {{ hostvars[server]['ansible_host'] }};
{% endfor %}

{# Filters #}
{{ 'hello' | upper }}           → HELLO
{{ list | join(', ') }}         → a, b, c
{{ string | regex_replace('old', 'new') }}
{{ number | int }}
{{ path | basename }}           → filename.txt
{{ path | dirname }}            → /path/to
```
