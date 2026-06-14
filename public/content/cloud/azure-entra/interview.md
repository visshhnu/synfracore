# Azure Entra ID — Interview Questions

**What is the difference between Azure Entra ID and on-premises Active Directory?**
On-premises AD: traditional directory service for Windows environments, uses LDAP/Kerberos protocols, manages computers/users on-prem network, group policies for device management. Entra ID (formerly Azure AD): cloud identity platform, uses OAuth2/OIDC/SAML protocols, manages access to cloud apps and Azure resources, no Group Policy (uses Intune/Endpoint Manager instead). Entra Connect can sync identities between both. Hybrid environments use both together.

**Explain the difference between authentication and authorization in Entra ID.**
Authentication (AuthN): verifying who you are — Entra ID handles this via passwords, MFA, biometrics, certificate. Authorization (AuthZ): what you're allowed to do — handled by RBAC (Azure role assignments), app permissions in OAuth scopes, Conditional Access policies. Entra ID issues tokens after authentication; those tokens are then presented to resources (Azure, apps) which check authorization.

**What is a managed identity and when would you use it?**
A managed identity is a service account in Entra ID automatically managed by Azure — no credentials to create, rotate, or store. System-assigned: tied to a specific resource (deleted when resource deleted). User-assigned: independent resource, can be assigned to multiple Azure resources. Use when: an Azure resource (VM, App Service, AKS pod) needs to access other Azure services (Key Vault, Storage, SQL). The service gets a token automatically from the instance metadata service — no secrets in code or config files.

**What are app registrations and service principals?**
App registration: the blueprint/definition of an application in Entra ID — defines its name, what permissions it requests, where to redirect after login. Service principal: the actual instance/identity created in a tenant when the app is used — think of app registration as the class, service principal as the object. An enterprise app (service principal) is created automatically when a user consents to an app or when an admin provisions it.
