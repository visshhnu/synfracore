# Azure — Getting Started Guide

## Create Your Azure Account

1. Go to **azure.microsoft.com/free**
2. Click "Start free" — you get:
   - **$200 credit** for 30 days
   - **12 months** of popular free services
   - **Always-free** tier (25+ products, no expiry)
3. Sign in with Microsoft account (or create one)
4. Enter payment method (won't be charged during free period)

## Install Azure CLI

### macOS
```bash
brew install azure-cli
az --version   # azure-cli 2.x.x
```

### Ubuntu / Debian
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version
```

### Windows
```powershell
winget install Microsoft.AzureCLI
az --version
```

## Login to Azure

```bash
az login
# Opens browser for Microsoft login
# After login, terminal shows your subscriptions

# Verify
az account show
# Shows your subscription name and ID

# If you have multiple subscriptions
az account list --output table
az account set --subscription "My Subscription Name"
```

## Create Your First VM

```bash
# Create a resource group (like a folder for related resources)
az group create --name my-rg --location southindia

# Create a VM (Standard_B1s = 1 vCPU, 1GB RAM — free tier eligible)
az vm create \
  --resource-group my-rg \
  --name my-first-vm \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --generate-ssh-keys

# Output includes publicIpAddress
# SSH to it
ssh azureuser@PUBLIC-IP

# IMPORTANT: Delete resource group when done (deletes everything in it)
az group delete --name my-rg --yes --no-wait
```

## Essential Azure CLI Commands

```bash
# Resource groups
az group list --output table
az group create --name myRG --location eastus
az group delete --name myRG --yes

# Virtual Machines
az vm list --output table
az vm start --name myVM --resource-group myRG
az vm stop --name myVM --resource-group myRG
az vm deallocate --name myVM --resource-group myRG  # Stops billing

# AKS (Kubernetes)
az aks list --output table
az aks get-credentials --name myCluster --resource-group myRG

# Common locations for India
# southindia     = Chennai
# centralindia   = Pune
# westindia      = Mumbai
az account list-locations --output table | grep india
```

## Check Costs and Set Budget Alert

```bash
# Check current spending
az consumption budget list

# Create budget alert (via portal is easier):
# Cost Management + Billing → Budgets → Add
# Amount: $50, Alert at 80% → your email
```

## Install VS Code Azure Extensions (Optional but Helpful)

- Azure Account
- Azure Resources
- Azure Virtual Machines
- Azure Kubernetes Service

## Next Steps

Azure CLI is configured. Go to the **Azure Fundamentals** section to learn about resource groups, VNets, and managed services.
