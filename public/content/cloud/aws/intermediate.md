# Amazon Web Services — Intermediate

## IAM Roles over IAM Users for anything application-facing

An IAM User has long-lived credentials (an access key/secret pair) that exist until someone manually rotates or revokes them. An IAM Role issues short-lived, temporary credentials assumed at runtime — no static secret to leak, store, or rotate manually. **Applications and services should always use Roles, never a User's static access keys** — a leaked short-lived role credential expires on its own within hours; a leaked long-lived user access key remains valid indefinitely until someone notices and acts.

```bash
aws sts assume-role --role-arn arn:aws:iam::123456789:role/app-role --role-session-name my-session
```

## IRSA: IAM Roles for Service Accounts, precisely

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: myapp-sa
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789:role/myapp-role
```

IRSA lets an EKS pod assume a specific IAM role directly, scoped to that pod's own Kubernetes ServiceAccount — no access keys stored anywhere in the cluster. This is the same category of improvement as Azure's Managed Identity or GCP's Workload Identity (worth recognizing as the same underlying pattern across all three major clouds): federate a Kubernetes-native identity directly to the cloud provider's IAM, rather than embedding a long-lived credential as a Kubernetes Secret.

## SCPs: organization-wide guardrails, not per-account permissions

Service Control Policies apply at the AWS Organizations level, restricting what an entire account (or group of accounts) can do — even the account's own root user can't exceed an SCP's boundary. This is a different layer from IAM policies: IAM grants permissions within an account; SCPs set the outer boundary an account can never exceed, regardless of what IAM policies inside it grant. A common real pattern: an SCP blocking specific regions entirely (for compliance/data-residency reasons) or blocking specific high-risk actions (disabling CloudTrail, leaving the organization) across every account, so no individual account's IAM misconfiguration can violate an organization-wide requirement.

## Multi-AZ as the actual production baseline, not an upgrade

With 2-6 Availability Zones per region, a single-AZ deployment shares one failure domain — an AZ-level event (which does happen, at real cloud scale) takes down everything in it, regardless of how many redundant instances you're running within that one zone. Multi-AZ (replicas spread across at least 2, commonly 3 AZs) is the actual minimum bar for "production-ready" on AWS — not an optional resilience upgrade to consider later.

## VPC design: the decisions that are hard to change later

```
Production VPC: 10.0.0.0/16
  Public subnet (per AZ):  10.0.1.0/24, 10.0.2.0/24   — load balancers, NAT gateways
  Private subnet (per AZ): 10.0.10.0/22, 10.0.14.0/22  — application servers
  Database subnet (per AZ): 10.0.20.0/24, 10.0.21.0/24 — isolated, no direct internet route
```
CIDR range planning matters disproportionately early, because changing a VPC's CIDR block later is disruptive — plan non-overlapping ranges across environments (prod/staging/dev) from the start if VPC peering or a future multi-account setup is even plausible, since overlapping CIDRs block peering entirely and require a genuinely painful re-IP to fix after the fact.

## Cost visibility: tagging as a prerequisite, not an afterthought

```bash
aws resourcegroupstaggingapi tag-resources --resource-arn-list <arns> --tags Environment=production,Team=payments
```
Cost Explorer and Cost Allocation Reports are only as useful as your tagging discipline — untagged resources show up as unattributed spend, with no way to retroactively determine which team or project it belonged to without manual investigation. Establishing tagging as a required, enforced convention (via SCPs or automated policy checks) before resources sprawl is far cheaper than trying to retrofit tags onto hundreds of already-created, already-costing resources later.
