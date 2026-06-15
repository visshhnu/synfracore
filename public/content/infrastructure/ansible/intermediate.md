# Ansible — Intermediate

## Variables

Three ways to define variables in Ansible:

### 1. Inline in Playbook (vars)
```yaml
---
- name: Working with variables
  hosts: node1
  vars:
    http_port: 80
    app_user: deploy
    packages:
      - nginx
      - python3
      - git
  tasks:
    - name: Show HTTP port
      debug:
        msg: "HTTP port is {{ http_port }}"
    - name: Install packages
      yum:
        name: "{{ item }}"
        state: present
      loop: "{{ packages }}"
```

### 2. External Variable Files (vars_files)
```yaml
# myvars.yml
port_nums: [21, 22, 23, 25, 80, 443]
users:
  bob:
    username: bob
    uid: 1122
    shell: /bin/bash
  lisa:
    username: lisa
    uid: 2233
    shell: /bin/sh
```

```yaml
# variables-playbook.yml
---
- name: Working with variables
  hosts: node1
  vars_files: myvars.yml          # load variables from file
  tasks:
    - name: Show 2nd item in port_nums
      debug:
        msg: "SSH port is {{ port_nums[1] }}"     # array index

    - name: Show UID of bob
      debug:
        msg: "UID of bob is {{ users.bob.uid }}"  # dictionary access
```

**vars_files** preprocesses and loads variables at playbook start.
**include_vars** loads variables dynamically at task execution time:
```yaml
- name: Load variables dynamically
  include_vars: myvars.yml
```

### 3. Registered Variables (capture task output)
```yaml
- name: Save contents of /etc/os-release
  command: cat /etc/os-release
  register: os_release            # save command output to variable

- name: Display the result
  debug:
    msg: "OS release: {{ os_release.stdout }}"

- name: Detect CentOS
  debug:
    msg: "Running CentOS ..."
  when: os_release.stdout.find('CentOS') != -1   # use register in when
```

## Ansible Facts

Ansible automatically gathers facts (system information) from managed nodes before running tasks. Access them via `ansible_facts`:

```bash
# See all facts for a host
ansible node1 -m setup

# Filter specific facts
ansible node1 -m setup -a "filter=ansible_distribution"
ansible node1 -m setup -a "filter=ansible_memory_mb"
ansible node1 -m setup -a "filter=ansible_interfaces"
```

```yaml
# Use facts in playbooks
- name: Show OS info
  debug:
    msg: "{{ ansible_facts['distribution'] }} {{ ansible_facts['distribution_version'] }}"
    # OR shorter: {{ ansible_distribution }} {{ ansible_distribution_version }}

- name: Only run on Ubuntu hosts
  debug:
    msg: "This is an Ubuntu Server."
  when: ansible_facts['distribution'] == "Ubuntu"
```

**Play output showing when + facts in action:**
```
TASK [Only run on Ubuntu hosts]
skipping: [node1]    # CentOS node — skipped
skipping: [node2]    # CentOS node — skipped
skipping: [node3]    # CentOS node — skipped
ok: [node4] => {     # Ubuntu node — ran!
    "msg": "This is an Ubuntu Server."
}

PLAY RECAP
node1: ok=1  changed=0  skipped=1
node4: ok=2  changed=0  skipped=0
```

### Creating Custom Facts
Add permanent custom facts to managed nodes:

```bash
# 1. Create a facts file on control node
[elliot@control plays]$ cat cool.fact
[fun]
kiwi=fruit
matrix=movie
octopus='8 legs'
# Notice: facts filename must have .fact extension
```

```yaml
# custom-facts.yml — deploy the facts file to managed nodes
---
- name: Adding custom facts to node1
  hosts: node1
  tasks:
    - name: Create the facts.d directory
      file:
        path: /etc/ansible/facts.d
        owner: elliot
        mode: 775
        state: directory

    - name: Copy cool.fact to the facts.d directory
      copy:
        src: cool.fact
        dest: /etc/ansible/facts.d

    - name: Display custom fact
      debug:
        msg: "kiwi is a {{ ansible_local.cool.fun.kiwi }}"
        # ansible_local → custom facts → filename → section → key
```

## Loops

### Basic Loop
```yaml
- name: Create multiple users
  user:
    name: "{{ item }}"
    state: present
  loop:
    - alice
    - bob
    - charlie

- name: Install multiple packages
  yum:
    name: "{{ item }}"
    state: present
  loop: "{{ packages }}"   # loop over a variable list
```

### Loop over Dictionaries
```yaml
# Cannot directly loop over a dictionary in Ansible — need dict2items filter
vars:
  employee:
    name: "Elliot Alderson"
    title: "Penetration Tester"
    company: "Linux Handbook"

tasks:
  - name: Print each key-value pair
    debug:
      msg: "{{ item.key }}: {{ item.value }}"
    loop: "{{ employee | dict2items }}"
    # Output:
    # name: Elliot Alderson
    # title: Penetration Tester
    # company: Linux Handbook

# Common mistake: loop: "{{ employee }}" causes error:
# "Invalid data passed to 'loop', it requires a list"
# Fix: always use dict2items to convert dict to list first
```

### Loop with Multiple Values
```yaml
- name: Create users with full details
  user:
    name: "{{ item.username }}"
    uid: "{{ item.uid }}"
    shell: "{{ item.shell }}"
  loop:
    - { username: alice, uid: 1001, shell: /bin/bash }
    - { username: bob,   uid: 1002, shell: /bin/sh }
    - { username: carol, uid: 1003, shell: /bin/bash }
```

## Conditionals (when)

```yaml
# Simple condition
- name: Start httpd on CentOS only
  service:
    name: httpd
    state: started
  when: ansible_facts['distribution'] == "CentOS"

# NOT condition
- name: Skip Ubuntu hosts
  debug:
    msg: "Not an Ubuntu host"
  when: ansible_facts['distribution'] != "Ubuntu"

# Multiple conditions (AND)
- name: Run only on CentOS 8
  debug:
    msg: "CentOS 8 host"
  when:
    - ansible_facts['distribution'] == "CentOS"
    - ansible_facts['distribution_major_version'] == "8"

# Multiple conditions (OR)
- name: Run on CentOS or RHEL
  yum:
    name: httpd
    state: present
  when: >
    ansible_facts['distribution'] == "CentOS" or
    ansible_facts['distribution'] == "RedHat"

# Using registered variable in when
- name: Check if file exists
  stat:
    path: /etc/nginx/nginx.conf
  register: nginx_conf

- name: Backup if exists
  copy:
    src: /etc/nginx/nginx.conf
    dest: /etc/nginx/nginx.conf.bak
    remote_src: yes
  when: nginx_conf.stat.exists
```

## Jinja2 Templates

Jinja2 templates generate dynamic config files by substituting variables at runtime.

```bash
# Create template: nginx.conf.j2
# .j2 extension indicates Jinja2 template
```

```jinja2
# nginx.conf.j2
server {
    listen {{ http_port }};
    server_name {{ server_name }};

    location / {
        root {{ web_root }};
        index index.html;
    }
}
```

```yaml
# Use template module in playbook
- name: Deploy nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/conf.d/mysite.conf
  notify: Reload nginx
```

### Jinja2 with SELinux status example (from book):
```yaml
---
- name: Check SELinux Status
  hosts: all
  tasks:
    - name: Get SELinux status
      command: getenforce
      register: selinux_status

    - name: Create selinux.out using Jinja2
      template:
        src: selinux.j2
        dest: /tmp/selinux.out
```

```jinja2
{# selinux.j2 — Jinja2 template #}
SELinux Status on {{ inventory_hostname }}: {{ selinux_status.stdout }}

{% if selinux_status.stdout == "Enforcing" %}
SELinux is ACTIVE — good security posture
{% elif selinux_status.stdout == "Permissive" %}
SELinux is permissive — logging but not enforcing
{% else %}
SELinux is DISABLED — consider enabling for production
{% endif %}
```

**Output from running the playbook:**
```
PLAY RECAP
node1: ok=3  changed=1  (SELinux: Enabled)
node2: ok=3  changed=1  (SELinux: Disabled)
node3: ok=3  changed=1  (SELinux: Enabled)
node4: ok=3  changed=1  (SELinux: Missing — uses AppArmor instead)
```

## Error Handling with Blocks

Blocks group tasks and allow structured error handling similar to try/catch:

```yaml
tasks:
  - name: Handle errors gracefully
    block:
      - name: Run uptime
        command: uptime

      - name: Run a bad command
        command: blabla           # this will fail

      - name: This task will NOT run
        debug:
          msg: "I won't run because the above failed"

    rescue:                       # runs when block fails (like catch)
      - name: Runs when the block failed
        debug:
          msg: "Block failed; let's try to fix it here ..."

    always:                       # always runs (like finally)
      - name: Always runs
        debug:
          msg: "This always runs regardless of success or failure"
```

```yaml
# ignore_errors: yes — continue even if task fails
tasks:
  - name: Handling error example
    block:
      - name: run a command
        command: uptime

      - name: run a bad command
        command: blabla
        ignore_errors: yes        # this task fails but playbook continues

      - name: This task WILL run
        debug:
          msg: "I run because the above errors were ignored."

    rescue:                       # rescue does NOT run because errors were ignored
      - name: This will NOT run
        debug:
          msg: "Errors were ignored! ... not going to run."
```

## Import vs Include

**import** is static — processed at parse time (before execution):
```yaml
- name: Reboot the servers
  reboot:
    msg: Server is rebooting ...

- name: Run first playbook
  import_playbook: first-playbook.yml    # static — loaded at parse time
```

**include** is dynamic — processed at execution time:
```yaml
- name: Run first playbook
  include: first-playbook.yml           # dynamic — loaded when reached
```

Key difference: `import` is evaluated before the playbook runs. `include` is evaluated as the playbook is running. Use `import` for most cases. Use `include` when the file to include is determined at runtime (variable-based).

**Note:** You can only import a playbook at the play level — you cannot import a play within another play.
