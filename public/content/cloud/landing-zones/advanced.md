# Landing Zones — Advanced

## Terraform Landing Zone (Complete)

```hcl
# modules/landing-zone/main.tf
# Automated landing zone with Terraform

module "organization" {
  source = "./modules/org"
  
  # Create OUs
  organizational_units = {
    "Production" = { parent = "root" }
    "Non-Production" = { parent = "root" }
    "Security" = { parent = "root" }
    "Sandbox" = { parent = "root" }
  }
  
  # SCPs
  service_control_policies = {
    "restrict-regions" = {
      file = "${path.module}/policies/restrict-regions.json"
      targets = ["Production", "Non-Production"]
    }
    "prevent-leaving-org" = {
      file = "${path.module}/policies/prevent-leaving.json"
      targets = ["root"]
    }
  }
}

module "baseline_accounts" {
  source = "./modules/account-baseline"
  
  # Apply to all accounts via StackSets
  cloudtrail_bucket = module.log_archive.bucket_arn
  guardduty_admin = var.security_account_id
  config_recorder = true
  security_hub = true
  
  excluded_accounts = ["management-account-id"]
}

# Account vending machine
resource "aws_servicecatalog_product" "new_account" {
  name  = "New AWS Account"
  owner = "Platform Team"
  type  = "CLOUD_FORMATION_TEMPLATE"
  
  provisioning_artifact_parameters {
    name         = "v1.0"
    template_url = "https://s3.amazonaws.com/templates/account-baseline.yaml"
    type         = "CLOUD_FORMATION_TEMPLATE"
  }
}
```

## Networking in Landing Zones

```bash
# Centralized networking: Transit Gateway + RAM (Resource Access Manager)

# Create Transit Gateway in network account
TGW=$(aws ec2 create-transit-gateway \
  --description "Org Transit Gateway" \
  --options "AutoAcceptSharedAttachments=enable,DefaultRouteTableAssociation=enable" \
  --query 'TransitGateway.TransitGatewayId' --output text)

# Share via RAM with entire org
aws ram create-resource-share \
  --name org-tgw \
  --resource-arns arn:aws:ec2:us-east-1:$NETWORK_ACCT:transit-gateway/$TGW \
  --principals arn:aws:organizations::$MGMT_ACCT:organization/$ORG_ID

# Spoke accounts: attach VPCs to shared TGW
aws ec2 create-transit-gateway-vpc-attachment \
  --transit-gateway-id $TGW \
  --vpc-id $VPC_ID \
  --subnet-ids $SUBNET_A $SUBNET_B

# Centralized egress: all internet traffic through network account firewall
# Route: spoke VPC → TGW → inspection VPC → AWS Network Firewall → NAT GW → internet
```
