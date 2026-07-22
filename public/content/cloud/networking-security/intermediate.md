# Cloud Networking & Security — Intermediate

## Transit Gateway: solving VPC peering's real scaling problem

VPC Peering connects two VPCs directly — simple, but it doesn't transit through a third VPC, and it doesn't scale: N VPCs that all need to talk to each other require roughly N²/2 individual peering connections, each managed separately. Transit Gateway solves this by acting as a central hub — every VPC attaches to it once, and routing between any two attached VPCs goes through the hub:

```
Without Transit Gateway (peering mesh):        With Transit Gateway (hub-spoke):
VPC-A ↔ VPC-B                                   VPC-A ↘
VPC-A ↔ VPC-C                                   VPC-B → Transit Gateway
VPC-B ↔ VPC-C                                   VPC-C ↗
(3 VPCs = 3 connections;                        (3 VPCs = 3 attachments;
 10 VPCs = 45 connections)                       10 VPCs = 10 attachments)
```
This matters most for multi-account AWS organizations, where new VPCs (new environments, new teams' accounts) get added over time — a peering-mesh design that was manageable at 5 VPCs becomes an operational burden at 20, while a Transit Gateway design scales by simply adding one new attachment per new VPC, with routing centrally managed rather than re-negotiated pairwise each time.

## VPC Endpoints: keeping traffic to AWS services off the public internet

By default, a private-subnet resource calling an AWS service like S3 routes that traffic out through a NAT Gateway to the public internet (even though the traffic never leaves AWS's own network in practice, it's routed as if it were internet-bound, incurring NAT Gateway data-processing charges and a real, if narrow, exposure surface). A VPC Endpoint creates a private, direct path to that AWS service instead:

```bash
# Gateway endpoint (S3, DynamoDB) — free, route-table based, no NAT charges for this traffic
aws ec2 create-vpc-endpoint \
  --vpc-id vpc-0123456789 \
  --service-name com.amazonaws.us-east-1.s3 \
  --route-table-ids rtb-0123456789

# Interface endpoint (most other services) — an ENI in your subnet, small hourly cost
aws ec2 create-vpc-endpoint \
  --vpc-id vpc-0123456789 \
  --service-name com.amazonaws.us-east-1.secretsmanager \
  --vpc-endpoint-type Interface \
  --subnet-ids subnet-0123456789
```
Beyond the cost savings (avoiding NAT Gateway data-processing fees for this traffic), the security argument is the more important one for a genuinely private architecture: a private subnet with no NAT Gateway at all, reaching AWS services purely via VPC Endpoints, has *no path to the public internet whatsoever* — a meaningfully stronger isolation guarantee than "outbound-only via NAT" for workloads that only ever need to reach AWS's own services.

## Web Application Firewall (WAF): the layer above network-level controls

Security Groups and NACLs operate on IP/port — they can't distinguish "legitimate HTTPS request" from "a SQL injection attempt over HTTPS," since both look identical at the network layer. A WAF inspects actual HTTP request content and blocks based on application-layer patterns:

```json
{
  "Name": "block-sql-injection",
  "Priority": 1,
  "Statement": {
    "SqliMatchStatement": {
      "FieldToMatch": { "AllQueryArguments": {} },
      "TextTransformations": [{ "Priority": 0, "Type": "URL_DECODE" }]
    }
  },
  "Action": { "Block": {} }
}
```
The practical placement matters: a WAF (AWS WAF, Azure Front Door's WAF, Cloudflare) sits in front of the load balancer, inspecting requests before they ever reach application infrastructure — this is a genuinely different layer of defense from network segmentation, and skipping it because "we already have Security Groups" is a common gap, since Security Groups fundamentally cannot see or filter on request content.

## Flow logs: the visibility layer that makes "assume breach" actually actionable

Zero Trust's "assume breach, monitor all traffic" principle is only useful if traffic is actually being logged somewhere reviewable — VPC Flow Logs (AWS) or NSG Flow Logs (Azure) capture metadata (source/destination IP, port, protocol, accept/reject, byte count) for every connection through a VPC/subnet:

```bash
# Enable VPC Flow Logs to CloudWatch Logs for later analysis/alerting
aws ec2 create-flow-logs \
  --resource-type VPC \
  --resource-ids vpc-0123456789 \
  --traffic-type ALL \
  --log-destination-type cloud-watch-logs \
  --log-group-name /vpc/flow-logs
```
Flow logs don't capture packet content (they're metadata, not a full packet capture) — but metadata alone is enough to detect a meaningful class of real incidents: unexpected traffic between subnets that should never communicate, a sudden spike in outbound traffic to an unfamiliar IP (a possible data exfiltration signal), or repeated rejected connection attempts against a specific port (a possible scan). Enabling flow logs costs relatively little and provides exactly the visibility "assume breach" requires to actually be detectable rather than just a design principle on paper.

## NSG vs. Azure Firewall — when the free option isn't enough

| | NSG | Azure Firewall |
|---|---|---|
| Layer | L4 (IP/port) | L4 + L7 |
| FQDN filtering | No | Yes — e.g. allow only `*.github.com` outbound |
| Centralized management | Per-NIC/subnet, decentralized | Centralized policy across a hub-spoke topology |
| Cost | Free | Paid *(needs verification — Azure Firewall's hourly rate changes with SKU/region; previously stated here as ~$1.25/hour)* plus data processing |

The upgrade from NSG to Azure Firewall is worth making specifically when FQDN-based outbound filtering matters — restricting egress to a named allowlist of external domains (`*.github.com`, `pypi.org`) rather than just IP ranges, which is meaningfully harder to maintain correctly with IP-based rules alone since many SaaS/package-registry services don't publish stable IP ranges. For simpler environments where IP/port-level control is genuinely sufficient, NSGs alone remain a reasonable, cost-free choice.
