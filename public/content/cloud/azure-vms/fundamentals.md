# Azure Virtual Machines — Fundamentals

## The hook: the VM that's still running (and billing) after you "stopped" it

A very common early mistake: stopping a VM from inside the guest OS (or via `az vm stop`) and assuming that stops the charges. It doesn't — Azure still reserves the compute capacity for that VM until it's explicitly **deallocated**, and compute is billed the whole time it's reserved. This distinction — `stop` vs. `deallocate` — is one of the highest-value small facts in this whole section, because getting it wrong silently costs real money on every VM you ever create.

## Analogy

Think of `az vm stop` as turning off your car's engine while it's still parked in a reserved, paid parking spot — the meter keeps running because the spot is still yours. `az vm deallocate` is actually giving the spot back — the meter stops, but you also lose the guarantee that the exact same spot will be available when you come back (the VM may get a new private IP/host on next start, unless configured otherwise).

## Create VMs with Azure CLI

```bash
# Create a VM
# --public-ip-address "" means no public IP is assigned (access via Bastion instead)
# --zone 1 pins this VM to Availability Zone 1
az vm create \
    --resource-group prod-rg \
    --name web-vm-01 \
    --image Ubuntu2204 \
    --size Standard_D4s_v5 \
    --admin-username azureuser \
    --ssh-key-values ~/.ssh/id_rsa.pub \
    --vnet-name prod-vnet \
    --subnet app-subnet \
    --public-ip-address "" \
    --nsg prod-nsg \
    --zone 1 \
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

## How it fits together (diagram)

```
az vm stop        → OS shuts down, VM still "reserved"  → compute STILL billed
az vm deallocate  → VM fully released back to Azure's    → compute billing STOPS
                     capacity pool                          (disk storage still billed)
az vm start       → VM re-provisioned onto (possibly a
                     different) physical host
```

## Try it yourself (2 minutes)

If you have a test VM available (or are reading along without one): run `az vm get-instance-view --resource-group <rg> --name <vm> --query instanceView.statuses` right after `az vm stop`, then again after `az vm deallocate`. Compare the `PowerState` value in each case — `stop` typically leaves it as `VM stopped`, while `deallocate` shows `VM deallocated`. That single word is the difference between "still on the clock" and "actually released" — always check it before assuming a stopped dev/test VM isn't costing anything.
