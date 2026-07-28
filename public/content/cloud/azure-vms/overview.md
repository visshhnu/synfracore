# Azure Virtual Machines

**Before you start:** basic Azure familiarity (subscriptions, resource groups — see the Azure Core Overview first if those are new) is assumed. VNets, subnets, and NSGs are used directly in the networking examples below; the dedicated Azure Networking (VNets) course covers them in depth if you want that grounding first, but the basics needed to follow along here are explained as they come up. No prior VM/server administration experience is required.

Azure VMs provide IaaS compute. Choose the right size, configure networking, and automate provisioning with ARM templates or Terraform.

## Why this exists (the hook)

Not every workload fits neatly into a managed PaaS box — a legacy application that needs a specific OS kernel version, a database engine that expects raw disk access, or software licensed per-physical/virtual-machine all need something closer to "a real computer you fully control." Azure VMs are that: you pick the CPU/memory/disk shape, you manage the OS and everything on it, and in exchange for that control you also own the patching, sizing, and availability decisions that a PaaS service would otherwise handle for you.

## Analogy

Choosing an Azure VM is like renting an apartment versus a serviced hotel room. A PaaS service (like App Service) is the hotel room — housekeeping, maintenance, and security are all handled, but you can't rewire the electrics or install your own appliances. A VM is the apartment — you choose the layout (VM size/series), you're responsible for maintenance (OS patching, security updates) and for insurance decisions (Availability Sets/Zones for resilience), but you can install literally anything you need, because it's genuinely yours to configure.

## How it fits together (diagram)

```
                 You choose:
        ┌────────────────────────────┐
        │  VM Series (D/E/F/L/N/B)   │  ← CPU:RAM ratio, GPU, burst behavior
        │  Managed Disk (Ultra/      │  ← latency/IOPS/cost tradeoff
        │  Premium/Standard)         │
        │  Availability (Set/Zone/   │  ← blast-radius protection level
        │  Scale Set)                │
        └──────────────┬─────────────┘
                        ▼
              Azure provisions the VM
              into your VNet/subnet
                        │
        ┌───────────────┴────────────────┐
        │  Access it WITHOUT a public IP  │
        │  via Azure Bastion (SSH/RDP     │
        │  over HTTPS through the Portal) │
        └──────────────────────────────────┘
```

## Try it yourself (2 minutes)

If you have an Azure sandbox available, run `az vm list-sizes --location eastus --output table | head -20` (or the equivalent on your platform) and scan the output for the B-series and D-series entries. Notice how many distinct sizes exist even within just those two series — this is exactly why "choose the right size" in the intro above isn't a throwaway line: picking `Standard_D2s_v5` versus `Standard_D4s_v5` isn't a rounding error, it's a real decision about how much you'll pay per hour and how much headroom your application actually has.

## VM Series

```
General Purpose: D-series (Dsv5, Ddsv5) — balanced CPU/memory, most workloads
Compute Optimised: F-series — high CPU ratio, web servers, batch
Memory Optimised: E-series — databases, in-memory analytics, SAP HANA
Storage Optimised: L-series — high disk I/O, NoSQL databases
GPU: NC, ND, NV — ML training, rendering, visualisation
Burstable: B-series — dev/test, low baseline with burst credits
```

## Creating a VM (Terraform)

```hcl
resource "azurerm_linux_virtual_machine" "main" {
  name                = "prod-app-vm"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_D4s_v5"  # 4 vCPU, 16GB RAM

  admin_username = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  network_interface_ids = [azurerm_network_interface.main.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"  # SSD
    disk_size_gb         = 128
  }
  
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"  # Managed Identity — no passwords for Azure services
  }
  
  custom_data = base64encode(file("cloud-init.yaml"))
}
```

## Availability Options

```
Availability Set: Spreads VMs across fault/update domains in ONE datacenter
  2 VMs in availability set = 99.95% SLA *(needs verification — confirm current SLA figure against Azure's published SLA page)*
  
Availability Zone: Spreads VMs across physically separate datacenters
  2 VMs in different zones = 99.99% SLA *(needs verification — confirm current SLA figure against Azure's published SLA page)*
  
Virtual Machine Scale Sets (VMSS):
  Auto-scale based on metrics
  Identical VMs managed as a group
  Supports spot instances for cost savings
  
Azure Spot VMs: Up to 90% discount, can be evicted with short notice (roughly 30 seconds) *(needs verification — exact discount range and eviction-notice window against current Azure docs)*
  Best for: Batch, CI/CD, fault-tolerant workloads
```

## Managed Disks

```
Ultra Disk:   Max IOPS/throughput, for databases requiring sub-millisecond latency
Premium SSD:  Production workloads, consistent low latency
Standard SSD: Dev/test, non-critical production
Standard HDD: Backup, archival, infrequent access

Disk Encryption: Enabled by default (Azure managed keys)
  Customer-managed keys: Bring Your Own Key (BYOK) for compliance
```

## Bastion — Secure Access

```bash
# Azure Bastion: SSH/RDP over HTTPS, no public IP on VMs
# Deploy in same VNet, access VMs securely from Azure Portal or CLI

az network bastion ssh \
  --name MyBastion \
  --resource-group MyRG \
  --target-resource-id /subscriptions/.../virtualMachines/myVM \
  --auth-type ssh-key \
  --username azureuser \
  --ssh-key ~/.ssh/id_rsa
```
