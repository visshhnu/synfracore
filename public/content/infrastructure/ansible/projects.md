# Ansible -- Portfolio Projects

---

## Project 1: CIS Server Hardening Playbook

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `ansible-server-hardening`

Apply CIS Level 1 security hardening to Ubuntu 22.04 servers automatically.

```yaml
# site.yml
- name: CIS Level 1 Hardening
  hosts: all
  become: true
  roles:
    - filesystem
    - software  
    - ssh-hardening
    - network
    - logging

# roles/ssh-hardening/tasks/main.yml
- name: Disable root SSH login
  lineinfile:
    path: /etc/ssh/sshd_config
    regexp: "^#?PermitRootLogin"
    line: "PermitRootLogin no"
    validate: /usr/sbin/sshd -t -f %s
  notify: Restart SSH

- name: Set idle timeout (10 minutes)
  blockinfile:
    path: /etc/ssh/sshd_config
    block: |
      ClientAliveInterval 600
      ClientAliveCountMax 0
```

**Steps:** Test VMs, check mode first, molecule tests, idempotency check, GitHub Actions pipeline

---

## Project 2: Zero-Downtime Rolling Application Deployment

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `ansible-app-deploy`

Full deployment with HAProxy removal, health checks, and re-addition for zero-downtime.

```yaml
- name: Rolling update
  hosts: webservers
  serial: 1
  max_fail_percentage: 0

  pre_tasks:
    - name: Remove from load balancer
      haproxy:
        state: disabled
        host: "{{ inventory_hostname }}"
        socket: /var/run/haproxy/admin.sock

  roles:
    - deploy-app

  post_tasks:
    - name: Verify health
      uri:
        url: "http://localhost:{{ app_port }}/health"
        status_code: 200
      retries: 10
      delay: 5

    - name: Re-add to load balancer
      haproxy:
        state: enabled
        host: "{{ inventory_hostname }}"
        socket: /var/run/haproxy/admin.sock
```

**Steps:** Static inventory, Ansible Vault for secrets, rolling update test, rollback mechanism

---

## Project 3: Dynamic AWS Inventory + Compliance Automation

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `ansible-cloud-fleet`

Dynamic EC2 discovery with tag-based targeting and automated compliance remediation.

```yaml
# aws_ec2.yml (dynamic inventory)
plugin: amazon.aws.aws_ec2
regions: [ap-south-1]
filters:
  instance-state-name: running
  tag:ManagedBy: ansible
keyed_groups:
  - key: tags.Environment
  - key: tags.Role
```

**Steps:** IAM role for Ansible, dynamic inventory, compliance check playbook, AWX scheduler

---

## Portfolio Checklist
- [ ] All playbooks idempotent (run twice, zero changes second time)
- [ ] Ansible Vault for all secrets
- [ ] Molecule tests for all roles
- [ ] ansible-lint passes with 0 violations
