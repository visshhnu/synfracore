# Azure VMs — Cheatsheet

```bash
# ── CREATE ────────────────────────────────────────────────
az vm create \
  --resource-group prod-rg --name web-01 \
  --image Ubuntu2204 --size Standard_D4s_v5 \
  --admin-username azureuser --generate-ssh-keys \
  --vnet-name prod-vnet --subnet app-subnet \
  --public-ip-address "" --no-wait

# ── LIFECYCLE ─────────────────────────────────────────────
az vm start  --resource-group rg --name vm
az vm stop   --resource-group rg --name vm       # Still billed!
az vm deallocate --resource-group rg --name vm   # Stop billing
az vm restart --resource-group rg --name vm
az vm delete  --resource-group rg --name vm --yes

# ── INSPECT ───────────────────────────────────────────────
az vm list --resource-group rg --output table
az vm show --resource-group rg --name vm
az vm get-instance-view --resource-group rg --name vm --query instanceView.statuses
az vm list-sizes --location eastus --output table

# ── RESIZE ────────────────────────────────────────────────
az vm resize --resource-group rg --name vm --size Standard_D8s_v5

# ── DISK MANAGEMENT ───────────────────────────────────────
az disk create --resource-group rg --name data-disk --size-gb 256 --sku Premium_LRS
az vm disk attach --resource-group rg --vm-name vm --name data-disk
az vm disk detach --resource-group rg --vm-name vm --name data-disk
az disk delete --resource-group rg --name data-disk --yes

# ── NETWORKING ────────────────────────────────────────────
az vm list-ip-addresses --resource-group rg --name vm --output table
az network nic list --resource-group rg --output table
az network nsg list --resource-group rg --output table
az network nsg rule list --resource-group rg --nsg-name vm-nsg --output table

# ── RUN COMMANDS ──────────────────────────────────────────
az vm run-command invoke --resource-group rg --name vm \
  --command-id RunShellScript \
  --scripts "systemctl status nginx && df -h"

# ── EXTENSIONS ────────────────────────────────────────────
az vm extension list --resource-group rg --vm-name vm --output table

# ── SNAPSHOTS ─────────────────────────────────────────────
OS_DISK=$(az vm show -g rg -n vm --query 'storageProfile.osDisk.managedDisk.id' -o tsv)
az snapshot create -g rg -n vm-snapshot --source $OS_DISK

# ── VM SIZES QUICK REFERENCE ─────────────────────────────
# B1s:       1 vCPU,   1GB  — burstable, dev/test
# D2s_v5:    2 vCPU,   8GB  — general purpose
# D4s_v5:    4 vCPU,  16GB  — general purpose
# D8s_v5:    8 vCPU,  32GB  — general purpose
# E4s_v5:    4 vCPU,  32GB  — memory optimized
# F4s_v2:    4 vCPU,   8GB  — compute optimized
# Standard_D*s_v* = Premium Storage supported
```
