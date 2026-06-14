# Terraform — Certification Guide

## HashiCorp Terraform Associate (003)

| Detail | Info |
|---|---|
| **Provider** | HashiCorp |
| **Exam Code** | TA-003 |
| **Cost** | $70.50 USD |
| **Validity** | 2 years |
| **Format** | 57 questions, 60 minutes, multiple choice + true/false |
| **Passing score** | Not published (typically ~70%) |
| **Delivery** | Online proctored via PSI |

### Domain Breakdown
- **11%** Understand Infrastructure as Code (IaC) concepts
- **11%** Understand Terraform's purpose vs other IaC tools
- **9%**  Understand Terraform basics
- **22%** Use Terraform outside the core workflow
- **11%** Interact with Terraform modules
- **11%** Use the core Terraform workflow
- **9%**  Implement and maintain state
- **6%**  Read, generate, and modify configuration
- **9%**  Understand Terraform Cloud capabilities

### Key Topics to Master
- `terraform init`, `plan`, `apply`, `destroy`, `fmt`, `validate`, `import`
- State: local vs remote, `terraform state list/show/mv/rm`
- Modules: input variables, output values, module sources
- Workspaces: `terraform workspace new/select/list`
- Provisioners: when to use, when NOT to use
- `terraform.tfvars` vs environment variables vs `-var` flag precedence
- Backends: S3, Terraform Cloud, local
- Terraform Cloud: remote runs, sentinel policies, private registry

### Exam Tips
- The official Terraform Associate study guide is excellent — read it twice
- Practice with real AWS/Azure resources (even small ones)
- Understand the difference between `plan` and `apply` output
- Know `count` vs `for_each` trade-offs — this is commonly tested
- `depends_on` usage — when implicit dependency isn't enough

### Study Resources
- **developer.hashicorp.com/terraform/tutorials** — official tutorials (free)
- **FreeCodeCamp Terraform course** — YouTube, 13 hours, free
- **Study guide**: developer.hashicorp.com/terraform/tutorials/certification-003/associate-study-003

### Schedule the Exam
1. Complete at least 2 Terraform projects (see Projects section)
2. Score 80%+ on 2 practice exams
3. Book via psiexams.com — available 7 days a week online
