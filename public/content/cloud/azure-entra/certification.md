# Azure Entra ID (formerly Azure AD) Certification Guide

## Primary Certification

**SC-300 Microsoft Identity and Access Administrator**

*Format*: 40-60 MCQ | 3 hours | 700/1000 | $165 USD

## Related Certifications

- AZ-500 Azure Security Technologies
- AZ-104 Azure Administrator

## Key Exam Topics

- Entra ID vs Active Directory: cloud identity service (no LDAP/Kerberos native)
- Authentication: Password Hash Sync (PHS), Pass-through Auth (PTA), Federation (ADFS)
- Conditional Access: policies to require MFA, compliant devices, named locations
- App registration vs Enterprise Application: register = definition; enterprise = instance
- Managed Identity: system-assigned (lifecycle tied to resource) vs user-assigned (reusable)
- RBAC: role assignments at management group / subscription / resource group / resource
- PIM (Privileged Identity Management): just-in-time privileged access with approval

## Must-Know CLI Commands

```bash
az ad user create --display-name "Alice Smith" --user-principal-name alice@contoso.com --password Passw0rd! --force-change-password-next-sign-in false
az ad group create --display-name "DevOps Team" --mail-nickname devops-team
az ad group member add --group DevOps-Team --member-id alice-object-id
az role assignment create --assignee alice@contoso.com --role Contributor --scope /subscriptions/SUB-ID/resourceGroups/myRG
az identity create --name myapp-identity --resource-group myRG
```

## Exam Tips

- Managed Identity: no credentials to manage; works with Azure Key Vault, Storage, SQL
- Conditional Access: requires Azure AD Premium P1; block legacy auth (SMTP, POP3, IMAP)
- MFA enforcement: Conditional Access > per-user MFA (more flexible, less legacy)
- App registrations: client ID + client secret or certificate → service principal authentication

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: SC-300 Microsoft Identity and Access Administrator

TOP TOPICS:
  Entra ID vs Active Directory: cloud identity service (no LDAP/Kerberos native)
  Authentication: Password Hash Sync (PHS), Pass-through Auth (PTA), Federation (A
  Conditional Access: policies to require MFA, compliant devices, named locations
  App registration vs Enterprise Application: register = definition; enterprise = 
```
