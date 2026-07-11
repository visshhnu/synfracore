# Microsoft Azure — Intermediate

## AKS node pools: system vs. user, and why the split exists

An AKS cluster's **system node pool** runs cluster-critical components (CoreDNS, metrics-server, the AKS-managed control plane's supporting agents); the **user node pool(s)** run your actual application workloads. Keeping these separate — rather than one shared pool — means a resource-hungry application can't starve the cluster's own critical components of capacity, and lets you scale/configure application node pools independently (different VM sizes, different autoscaling ranges) from the system pool's more stable, predictable needs.

## Azure CNI vs. Kubenet: a real networking tradeoff, not just a default choice

**Kubenet** is simpler and uses fewer IP addresses (pods get IPs from a separate, internal range, NAT'd for external communication) — easier to set up, but limits some Azure-native networking integrations. **Azure CNI** gives every pod a real, routable IP directly from the VNet's address space — better for enterprise networking scenarios needing direct pod-to-on-premises connectivity, Network Policies, or integration with other Azure networking features, at the cost of consuming meaningfully more IP address space per cluster (worth planning your VNet CIDR sizing around before deploying, since running out of pod IPs mid-cluster-lifecycle is a genuinely disruptive problem to fix after the fact).

## Application Gateway: L7 load balancing with WAF built in

Unlike a basic L4 load balancer (routing purely on IP:port), Application Gateway operates at L7 — routing decisions can be based on URL path, host header, or cookies, and it includes an integrated Web Application Firewall (WAF) providing OWASP-rule-based protection against common web attack patterns (SQL injection, XSS) at the edge, before traffic ever reaches application pods. AGIC (Application Gateway Ingress Controller) lets Kubernetes Ingress resources drive Application Gateway configuration directly, combining Kubernetes-native routing definitions with Azure's own L7/WAF capability rather than needing a separate in-cluster Ingress controller.

## Private Endpoints: keeping PaaS traffic off the public internet entirely

By default, Azure PaaS services (Storage accounts, Azure SQL) are reachable via a public endpoint, secured by access keys/firewall rules — but the traffic path itself still traverses the public internet. A Private Endpoint provisions a private IP address, from your own VNet, for that specific PaaS resource — traffic never leaves Azure's private backbone network at all. This is a meaningfully stronger security posture than public-endpoint-plus-firewall-rules for anything handling sensitive data, and increasingly a default expectation in enterprise Azure environments rather than an advanced option.

## KQL: the query language every Azure Monitor investigation needs

```kql
AppRequests
| where TimeGenerated > ago(1h)
| where Success == false
| summarize FailureCount = count() by bin(TimeGenerated, 5m), Name
| order by TimeGenerated desc
```
Kusto Query Language (KQL) is what Log Analytics and Application Insights are queried through — genuinely similar to SQL in structure (filtering, aggregation, grouping) but with its own pipe-based syntax (`|` chaining operations) and its own function library. Fluency here directly determines how fast you can actually investigate an incident using Azure Monitor's log data — reaching for the Azure Portal's UI-based filters alone is meaningfully slower than a well-constructed KQL query once you're comfortable writing them.

## Conditional Access: identity-aware, context-sensitive access policies

Beyond basic RBAC (who can do what), Conditional Access in Entra ID adds context-sensitive rules — requiring MFA specifically for access from an unfamiliar location, blocking sign-in from specific countries, requiring a compliant/managed device for accessing sensitive resources. This is a genuinely different layer from RBAC: RBAC defines permissions once a session is authenticated; Conditional Access determines the *conditions* under which authentication itself is allowed to succeed, or what additional verification it requires, based on real-time signals about the request's context.
