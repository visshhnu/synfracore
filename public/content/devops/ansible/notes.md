# Ansible Key Notes & Gotchas

## Variable Precedence (22 levels — highest wins)
1. Extra vars (`-e`) — always wins
2. Task vars (set_fact, register)
3. Block vars
4. Role params
5. Include vars
6. Play vars_files
7. Play vars
8. Host facts
9. host_vars files
10. group_vars/all
11. Role defaults — lowest

## Idempotency Rules
- Use `apt`/`yum` NOT `shell: apt install` — modules are idempotent, shell is not
- Use `copy` with content= NOT `shell: echo > file`
- Use `lineinfile` NOT `shell: sed`
- Use `template` NOT `shell: cat > file`

## Performance Tips
- Enable pipelining in `ansible.cfg`: `pipelining = True` (10-30% faster)
- Increase forks: `forks = 20` (default 5)
- Use `gather_facts: false` when you don't need facts
- Use `async` for long-running tasks

## Security Best Practices
- Never store plain text passwords in playbooks or inventory
- Use ansible-vault for all secrets
- Use become only when necessary (avoid become: yes globally)
- Restrict SSH key permissions: `chmod 600 ~/.ssh/id_rsa`
- Use dedicated service accounts, not personal accounts

## Common Gotchas
- `command`/`shell` modules are NOT idempotent — they always run
- Handlers run at end of play, not immediately when notified
- `loop` replaces deprecated `with_items` in Ansible 2.5+
- Variables in quotes need special handling: `"{ variable }"`
- `become: yes` is sudo — need NOPASSWD in sudoers for automation
