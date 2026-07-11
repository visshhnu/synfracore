# Cloud Security — Intermediate

## SSRF against cloud metadata services — a real, well-documented attack class

Cloud instances typically expose an internal metadata service (reachable only from the instance itself, at a fixed internal address) that provides instance configuration — including, critically, temporary IAM credentials for the instance's attached role. A Server-Side Request Forgery (SSRF) vulnerability in an application running on that instance — where an attacker can trick the server into making a request to an arbitrary URL — can be used to make the vulnerable server request the metadata endpoint on the attacker's behalf, exfiltrating those IAM credentials through the vulnerable application itself. This is a genuinely important, well-documented real attack class (see Real World), not a theoretical edge case.

The specific, concrete defense: **Instance Metadata Service v2 (IMDSv2)** on AWS requires a session token obtained via a PUT request before GET requests to the metadata service succeed — this specifically breaks simple SSRF exploitation, since a typical SSRF vulnerability only lets an attacker control the destination URL and method of a GET request, not inject the token-request step IMDSv2 requires first. Enforcing IMDSv2-only (disabling the older IMDSv1 fallback) on every instance is a concrete, high-value hardening step, not just a recommended best practice.

## CSPM in practice: from a list of findings to actual remediation

Overview lists common CSPM-detected misconfigurations, but the intermediate skill is triage and remediation workflow, not just recognizing the list. A real CSPM deployment produces a continuous stream of findings, and not all carry equal urgency — a genuinely useful triage framework:

- **Internet-facing + high privilege** (a publicly readable S3 bucket containing sensitive data, a security group open to 0.0.0.0/0 on an admin port) — remediate immediately, treat as an active incident risk, not a backlog item.
- **Internet-facing + low sensitivity**, or **internal + high privilege** — remediate on a defined SLA (days, not months), since it's a real risk but not immediately exploitable from the open internet against sensitive data.
- **Internal + low sensitivity** — track and remediate, but reasonable to batch into regular maintenance rather than treating as urgent.

Without an explicit triage framework like this, CSPM tools commonly produce alert fatigue — hundreds of findings with no clear prioritization lead teams to eventually start ignoring the tool's output entirely, which defeats its purpose.

## IAM policy analysis beyond "does this work"

A policy that grants the access a role needs to function isn't automatically a *good* policy — it needs review against what it grants beyond that need. Common intermediate-level review targets: wildcard resources (`"Resource": "*"`) where a specific ARN would work just as well for the role's actual function, wildcard actions (`"Action": "s3:*"`) where the role only actually needs `s3:GetObject`, and policies granted "temporarily" during initial development that were never tightened afterward. Tools like AWS IAM Access Analyzer can identify unused permissions granted to a role based on actual access history — a practical way to find and trim over-permissioning that manual policy review alone tends to miss.

## Secrets management: beyond "don't hardcode credentials"

Overview's checklist says secrets belong in a dedicated vault, not hardcoded — the intermediate-level question is what that actually requires operationally: automatic rotation (a secret that's never rotated is a standing risk indistinguishable in practice from a hardcoded one, just stored more conveniently), access logging on secret retrieval (knowing *when* and *by what* a secret was accessed, not just that it exists in a vault), and scoping secret access via IAM the same way you'd scope any other resource access — a secrets vault with no access controls of its own just relocates the hardcoded-credential problem rather than solving it.

## Logging and monitoring: what "enabled" actually needs to mean

CloudTrail/Activity Log "enabled" (per Overview's checklist) is a necessary but incomplete condition — the intermediate-level requirements: logs enabled in *every* region (a common gap: enabling logging only in your primary region while an attacker operates in a region you're not monitoring), logs shipped to a separate, access-restricted destination (an attacker with sufficient access could otherwise delete or tamper with logs in the same account they're compromising), and actual alerting rules on top of raw logs — a log that's collected but never reviewed or alerted on provides forensic value after the fact, but no real-time protection.
