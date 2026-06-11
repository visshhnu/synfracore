# Azure Virtual Machines

Azure VMs provide IaaS compute. Choose the right size, configure networking, and automate provisioning with ARM templates or Terraform.

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
  2 VMs in availability set = 99.95% SLA
  
Availability Zone: Spreads VMs across physically separate datacenters
  2 VMs in different zones = 99.99% SLA
  
Virtual Machine Scale Sets (VMSS):
  Auto-scale based on metrics
  Identical VMs managed as a group
  Supports spot instances for cost savings
  
Azure Spot VMs: Up to 90% discount, can be evicted with 30s notice
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
