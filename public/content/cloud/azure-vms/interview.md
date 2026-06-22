# Azure Virtual Machines Interview Questions

## Core Concepts

**Q: Azure VM series — how do you choose the right size?**

| Series | Use Case | Examples |
|---|---|---|
| B (Burstable) | Dev/test, low steady-state CPU | B2s, B4ms |
| D (General Purpose) | Most workloads, balanced CPU/RAM | D4s_v5, D8s_v5 |
| E (Memory Optimised) | Databases, in-memory analytics | E8s_v5, E32s_v5 |
| F (Compute Optimised) | CPU-heavy batch, gaming | F8s_v2 |
| L (Storage Optimised) | High disk throughput, Cassandra | L8s_v3 |
| N (GPU) | ML training, graphics rendering | NC6s_v3, ND96asr |
| H (HPC) | MPI workloads, simulations | HB120rs_v3 |

**Naming convention:** D4s_v5 = D series, 4 vCPUs, s=premium SSD capable, v5=version 5.

**Cost optimisation:**
- Spot VMs: 60-90% discount, can be evicted (use for batch/stateless)
- Reserved Instances: 1 or 3 year commitment, 40-72% savings
- Hybrid Benefit: Bring your own Windows Server/SQL license

---

**Q: Azure VM availability options.**

**Availability Sets**: Group VMs across fault domains (different racks) and update domains (patching groups).
- Protects from hardware failure (rack-level)
- Protects from planned maintenance (rolling updates)
- Single datacenter — no protection from datacenter failure

**Availability Zones**: Deploy VMs to physically separate datacenters within a region.
- Each zone has independent power, cooling, networking
- 99.99% SLA (vs 99.95% for Availability Sets)
- Best practice for production workloads

**VM Scale Sets (VMSS)**: Identical VMs with auto-scaling. Load balancer in front.
- Manual, scheduled, or metric-based scaling (CPU %, custom metrics)
- Supports Spot VMs (mixed instances)
- Use for: web tiers, batch processing, microservices

---

**Q: Azure VM disk types.**

| Disk Type | Latency | IOPS | Use Case |
|---|---|---|---|
| Ultra Disk | <1ms | Up to 160K | Databases, latency-sensitive |
| Premium SSD v2 | ~2ms | Up to 80K | Production databases |
| Premium SSD (P-series) | <10ms | Up to 20K | Most production workloads |
| Standard SSD | ~10ms | Moderate | Dev/test, web servers |
| Standard HDD | Higher | Low | Backups, archival |

```bash
# Attach premium SSD to VM
az vm disk attach --resource-group myrg --vm-name myvm   --name myDisk --new --size-gb 128 --sku Premium_LRS

# Enable accelerated networking (reduces latency, required for high-perf)
az network nic update --name myNIC --resource-group myrg   --accelerated-networking true
```

---

**Q: VM extensions and custom script extension.**

VM Extensions add post-deployment configuration:
- **Custom Script Extension**: Run scripts on VM after deployment
- **DSC**: PowerShell Desired State Configuration
- **Azure Monitor Agent**: Metrics and log collection
- **Key Vault VM Extension**: Automatically refresh certificates from Key Vault
- **Disk Encryption**: Enable Azure Disk Encryption (ADE with BitLocker/dm-crypt)

```json
// Custom Script Extension via ARM template
{
  "type": "extensions",
  "name": "CustomScriptExtension",
  "properties": {
    "publisher": "Microsoft.Compute",
    "type": "CustomScriptExtension",
    "settings": {
      "fileUris": ["https://mystorageaccount.blob.core.windows.net/scripts/setup.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File setup.ps1"
    }
  }
}
```

## Revision Notes
```
VM SERIES: B(burstable) D(general) E(memory) F(compute) L(storage) N(GPU)
D4s_v5: D series, 4 vCPU, s=premium SSD, v5=generation

AVAILABILITY:
Availability Sets: same DC, different fault+update domains (99.95% SLA)
Availability Zones: separate DCs in region (99.99% SLA) — use for production
VM Scale Sets: auto-scaling group of identical VMs

DISKS: Ultra(<1ms) > Premium SSD v2 > Premium SSD > Standard SSD > HDD
Premium SSD = P-series (required for most production workloads)

COST: Spot (60-90% off, evictable) | Reserved (40-72% off, 1-3yr commit) | Hybrid Benefit (BYOL)

EXTENSIONS: Custom Script (run scripts) | AMA (monitoring) | Key Vault (cert rotation) | ADE (encryption)
```
