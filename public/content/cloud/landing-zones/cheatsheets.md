# Landing Zones — Cheatsheet

```bash
# ── AWS ORGANIZATIONS ─────────────────────────────────────
aws organizations describe-organization
aws organizations list-accounts --output table
aws organizations list-organizational-units-for-parent --parent-id $ROOT_ID
aws organizations list-children --parent-id $OU_ID --child-type ACCOUNT

# Create OU
aws organizations create-organizational-unit --parent-id $ROOT_ID --name Production

# Move account to OU
aws organizations move-account \
  --account-id $ACCOUNT_ID \
  --source-parent-id $CURRENT_OU \
  --destination-parent-id $TARGET_OU

# ── SERVICE CONTROL POLICIES ──────────────────────────────
aws organizations list-policies --filter SERVICE_CONTROL_POLICY --output table
aws organizations describe-policy --policy-id $POLICY_ID
aws organizations create-policy \
  --name "restrict-regions" --type SERVICE_CONTROL_POLICY \
  --content file://restrict-regions.json \
  --description "Restrict to ap-south-1 and us-east-1"
aws organizations attach-policy --policy-id $POLICY_ID --target-id $OU_ID
aws organizations detach-policy --policy-id $POLICY_ID --target-id $OU_ID

# Effective policies for an account (combined OU + account policies)
aws organizations describe-effective-policy \
  --policy-type SERVICE_CONTROL_POLICY \
  --target-id $ACCOUNT_ID

# ── AWS CONTROL TOWER ─────────────────────────────────────
aws controltower list-enabled-controls --target-identifier $OU_ARN
aws controltower enable-control \
  --control-identifier $CONTROL_ARN --target-identifier $OU_ARN
aws controltower disable-control \
  --control-identifier $CONTROL_ARN --target-identifier $OU_ARN

# ── CLOUDFORMATION STACK SETS ─────────────────────────────
# Deploy baseline to all accounts
aws cloudformation create-stack-set \
  --stack-set-name security-baseline \
  --template-body file://baseline.yaml \
  --permission-model SERVICE_MANAGED \
  --auto-deployment Enabled=true,RetainStacksOnAccountRemoval=true

aws cloudformation create-stack-instances \
  --stack-set-name security-baseline \
  --deployment-targets OrganizationalUnitIds=[$OU_ID] \
  --regions ap-south-1 \
  --operation-preferences MaxConcurrentPercentage=25

# ── CORE ACCOUNT STRUCTURE ────────────────────────────────
# Root (Management Account)
# ├── Security OU
# │   ├── Log Archive Account (all CloudTrail/Config logs)
# │   └── Audit/Security Account (GuardDuty admin, Security Hub admin)
# ├── Infrastructure OU
# │   └── Network Account (Transit Gateway, shared VPCs)
# ├── Workloads OU
# │   ├── Production OU → prod accounts per team/service
# │   └── Non-Production OU → dev/staging accounts
# └── Sandbox OU → individual developer experimentation
```
