# Ansible — Intermediate

## Roles Deep Dive

```bash
# Create role structure
ansible-galaxy role init nginx
# Creates: tasks/ handlers/ templates/ files/ vars/ defaults/ meta/

# Role directory structure
roles/nginx/
  defaults/main.yml    # Low priority defaults (easily overridden)
  vars/main.yml        # High priority vars (rarely override)
  tasks/main.yml       # Main task list
  tasks/install.yml    # Separate task file
  handlers/main.yml    # Triggered by notify:
  templates/           # Jinja2 .j2 templates
  files/               # Static files
  meta/main.yml        # Dependencies on other roles
```

```yaml
# roles/nginx/tasks/main.yml
---
- name: Install nginx
  import_tasks: install.yml
  tags: install

- name: Configure nginx
  import_tasks: configure.yml
  tags: configure

- name: Ensure nginx running
  service:
    name: nginx
    state: started
    enabled: true
  tags: always

# roles/nginx/tasks/install.yml
- name: Install nginx package
  package:
    name: "nginx={{ nginx_version }}"
    state: present
  notify: Reload nginx

# roles/nginx/handlers/main.yml
- name: Reload nginx
  service:
    name: nginx
    state: reloaded

- name: Restart nginx
  service:
    name: nginx
    state: restarted

# roles/nginx/defaults/main.yml
nginx_version: "1.24.*"
nginx_worker_processes: "auto"
nginx_worker_connections: 1024
nginx_sites: []

# roles/nginx/meta/main.yml
dependencies:
  - role: common          # Run 'common' role first
  - role: firewall
    vars:
      open_ports: [80, 443]
```

## Dynamic Inventory

```python
#!/usr/bin/env python3
# inventory/aws_ec2.py — Dynamic inventory from AWS

import boto3, json, sys

def get_inventory():
    ec2 = boto3.client('ec2', region_name='ap-south-1')
    instances = ec2.describe_instances(
        Filters=[{'Name': 'instance-state-name', 'Values': ['running']}]
    )['Reservations']

    inventory = {'_meta': {'hostvars': {}}}

    for reservation in instances:
        for inst in reservation['Instances']:
            ip = inst.get('PublicIpAddress') or inst.get('PrivateIpAddress')
            if not ip:
                continue

            # Group by Name tag
            name = next((t['Value'] for t in inst.get('Tags', [])
                         if t['Key'] == 'Name'), inst['InstanceId'])

            # Group by Environment tag
            env = next((t['Value'] for t in inst.get('Tags', [])
                        if t['Key'] == 'Environment'), 'unknown')

            for group in [name, env, f"{env}_servers"]:
                inventory.setdefault(group, {'hosts': [], 'vars': {}})
                inventory[group]['hosts'].append(ip)

            inventory['_meta']['hostvars'][ip] = {
                'ansible_host': ip,
                'instance_id': inst['InstanceId'],
                'instance_type': inst['InstanceType'],
            }

    return inventory

if __name__ == '__main__':
    print(json.dumps(get_inventory(), indent=2))
```

```ini
# ansible.cfg — point to dynamic inventory
[defaults]
inventory = inventory/aws_ec2.py
remote_user = ec2-user
private_key_file = ~/.ssh/prod.pem
host_key_checking = False
```

## Handlers and Notifications

```yaml
# Multiple tasks can notify the same handler
# Handler runs ONCE at end of play, even if notified 10 times

- name: Update nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: Reload nginx           # Queues the handler

- name: Update SSL cert
  copy:
    src: ssl.crt
    dest: /etc/ssl/certs/app.crt
  notify: Reload nginx           # Same handler — still runs once

# Flush handlers immediately (before end of play)
- name: Deploy config
  template: ...
  notify: Restart app

- name: Flush handlers now
  meta: flush_handlers           # Restarts app HERE, not at end

- name: Run smoke test
  uri:
    url: http://localhost/health  # App is running at this point
```

## Error Handling

```yaml
- name: Attempt risky operation
  command: /opt/migrate.sh
  register: migration_result
  ignore_errors: true            # Don't fail play on error

- name: Check migration result
  fail:
    msg: "Migration failed: {{ migration_result.stderr }}"
  when: migration_result.rc != 0 and not ansible_check_mode

# Block / rescue / always (try / catch / finally)
- name: Deploy application
  block:
    - name: Pull new image
      docker_image:
        name: "myapp:{{ version }}"
        source: pull

    - name: Stop old container
      docker_container:
        name: myapp
        state: stopped

    - name: Start new container
      docker_container:
        name: myapp
        image: "myapp:{{ version }}"
        state: started

  rescue:
    - name: Rollback to previous version
      docker_container:
        name: myapp
        image: "myapp:{{ previous_version }}"
        state: started
    - name: Alert on failure
      slack:
        token: "{{ slack_token }}"
        msg: "Deployment failed on {{ inventory_hostname }}, rolled back"

  always:
    - name: Clean up old images
      docker_prune:
        images: true
        images_filters:
          dangling: true
```

## Performance Optimization

```ini
# ansible.cfg — production tuning
[defaults]
forks = 20                    # Parallel hosts (default: 5)
gather_facts = smart          # Cache facts, only re-gather if stale
fact_caching = jsonfile
fact_caching_connection = /tmp/ansible_facts
fact_caching_timeout = 3600   # Facts valid for 1 hour

[ssh_connection]
pipelining = True             # Reduce SSH connections (big speedup)
ssh_args = -o ControlMaster=auto -o ControlPersist=60s -o ServerAliveInterval=30
```

```yaml
# Profile tasks to find bottlenecks
# Set ANSIBLE_CALLBACK_WHITELIST=profile_tasks
# Or in ansible.cfg:
# [defaults]
# callback_whitelist = profile_tasks, timer

# Run only changed hosts with --limit
# ansible-playbook site.yml --limit @/tmp/failed_hosts

# Use free strategy for independent hosts (don't wait for slowest)
- hosts: webservers
  strategy: free              # Each host runs at its own pace
  serial: 3                   # Process 3 hosts at a time (rolling)
  tasks:
    - include_role: { name: nginx }
```
