# Terraform Troubleshooting Guide

## Issue 1: State lock error

**Symptom:** `Error: Error acquiring the state lock` — another apply is running or previous apply crashed.

**Root Cause:** Previous `terraform apply` crashed mid-execution leaving a lock file. Or another pipeline is running simultaneously.

**Debug steps:**
```bash
terraform force-unlock <lock-id>   # get lock ID from error message
# Check if any apply actually running:
aws s3api get-object --bucket my-tf-state --key production.terraform.tfstate /tmp/state.json
cat /tmp/state.json | jq .serial  # compare with local .terraform/terraform.tfstate
```

**Fix:**
```bash
# ONLY after confirming no active apply
terraform force-unlock <lock-id>
# Re-run apply
terraform apply
```

**Prevention:** Use CI/CD with mutex/queue so only one apply runs at a time.

---

## Issue 2: Resource already exists error

**Symptom:** `Error: Resource already exists` when terraform tries to create something.

**Root Cause:** Resource exists in cloud but not tracked in Terraform state.

**Fix:**
```bash
# Import existing resource into state
terraform import aws_instance.web i-1234567890abcdef0
terraform import azurerm_resource_group.main /subscriptions/.../resourceGroups/my-rg

# After import, run plan to verify no diff
terraform plan   # should show 0 changes if import was correct
```

---

## Issue 3: Plan shows unexpected destroy

**Symptom:** `terraform plan` shows resources being destroyed when you only changed a small setting.

**Root Cause:** Changed a resource attribute that forces replacement (e.g., AMI ID, availability zone, key name).

**Debug steps:**
```bash
terraform plan -out=plan.tfplan
terraform show plan.tfplan | grep -A5 "must be replaced"
```

**Fix patterns:**
```hcl
# Use lifecycle to prevent accidental destroy
resource "aws_db_instance" "main" {
  # ...
  lifecycle {
    prevent_destroy = true   # fails if plan would destroy this
  }
}

# Ignore changes that trigger replacement
lifecycle {
  ignore_changes = [ami, user_data]
}
```

---

## Issue 4: Provider authentication errors

**Symptom:** `Error: No valid credential sources found for AWS Provider` or similar.

**Fix:**
```bash
# AWS
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_DEFAULT_REGION="us-east-1"
# OR use profile
export AWS_PROFILE=myprofile

# Azure
az login
export ARM_SUBSCRIPTION_ID="..."
# For CI: use service principal
export ARM_CLIENT_ID="..."
export ARM_CLIENT_SECRET="..."
export ARM_TENANT_ID="..."

# Verify credentials
aws sts get-caller-identity  # should return your account info
az account show
```

---

## Issue 5: Terraform state drift — plan shows unexpected changes

**Symptom:** Plan shows resources being modified even though you didn't change any code.

**Root Cause:** Someone manually changed the cloud resource outside of Terraform (console, CLI, another script).

**Debug steps:**
```bash
# Refresh state against live infrastructure
terraform refresh   # deprecated in 0.15+
terraform apply -refresh-only  # modern equivalent

# Then plan to see drift
terraform plan
```

**Fix:**
```bash
# Option 1: Apply Terraform to bring back to desired state
terraform apply

# Option 2: Update Terraform code to match manual change, then import
# (when manual change is intentional and correct)

# Option 3: Mark resource for recreation
terraform taint aws_instance.web   # deprecated
# Modern:
terraform apply -replace=aws_instance.web
```

**Prevention:**
- Restrict cloud console access — enforce IaC-only changes via IAM/RBAC
- Enable CloudTrail/Activity Logs to detect manual changes
- Run `terraform plan` on a schedule to detect drift (CI cron job)
