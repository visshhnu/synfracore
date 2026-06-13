# Azure Virtual Machines — Fundamentals

## Create VMs with Azure CLI

```bash
# Create a VM
az vm create \
    --resource-group prod-rg \
    --name web-vm-01 \
    --image Ubuntu2204 \
    --size Standard_D4s_v5 \
    --admin-username azureuser \
    --ssh-key-values ~/.ssh/id_rsa.pub \
    --vnet-name prod-vnet \
    --subnet app-subnet \
    --public-ip-address "" \           # No public IP (access via Bastion)
    --nsg prod-nsg \
    --zone 1 \                          # Availability Zone
    --storage-sku Premium_LRS \
    --custom-data cloud-init.yml

# Scale Set (auto-scaling)
az vmss create \
    --resource-group prod-rg \
    --name app-vmss \
    --image Ubuntu2204 \
    --instance-count 2 \
    --vm-sku Standard_D4s_v5 \
    --upgrade-policy-mode Automatic \
    --admin-username azureuser \
    --ssh-key-values ~/.ssh/id_rsa.pub

# Enable autoscale
az monitor autoscale create \
    --resource-group prod-rg \
    --resource app-vmss \
    --resource-type Microsoft.Compute/virtualMachineScaleSets \
    --name autoscale-config \
    --min-count 2 --max-count 20 --count 2

az monitor autoscale rule create \
    --autoscale-name autoscale-config \
    --resource-group prod-rg \
    --scale out --cooldown 5 --condition "Percentage CPU > 70 avg 5m"
```

## VM Extensions and Bootstrap

```bash
# Custom Script Extension (bootstrap on creation)
az vm extension set \
    --resource-group prod-rg \
    --vm-name web-vm-01 \
    --name customScript \
    --publisher Microsoft.Azure.Extensions \
    --settings '{"fileUris":["https://storage.blob.core.windows.net/scripts/install.sh"],"commandToExecute":"./install.sh"}'

# Azure Monitor Agent (replace legacy MMA)
az vm extension set \
    --name AzureMonitorLinuxAgent \
    --publisher Microsoft.Azure.Monitor \
    --resource-group prod-rg \
    --vm-name web-vm-01

# VM Cheatsheet
az vm list --output table
az vm show --resource-group rg --name vm --output json
az vm start/stop/restart --resource-group rg --name vm
az vm deallocate --resource-group rg --name vm  # Stop billing
az vm resize --resource-group rg --name vm --size Standard_D8s_v5
az vm disk attach --resource-group rg --vm-name vm --name datadisk --size-gb 100 --sku Premium_LRS
```
