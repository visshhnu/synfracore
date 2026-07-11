# Cloud Security — Quick Reference

## IAM policy evaluation order (AWS)

```
1. Explicit Deny (anywhere in the chain: SCP, permission boundary, policy) → DENY, always wins
2. Explicit Allow → ALLOW
3. Implicit Deny (default, nothing matched) → DENY
```

## Security group vs. NACL, quick comparison

| | Security Group | NACL |
|---|---|---|
| Level | Instance/ENI | Subnet |
| State | Stateful (return traffic auto-allowed) | Stateless (both directions need explicit rules) |
| Rule type | Allow only | Allow and Deny |
| Evaluation | All rules evaluated together | Rules evaluated in numbered order, first match wins |

## Core AWS security services, one-line purpose

| Service | Purpose |
|---|---|
| GuardDuty | ML-based threat detection |
| Security Hub | Aggregated findings, central view |
| Config | Configuration drift/compliance detection |
| Inspector | Vulnerability scanning (EC2, containers, Lambda) |
| Macie | Sensitive-data (PII) discovery in S3 |
| CloudTrail | API audit log — who did what, when |
| WAF | L7 web application firewall |
| Shield | DDoS protection (L3/L4) |
| IAM Access Analyzer | Finds unused/over-broad permissions |

## Common CSPM findings, quick triage guide

| Finding | Typical urgency |
|---|---|
| Public S3 bucket/blob with sensitive data | Immediate — active exposure |
| Security group open to 0.0.0.0/0 on admin ports (22/3389) | Immediate |
| Root account without MFA | Immediate |
| CloudTrail not enabled in all regions | High — closes a visibility gap |
| Unencrypted storage (RDS/EBS) | High, SLA-based |
| IAM access keys older than 90 days | Medium, SLA-based |
| No password policy | Medium |

## IMDSv1 vs IMDSv2 (AWS metadata service)

| | IMDSv1 | IMDSv2 |
|---|---|---|
| Access | Simple GET request | Requires a session token via PUT first |
| SSRF exploitability | Vulnerable to simple SSRF (GET-only exploit works) | Blocks typical SSRF (needs the PUT step too) |
| Recommendation | Disable | Enforce IMDSv2-only |

## Incident response order for a compromised credential

```
1. Revoke/rotate the credential — stop ongoing access first
2. Investigate scope — CloudTrail history for what it actually accessed
3. Remediate root cause — how it leaked, and fix that specific gap
```

## Zero Trust — core principles, quick reference

- Never trust based on network location alone
- Verify identity + authorization explicitly, every request
- Grant minimum access per-request, not broad standing access
- Enforce policy at every service boundary, not just the perimeter
