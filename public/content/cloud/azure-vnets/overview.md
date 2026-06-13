# Azure Virtual Networks — Fundamentals

Azure Virtual Network (VNet) is your private network in Azure, equivalent to AWS VPC. It provides isolation, segmentation, and routing for your Azure resources.

## VNet Architecture

```
VNet: 10.0.0.0/16
  ├── Subnet: 10.0.1.0/24 (Web Tier)
  │     └── VMs, Application Gateway
  ├── Subnet: 10.0.2.0/24 (App Tier)  
  │     └── VMs, App Service integration
  ├── Subnet: 10.0.3.0/24 (Data Tier)
  │     └── Azure SQL, Redis, Storage endpoints
  └── AzureBastionSubnet: 10.0.4.0/27
        └── Azure Bastion (secure RDP/SSH, no public IP needed)
```

## Create VNet and Subnets

```bash
az network vnet create \
    --resource-group prod-rg \
    --name prod-vnet \
    --address-prefix 10.0.0.0/16 \
    --location eastus

az network vnet subnet create \
    --resource-group prod-rg \
    --vnet-name prod-vnet \
    --name app-subnet \
    --address-prefix 10.0.2.0/24 \
    --service-endpoints Microsoft.Sql Microsoft.Storage  # For private access

# NSG (Network Security Group) — like AWS Security Group
az network nsg create --resource-group prod-rg --name app-nsg

az network nsg rule create \
    --resource-group prod-rg --nsg-name app-nsg \
    --name allow-https --priority 100 \
    --protocol Tcp --direction Inbound --access Allow \
    --source-address-prefixes '*' --destination-port-ranges 443

# VNet Peering (connect two VNets)
az network vnet peering create \
    --resource-group prod-rg --vnet-name prod-vnet \
    --name prod-to-shared --remote-vnet shared-vnet \
    --allow-vnet-access
```
