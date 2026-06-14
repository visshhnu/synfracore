# Terraform — Installation Guide

## Install Terraform

### macOS (Homebrew — Recommended)
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
terraform --version   # Terraform v1.7.x
```

### Ubuntu / Debian
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform --version
```

### Windows
```powershell
winget install HashiCorp.Terraform
terraform --version
```

### Manual (Any OS)
1. Download from **releases.hashicorp.com/terraform**
2. Choose your OS and latest version
3. Extract the `terraform` binary
4. Move to a directory in your PATH (`/usr/local/bin` on Linux/Mac, `C:\Windows\System32` on Windows)

## Configure AWS Provider (Most Common)

```bash
# Install AWS CLI
# macOS: brew install awscli
# Linux: curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install

# Configure credentials
aws configure
# AWS Access Key ID: (from IAM → Security credentials)
# AWS Secret Access Key: (from IAM)
# Default region: ap-south-1
# Default output format: json

# Test credentials
aws sts get-caller-identity
```

## Configure Azure Provider

```bash
# Install Azure CLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

az login          # Opens browser for authentication
az account show   # Verify logged in
```

## Your First Terraform File

```bash
mkdir terraform-test && cd terraform-test

cat > main.tf << 'EOF'
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# List available AZs (read-only, no resources created)
data "aws_availability_zones" "available" {}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}
EOF

terraform init      # Downloads AWS provider plugin
terraform plan      # Shows what would happen
terraform apply     # Run it (type "yes")
terraform output    # Shows the AZ names
terraform destroy   # Clean up
```

## Recommended Project Structure

```
my-project/
├── main.tf           # Main resources
├── variables.tf      # Input variables
├── outputs.tf        # Output values
├── versions.tf       # Provider versions (locked)
├── terraform.tfvars  # Variable values (gitignore secrets!)
└── .gitignore        # Exclude: .terraform/, *.tfstate, *.tfvars if secrets
```

## Install Helper Tools

```bash
# terraform-docs: auto-generate documentation
brew install terraform-docs

# tflint: linting and best practice checks
brew install tflint

# tfenv: manage multiple Terraform versions
brew install tfenv
tfenv install 1.7.0
tfenv use 1.7.0

# pre-commit hooks (run fmt/validate on every commit)
pip install pre-commit
```

## Common Installation Issues

**"terraform: command not found"**
The binary isn't in your PATH. Move it to `/usr/local/bin/` or add its location to `$PATH`.

**"Error: No valid credential sources found"**
Run `aws configure` and enter your access key. Or set environment variables:
```bash
export AWS_ACCESS_KEY_ID=xxx
export AWS_SECRET_ACCESS_KEY=xxx
export AWS_DEFAULT_REGION=ap-south-1
```

**"Required plugins are not installed" on terraform init**
Delete the `.terraform` folder and run `terraform init` again.
