# Azure VMs — Advanced

## Proximity Placement Groups and Ultra Disks

```bash
# Proximity Placement Group — co-locate VMs for ultra-low network latency
az ppg create --resource-group prod-rg --name latency-ppg --type Standard

az vm create --resource-group prod-rg --name db-vm \
  --ppg latency-ppg \
  --image Ubuntu2204 --size Standard_D16s_v3

# Ultra Disk — sub-millisecond latency for databases
az disk create --resource-group prod-rg --name ultra-data \
  --sku UltraSSD_LRS --size-gb 1024 \
  --disk-iops-read-write 16000 --disk-mbps-read-write 500

az vm disk attach --resource-group prod-rg --vm-name db-vm \
  --name ultra-data --lun 0
```

## Azure Spot VMs

```bash
# Spot VMs: up to 90% discount, evicted when capacity needed
az vm create --resource-group prod-rg \
  --name spot-worker \
  --image Ubuntu2204 --size Standard_D8s_v3 \
  --priority Spot \
  --eviction-policy Deallocate \  # or Delete
  --max-price 0.1   # Max price per hour (evicted if market exceeds this)

# Handle eviction gracefully: check metadata service
# 30-second warning: https://169.254.169.254/metadata/scheduledevents
```

## Azure Compute Gallery (Custom Images)

```bash
# Create golden image for rapid deployment
# Step 1: Prepare VM (install software, run sysprep/waagent)
az vm run-command invoke --resource-group prod-rg --name template-vm \
  --command-id RunShellScript \
  --scripts "sudo waagent -deprovision+user -force"

# Step 2: Generalize and capture
az vm deallocate --resource-group prod-rg --name template-vm
az vm generalize --resource-group prod-rg --name template-vm

# Step 3: Create image in Compute Gallery
az sig create --resource-group prod-rg --gallery-name myGallery
az sig image-definition create --resource-group prod-rg --gallery-name myGallery \
  --gallery-image-definition UbuntuWebServer \
  --publisher MyOrg --offer Ubuntu --sku 22-04 \
  --os-type Linux --os-state Generalized

az sig image-version create --resource-group prod-rg --gallery-name myGallery \
  --gallery-image-definition UbuntuWebServer \
  --gallery-image-version 1.0.0 \
  --managed-image /subscriptions/$SUB/resourceGroups/prod-rg/providers/Microsoft.Compute/virtualMachines/template-vm \
  --replica-count 2 --replication-mode Shallow

# Deploy from gallery image (< 1 min vs 10 min from marketplace)
az vm create --resource-group prod-rg --name new-vm \
  --image /subscriptions/$SUB/resourceGroups/prod-rg/providers/Microsoft.Compute/galleries/myGallery/images/UbuntuWebServer/versions/1.0.0
```
