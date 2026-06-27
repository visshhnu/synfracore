# Ansible Troubleshooting Guide

## Issue 1: SSH connection failures

**Symptom:** `UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh"}`

**Root Cause:** SSH key not accepted, host not in known_hosts, wrong user, or firewall blocking port 22.

**Debug steps:**
```bash
# Test SSH manually
ssh -i ~/.ssh/id_rsa user@target-host -v  # verbose SSH

# Test Ansible connection
ansible myhost -m ping -vvv
ansible myhost -m ping --ask-pass   # use password auth

# Check inventory
ansible-inventory -i inventory --list
```

**Fix patterns:**
```ini
# inventory/hosts.ini
[webservers]
192.168.1.10 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/key.pem
192.168.1.11 ansible_user=ec2-user ansible_port=2222  # non-standard port
```

```bash
# Add to known_hosts automatically
ansible.cfg: [defaults] host_key_checking = False  # for testing only
```

---

## Issue 2: Task says 'changed' every run (not idempotent)

**Symptom:** Same task shows `changed=1` on every playbook run even if nothing actually changed.

**Root Cause:** Using `command`/`shell` modules which are never idempotent, or module not checking state properly.

**Debug steps:**
```bash
ansible-playbook playbook.yml --check  # dry-run
ansible-playbook playbook.yml --diff   # show what changed
```

**Fix patterns:**
```yaml
# WRONG: shell is not idempotent
- name: Create directory
  shell: mkdir -p /opt/myapp

# RIGHT: file module is idempotent
- name: Create directory
  file:
    path: /opt/myapp
    state: directory
    mode: '0755'

# For command module: use creates/removes to make idempotent
- name: Extract archive
  command: tar xzf /tmp/app.tar.gz -C /opt/
  args:
    creates: /opt/app/  # only runs if this path doesn't exist
```

---

## Issue 3: Variable not defined error

**Symptom:** `AnsibleUndefinedVariable: 'variable_name' is undefined`

**Root Cause:** Variable not set in inventory, group_vars, host_vars, or passed via -e.

**Debug steps:**
```bash
# Check what variables are available
ansible hostname -m debug -a "var=hostvars[inventory_hostname]"

# Show all variables for a host
ansible-inventory -i inventory --host hostname --vars

# Run with verbose
ansible-playbook playbook.yml -vvv
```

**Fix patterns:**
```yaml
# Set defaults for optional variables
- name: Use variable with default
  debug:
    msg: "{{ my_var | default('default_value') }}"

# Conditional on variable existence
- name: Only run if variable set
  command: echo {{ my_var }}
  when: my_var is defined
```

---

## Issue 4: Vault decryption fails

**Symptom:** `ERROR! Decryption failed (no vault secrets were found that could decrypt)`

**Root Cause:** Wrong vault password, missing vault password file, or vault ID mismatch.

**Debug steps:**
```bash
ansible-vault view secrets.yml --ask-vault-pass
ansible-vault decrypt secrets.yml --output=/tmp/check.yml
```

**Fix patterns:**
```bash
# Method 1: password file
echo "my_vault_password" > .vault_pass
chmod 600 .vault_pass
ansible-playbook playbook.yml --vault-password-file .vault_pass

# Method 2: environment variable
export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass

# Method 3: vault ID
ansible-vault encrypt secrets.yml --vault-id prod@.vault_pass
ansible-playbook playbook.yml --vault-id prod@.vault_pass
```

---

## Issue 5: Task runs but changes are not applied

**Symptom:** Playbook completes successfully but system state didn't change as expected.

**Root Cause:** `become: yes` not set, check mode enabled, handler not notified, or wrong target.

**Debug steps:**
```bash
# Verify become
ansible hostname -m command -a "whoami" --become  # should return root

# Check if in check mode
ansible-playbook playbook.yml --check   # dry run only

# Verify handler triggers
ansible-playbook playbook.yml -v  # shows handler notifications
```

**Fix patterns:**
```yaml
# Ensure become for privileged operations
- name: Install nginx
  apt:
    name: nginx
    state: present
  become: yes          # sudo

# Force handler execution immediately
- name: Update nginx config
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: restart nginx

- name: Force handlers
  meta: flush_handlers  # runs handlers immediately
```

---

## Prevention Tips
- Always test with `--check --diff` before running in production
- Use `--limit hostname` to target single host during testing
- Enable `log_path = /var/log/ansible.log` in ansible.cfg for auditing
- Use `serial: 1` for rolling updates to catch issues before full deployment
- Add `any_errors_fatal: true` for critical playbooks that must not partially succeed
