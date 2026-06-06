# Terraform — Infrastructure as Code

Terraform by HashiCorp is the industry-standard tool for provisioning and managing cloud infrastructure through code. It works with 1000+ providers — AWS, Azure, GCP, Kubernetes, databases, DNS, and more.

## Why Terraform?

**Before Terraform:** Click around in AWS console. Write docs about what you clicked. Hope the next person follows the docs. Inconsistent environments. No version history. No easy way to recreate.

**With Terraform:** Describe your infrastructure in code. Version it in Git. Review it in PRs. Apply it consistently across environments. Destroy and recreate in minutes.

\`\`\`hcl
# This creates an AWS EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  
  tags = {
    Name = "production-web-server"
  }
}
\`\`\`

## How Terraform Works

\`\`\`
1. Write: .tf files describing desired infrastructure
2. Init:  terraform init   (download providers)
3. Plan:  terraform plan   (show what will change)
4. Apply: terraform apply  (make the changes)
\`\`\`

Terraform uses a **declarative model** — you describe WHAT you want, not HOW to create it. Terraform figures out the how.

## State

Terraform maintains a **state file** (\`terraform.tfstate\`) that maps your config to real infrastructure. The state is the source of truth for what Terraform thinks exists.

**Critical:** In teams, state must be stored remotely (S3, Terraform Cloud) to avoid conflicts. Never commit state files to Git.

## Providers

Providers are plugins that let Terraform talk to APIs. Each provider is maintained separately:
- \`hashicorp/aws\` — All AWS services
- \`hashicorp/azurerm\` — Azure resources
- \`hashicorp/google\` — GCP resources
- \`hashicorp/kubernetes\` — K8s resources