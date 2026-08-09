# Ansible — PYQ (Previously Asked / Practice Questions)

**Framing note:** Red Hat's Ansible certifications (Red Hat Certified Specialist in Ansible Automation) are proctored, hands-on, performance-based exams — no public leaked-question archive exists. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Ansible behavior.

---

### 1. (Domain: Architecture) Why is Ansible described as "agentless," and what does this actually mean operationally compared to a tool that requires an agent on every managed node?

**Answer:** Ansible connects to managed nodes over standard SSH (or WinRM for Windows), requiring no persistent agent process to be installed, maintained, or kept running on the target machine — Ansible pushes and executes tasks over an existing, already-trusted connection mechanism. This means no agent software to patch, upgrade, or troubleshoot on every managed node, and no agent-specific network ports to open — the operational surface is just SSH access, which most infrastructure already has.

---

### 2. (Domain: Idempotency) What does "idempotent by design" mean for an Ansible playbook, and why does a task reporting "changed" on every single run indicate a real problem?

**Answer:** Idempotent means running the same playbook repeatedly against the same target produces the same end state without unnecessary repeated changes — a correctly-written task should report "ok" (no change needed) on a second run if nothing has actually changed, and only report "changed" when it genuinely modifies something. A task reporting "changed" on every run despite no underlying difference usually means the task isn't actually checking current state before acting (e.g., a `shell`/`command` task doing raw execution instead of using a proper idempotent module), which defeats the safety and predictability idempotency is meant to provide.

---

### 3. (Domain: Inventory) Why does this guide recommend dynamic inventory with cloud plugins over a static, hardcoded inventory file for production use?

**Answer:** A static inventory file requires manual updates every time infrastructure changes — a new instance is added, an old one is terminated — and drifts out of sync with real infrastructure the moment anyone forgets to update it. Dynamic inventory queries the cloud provider's API directly at runtime, always reflecting the actual current state of infrastructure, removing the manual-maintenance burden and the risk of Ansible operating against a stale, inaccurate view of what hosts actually exist.

---

### 4. (Domain: Troubleshooting) An SSH connection failure occurs when Ansible tries to reach a managed node, even though you can SSH to that host manually without issue. What's a common cause of this specific discrepancy?

**Answer:** Ansible often connects using a different SSH configuration than your interactive shell session — a different key, a different user, or SSH config file settings (like a custom `Host` alias in `~/.ssh/config`) that apply to your manual SSH session but aren't automatically picked up by Ansible unless explicitly configured in the inventory or playbook. Checking `ansible_ssh_private_key_file`, `ansible_user`, and any inventory-level connection variables against what your manual SSH session actually uses is the direct way to find the mismatch.

---

### 5. (Domain: Variables) A playbook fails with a "variable not defined" error. What are two genuinely different causes this could have, beyond simply forgetting to define the variable?

**Answer:** First, a variable precedence issue — Ansible has a defined variable precedence order (role defaults, inventory vars, playbook vars, extra vars, etc.), and a variable might be defined at a precedence level that doesn't actually apply in the current execution context. Second, a scoping issue — a variable defined within one role or task file isn't automatically available in a different role or play unless explicitly passed or registered appropriately. Both produce the identical "not defined" error, but require checking genuinely different things to resolve.

---

### 6. (Domain: Vault) Why does Ansible Vault exist, and what specific problem does it solve that plain YAML variables files don't?

**Answer:** Playbooks and variable files often need to reference sensitive values (passwords, API keys, certificates) — storing these in plaintext YAML, even in a private repository, is a real exposure risk (accidental public repo, compromised credentials, or simply anyone with repo read-access seeing secrets they don't need). Ansible Vault encrypts these values (or entire files) so they can be safely committed to version control, decrypted only at playbook execution time using a vault password or key.

---

### 7. (Domain: Troubleshooting) Vault decryption fails during a playbook run. Name the most common cause, distinct from "the password is simply wrong."

**Answer:** A vault ID or password-file mismatch — when multiple vault-encrypted files use different vault IDs/passwords (a common pattern for separating secrets by environment or sensitivity level), providing the wrong vault password file, or omitting a required `--vault-id` flag for a specific file, produces a decryption failure that looks identical to a simply-wrong password but has a different root cause and fix (matching the correct vault ID/password to the specific file, not just re-entering the password).

---

### 8. (Domain: Troubleshooting) A task appears to run successfully ("ok" or "changed" status, no errors) but the actual change doesn't seem to have taken effect on the target host. What's a common cause?

**Answer:** The task ran successfully against a different target than expected — often due to an inventory pattern matching a broader or different set of hosts than intended, or a `become`/privilege-escalation issue where the task executed successfully but with insufficient privileges to make the intended system-level change, without necessarily erroring (depending on what specifically failed silently). Confirming exactly which hosts a play actually targeted, and that privilege escalation genuinely succeeded, are the first two things to check.

---

### 9. (Domain: Push vs Pull) What's the practical difference between Ansible's push model and a pull-based configuration management approach, and what tradeoff does each represent?

**Answer:** In Ansible's push model, a control node initiates connections to managed nodes and pushes configuration to them on demand — the control node needs network access to every managed node. A pull-based approach has each managed node periodically checking in and pulling its own configuration independently — no persistent inbound connectivity needed to each node from a central control point, but configuration application becomes decoupled from an explicit "run now" trigger, harder to orchestrate as a single coordinated action across many hosts simultaneously.

---

### 10. (Domain: Ansible vs Chef/Puppet) What's the core architectural distinction between Ansible and agent-based tools like Chef or Puppet, and what tradeoff does that distinction represent?

**Answer:** Ansible's agentless, SSH-based push model requires no persistent agent installed on managed nodes, lowering the operational overhead of managing the tooling itself. Chef and Puppet's agent-based, typically pull-based model requires an agent running continuously on every managed node, which adds agent management overhead but enables more sophisticated ongoing state-enforcement (an agent that continuously self-corrects drift) than Ansible's typically on-demand execution model provides by default.
