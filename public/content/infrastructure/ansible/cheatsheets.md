# Ansible — Cheatsheet

## Commands Quick Reference

```bash
# ── CONNECTIVITY ──────────────────────────────────────────
ansible all -m ping                          # test connectivity
ansible webservers -m ping                   # test specific group
ansible node1 -m ping                        # test single host
ansible all -m setup                         # gather all facts
ansible node1 -m setup -a "filter=ansible_distribution"

# ── AD-HOC COMMANDS ───────────────────────────────────────
ansible all -m command -a "uptime"           # run command
ansible all -m shell -a "df -h | grep /dev" # shell with pipe
ansible all -m command -a "id" --become      # run as sudo
ansible webservers -m yum -a "name=httpd state=present" --become
ansible webservers -m service -a "name=httpd state=started" --become
ansible all -m copy -a "src=/etc/hosts dest=/tmp/hosts"
ansible all -m file -a "path=/tmp/dir state=directory mode=0755"

# ── PLAYBOOK COMMANDS ─────────────────────────────────────
ansible-playbook playbook.yml                # run playbook
ansible-playbook playbook.yml -v             # verbose
ansible-playbook playbook.yml -vvv           # very verbose (SSH level)
ansible-playbook playbook.yml --check        # dry run (no changes)
ansible-playbook playbook.yml --diff         # show file diffs
ansible-playbook playbook.yml --list-tasks   # list tasks only
ansible-playbook playbook.yml --list-hosts   # list target hosts
ansible-playbook playbook.yml --syntax-check # validate YAML syntax
ansible-playbook playbook.yml --limit node1  # only run on node1
ansible-playbook playbook.yml --limit "node1,node2"
ansible-playbook playbook.yml --tags install # run only tagged tasks
ansible-playbook playbook.yml --skip-tags restart
ansible-playbook playbook.yml --start-at-task "Configure nginx"
ansible-playbook playbook.yml --step         # confirm each task
ansible-playbook playbook.yml -e "http_port=8080"  # extra vars
ansible-playbook playbook.yml --ask-become-pass    # prompt sudo password

# ── VAULT ─────────────────────────────────────────────────
ansible-vault create secrets.yml             # create encrypted file
ansible-vault edit secrets.yml               # edit encrypted file
ansible-vault view secrets.yml               # view without decrypting
ansible-vault encrypt file.yml               # encrypt existing file
ansible-vault decrypt file.yml               # decrypt to plaintext
ansible-vault rekey secrets.yml              # change vault password
ansible-playbook playbook.yml --ask-vault-pass
ansible-playbook playbook.yml --vault-password-file ~/.vault_pass

# ── GALAXY ────────────────────────────────────────────────
ansible-galaxy init my-role                  # create role structure
ansible-galaxy install geerlingguy.nginx     # install from Galaxy
ansible-galaxy install -r requirements.yml  # install from file
ansible-galaxy list                          # list installed roles
ansible-galaxy remove geerlingguy.nginx     # remove role
ansible-galaxy search nginx --platforms EL  # search

# ── INVENTORY ─────────────────────────────────────────────
ansible-inventory --list                     # list all hosts JSON
ansible-inventory --graph                    # show host tree
ansible-inventory -i aws_ec2.yml --list     # dynamic inventory
```

## Playbook Structure

```yaml
---
- name: Play name                  # descriptive name
  hosts: webservers                # target: all, group, host, pattern
  become: yes                      # sudo on all tasks
  become_user: root                # sudo as specific user
  gather_facts: yes                # gather facts (default: yes)
  serial: 2                        # rolling update: 2 hosts at a time
  max_fail_percentage: 20          # abort if >20% hosts fail
  vars:                            # inline variables
    http_port: 80
  vars_files:                      # external variable files
    - vars/main.yml
    - vars/secrets.yml             # can be vault-encrypted
  environment:                     # environment variables for all tasks
    PATH: /usr/local/bin:{{ ansible_env.PATH }}

  pre_tasks:                       # run before roles
    - name: Update cache
      apt: update_cache=yes

  roles:                           # apply roles
    - common
    - { role: nginx, http_port: 8080 }

  tasks:                           # task list
    - name: Descriptive task name
      module_name:
        param1: value1
        param2: value2
      become: yes                  # sudo for this task only
      when: ansible_os_family == "RedHat"
      loop: "{{ my_list }}"
      register: result             # save output
      notify: Handler name         # trigger handler
      tags: [install, configure]   # for --tags filtering
      ignore_errors: yes           # continue if fails
      timeout: 30                  # task timeout seconds
      changed_when: false          # never report as changed
      failed_when: result.rc != 0  # custom failure condition

  handlers:                        # only run when notified
    - name: Handler name
      service:
        name: nginx
        state: restarted

  post_tasks:                      # run after roles
    - name: Verify service
      uri:
        url: http://localhost:80
        status_code: 200
```

## Common Modules

```yaml
# ── FILE MANAGEMENT ───────────────────────────────────────
- file:
    path: /tmp/myfile
    state: touch       # touch, absent, directory, link, hard
    mode: '0644'       # permissions (string with quotes)
    owner: nginx
    group: nginx
    recurse: yes       # for directories

- copy:
    src: files/nginx.conf    # relative to playbook or role files/
    dest: /etc/nginx/nginx.conf
    backup: yes              # keep .backup file
    validate: nginx -t -c %s # validate before replacing

- template:
    src: templates/nginx.conf.j2
    dest: /etc/nginx/nginx.conf
    validate: nginx -t -c %s

- fetch:                     # copy file FROM managed node TO control node
    src: /var/log/app.log
    dest: logs/{{ inventory_hostname }}/
    flat: no

- lineinfile:                # manage single lines in file
    path: /etc/hosts
    line: "192.168.1.10 node1"
    state: present

- blockinfile:               # manage block of lines in file
    path: /etc/nginx/nginx.conf
    block: |
      upstream backend {
        server 127.0.0.1:8080;
      }
    marker: "# {mark} ANSIBLE MANAGED BLOCK"

# ── PACKAGES ──────────────────────────────────────────────
- yum:
    name: "{{ packages }}"  # list or string
    state: present           # present, absent, latest
    update_cache: yes

- apt:
    name: nginx
    state: present
    update_cache: yes
    cache_valid_time: 3600   # don't update if cache < 1h old

- package:                   # distro-agnostic
    name: vim
    state: present

# ── SERVICES ──────────────────────────────────────────────
- service:
    name: nginx
    state: started           # started, stopped, restarted, reloaded
    enabled: yes             # start on boot

# ── USERS ─────────────────────────────────────────────────
- user:
    name: deploy
    uid: 1050
    shell: /bin/bash
    groups: [sudo, docker]
    append: yes              # add to groups (don't replace)
    create_home: yes
    password: "{{ 'mypassword' | password_hash('sha512') }}"
    state: present

- authorized_key:
    user: deploy
    key: "{{ lookup('file', 'files/deploy.pub') }}"
    state: present

# ── COMMANDS ──────────────────────────────────────────────
- command: /usr/bin/uptime          # no shell features
- shell: "df -h | grep /dev/sda"    # full shell

- command: /opt/scripts/deploy.sh
  args:
    creates: /opt/app/deployed      # skip if this file exists (idempotent)

- command: /opt/scripts/cleanup.sh
  args:
    removes: /tmp/lockfile          # skip if this file doesn't exist

# ── DEBUGGING ─────────────────────────────────────────────
- debug:
    msg: "OS is {{ ansible_distribution }}"

- debug:
    var: ansible_facts              # print entire variable

- debug:
    msg: "{{ result | to_nice_json }}"

- assert:
    that:
      - result.rc == 0
      - result.stdout != ""
    fail_msg: "Task failed! rc={{ result.rc }}"
```

## Jinja2 Template Filters

```jinja2
{{ variable | upper }}              {# UPPERCASE #}
{{ variable | lower }}              {# lowercase #}
{{ variable | default('fallback') }} {# default if undefined #}
{{ variable | int }}                {# convert to integer #}
{{ variable | string }}             {# convert to string #}
{{ list | join(', ') }}             {# join list to string #}
{{ dict | dict2items }}             {# dict to list for loops #}
{{ string | replace('old','new') }} {# string replace #}
{{ list | length }}                 {# list/string length #}
{{ list | first }}                  {# first element #}
{{ list | last }}                   {# last element #}
{{ list | sort }}                   {# sort list #}
{{ list | unique }}                 {# remove duplicates #}
{{ 'password' | password_hash('sha512') }}  {# hash password #}
{{ variable | to_json }}            {# convert to JSON #}
{{ variable | to_nice_json }}       {# pretty JSON #}
{{ variable | to_yaml }}            {# convert to YAML #}
```

## Ansible Output Status Meanings

```
ok       → task ran, nothing changed (already in desired state)
changed  → task ran and made a change to the system
failed   → task failed (playbook stops unless ignore_errors: yes)
skipped  → task skipped (when condition evaluated to false)
unreachable → could not connect to host via SSH
ignored  → task failed but ignore_errors: yes
rescued  → task failed but block rescue handled it
```

## Chapter Reference (O'Reilly Book)

```
Ch 1:  Hello Ansible      — install, SSH setup, inventory
Ch 2:  Ad-Hoc Commands    — ping, command, shell modules
Ch 3:  Playbooks          — YAML syntax, tasks, handlers
Ch 4:  Variables/Facts    — vars, vars_files, ansible_facts, set_fact
Ch 5:  Loops              — loop, dict2items, loop_control
Ch 6:  Conditionals       — when, register, ansible_facts
Ch 7:  Jinja2 Templates   — template module, filters, blocks
Ch 8:  Ansible Vault      — encrypt, decrypt, rekey
Ch 9:  Roles              — galaxy init, tasks/handlers/templates
Ch 10: RHEL System Roles  — timesync, selinux, network
Ch 11: Managing Systems   — package, yum, apt, service, user
Ch 12: Troubleshooting    — -v flags, --check, blockinfile, lineinfile
```
