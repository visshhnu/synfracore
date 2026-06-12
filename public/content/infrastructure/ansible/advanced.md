# Ansible — Advanced

## Custom Modules

```python
#!/usr/bin/python
# library/app_deploy.py — Custom Ansible module

from ansible.module_utils.basic import AnsibleModule
import subprocess, json

DOCUMENTATION = '''
module: app_deploy
short_description: Deploy application version
'''

def main():
    module = AnsibleModule(
        argument_spec=dict(
            version=dict(type='str', required=True),
            service=dict(type='str', required=True),
            health_check_url=dict(type='str', default='http://localhost/health'),
            timeout=dict(type='int', default=60),
        ),
        supports_check_mode=True
    )

    version = module.params['version']
    service = module.params['service']

    # Check current version
    result = subprocess.run(
        ['/opt/app/current-version.sh', service],
        capture_output=True, text=True
    )
    current = result.stdout.strip()

    if current == version:
        module.exit_json(changed=False, msg=f"Already at version {version}")

    if module.check_mode:
        module.exit_json(changed=True, msg=f"Would deploy {version}")

    # Deploy
    deploy = subprocess.run(
        ['/opt/deploy.sh', service, version],
        capture_output=True, text=True
    )

    if deploy.returncode != 0:
        module.fail_json(msg=f"Deploy failed: {deploy.stderr}")

    module.exit_json(
        changed=True,
        msg=f"Deployed {service} from {current} to {version}",
        previous_version=current,
        new_version=version
    )

if __name__ == '__main__':
    main()
```

```yaml
# Use custom module in playbook
- name: Deploy application
  app_deploy:
    version: "{{ app_version }}"
    service: "myapp"
    health_check_url: "http://localhost:8080/health"
    timeout: 120
  register: deploy_result

- debug:
    msg: "Deployed: {{ deploy_result.msg }}"
```

## Ansible and CI/CD Integration

```yaml
# GitHub Actions — run Ansible in CI/CD
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Ansible
        run: pip install ansible boto3

      - name: Setup SSH key
        run: |
          mkdir -p ~/.ssh
          echo "${{ secrets.DEPLOY_KEY }}" > ~/.ssh/id_rsa
          chmod 600 ~/.ssh/id_rsa

      - name: Install requirements
        run: ansible-galaxy install -r requirements.yml

      - name: Run playbook
        run: |
          ansible-playbook site.yml \
            --inventory inventory/prod/ \
            --extra-vars "app_version=${{ github.sha }}" \
            --vault-password-file <(echo "${{ secrets.VAULT_PASS }}")
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Testing with Molecule

```bash
# Install molecule
pip install molecule[docker] ansible-lint

# Initialize molecule for a role
cd roles/nginx
molecule init scenario --driver-name docker

# molecule/default/molecule.yml
platforms:
  - name: ubuntu22
    image: geerlingguy/docker-ubuntu2204-ansible
    command: /lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    privileged: true
  - name: centos9
    image: geerlingguy/docker-centos9-ansible
    command: /lib/systemd/systemd

# molecule/default/verify.yml
- name: Verify
  hosts: all
  tasks:
    - name: Check nginx is running
      service_facts:
    - assert:
        that: "'nginx' in services and services['nginx']['state'] == 'running'"

    - name: Check nginx responds
      uri:
        url: http://localhost
        status_code: 200
```

```bash
molecule test          # Full cycle: create → converge → verify → destroy
molecule converge      # Apply role only
molecule verify        # Run tests only
molecule login         # SSH into test container
```

## AWX / Ansible Automation Platform

```
AWX (open-source) / AAP (Red Hat licensed):
  Web UI for Ansible
  Role-based access control
  Job scheduling and history
  REST API for triggering playbooks
  Credential vault
  Survey forms (parameterize playbook runs)

Key concepts:
  Project:      Git repository with playbooks
  Inventory:    Static or dynamic host list
  Credential:   SSH keys, vault passwords, cloud creds
  Job Template: Playbook + inventory + credentials
  Workflow:     Chain multiple job templates
  Schedule:     Run job templates on a cron schedule

Use case: Give developers ability to deploy their app
  without giving them SSH access to servers
  They click "Deploy to staging" in AWX UI
  AAP runs the playbook with saved credentials
```
