# Azure Entra ID (Azure Active Directory) Interview Questions

## Core Concepts

**Q: What is Azure Entra ID? How does it differ from on-premise AD?**

Azure Entra ID (formerly Azure Active Directory) is Microsoft's cloud-based identity and access management service. It provides authentication and authorisation for Azure, Microsoft 365, and thousands of SaaS apps.

**Azure Entra ID vs Windows Server Active Directory:**

| | Azure Entra ID | Windows Server AD |
|---|---|---|
| Protocol | OAuth 2.0, OIDC, SAML | Kerberos, NTLM, LDAP |
| Structure | Flat (no OUs, no GPOs) | Hierarchical (OUs, GPOs, domains) |
| Location | Cloud (SaaS) | On-premise (domain controllers) |
| Join type | Azure AD Join, Hybrid Join | Domain Join |
| Use case | Cloud/SaaS apps, mobile | On-premise Windows, legacy apps |

**Hybrid identity**: Sync on-premise AD to Azure Entra ID using Azure AD Connect.

---

**Q: Authentication methods in Azure Entra ID.**

**Password Hash Sync (PHS)**: Hash of hash of user's on-prem password synced to cloud. Simplest. Enables cloud auth even if on-prem is down.

**Pass-through Authentication (PTA)**: Cloud validates credentials by passing to on-prem agent. Password never leaves on-prem. More complex.

**Federation (ADFS)**: On-prem ADFS issues tokens. Most control but highest complexity.

**MFA (Multi-Factor Authentication)**:
- Microsoft Authenticator app (push notification, TOTP)
- FIDO2 hardware keys (phishing-resistant)
- SMS/Voice (less secure, avoid where possible)

**Conditional Access**: Policy-based access control.
```
IF: User = Finance team AND Device = Non-compliant
THEN: Block access (or require MFA, or require compliant device)
```

Conditions: User/group, location, device state, risk score, app.
Controls: Allow, Block, Require MFA, Require compliant device, Require Entra ID join.

---

**Q: Azure Entra ID App Registrations and Service Principals.**

**App Registration**: Defines an application's identity in Entra ID. One per application.
**Service Principal**: The instance of an App Registration in a specific tenant. Multiple tenants = multiple SPs.

```bash
# Create App Registration (service principal for automation)
az ad sp create-for-rbac --name myapp --role Contributor   --scopes /subscriptions/$SUBSCRIPTION_ID/resourceGroups/myRG

# Output: appId (client ID), password (client secret), tenant
# Use for: Terraform, GitHub Actions, CI/CD pipelines accessing Azure

# Managed Identity (preferred over service principal for Azure resources)
az identity create --name myapp-identity --resource-group myrg
# Assign to VM, AKS pod, or Azure Function — auto-rotated credentials
```

**Managed Identity** (always prefer over service principal): No credentials to manage, auto-rotated, only works for Azure services.

---

**Q: RBAC in Azure — how does it work?**

Azure RBAC controls who can do what to which Azure resources.

```
Security principal (User/Group/SP/Managed Identity)
  ↓
Role Assignment
  ↓
Role (built-in or custom) → defines Actions/DataActions/NotActions
  ↓
Scope (Management Group → Subscription → Resource Group → Resource)
```

**Common built-in roles:**
- Owner: Full access + manage access
- Contributor: Full access, no RBAC management
- Reader: View only
- User Access Administrator: Manage RBAC only
- AKS Cluster Admin: K8s cluster admin access
- Key Vault Secrets User: Read secrets from Key Vault

**Custom role:**
```json
{
  "Name": "VM Operator",
  "Actions": ["Microsoft.Compute/virtualMachines/start/action",
               "Microsoft.Compute/virtualMachines/restart/action",
               "Microsoft.Compute/virtualMachines/read"],
  "NotActions": [],
  "AssignableScopes": ["/subscriptions/xxxx"]
}
```

## Revision Notes
```
AZURE ENTRA ID: Cloud IAM. OAuth2/OIDC/SAML (not Kerberos/LDAP like on-prem AD).
HYBRID: Azure AD Connect syncs on-prem AD to cloud.

AUTH METHODS:
PHS: sync password hash (simplest, cloud auth works if on-prem down)
PTA: forward auth to on-prem (password stays on-prem)
Federation/ADFS: most control, most complex

MFA: Authenticator app > FIDO2 > SMS (avoid SMS — phishable)

CONDITIONAL ACCESS: IF (user/location/device/risk) THEN (allow/block/MFA/compliant device)

APP REGISTRATION: app's identity | SERVICE PRINCIPAL: per-tenant instance
MANAGED IDENTITY: preferred over SP — no credentials, auto-rotated, Azure-native only

AZURE RBAC: Principal → Role Assignment → Role (actions) → Scope
Scope hierarchy: MG → Subscription → RG → Resource (inherits downward)
Key roles: Owner > Contributor > Reader | Key Vault Secrets User
```
