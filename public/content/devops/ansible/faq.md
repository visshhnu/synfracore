# Ansible — FAQ

## Do I need to install anything on the servers Ansible manages?

No — this is the core meaning of "agentless." Ansible connects over standard SSH (or WinRM for Windows targets), executes tasks, and disconnects, without requiring any persistent agent process installed and running on the managed node. The only real requirement on the target side is SSH access and Python (for most modules), both of which are already present on most standard server images.

## Why does my task report "changed" every single time I run the playbook, even when nothing seems different?

This usually means the task isn't genuinely idempotent — a raw `shell` or `command` task executes unconditionally every run, with no built-in check of whether the change is actually already applied, unlike a proper Ansible module which checks current state before acting. Prefer a real module over raw shell execution wherever one exists for the intended change; if shell execution is genuinely necessary, add an explicit `changed_when` condition reflecting the actual state.

## Is a static inventory file good enough for production, or do I need dynamic inventory?

For a small, genuinely stable set of hosts, static inventory can work — but for any environment where infrastructure changes over time (new instances added, old ones terminated), a static file requires manual upkeep and will drift out of sync with reality the moment someone forgets to update it. Dynamic inventory querying your cloud provider's API at runtime always reflects actual current infrastructure, which is why this guide recommends it specifically for production use.

## Why can I SSH to a host manually, but Ansible fails to connect to the same host?

Ansible's SSH connection settings (which key, which user, which port) are configured separately from your interactive shell's SSH client and don't automatically inherit your personal `~/.ssh/config` settings unless explicitly matched. Check `ansible_user`, `ansible_ssh_private_key_file`, and any other connection variables set at the inventory or playbook level against what your manual SSH session actually uses — a mismatch there is the most common cause of this specific discrepancy.

## What's the actual purpose of Ansible Vault, versus just keeping secrets in a separate, gitignored file?

A gitignored file works for keeping secrets out of version control entirely, but that means the file itself has to be distributed and kept in sync out-of-band, outside your normal Git workflow — inconvenient for teams and CI. Ansible Vault lets you encrypt sensitive values (or entire files) and commit them safely to version control alongside everything else, decrypting only at execution time with a vault password — keeping secrets in the same workflow as the rest of your configuration, just encrypted.

## My playbook completed successfully, but the change doesn't seem to have taken effect. What should I check?

Two common causes: first, confirm the play actually targeted the hosts you intended — an inventory pattern typo can cause Ansible to run successfully against an unintended set of hosts, with no error signal that anything was wrong. Second, check whether privilege escalation (`become`) genuinely succeeded — a task can complete without erroring while still lacking sufficient privileges to make the intended system-level change, depending on exactly what failed.

## Is Ansible always simpler than agent-based tools like Chef or Puppet?

Operationally simpler in one specific, real way — no agent to install, patch, or maintain on every managed node. But this isn't a universal "simpler in every respect" claim: agent-based tools can provide more sophisticated continuous state enforcement (an agent that keeps checking and self-correcting drift on its own schedule) than Ansible's typically on-demand execution model offers by default. The right tool depends on whether continuous, autonomous enforcement or simpler, on-demand push-based execution better fits your actual operational needs.

## Should Vault-encrypted files use the same password/vault ID for everything, or separate ones per environment?

Separate vault IDs per environment or sensitivity level is a common, deliberate practice — it limits the blast radius if one vault password is ever compromised, and lets different teams/pipelines have access only to the specific secrets they actually need. The tradeoff is more operational complexity in managing multiple vault passwords/IDs correctly, including making sure every system needing decryption access (like CI) has the correct one for each specific file.
