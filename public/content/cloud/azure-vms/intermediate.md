# Azure VMs — Intermediate

## VM Scale Sets (VMSS)

```bash
# Create scale set for auto-scaling web tier
az vmss create \
  --resource-group prod-rg \
  --name web-vmss \
  --image Ubuntu2204 \
  --instance-count 2 \
  --vm-sku Standard_D2s_v3 \
  --upgrade-policy-mode Automatic \
  --admin-username azureuser \
  --generate-ssh-keys \
  --custom-data cloud-init.yaml

# Configure autoscale
az monitor autoscale create \
  --resource-group prod-rg \
  --resource web-vmss \
  --resource-type Microsoft.Compute/virtualMachineScaleSets \
  --name autoscale \
  --min-count 2 --max-count 20 --count 2

az monitor autoscale rule create \
  --autoscale-name autoscale --resource-group prod-rg \
  --scale out --cooldown 5 \
  --condition "Percentage CPU > 70 avg 5m"

az monitor autoscale rule create \
  --autoscale-name autoscale --resource-group prod-rg \
  --scale in --cooldown 10 \
  --condition "Percentage CPU < 30 avg 10m"
```

## VM Extensions

```bash
# Custom Script Extension (bootstrap at deploy time)
az vm extension set \
  --resource-group prod-rg --vm-name my-vm \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --settings '{"fileUris":["https://storage.blob.core.windows.net/scripts/setup.sh"],"commandToExecute":"bash setup.sh"}'

# Azure Monitor Agent (replace legacy Log Analytics agent)
az vm extension set \
  --resource-group prod-rg --vm-name my-vm \
  --name AzureMonitorLinuxAgent \
  --publisher Microsoft.Azure.Monitor \
  --version 1.0

# Check extension status
az vm extension list --resource-group prod-rg --vm-name my-vm --output table
az vm extension show --resource-group prod-rg --vm-name my-vm --name customScript
```

## Azure Bastion (Secure SSH/RDP)

```bash
# Deploy Azure Bastion — no public IP on VMs needed
# Requires AzureBastionSubnet (/26 minimum) in the VNet

az network vnet subnet create \
  --resource-group prod-rg --vnet-name prod-vnet \
  --name AzureBastionSubnet --address-prefix 10.0.100.0/27

az network public-ip create \
  --resource-group prod-rg --name bastion-pip \
  --sku Standard --allocation-method Static

az network bastion create \
  --resource-group prod-rg --name prod-bastion \
  --vnet-name prod-vnet --public-ip-address bastion-pip

# Connect via Bastion (from Azure portal or CLI)
az network bastion ssh \
  --name prod-bastion --resource-group prod-rg \
  --target-resource-id $VM_RESOURCE_ID \
  --auth-type ssh-key --username azureuser \
  --ssh-key ~/.ssh/id_rsa
```
