# Cloud Security — Learning Roadmap

## Stage 1 — Cloud + security fundamentals, if not already solid (2-3 weeks)

Don't start cloud-security-specific learning without genuine comfort in both general cloud infrastructure and general security concepts (see Prerequisites) — this page assumes both as a floor, not a starting point to build from zero.

## Stage 2 — IAM depth (1-2 weeks)

Spend real, deliberate time on IAM specifically — Fundamentals and Intermediate both treat it as the center of cloud security for a reason (it's where the most real incidents trace back to). Practice writing least-privilege policies, understand the policy-evaluation logic precisely (explicit deny wins, see Fundamentals), and use IAM Access Analyzer or an equivalent tool against your practice account to find and trim over-permissioning you've introduced.

## Stage 3 — Enable and interpret detection tooling (1-2 weeks)

Enable GuardDuty, Security Hub, and CloudTrail (see Installation) in a practice account, then deliberately trigger a few detectable conditions (an intentionally-public S3 bucket, an overly-open security group) and observe what gets flagged and how. Reading a checklist of "things CSPM detects" is much less useful than watching your own practice environment actually get flagged for something you configured on purpose.

## Stage 4 — Network security layers, hands-on (1 week)

Practice the security group vs. NACL distinction (Fundamentals) directly — configure both on a small practice VPC and deliberately misconfigure one to observe the difference between stateful and stateless filtering behavior firsthand, rather than only understanding it as a definition.

## Stage 5 — SSRF and metadata-service security specifically (3-5 days)

This deserves dedicated, focused time given how consequential this specific attack class has been historically (see Intermediate and Real World) — understand SSRF conceptually, understand exactly what IMDSv2 changes and why it specifically breaks the common exploitation path, and verify (don't assume) that IMDSv2 enforcement is actually configured on instances in any environment you're responsible for.

## Stage 6 — Triage and incident response process (1-2 weeks)

Build a genuine triage framework for CSPM findings (see Intermediate) rather than treating every finding as equally urgent, and study the credential-compromise response order (revoke, investigate, remediate root cause — see Advanced) until it's a fast, automatic sequence rather than something you'd have to think through from scratch during an actual incident.

## Stage 7 — Advanced architecture and supply chain security (ongoing)

Zero Trust implementation, container/Kubernetes-specific security, and supply chain security (see Advanced) are genuinely deep areas each — pick the one most relevant to your actual work environment and go deep there rather than shallow across all three.

## What "done" looks like at each level

- **Junior-ready**: understands the shared responsibility model precisely, can write a reasonably scoped least-privilege IAM policy, knows what each core detection service (GuardDuty, Security Hub, CloudTrail) actually does.
- **Mid-level-ready**: has a real CSPM triage framework, understands SSRF/metadata-service risk and IMDSv2's specific defense mechanism, can read CloudTrail logs to investigate a specific access pattern.
- **Senior-ready**: can design a genuine Zero Trust architecture for a real system, has a fast, practiced credential-compromise response process, and treats compliance as continuously-verified infrastructure rather than a periodic audit exercise.
