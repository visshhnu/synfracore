# Azure Entra ID Advanced Topics

## Conditional Access Advanced

```
CONDITIONAL ACCESS POLICY COMPONENTS:
  Assignments (WHO + WHAT + WHERE):
    Users/Groups: target users or exclude break-glass accounts
    Cloud apps: all apps, specific apps, user actions
    Conditions: location, device platform, client app, risk level, sign-in risk

  Access controls (THEN DO):
    Grant: require MFA, compliant device, hybrid joined, approved app
    Session: limited web access, app enforced restrictions, sign-in frequency

NAMED LOCATIONS:
  IP ranges: define trusted corporate IPs
  Countries: block or allow by geography
  Used in: block access from untrusted countries

SIGN-IN RISK LEVELS (Identity Protection):
  High risk:  likely account compromise (atypical travel, malware-linked IP)
  Medium risk: suspicious activity
  Low risk:   minor anomalies
  Require MFA or block based on risk level

DEVICE COMPLIANCE:
  Intune managed: device enrolled in Intune + meets compliance policy
  Hybrid Entra Joined: on-premise AD joined + Entra registered
  Use for: require compliant device for sensitive apps

CA BEST PRACTICES:
  Always exclude break-glass accounts (≥2, different methods)
  Use Report-only mode before enforcing
  Named locations for VPN/office IPs (trusted)
  Require MFA for all admin roles (non-negotiable)
  Enable Continuous Access Evaluation (CAE) for real-time revocation
```

## Privileged Identity Management (PIM)

```
PIM CONCEPTS:
  Eligible assignment: user can activate the role when needed
  Active assignment: role permanently assigned (avoid for highly privileged)
  Activation: request → optionally require MFA, justification, approval
  Time-bound: eligible or active with expiry date

PIM WORKFLOW:
  Admin assigns eligible role → User activates when needed
  → Activation requires: MFA + justification + optional approval
  → Role active for configured hours (1-8 hours typical)
  → Access Review: regular review who has eligible/active assignments

PIM SETTINGS PER ROLE:
  Max activation duration: 1-24 hours
  Require MFA on activation: yes (always for Global Admin, Privileged Role Admin)
  Require justification: yes (audit trail)
  Require approval: for Global Admin and other critical roles
  Send notifications: on activation and assignment

ROLES TO PROTECT WITH PIM:
  Global Administrator | Privileged Role Administrator
  Security Administrator | Exchange Administrator
  SharePoint Administrator | User Administrator
```

## Enterprise Application and App Registrations

```
APP REGISTRATION (identity for your app):
  Client ID: public identifier (safe to expose)
  Client Secret / Certificate: authenticate your app (keep secret)
  Redirect URIs: where Entra sends tokens after auth
  API Permissions: what your app can access
    Delegated: on behalf of signed-in user
    Application: background service (no user), requires admin consent

OAUTH 2.0 FLOWS:
  Authorization Code + PKCE: web/SPA apps (most secure, recommended)
  Client Credentials: service-to-service (no user context)
  Device Code: CLI/IoT apps (user signs in on another device)
  On-behalf-of: middle-tier API calls downstream API on user's behalf

CONSENT:
  User consent: user grants app access to their data
  Admin consent: admin grants for all users in tenant
  Pre-authorize: API owner pre-approves client app (no consent prompt)
```

## Study Resources
- **SC-300 (Identity and Access Administrator)** — Microsoft certification
- **Microsoft Learn Entra ID** (learn.microsoft.com/entra) — free learning paths
- **Entra ID documentation** — Conditional Access, PIM, B2C, External Identities
- **Azure AD Attack and Defense** (GitHub/Cloud-Architekt) — security deep dive
