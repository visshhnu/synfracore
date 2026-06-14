# Azure VMs — Interview Questions

**What is the difference between stopping a VM (Deallocated) vs Stopped?**
Stopped (from OS shutdown): VM is stopped but still allocated on Azure hardware — you continue to pay the compute cost. Deallocated (Stop via Azure Portal/CLI with az vm deallocate): VM is stopped AND underlying hardware released — no compute cost (you only pay for storage/IP). Always use deallocate for dev/test VMs outside business hours. Important: when a deallocated VM starts again, it may get a different public IP unless you use a Static IP.

**What are Azure VM sizes and how do you choose?**
Azure VM sizes follow a naming convention: [Family][Generation]s_v[Version]. D-series: general purpose. E-series: memory optimized (databases). F-series: compute optimized (high CPU). L-series: storage optimized (NVMe, very high IOPS). N-series: GPU (AI/ML, graphics). B-series: burstable (test workloads). Size examples: Standard_D4s_v5 = D-series, 4 vCPUs, supports premium storage, v5 generation. Choose based on: CPU/memory ratio needed, IOPS requirements, workload type.

**What is Azure Managed Disks and what are the tiers?**
Managed Disks: Azure manages the storage account behind disks — you just choose size and tier. OS and data disks are separate resources. Tiers: Standard HDD (lowest cost, dev/test), Standard SSD (balanced, web servers), Premium SSD (high IOPS, production databases, requires s in VM size like Standard_D4s), Ultra Disk (sub-millisecond latency, highest IOPS, mission-critical databases). Premium SSD with Bursting lets you temporarily exceed provisioned IOPS.

**How do you achieve high availability for Azure VMs?**
Availability Sets: spread VMs across fault domains (different power/network) and update domains (not rebooted simultaneously during maintenance). 99.95% SLA. Availability Zones: spread VMs across physically separate data centers within a region. 99.99% SLA. VM Scale Sets: automatically scale based on metrics, built-in high availability. For stateless apps: VMSS + load balancer. For stateful apps (databases): Availability Zones + Azure Backup or database-specific HA (SQL Always On, etc.).
