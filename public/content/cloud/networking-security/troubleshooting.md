# Cloud Networking & Security — Troubleshooting

## A Security Group rule looks correct but traffic is still blocked

Before assuming the Security Group rule itself is wrong, check the layers around it in order: **NACLs** (a Security Group can correctly allow traffic that a subnet-level NACL still blocks — NACLs are evaluated independently and a Security Group allow doesn't override a NACL deny), **route tables** (a subnet with no route to the destination, or a missing route back for asymmetric traffic, produces the same symptom as a blocked port), and **the resource's own OS-level firewall** (a Security Group allowing port 443 does nothing if the instance's own firewall — `iptables`, Windows Firewall — is independently blocking it). The systematic check, in order: confirm the route exists, confirm the NACL allows it in both directions (remembering NACLs are stateless), confirm the Security Group allows it, then confirm the OS-level firewall isn't also blocking it — skipping straight to "the Security Group must be wrong" misses three other equally common causes.

## NAT Gateway costs are far higher than expected

NAT Gateway charges are per-GB of data processed, not just an hourly rate — a workload that seemed cheap based on the hourly NAT Gateway cost alone can have a much larger real bill once data-processing charges for actual traffic volume are included. The most common real cause of unexpectedly high NAT costs: traffic to AWS's own services (S3, DynamoDB, Secrets Manager) routing through the NAT Gateway unnecessarily, when a VPC Endpoint (covered on the Intermediate tab) would route that same traffic privately at little to no cost. Auditing what's actually generating NAT Gateway data volume (VPC Flow Logs, filtered to traffic destined for the NAT Gateway's ENI) commonly reveals a meaningful fraction is AWS-service traffic that a VPC Endpoint would eliminate entirely.

## DNS resolution fails across a VPC peering connection

VPC Peering does not automatically enable DNS resolution across the peered VPCs by default — connectivity at the network layer (routing, Security Groups) can be entirely correct while DNS queries for resources in the peered VPC still fail to resolve, because DNS resolution over peering is a separate, explicit setting:

```bash
# Must be explicitly enabled on both sides of a peering connection
aws ec2 modify-vpc-peering-connection-options \
  --vpc-peering-connection-id pcx-0123456789 \
  --accepter-peering-connection-options AllowDnsResolutionFromRemoteVpc=true

aws ec2 modify-vpc-peering-connection-options \
  --vpc-peering-connection-id pcx-0123456789 \
  --requester-peering-connection-options AllowDnsResolutionFromRemoteVpc=true
```
This is a genuinely common gap specifically because it's easy to test connectivity by IP address (which works fine, since routing is correct) and conclude everything's working, without separately testing DNS resolution, which silently fails until this option is explicitly enabled on both sides of the peering connection.

## Asymmetric routing breaks a stateful connection unexpectedly

If traffic appears to flow correctly in one direction but a connection still fails or resets, asymmetric routing is a common real cause in more complex multi-VPC/hybrid topologies: request traffic takes one path (through a Transit Gateway, say) but the response takes a different path (directly, bypassing the same hub) — a stateful device anywhere in that path (a firewall, a NAT device) that only sees half the conversation will often drop it, since it never sees the traffic pattern it expects for an established, valid connection. Diagnosing this requires tracing the actual path in both directions independently (not just confirming "a route exists" in the direction being tested) — route table entries and any relevant BGP/routing-priority configuration in both directions need to agree on a consistent, single path for the connection to be evaluated correctly end-to-end by any stateful device along the way.

## A WAF rule is blocking legitimate traffic

A WAF configured with broad managed rule sets (SQL injection, XSS protection) can produce false positives against legitimate application traffic that happens to match a pattern too broadly — a search field containing text that superficially resembles a SQL injection pattern, for instance. The systematic fix is not disabling the rule set entirely (which removes real protection) but using the WAF's **count mode** first — run new or broad rules in count-only mode (logging matches without blocking) against real production traffic for a period before switching to block mode, which surfaces false positives against real traffic patterns before they cause a genuine outage, rather than discovering them only after legitimate users are already being blocked.
