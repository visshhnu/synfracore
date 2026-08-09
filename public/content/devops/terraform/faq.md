# Terraform — FAQ

## Is Terraform's state file strictly necessary, or is it just an implementation detail?

It's genuinely necessary, not incidental — the state file is how Terraform knows what infrastructure it's already created and tracks the mapping between your configuration and real-world resources. Without it, Terraform would have no way to compute an accurate diff between desired and actual state on subsequent runs, and every `apply` would risk either recreating existing resources or losing track of what it's responsible for managing.

## Why is local state considered risky for a team, even a small one?

Local state means each person has their own separate copy, with no locking mechanism preventing two people from running `terraform apply` around the same time — this can easily cause conflicting changes or corrupted state, and there's no single shared source of truth about what infrastructure actually exists according to Terraform. Remote state (S3, Azure Blob, or similar) solves both problems, which is why this guide treats it as mandatory for any team usage, not just larger organizations.

## Why did `terraform plan` show a destroy-and-recreate for a resource when I only changed one small attribute?

Some resource attributes require full replacement rather than supporting an in-place update — this is defined per-attribute in the provider's resource schema, not something Terraform decides arbitrarily. Check the provider's documentation for that specific attribute before assuming a small configuration change is safe; `terraform plan`'s output will explicitly show the replacement action, which is worth reading carefully rather than skimming for just the value diff.

## Is it safe to run `terraform force-unlock` whenever I hit a state lock error?

Not automatically — a lock error looks identical whether it's from a genuinely stuck/orphaned lock (safe to force-unlock) or a legitimately still-running operation elsewhere (force-unlocking this can cause real state corruption from concurrent modification). Always verify no other operation is actually still in progress — checking CI pipeline status, asking teammates — before force-unlocking, rather than treating it as a routine first response to any lock error.

## Why does Terraform show unexpected changes in `plan` even though nobody touched the configuration file?

This is state drift — actual infrastructure was modified outside of Terraform (a manual console change, another tool, a direct API call), so Terraform's recorded state no longer matches reality, and the plan is showing what it would take to reconcile real infrastructure back to match the configuration. Investigate why the drift happened before applying — sometimes the manual change should be preserved by updating the Terraform configuration instead of reverted.

## Should secrets like database passwords ever go directly into a `.tf` file?

No — even in a private repository, hardcoded secrets in configuration risk also being persisted into the state file (which Terraform often stores in plaintext), creating a second exposure surface beyond the configuration file itself. Use environment variables or a proper secrets manager (Vault integration is common) to inject secrets at runtime instead.

## What's the practical difference between `terraform plan` and `terraform apply` that matters day to day?

`terraform plan` is a dry run — it computes and shows what would change, without making any actual changes to real infrastructure. `terraform apply` executes those changes for real. Getting into the habit of always reviewing a `plan` before running `apply` (rather than applying directly) is what catches unintended changes — like an unexpected forced replacement — before they actually happen, not after.

## Is Terraform always the right choice over a cloud-native tool like CloudFormation?

Not universally — Terraform's real advantage is multi-cloud/provider-agnostic infrastructure management through one consistent tool and language; a team fully committed to a single cloud with no multi-cloud need can reasonably choose a cloud-native tool and avoid Terraform's added state-management overhead. The right choice depends on whether genuine multi-cloud or provider-portability requirements exist, not a blanket rule that one tool is always superior.
