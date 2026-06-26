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

## Quick Reference — Ansible

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
