# Cloud Landing Zones Cheatsheet

## AWS Landing Zone — Key Components
```bash
# AWS Control Tower (managed landing zone)
# Setup via console: aws.amazon.com/controltower

# Key concepts:
# Management account: Control Tower home, no workloads
# Log archive account: centralised CloudTrail, Config logs
# Audit account: security team access, read-only across org

# Account Factory — create new accounts via Service Catalog
aws servicecatalog list-portfolios
aws servicecatalog search-products --filters FullTextSearch=account

# SCPs — apply guardrails at OU level
aws organizations list-policies --filter SERVICE_CONTROL_POLICY
aws organizations describe-policy --policy-id p-xxxx

# Common preventive guardrails (SCPs):
# - Deny root account usage
# - Require S3 bucket encryption
# - Deny disabling CloudTrail
# - Deny leaving AWS Organisations

# Common detective guardrails (Config rules):
# - s3-bucket-public-read-prohibited
# - encrypted-volumes
# - cloudtrail-enabled
# - iam-password-policy

# Example SCP: Deny root
cat > deny-root.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Deny",
    "Action": "*",
    "Resource": "*",
    "Condition": {"StringLike": {"aws:PrincipalArn": "arn:aws:iam::*:root"}}
  }]
}
EOF
aws organizations create-policy --content file://deny-root.json \
  --description "Deny root usage" --name DenyRoot --type SERVICE_CONTROL_POLICY
```

## Azure Landing Zone — Key Components
```bash
# Management Group hierarchy
az account management-group create --name "Platform" --display-name "Platform"
az account management-group create --name "Connectivity" --parent "Platform"
az account management-group create --name "Identity" --parent "Platform"
az account management-group create --name "Management" --parent "Platform"
az account management-group create --name "Landing-Zones" --display-name "Landing Zones"
az account management-group create --name "Corp" --parent "Landing-Zones"
az account management-group create --name "Online" --parent "Landing-Zones"

# Azure Policy at management group scope
az policy assignment create \
  --name "Require-Encryption" \
  --policy "/providers/Microsoft.Authorization/policyDefinitions/xxx" \
  --scope "/providers/Microsoft.Management/managementGroups/Landing-Zones"

# Assign Blueprint or deploy via Bicep/Terraform
# ALZ Bicep: github.com/Azure/ALZ-Bicep
# Terraform: github.com/Azure/terraform-azurerm-caf-enterprise-scale
```

## Key Guardrails Quick Reference
```
AWS PREVENTIVE (SCPs):                    AZURE PREVENTIVE (Policy/RBAC):
  Deny root account usage                   Require resource tags (Deny)
  Deny leaving Organisation                 Allowed locations (Deny)
  Deny disabling CloudTrail                 Require encryption (Deny)
  Deny creating IAM users without MFA       No public IPs (Deny)
  Require MFA for console                   Approved VM SKUs only

AWS DETECTIVE (Config):                   AZURE DETECTIVE (Policy audit):
  cloudtrail-enabled                        Require tag on resource groups
  encrypted-volumes                         Monitor unencrypted SQL
  s3-bucket-public-read-prohibited          Audit MFA for admins
  iam-password-policy                       Monitor open network ports
```
