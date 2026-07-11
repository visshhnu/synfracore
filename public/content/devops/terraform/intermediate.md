# Terraform — Modules, Workspaces & CI/CD

## Modules: reusable, versioned infrastructure packages

A module is a reusable package of Terraform configuration — the same DRY principle as a function in a programming language, applied to infrastructure. Instead of copy-pasting the same VPC/database/cluster configuration across every environment, define it once as a module and call it with different inputs.

```hcl
module "vpc" {
  source  = "./modules/vpc"
  # or: source = "git::https://github.com/org/tf-modules.git//vpc?ref=v2.1.0"
  cidr_block  = "10.0.0.0/16"
  environment = var.environment
}
```

**Pin module versions for anything beyond local development** — an unpinned Git or registry source can silently pull a newer, breaking version of a module on the next `init`, changing your infrastructure without a corresponding config change in your own repo. A tagged, pinned version (`?ref=v2.1.0`) makes module updates an explicit, reviewable decision.

## Workspaces vs. separate state files — a genuinely debated choice

Terraform workspaces let one configuration manage multiple, isolated state files (commonly one per environment) without duplicating `.tf` files. The real tradeoff: workspaces are convenient but easy to misuse — running `apply` in the wrong workspace by mistake (forgetting to `terraform workspace select production` first) is a real, common incident. Many teams instead use **separate state files per environment via distinct backend configurations** (or separate directories entirely) specifically because it makes "which environment am I about to change" unambiguous from the file path alone, rather than an easy-to-forget runtime selection.

## Remote backends and locking, concretely

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"   # provides locking
    encrypt        = true
  }
}
```

The `dynamodb_table` here isn't optional plumbing — without a locking mechanism, two concurrent `apply` runs can both read the same starting state, both make changes, and the second write can silently overwrite the first's changes in state (even though both sets of changes may have actually happened against real infrastructure) — a genuinely dangerous state/reality mismatch that locking exists specifically to prevent.

## Terraform in CI/CD: plan on PR, apply on merge

The standard, safe pattern: `terraform plan` runs automatically on every pull request, posting the plan output as a PR comment so reviewers see the actual infrastructure diff before approving — not just the `.tf` code diff, which doesn't always make the real-world impact obvious. `terraform apply` runs only after merge to the main branch, ideally gated by a manual approval step for production specifically. Tools like Atlantis automate this workflow directly against pull requests; Terraform Cloud/Enterprise provide a managed equivalent with policy enforcement (Sentinel) that can block an apply violating a defined infrastructure policy (e.g., "no public S3 buckets") before it ever runs.

## Drift detection: when reality and state disagree

Drift happens when someone (or something) changes real infrastructure outside of Terraform — a manual console click, an emergency hotfix via the CLI. `terraform plan` against drifted infrastructure shows Terraform's attempt to revert the manual change back to what the config declares, which can be surprising if you don't expect it. Scheduled drift-detection runs (a periodic `terraform plan` in CI, alerting on any unexpected diff) catch this before it compounds — the alternative is discovering drift only when someone's manual change gets silently reverted by the next real `apply`.

## Import: bringing existing, unmanaged infrastructure under Terraform

```bash
terraform import aws_instance.web i-0123456789abcdef0
```

`import` associates an already-existing, real resource with a resource block in your configuration, without recreating it — necessary when infrastructure was created manually (or by an older tool) and needs to come under Terraform management going forward. You still need to write the matching `.tf` resource block yourself first — `import` only populates state, it doesn't generate the configuration for you (though `terraform plan` after an import will show any drift between your written config and the real resource's actual settings, which is exactly what you want to reconcile next).
