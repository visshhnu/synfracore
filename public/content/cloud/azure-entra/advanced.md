# Azure Entra ID — Advanced

## Privileged Identity Management (PIM)

```
PIM: Just-in-time privileged access — no permanent admin roles

How it works:
  1. Assign users as "Eligible" for a role (not permanently active)
  2. When they need to use the role: "Activate" it (request via portal/API)
  3. Activation requires: MFA, justification, approval (optional), max 8hr duration
  4. After duration expires: role automatically deactivated
  5. All activations logged in audit trail

Key PIM features:
  - Access reviews: periodically verify who still needs access
  - Notifications: alerts when role is activated
  - Approval workflows: manager must approve high-privilege activations
  - Time-bound assignments: permanent eligibility but time-limited activation
  
Why PIM matters:
  Reduces attack surface — compromised credentials don't grant permanent admin
  Limits blast radius — attacker only has privilege for max 8 hours
  Creates audit trail — every privilege use is logged with justification
```

## External Identities (B2B/B2C)

```bash
# Invite external user (B2B collaboration)
az ad invitation create \
  --invite-redirect-url "https://myapp.com" \
  --invited-user-email "partner@external.com" \
  --invited-user-display-name "External Partner"

# External user can then access resources via their own identity
# No need to create accounts in your tenant
# Supported providers: Microsoft, Google, Facebook, email OTP

# Configure cross-tenant access settings (who can collaborate)
az rest --method PUT \
  --uri "https://graph.microsoft.com/v1.0/policies/crossTenantAccessPolicy/partners/$PARTNER_TENANT_ID" \
  --body '{"b2bCollaborationInbound":{"usersAndGroups":{"accessType":"allowed","targets":[{"target":"AllUsers","targetType":"user"}]}}}'
```
