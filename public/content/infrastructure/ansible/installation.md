# Ansible — Installation Guide

## Prerequisites

Ansible runs on a **control node** (your laptop or a jump server) and connects to **managed nodes** (servers you want to configure) via SSH. **No agent needed on managed nodes.**

Control node requirements: Linux/macOS with Python 3.8+. Windows can use WSL2.

## Install Ansible

### macOS
```bash
brew install ansible
ansible --version
# ansible [core 2.17.x]
```

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
ansible --version
```

### Any OS via pip (always gets latest)
```bash
pip3 install ansible
# or with virtual environment (recommended):
python3 -m venv ansible-venv
source ansible-venv/bin/activate
pip install ansible
ansible --version
```

## Set Up SSH Access to Managed Nodes

Ansible connects via SSH. You need passwordless SSH from control → managed node.

```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "ansible-control"

# Copy your public key to the managed node
ssh-copy-id user@192.168.1.100

# Test SSH works without password
ssh user@192.168.1.100 "echo 'SSH works!'"
```

## Create Your First Inventory

```bash
mkdir ~/ansible-start && cd ~/ansible-start

# Create inventory file
cat > inventory.ini << 'EOF'
[webservers]
192.168.1.100 ansible_user=ubuntu
192.168.1.101 ansible_user=ubuntu

[databases]
192.168.1.200 ansible_user=ubuntu ansible_port=2222

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

# Test connectivity (ping all hosts)
ansible all -i inventory.ini -m ping
```

Expected output:
```
192.168.1.100 | SUCCESS => {"changed": false, "ping": "pong"}
```

## Your First Playbook

```bash
cat > first-playbook.yml << 'EOF'
---
- name: My first playbook
  hosts: webservers
  become: true    # Run as sudo

  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Start nginx service
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Create a test page
      copy:
        content: "<h1>Ansible deployed this!</h1>"
        dest: /var/www/html/index.html
EOF

# Dry run (check mode)
ansible-playbook -i inventory.ini first-playbook.yml --check

# Run it
ansible-playbook -i inventory.ini first-playbook.yml
```

## Practice Without Real Servers

### Use Docker containers as managed nodes
```bash
# Start 3 Ubuntu containers
docker run -d --name node1 -p 2221:22 rastasheep/ubuntu-sshd:18.04
docker run -d --name node2 -p 2222:22 rastasheep/ubuntu-sshd:18.04

# Add to inventory
cat > inventory-docker.ini << 'EOF'
[all]
node1 ansible_host=localhost ansible_port=2221 ansible_user=root ansible_password=root
node2 ansible_host=localhost ansible_port=2222 ansible_user=root ansible_password=root
EOF

ansible all -i inventory-docker.ini -m ping
```

## Useful Configuration

```bash
# Create ansible.cfg in your project directory
cat > ansible.cfg << 'EOF'
[defaults]
inventory = inventory.ini
remote_user = ubuntu
host_key_checking = False    # Disable SSH host key prompt (dev only)
stdout_callback = yaml        # Nicer output format

[ssh_connection]
pipelining = True             # Faster execution
EOF

# Now you can run without specifying -i inventory.ini
ansible all -m ping
```

## Next Steps

Ansible is installed and connecting to your nodes. Go to **Fundamentals** to learn modules, variables, and your first multi-task playbooks.
