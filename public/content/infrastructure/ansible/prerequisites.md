# Ansible — Prerequisites

## What to Know Before Starting Ansible

Ansible automates server configuration over SSH. These foundations make learning it smooth.

## Required

### 1. Linux Command Line — Comfortable Level
Ansible manages Linux servers. You must understand:
```bash
ssh user@server              # Connect to remote servers
sudo command                 # Run as root
systemctl start/stop nginx   # Manage services
apt install / yum install    # Install packages
cat, nano, vim               # Read and edit files
chmod, chown                 # File permissions
```
**If this feels unfamiliar:** Complete the Linux Fundamentals section first (1-2 weeks).

### 2. SSH — Basic Understanding
Ansible connects via SSH. You should know:
- What SSH keys are (public/private key pair)
- How to generate an SSH key: `ssh-keygen`
- How to copy a key to a server: `ssh-copy-id user@server`
- How to SSH without a password

### 3. Basic YAML Syntax
All Ansible playbooks are YAML. You must be able to read and write:
```yaml
# YAML is indentation-sensitive — always use 2 spaces, never tabs
- name: Install nginx         # list item (starts with -)
  apt:                        # module name (indented 2 spaces)
    name: nginx               # module parameter (indented 4 spaces)
    state: present

# Variables
my_variable: "hello"
port_number: 8080
is_enabled: true

# Lists
packages:
  - nginx
  - python3
  - git
```

### 4. Understanding of What You're Automating
Ansible automates server tasks. If you've never manually set up a web server, database, or user account on Linux — do that manually once first. Automation of something you've never done manually is confusing.

**Spend 30 minutes manually:**
- `apt install nginx && systemctl start nginx` (install a web server)
- `useradd -m john && passwd john` (create a user)
- `cp file.txt /etc/myapp/config.txt` (copy a file)

Now Ansible's modules (apt, user, copy) will make perfect sense.

## Nice to Have

### Python Basics
Ansible is written in Python. You don't need to write Python, but understanding variables, conditions (`if`), and loops (`for`) helps when reading Ansible's Jinja2 templates.

### Multiple VMs or Servers
Ansible's power shows when managing 10+ servers simultaneously. Practice is better with at least 2-3 VMs. Use:
- Vagrant (free, local VMs)
- Cloud VMs (AWS/Azure/GCP free tier)
- Docker containers with SSH enabled

## Learning Order

```
Linux basics (if needed) ← 1-2 weeks
        ↓
SSH key setup
        ↓
Ansible Installation
        ↓
Ansible Fundamentals (ad-hoc commands, first playbook)
        ↓
Intermediate (roles, variables, templates)
        ↓
Advanced (dynamic inventory, Vault, AWX)
```

## Time Estimate

With the prerequisites above:
- Fundamentals: 3-5 days
- Intermediate: 1 week
- Job-ready with Ansible: 3-4 weeks
