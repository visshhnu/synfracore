# Terraform -- Portfolio Projects

Three IaC projects using real AWS resources. Focus on modules, remote state, and multi-environment patterns.

---

## Project 1: 3-Tier AWS Architecture with Modules

**Level:** Beginner | **Time:** 2 days | **GitHub:** `terraform-aws-webapp`

**What you build:** VPC + ALB + EC2 Auto Scaling Group + RDS using Terraform modules and remote state.

### Structure
```
terraform-aws-webapp/
+-- main.tf          (root module)
+-- variables.tf
+-- outputs.tf
+-- backend.tf       (remote state in S3)
+-- modules/
    +-- vpc/
    +-- ec2/
    +-- rds/
```

### Remote state
```hcl
terraform {
  backend "s3" {
    bucket         = "mycompany-terraform-state"
    key            = "webapp/production/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

### Steps
1. Create S3 bucket + DynamoDB table for remote state first
2. Write VPC module: subnets, IGW, NAT, route tables
3. Write EC2 module: Launch Template + ASG + ALB
4. Write RDS module in private subnet
5. Wire modules together in root main.tf
6. Add dev/prod environments with different tfvars
7. GitHub Actions: terraform plan on PR, apply on merge to main

---

## Project 2: EKS Cluster with Terraform

**Level:** Intermediate | **Time:** 3 days | **GitHub:** `terraform-eks-platform`

**What you build:** Production EKS cluster with VPC, managed node groups, spot instance pool, IRSA, and post-cluster Helm installations.

### Key configuration
```hcl
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "prod-cluster"
  cluster_version = "1.30"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_groups = {
    workers = {
      min_size     = 1
      max_size     = 10
      desired_size = 3
      instance_types = ["t3.medium"]
    }
    spot = {
      min_size       = 0
      max_size       = 20
      desired_size   = 0
      capacity_type  = "SPOT"
      instance_types = ["m5.large", "m5.xlarge", "m4.large"]
    }
  }
}

resource "helm_release" "argocd" {
  depends_on       = [module.eks]
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
}
```

### Steps
1. Use official terraform-aws-modules/eks (saves 500+ lines)
2. Create VPC first, pass subnet IDs to EKS
3. Apply in phases: VPC, then EKS (avoids timeout)
4. Install ArgoCD + ALB Controller via Helm provider
5. Set up IRSA for workload identity
6. Add terraform test assertions for module validation

---

## Project 3: Multi-Account Landing Zone

**Level:** Advanced | **Time:** 4-5 days | **GitHub:** `terraform-landing-zone`

**What you build:** Create AWS child accounts via Organizations, apply security baseline (CloudTrail, GuardDuty, Config) to each, and enforce SCPs -- all from Terraform.

### Account creation + cross-account provisioning
```hcl
resource "aws_organizations_account" "dev" {
  name  = "development"
  email = "dev@company.com"
}

provider "aws" {
  alias = "dev"
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.dev.id}:role/OrganizationAccountAccessRole"
  }
}

module "security_baseline" {
  source    = "./modules/security-baseline"
  providers = {aws = aws.dev}
}
```

### Steps
1. Enable AWS Organizations in management account
2. Write account creation module
3. Write security baseline (CloudTrail + GuardDuty + Config)
4. Apply baseline to each account via provider aliases
5. Add SCP restricting regions to ap-south-1 and us-east-1
6. Create SSO permission sets per account type
7. Document full setup with architecture diagram

---

## Portfolio Checklist
- [ ] Remote state in S3 with DynamoDB locking (never local tfstate)
- [ ] No hardcoded credentials anywhere
- [ ] `terraform plan` shows zero changes after clean apply (idempotent)
- [ ] Pre-commit hooks: terraform fmt, validate, tflint
- [ ] GitHub Actions pipeline: plan on PR, apply on merge
