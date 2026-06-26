# Ansible — Core Concepts & Playbook Writing

# Ansible Automation — Complete Study Guide
**Wipro Berribot Interview Prep | B. Vishnu**
> Level: Concepts to Expert Framing | Focus: Ansible + AAP for DevOps Lead role

---

## Why Ansible for This Role

The JD requires **Ansible Automation Platform (AAP)** — formerly Ansible Tower. This is enterprise Ansible with RBAC, GUI, scheduling, and audit trails. The questions you were asked (Tower migration, RBAC in AAP) confirm the interviewer wants AAP depth, not just basic playbook knowledge.

Your key advantage: **Ansible is on your resume** and you have context from HPE (Linux server config) and PACE (hybrid cloud). Frame every answer around real experience.

---

## Topic 1 — What is Ansible and How It Works

### Key Concept
Ansible is an **agentless** IT automation tool. It connects to servers over SSH and runs tasks defined in YAML files called **playbooks**. No agent needs to be installed on target servers — this is its biggest advantage over Chef and Puppet.

### Architecture
```
Control Node (your laptop / Jenkins agent)
        |
        | SSH (port 22)
        |
   ┌────▼─────────────────────────┐
   │  Target Servers              │
   │  web-01  web-02  db-01       │
   │  (only needs Python + SSH)   │
   └──────────────────────────────┘
```

### Core File Types

| File | Purpose |
|---|---|
| `inventory` | List of servers to manage, grouped by role |
| `playbook.yml` | YAML file defining tasks to run on which servers |
| `role/` | Reusable collection of tasks, vars, handlers, templates |
| `vars/` | Variable files — environment-specific config values |
| `templates/*.j2` | Jinja2 template files — config with variable substitution |
| `handlers/` | Tasks triggered by `notify` — run once at end of play |
| `ansible.cfg` | Ansible configuration — default inventory, SSH settings |

### Interview Tip
> "Think of Ansible as the server-configuration counterpart to Terraform. Terraform creates the server — Ansible configures what's inside it. In our HPE pipeline: Terraform provisioned the AKS cluster, Ansible configured the Linux nodes and deployed application config."

### Berribot Questions
**Q: What is Ansible and how is it different from Chef and Puppet?**
> A: Ansible is agentless — it connects over SSH and requires only Python on the target server. Chef and Puppet require an agent daemon installed and running on every managed server. This makes Ansible simpler to set up and maintain — no agent upgrades, no agent authentication issues. Ansible playbooks are YAML which is readable by non-developers. Chef uses Ruby DSL (more complex). Ansible's trade-off: it is push-based (control node pushes), while Puppet is pull-based (agents pull config periodically).

**Q: Explain Ansible's push vs pull model.**
> A: Ansible is push-based — the control node connects to targets and pushes tasks when you run `ansible-playbook`. The targets don't initiate anything. Chef/Puppet are pull-based — agents on targets periodically check the server for config updates. Push is simpler for on-demand deployments; pull is better for continuous compliance enforcement. You can simulate pull with Ansible Tower scheduled jobs.

---

## Topic 2 — Inventory

### Key Concept
The inventory file tells Ansible **which servers to manage** and how to group them. Groups let you target subsets — run tasks on all webservers, or just the database, or just dev servers.

```ini
# inventory.ini — static inventory

[webservers]
web-01  ansible_host=10.0.0.1
web-02  ansible_host=10.0.0.2

[databases]
db-01   ansible_host=10.0.0.10  ansible_port=2222

[telecom:children]
webservers
databases

[all:vars]
ansible_user=ec2-user
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_python_interpreter=/usr/bin/python3

[webservers:vars]
http_port=8080
max_connections=100
```

### YAML Inventory (modern format)
```yaml
# inventory.yaml
all:
  children:
    webservers:
      hosts:
        web-01:
          ansible_host: 10.0.0.1
          http_port: 8080
        web-02:
          ansible_host: 10.0.0.2
    databases:
      hosts:
        db-01:
          ansible_host: 10.0.0.10
```

### Dynamic Inventory
```yaml
# aws_ec2.yaml — dynamic inventory from AWS
plugin: amazon.aws.aws_ec2
regions:
  - us-east-1
filters:
  instance-state-name: running
  tag:Environment: production
keyed_groups:
  - key: tags.Role
    prefix: role
```

```bash
# Use dynamic inventory
ansible-inventory --list -i aws_ec2.yaml
ansible-playbook deploy.yml -i aws_ec2.yaml
```

### Berribot Questions
**Q: What is dynamic inventory in Ansible and when do you use it?**
> A: Dynamic inventory queries a cloud provider (AWS, Azure, GCP) API at runtime to get the current list of servers — instead of a static file you maintain manually. In AWS it uses the `aws_ec2` plugin to pull all running EC2 instances with their tags. In Azure it uses `azure_rm`. You use dynamic inventory when infrastructure is ephemeral — Auto Scaling Groups add/remove instances automatically. A static file would be out of date within minutes. At HPE with AKS, we used dynamic inventory for the Linux management nodes that were provisioned by Terraform.

**Q: What is the `[all:vars]` section in an inventory file?**
> A: It defines variables that apply to ALL hosts in the inventory — like `ansible_user` (SSH username) and `ansible_ssh_private_key_file` (path to SSH key). These are connection variables Ansible uses to SSH into every server. You can also have `[webservers:vars]` to set variables only for the webservers group.

---

## Topic 3 — Playbooks

### Key Concept
A playbook is a YAML file defining **what to do, where to do it, and in what order**. Every task calls an Ansible **module**. The structure: `play → tasks → task → module`.

### Complete Playbook Structure
```yaml
---
# deploy-telecom.yml
- name: Deploy Telecom SRO Application          # play name
  hosts: webservers                              # target group from inventory
  become: yes                                    # run as sudo
  gather_facts: yes                              # collect server info (OS, IP etc.)

  vars:
    app_name: telecom-sro
    app_version: "2.1.0"
    app_port: 8080
    deploy_user: appuser

  vars_files:
    - vars/{{ env }}.yml                         # load env-specific vars file

  pre_tasks:
    - name: Verify disk space before deploy
      ansible.builtin.shell: df -h /opt
      register: disk_check

    - name: Fail if disk space low
      ansible.builtin.fail:
        msg: "Insufficient disk space"
      when: "'100%' in disk_check.stdout"

  tasks:
    - name: Ensure app directory exists
      ansible.builtin.file:
        path: /opt/{{ app_name }}
        state: directory
        owner: "{{ deploy_user }}"
        mode: '0755'

    - name: Install Java 11
      ansible.builtin.yum:
        name: java-11-openjdk
        state: present

    - name: Copy application jar
      ansible.builtin.copy:
        src: "dist/{{ app_name }}-{{ app_version }}.jar"
        dest: "/opt/{{ app_name }}/app.jar"
        owner: "{{ deploy_user }}"
        mode: '0644'
      notify: Restart application                # triggers handler

    - name: Deploy application config
      ansible.builtin.template:
        src: templates/app.conf.j2
        dest: /opt/{{ app_name }}/app.conf
        owner: "{{ deploy_user }}"
      notify: Restart application

    - name: Ensure application service is running
      ansible.builtin.service:
        name: "{{ app_name }}"
        state: started
        enabled: yes

    - name: Wait for application to be ready
      ansible.builtin.uri:
        url: "http://localhost:{{ app_port }}/health"
        status_code: 200
      retries: 10
      delay: 5
      register: health_check
      until: health_check.status == 200

  post_tasks:
    - name: Log deployment
      ansible.builtin.lineinfile:
        path: /var/log/deployments.log
        line: "{{ app_name }} v{{ app_version }} deployed at {{ ansible_date_time.iso8601 }}"

  handlers:
    - name: Rest
