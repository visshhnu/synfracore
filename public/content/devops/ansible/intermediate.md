# Ansible — Roles, Vault & Production Patterns

## Roles: Ansible's answer to Terraform modules

A role packages tasks, variables, templates, and files into a reusable, shareable unit with a standard directory structure — the same DRY principle modules give Terraform, applied to Ansible:

```
roles/nginx/
├── tasks/main.yml       # what to do
├── handlers/main.yml    # notify-triggered actions
├── templates/           # Jinja2 templates
├── files/                # static files to copy
├── vars/main.yml         # role-specific variables
└── defaults/main.yml     # default variable values (lowest precedence)
```

```yaml
- hosts: webservers
  roles:
    - nginx
    - { role: app_deploy, app_version: "2.1.0" }
```

**Ansible Galaxy** is the community role registry (`ansible-galaxy install geerlingguy.nginx`) — worth checking before writing a role from scratch for a common tool, since well-maintained community roles handle edge cases a first-pass custom role often misses.

## Testing roles with Molecule

Roles used across a real infrastructure fleet deserve real testing, not "it worked on my dev box." Molecule spins up isolated test instances (via Docker, typically), applies the role, and verifies the result — catching a role that breaks on a slightly different base image or OS version before it reaches production hosts. Skipping this for a role only a handful of people ever touch is a reasonable tradeoff; skipping it for a shared, widely-used role is a real, recurring source of "why did the role behave differently on that one server" incidents.

## Ansible Vault: encrypting secrets in version control

```bash
ansible-vault create secrets.yml       # create a new encrypted file
ansible-vault edit secrets.yml         # edit it (decrypts, opens editor, re-encrypts)
ansible-vault encrypt existing.yml     # encrypt an existing plaintext file
```

```yaml
# playbook usage
- hosts: all
  vars_files:
    - secrets.yml
```

```bash
ansible-playbook site.yml --ask-vault-pass
# or, for automation: --vault-password-file .vault_pass
```

Vault lets secret values live safely in version control alongside the rest of your playbooks, encrypted at rest. **`vault-id` supports multiple, separately-keyed vaults** — a real production pattern is one vault password per environment (dev/staging/prod), so a leaked development vault password doesn't expose production secrets. For genuinely dynamic secrets (rotating database credentials, short-lived cloud tokens), Vault the *tool* (Ansible Vault) is the wrong layer — integrate with HashiCorp Vault the *product* instead, which issues short-lived credentials rather than storing static encrypted ones.

## Handlers, `notify`, and why order matters

A task's `notify` queues a handler to run — but handlers run only *once*, at the *end* of the play, even if multiple tasks notify the same handler. This is deliberate: if five different config-file tasks all notify "restart nginx," nginx restarts once at the end, not five times mid-play. The practical implication: handlers are for end-state reconciliation ("something changed, so restart the service once everything's settled"), not for sequencing mid-playbook actions that need to happen immediately.

## `ansible-pull`: inverting the push model for scale

Standard Ansible pushes playbooks out from a control node over SSH — this doesn't scale indefinitely (one control node, sequentially or in limited parallel, managing thousands of hosts). `ansible-pull` inverts this: each managed host pulls the playbook from a Git repo and runs it against itself, typically on a cron schedule. This is a real, if less common, pattern for very large fleets where a single-control-node push model becomes the bottleneck — worth knowing exists, not something most teams need by default.

## Error handling: `ignore_errors`, `failed_when`, and `rescue`

```yaml
- name: This might fail, but that's OK
  command: /opt/legacy/check.sh
  ignore_errors: true

- name: Custom failure condition
  command: /opt/app/healthcheck
  register: result
  failed_when: "'ERROR' in result.stdout"

- block:
    - name: Risky task
      command: /opt/app/migrate.sh
  rescue:
    - name: Roll back on failure
      command: /opt/app/rollback.sh
```

`ignore_errors` should be rare and deliberate — reaching for it to silence a failing task is usually masking a real problem rather than solving it. `block`/`rescue` (Ansible's try/catch equivalent) is the correct tool when a genuine failure needs a defined recovery action, not just suppression.
