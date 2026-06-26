# Ansible — Enterprise Automation & AWX/AAP



## Ansible in CI/CD Pipelines

```yaml
# Azure DevOps pipeline using Ansible
- task: Ansible@0
  inputs:
    ansibleInterface: agentMachine
    playbookFile: playbooks/deploy.yml
    inventoryFile: inventory/production
    additionalArguments: '--extra-vars "env=production version=$(Build.BuildNumber)"'

# Jenkins pipeline with Ansible
stage('Deploy') {
    steps {
        ansiblePlaybook(
            playbook: 'playbooks/deploy.yml',
            inventory: 'inventory/production',
            credentialsId: 'ansible-vault-password',
            extraVars: [env: 'production']
        )
    }
}
```

## Ansible Vault — Secrets Management

```bash
# Encrypt a file
ansible-vault encrypt secrets.yml

# Encrypt a string (inline in playbook)
ansible-vault encrypt_string 'mysecretpassword' --name 'db_password'

# Use vault in playbook
vars_files:
  - secrets.yml

# Run with vault password
ansible-playbook deploy.yml --vault-password-file .vault_pass
# Or prompt
ansible-playbook deploy.yml --ask-vault-pass
```

## Dynamic Inventory for Azure

```yaml
# azure_rm.yml
plugin: azure.azcollection.azure_rm
include_vm_resource_groups:
  - my-resource-group
auth_source: auto
```
