# Azure Entra ID — Intermediate

## Service Principals and App Registrations

```bash
# Create app registration (for applications accessing Azure APIs)
az ad app create --display-name "my-app" --sign-in-audience AzureADMyOrg

# Create service principal from app registration
az ad sp create --id $APP_ID

# Create client secret
az ad app credential reset --id $APP_ID --append
# Save the returned password — shown only once!

# Assign role to service principal
az role assignment create \
  --assignee $SP_OBJECT_ID \
  --role "Contributor" \
  --scope "/subscriptions/$SUB_ID/resourceGroups/prod-rg"

# Test: login as service principal
az login --service-principal -u $APP_ID -p $PASSWORD --tenant $TENANT_ID
```

## Conditional Access Policies

```
Conditional Access: the if-then engine of Entra ID
If: user accesses app X from outside corporate network
Then: require MFA

Key conditions:
  Users/groups: who the policy applies to
  Cloud apps: which applications (all or specific)
  Conditions: location (named locations), device state, risk level
  Sign-in risk: if Entra ID detects anomalous behavior
  
Controls (what to enforce):
  Grant: Require MFA, require compliant device, block access
  Session: sign-in frequency, persistent browser session
  
Best practice:
  1. Create in report-only mode first (see impact without enforcing)
  2. Test with a small pilot group
  3. Enable for all users once validated
  4. Always exclude a break-glass account from all policies
```

## Entra ID Groups and Dynamic Membership

```bash
# Create security group with dynamic membership
az ad group create \
  --display-name "All Developers" \
  --mail-nickname "all-developers" \
  --description "Dynamic group: all users with Developer job title"

# Set dynamic membership rule
az rest --method PATCH \
  --uri "https://graph.microsoft.com/v1.0/groups/$GROUP_ID" \
  --body '{"membershipRule":"(user.jobTitle -eq \"Developer\")","membershipRuleProcessingState":"On","groupTypes":["DynamicMembership"]}'

# Common dynamic rules:
# All from a department: user.department -eq "Engineering"
# All with specific license: user.assignedPlans -any (assignedPlan.servicePlanId -eq "guid")
# All guests: user.userType -eq "Guest"
```
