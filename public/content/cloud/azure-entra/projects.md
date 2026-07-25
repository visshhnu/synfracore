# Entra ID — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Keyless Cloud Automation with Managed Identity

**Level:** Beginner | **Time:** 2 days

Deploy a small automation script (e.g., "resize an image dropped into Blob Storage" or "post a Teams/Slack message when a VM stops") running on an Azure resource (a VM or Function App) that authenticates to another Azure service using Managed Identity — with zero stored credentials anywhere in your code or config.

### Steps

1. Provision the compute resource (VM or Function App) and enable a system-assigned Managed Identity on it
2. Grant that identity least-privilege RBAC access to the target resource (e.g., "Storage Blob Data Reader" scoped to one storage account, not the whole subscription)
3. Write the automation code using the Azure SDK's `DefaultAzureCredential`/`ManagedIdentityCredential` — no `az login`, no client secret, no key
4. Verify it works, then deliberately try (and fail) to call a *different* resource you didn't grant access to, to prove the least-privilege scope is actually being enforced
5. Document the role assignment and why that specific scope was chosen, not a broader one

### Skills Demonstrated

- Managed Identity vs. service-principal-with-secret tradeoffs
- Azure RBAC least-privilege scoping
- Keyless application authentication

### GitHub Repo Name

`azure-entra-managed-identity-automation`

---

## Project 2: Conditional Access Policy Set for a Small Tenant

**Level:** Intermediate | **Time:** 3 days

Using a free/trial Entra ID tenant, design and roll out a realistic Conditional Access policy set the way a real organization would: staged, tested, and with a safety net — not switched on all at once for every user.

### Steps

1. Design the policy set on paper first: block legacy authentication protocols; require MFA for all admin directory roles; require MFA for all users signing in from outside a defined trusted location; require a compliant/hybrid-joined device for a sensitive test app
2. Create at least two break-glass emergency-access accounts, excluded from every policy, with strong non-MFA-dependent credentials stored securely outside Entra ID itself
3. Deploy every policy in **report-only mode** first and review the sign-in logs for who *would* have been blocked or challenged before enforcing anything
4. Roll out to a small pilot group, then to all users, only after report-only review shows no unintended lockouts
5. Document the rollout order and why report-only-first matters — this is the part interviewers actually probe on

### Skills Demonstrated

- Conditional Access policy design
- Safe staged rollout practices (report-only → pilot → enforce)
- Break-glass account planning

### GitHub Repo Name

`azure-entra-conditional-access-rollout`

---

## Project 3: Just-in-Time Admin Access with PIM

**Level:** Advanced | **Time:** 5 days

Replace standing administrative access in a test tenant with Privileged Identity Management (PIM) eligible role assignments, so that no one — including you — holds permanent Global Administrator or Owner rights day-to-day.

### Steps

1. Audit current role assignments in the tenant and identify every standing (permanently active) privileged role assignment
2. Convert those to PIM-eligible assignments instead, each requiring an explicit activation step to actually use the role
3. Configure per-role PIM settings: maximum activation duration, mandatory justification, MFA on activation, and approval requirements for the most sensitive roles (Global Administrator, Privileged Role Administrator)
4. Set up a recurring Access Review so eligible/active assignments are periodically re-justified rather than accumulating forever
5. Document the before/after: how many standing privileged assignments existed, how many remain after the migration, and what the activation workflow looks like end-to-end

### Skills Demonstrated

- Privileged Identity Management (PIM) configuration
- Just-in-time access design
- Access governance and review cycles

### GitHub Repo Name

`azure-entra-pim-jit-access`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. A Conditional Access policy set actually tested in report-only mode against real sign-in logs is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
