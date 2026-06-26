# Ansible Quick Reference

```bash
# Run playbook
ansible-playbook -i inventory playbook.yml
ansible-playbook -i inventory playbook.yml --check    # dry run
ansible-playbook -i inventory playbook.yml --diff     # show changes
ansible-playbook -i inventory playbook.yml --tags deploy
ansible-playbook -i inventory playbook.yml --limit webservers

# Ad-hoc commands
ansible all -m ping
ansible webservers -m shell -a "df -h"
ansible all -m apt -a "name=nginx state=present" --become
ansible all -m copy -a "src=nginx.conf dest=/etc/nginx/nginx.conf" --become

# Inventory
ansible-inventory -i inventory --list
ansible-inventory --graph

# Vault
ansible-vault encrypt vars/secrets.yml
ansible-vault decrypt vars/secrets.yml
ansible-vault view vars/secrets.yml
ansible-vault edit vars/secrets.yml
ansible-vault encrypt_string 'value' --name 'variable_name'

# Roles
ansible-galaxy init my_role
ansible-galaxy install geerlingguy.nginx
ansible-galaxy collection install azure.azcollection

# Debug
ansible-playbook playbook.yml -vvv   # verbose
ansible all -m setup | grep ansible_os   # facts
```

## Common Module Reference

| Module | Use |
|--------|-----|
| `apt`/`yum`/`dnf` | Package management |
| `copy` | Copy files to remote |
| `template` | Jinja2 template to remote |
| `service` | Manage systemd services |
| `user` | Manage users |
| `file` | File/directory/link management |
| `command`/`shell` | Run commands (not idempotent) |
| `stat` | Check file/dir existence |
| `when` | Conditional task execution |
| `with_items`/`loop` | Iterate over list |
| `register` | Capture task output |
| `debug` | Print variables |
| `include_tasks` | Include another task file |
| `roles` | Use role in play |

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
