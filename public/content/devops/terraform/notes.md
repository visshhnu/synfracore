# Terraform Key Notes

## Version Management
- Use `tfenv` for version switching: `tfenv install 1.6.6`, `tfenv use 1.6.6`
- Pin provider versions in `versions.tf` — prevents surprise breaking changes
- OpenTofu is the open-source fork (after HashiCorp BSL license change Aug 2023) — same syntax

## State Management Rules
1. Remote state is mandatory for teams — never local state in shared repos
2. State locking prevents concurrent applies
3. Never manually edit state file — use `terraform state mv/rm`
4. State contains secrets in plaintext — encrypt at rest (S3 server-side encryption, Azure Blob encryption)

## Import Workflow (Bringing Existing Resources Under TF)
1. Write the HCL configuration for the resource
2. `terraform import azurerm_resource_group.main /subscriptions/.../resourceGroups/my-rg`
3. `terraform plan` — verify no unexpected changes
4. `terraform apply` if plan shows no changes

## Terraform vs OpenTofu (2024)
| | Terraform | OpenTofu |
|-|-----------|----------|
| License | BSL 1.1 (not fully open source) | MPL 2.0 (fully open source) |
| Governance | HashiCorp (IBM) | CNCF |
| Syntax | HCL | HCL (identical) |
| Compatibility | Source | Drop-in replacement |
| State | Compatible | Compatible |

## Quick Reference — Terraform

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
