# Terraform — Prerequisites

## What You Need Before Starting Terraform

Terraform provisions real cloud infrastructure. A few foundations will save you hours of confusion.

## Required

### 1. A Cloud Provider Account
Terraform needs somewhere to create resources. Recommended starting points (all free):
- **AWS Free Tier** — 12 months of free t2.micro EC2, S3, RDS, etc.
- **Azure Free Account** — $200 credit for 30 days + 12 months of free services
- **GCP Free Tier** — $300 credit for 90 days

Start with whichever cloud you're learning. AWS is the most common for DevOps roles.

### 2. Basic Cloud Concepts
You should understand what these are (not how to configure them — Terraform handles that):
- **VPC** — Virtual Private Cloud (your isolated network in the cloud)
- **EC2 / VM** — a virtual server
- **S3 / Blob Storage** — object storage
- **IAM** — Identity and Access Management (permissions)
- **Regions and Availability Zones**

If these are unfamiliar, spend 2-3 hours in the cloud provider's "getting started" docs or this site's Cloud section first.

### 3. Basic Command Line
```bash
# You need these:
cd, ls, mkdir, cat      # Navigate and create files
nano or vim             # Edit files
export VAR=value        # Set environment variables
```

### 4. Basic Understanding of YAML/JSON (Helpful)
Terraform uses HCL (HashiCorp Configuration Language), which is similar. Understanding key-value pairs and nested structure helps.

## Nice to Have

### Git Basics
Terraform code should always be in version control. `git add`, `git commit`, `git push` is enough.

### Linux Basics
You'll run Terraform from a terminal. The more comfortable you are with Linux, the smoother this goes.

### Networking Basics
Terraform often creates VPCs, subnets, and security groups. Understanding CIDR notation (`10.0.0.0/24`) and inbound/outbound rules helps.

## What You Do NOT Need

- ❌ Programming experience (HCL is declarative, not programming)
- ❌ Advanced cloud knowledge (you'll learn as you build)
- ❌ Kubernetes knowledge
- ❌ Linux administration skills

## Learning Path

```
Cloud account + basic CLI
          ↓
Terraform Installation
          ↓
Terraform Fundamentals (create your first VPC)
          ↓
Intermediate (modules, remote state)
          ↓
Advanced (multi-environment, CI/CD)
          ↓
Terraform Associate Certification (~$70)
```

## Time Estimate

- Fundamentals: 1 week
- Intermediate: 1-2 weeks  
- Advanced: 2-3 weeks
- Certification ready: 6-8 weeks

## Start Here

Go to **Installation** to install Terraform and configure your cloud provider credentials.
