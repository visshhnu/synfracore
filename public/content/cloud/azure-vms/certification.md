# Azure Virtual Machines Certification Guide

## Primary Certification

**AZ-104 Microsoft Azure Administrator**

*Format*: 40-60 MCQ | 3 hours | 700/1000 | $165 USD

## Related Certifications

- AZ-305 Azure Solutions Architect Expert

## Key Exam Topics

- VM series: B (burstable/dev), D (general), E (memory), F (compute), N (GPU), L (storage)
- Availability Sets: fault domains (separate racks) + update domains (rolling restart)
- Availability Zones: physically separate data centers in same region (higher SLA)
- VM Scale Sets (VMSS): autoscaling group; flexible orchestration recommended
- Azure Spot VMs: 60-90% cheaper, evictable; use for batch/stateless workloads
- Disk types: Ultra (highest IOPS, mission critical) / Premium SSD v2 / Premium SSD / Standard SSD / HDD
- Azure Hybrid Benefit: use existing Windows Server / SQL Server licenses on Azure (save 40-55%)

## Must-Know CLI Commands

```bash
az vm create --resource-group myRG --name myVM --image Ubuntu2204 --size Standard_D4s_v3 --admin-username azureuser --generate-ssh-keys
az vm start --name myVM --resource-group myRG
az vm stop --name myVM --resource-group myRG
az vm deallocate --name myVM --resource-group myRG  # Stop billing for compute
az vm resize --resource-group myRG --name myVM --size Standard_D8s_v3
```

## Exam Tips

- Deallocate vs Stop: Stop keeps VM running (still charged!); Deallocate frees compute billing
- Availability Zones vs Sets: Zones = datacenter-level isolation; Sets = rack-level within datacenter
- Azure Bastion: connect via browser without public IP or NSG port 22/3389
- VM Extensions: run scripts post-deployment (Custom Script Extension, DSC, OMS Agent)

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AZ-104 Microsoft Azure Administrator

TOP TOPICS:
  VM series: B (burstable/dev), D (general), E (memory), F (compute), N (GPU), L (
  Availability Sets: fault domains (separate racks) + update domains (rolling rest
  Availability Zones: physically separate data centers in same region (higher SLA)
  VM Scale Sets (VMSS): autoscaling group; flexible orchestration recommended
```
