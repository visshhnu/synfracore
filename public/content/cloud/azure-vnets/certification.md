# Azure Virtual Networks Certification Guide

## Primary Certification

**AZ-700 Microsoft Azure Network Engineer Associate**

*Format*: 40-60 MCQ | 3 hours | 700/1000 | $165 USD

## Related Certifications

- AZ-104 Azure Administrator
- AZ-305 Azure Solutions Architect Expert

## Key Exam Topics

- VNet: isolated network; subnets; each resource gets private IP from subnet CIDR
- NSG (Network Security Group): stateful, layer 4 filtering; apply to subnet or NIC
- VNet Peering: non-transitive; works global (cross-region); must add routes if needed
- Azure Firewall vs NSG: Firewall = centralized L3-L7; NSG = local L4 only
- Private Endpoint vs Service Endpoint: Private = real private IP for service; Service = route optimization only
- VPN Gateway: site-to-site (IPSec) or point-to-site (VPN client); up to 10 Gbps
- ExpressRoute: private dedicated circuit (not over internet); 50 Mbps to 100 Gbps

## Must-Know CLI Commands

```bash
az network vnet create --name myVNet --resource-group myRG --address-prefix 10.0.0.0/16 --subnet-name default --subnet-prefix 10.0.1.0/24
az network nsg create --name myNSG --resource-group myRG
az network nsg rule create --nsg-name myNSG --resource-group myRG --name AllowHTTPS --priority 100 --protocol Tcp --destination-port-range 443 --access Allow
az network vnet peering create --name myPeering --resource-group myRG --vnet-name VNet1 --remote-vnet VNet2 --allow-vnet-access
az network private-endpoint create --name myPE --resource-group myRG --vnet-name myVNet --subnet default --private-connection-resource-id /subscriptions/.../storageAccounts/myaccount --group-ids blob --connection-name myPEConn
```

## Exam Tips

- VNet peering: bidirectional — must create peering in BOTH VNets
- Hub-spoke: hub VNet with Azure Firewall + shared services; spokes peer to hub
- Private DNS zones: required for private endpoints to resolve service FQDNs to private IPs
- Azure DDoS Protection Standard: $2,700/month but covers all public IPs in VNet

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
PRIMARY EXAM: AZ-700 Microsoft Azure Network Engineer Associate

TOP TOPICS:
  VNet: isolated network; subnets; each resource gets private IP from subnet CIDR
  NSG (Network Security Group): stateful, layer 4 filtering; apply to subnet or NI
  VNet Peering: non-transitive; works global (cross-region); must add routes if ne
  Azure Firewall vs NSG: Firewall = centralized L3-L7; NSG = local L4 only
```
