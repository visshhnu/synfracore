# Terraform — Learning Roadmap

## Time to Job-Ready: 6 weeks (2 hours/day)

**Goal:** Write production-grade Terraform for any cloud provider with proper state management and modules.

## Phase 1 — Foundations (Week 1-2)
- HCL syntax: resources, data sources, variables, outputs, locals
- Workflow: `terraform init`, `plan`, `apply`, `destroy`
- Provider configuration (AWS, Azure, or GCP)
- State file: what it is, why it matters, never edit manually
- Remote state: S3 + DynamoDB (AWS) or Terraform Cloud
- Basic resources: VPC, subnets, security groups, EC2/VMs

## Phase 2 — Real Infrastructure (Week 3-4)
- Load balancers, auto-scaling groups, RDS databases, S3 buckets
- Data sources: reference existing resources not managed by Terraform
- `count` vs `for_each` — when to use each
- Dynamic blocks for repeated nested configuration
- `depends_on` — explicit dependency management
- `lifecycle` rules: `create_before_destroy`, `prevent_destroy`, `ignore_changes`

## Phase 3 — Modules & Collaboration (Week 5)
- Write reusable modules with input variables and outputs
- Module versioning and the Terraform Registry
- Workspaces for multi-environment (dev/staging/prod)
- `.tfvars` files and variable precedence
- CI/CD integration: `terraform plan` on PR, `apply` on merge

## Phase 4 — Advanced (Week 6)
- Import existing infrastructure: `terraform import`
- Terraform Cloud: remote runs, state locking, team access
- Policy as code: Sentinel (Terraform Cloud) or OPA (open-source)
- Testing: `terraform validate`, `terraform fmt`, `tflint`, Terratest
- Performance: partial applies, targeted applies (`-target`)

## Certifications
- **HashiCorp Terraform Associate (003)** — $70, multiple choice, highly recommended

## Jobs After Terraform Mastery
Infrastructure Engineer · DevOps Engineer · Cloud Engineer · Platform Engineer

## Resources
- **developer.hashicorp.com/terraform** — official learn platform (free)
- **Terraform: Up & Running** by Yevgeniy Brikman
- **KodeKloud Terraform course**
