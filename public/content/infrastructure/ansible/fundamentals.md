# Ansible — Fundamentals

## What is Ansible?

Ansible is an open-source configuration management, software provisioning, and application deployment tool that makes automating your infrastructure operations very simple.

**Key advantage:** Ansible is agentless — it does not need an agent to run on managed nodes unlike other tools like Puppet. It connects via SSH and uses Python. This makes it very lightweight and easy to set up.

The word "Ansible" refers to a hypothetical device in science fiction that enables communication across great distances — faster-than-light communication. That is where Ansible got its name.

## Lab Setup (from the book)

The standard setup used throughout:
- **Control node** — RHEL 8 or Ubuntu — runs Ansible, manages other hosts
- **Managed nodes** — CentOS 8 (node1, node2, node3) + Ubuntu 18.04 (node4)

No Ansible agent is needed on managed nodes — just SSH and Python.

## Install Ansible

```bash
# RHEL / CentOS
sudo dnf install ansible -y

# Ubuntu / Debian
sudo apt update
sudo apt install ansible -y

# pip (any OS — always gets latest)
pip3 install ansible

# Verify
ansible --version
# ansible [core 2.17.x]
```

## SSH Key Setup (Required)

Ansible connects via SSH. Set up passwordless SSH from control node to all managed nodes:

```bash
# 1. Generate SSH key on control node
[elliot@control ~]$ ssh-keygen
# Generating public/private rsa key pair.
# Enter file: /home/elliot/.ssh/id_rsa  (press Enter)
# Enter passphrase: (press Enter for no passphrase)
# Key fingerprint: SHA256:Xf5bKx0kkBCsCQ/7rc6Kv6CxCRTH2XJajbNvpzel+Ik

# 2. Copy public key to all managed nodes
[elliot@control ~]$ ssh-copy-id node1
[elliot@control ~]$ ssh-copy-id node2
[elliot@control ~]$ ssh-copy-id node3
[elliot@control ~]$ ssh-copy-id node4

# 3. If you set a passphrase, use ssh-agent to avoid re-entering it
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
# Enter passphrase for /home/elliot/.ssh/id_rsa:
# Identity added: /home/elliot/.ssh/id_rsa

# 4. Verify passwordless SSH works
ssh node1 "hostname"  # should print node1's hostname without password prompt
```

## Inventory File

The inventory lists all hosts Ansible manages:

```ini
# /etc/ansible/hosts  (default)
# OR create your own: inventory.ini

[webservers]
node1 ansible_host=192.168.1.10
node2 ansible_host=192.168.1.11

[databases]
node3 ansible_host=192.168.1.12

[ubuntu]
node4 ansible_host=192.168.1.13

# Group of groups
[all_servers:children]
webservers
databases
ubuntu

# Variables for all hosts in a group
[webservers:vars]
ansible_user=elliot
ansible_python_interpreter=/usr/bin/python3

# Single host with custom port
node5 ansible_host=192.168.1.14 ansible_port=2222 ansible_user=admin
```

## ansible.cfg — Configuration

```ini
# ansible.cfg (in project directory — takes priority over /etc/ansible/ansible.cfg)
[defaults]
inventory     = inventory.ini
remote_user   = elliot
host_key_checking = False       # disable SSH fingerprint check (dev only)
stdout_callback = yaml          # nicer output format

[ssh_connection]
pipelining = True               # faster execution — reuses SSH connection
```

## Testing Connectivity — First Command

```bash
# Ping all hosts — tests SSH connectivity and Python on managed nodes
[elliot@control plays]$ ansible all -m ping

node4 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
node3 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
node1 | SUCCESS => { "changed": false, "ping": "pong" }
node2 | SUCCESS => { "changed": false, "ping": "pong" }
```

## Ad-Hoc Commands

Ad-hoc commands are for quick tasks you don't want to write a playbook for.
Format: `ansible <hosts> -m <module> -a "<arguments>"`

```bash
# Check uptime on all servers
ansible all -m command -a "uptime"

# Run as sudo (become root)
ansible all -m command -a "cat /etc/shadow" --become

# Install a package
ansible webservers -m yum -a "name=httpd state=present" --become

# Start a service
ansible webservers -m service -a "name=httpd state=started enabled=yes" --become

# Copy a file
ansible all -m copy -a "src=/etc/hosts dest=/tmp/hosts"

# Create a directory
ansible all -m file -a "path=/tmp/testdir state=directory mode=0755"

# Get facts from a host
ansible node1 -m setup

# Get specific fact
ansible node1 -m setup -a "filter=ansible_distribution"

# Run shell command (use shell module for pipes, redirects)
ansible all -m shell -a "cat /etc/os-release | grep PRETTY"

# Check free disk space
ansible all -m command -a "df -h"

# There are 3387+ Ansible modules — use ansible-doc to read them:
ansible-doc yum
ansible-doc copy
ansible-doc file
```

## Your First Playbook

```bash
# Create first-playbook.yml
[elliot@control plays]$ cat first-playbook.yml
---
- name: first play
  hosts: all
  tasks:
    - name: create a new file
      file:
        path: /tmp/foo.conf
        mode: 0664
        owner: elliot
        state: touch
```

```bash
# Run it
[elliot@control plays]$ ansible-playbook first-playbook.yml

PLAY [first play] ************

TASK [Gathering Facts] *****************
ok: [node4]
ok: [node3]
ok: [node1]
ok: [node2]

TASK [create a new file] ***************
changed: [node4]
changed: [node3]
changed: [node1]
changed: [node2]

PLAY RECAP ***************************
node1: ok=2  changed=1  unreachable=0  failed=0  skipped=0
node2: ok=2  changed=1  unreachable=0  failed=0  skipped=0
node3: ok=2  changed=1  unreachable=0  failed=0  skipped=0
node4: ok=2  changed=1  unreachable=0  failed=0  skipped=0
```

**Reading the output:**
- `ok` — task ran, nothing changed (already in desired state)
- `changed` — task ran and made a change
- `failed` — task failed
- `skipped` — task skipped (when condition not met)
- `unreachable` — couldn't connect to host

## Playbook Structure

```yaml
---                              # YAML document start (optional but good practice)
- name: Descriptive play name    # what this play does
  hosts: webservers              # which hosts to target
  become: true                   # run as sudo
  vars:                          # variables for this play
    http_port: 80
    app_user: deploy

  tasks:                         # list of tasks to execute in order
    - name: Install nginx
      yum:
        name: nginx
        state: present           # present=install, absent=remove, latest=upgrade

    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: true            # start on boot

    - name: Create config
      template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf
      notify: Restart nginx      # trigger handler if file changed

  handlers:                      # run when notified, only once at end
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
```

**YAML tip:** YAML is indentation-sensitive. Two-space indentation is recommended. Add this to `~/.vimrc` for automatic YAML formatting:
```
autocmd FileType yaml setlocal ai ts=2 sw=2 et
```

## Core Modules Reference

```yaml
# File management
- file:
    path: /tmp/myfile
    state: touch        # touch, absent, directory, link
    mode: '0644'
    owner: root

- copy:
    src: local_file.conf
    dest: /etc/myapp/config.conf
    backup: yes         # keep backup of old file

- template:             # like copy but processes Jinja2 variables
    src: config.j2
    dest: /etc/myapp/config.conf

# Package management
- yum:                  # RHEL/CentOS
    name: httpd
    state: present      # present, absent, latest

- apt:                  # Debian/Ubuntu
    name: nginx
    state: present
    update_cache: yes

- package:              # distro-agnostic (auto-detects yum/apt)
    name: vim
    state: present

# Service management
- service:
    name: nginx
    state: started      # started, stopped, restarted, reloaded
    enabled: yes        # start on boot

# User management
- user:
    name: deploy
    uid: 1050
    shell: /bin/bash
    groups: sudo
    append: yes
    create_home: yes

# Command execution
- command: uptime       # simple commands (no shell features)
- shell: cat /etc/hosts | grep node  # shell features (pipes, redirects)
```

## Next Steps

Go to **Intermediate** to learn Variables, Facts, Registers, Loops, Conditionals, Jinja2 Templates, and Ansible Vault.
