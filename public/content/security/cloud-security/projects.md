# Cloud Security — Portfolio Projects

## Project 1: CSPM audit of your own practice account (Beginner)

Run ScoutSuite or Prowler (see Installation) against a practice account you've deliberately configured with a few realistic misconfigurations (a public S3 bucket, an open security group, a root account without MFA), then write up the findings and remediate each one.

**What this demonstrates:** you can operate real security tooling and interpret its output, not just recite a list of misconfiguration types. **What to show:** the before/after audit reports, and your remediation steps for each finding — the remediation matters as much as the detection.

## Project 2: Least-privilege IAM policy from scratch (Beginner/Intermediate)

Take an application with a specific, defined function (a Lambda that reads from one S3 bucket and writes to one DynamoDB table, for example) and write an IAM policy granting exactly what it needs — no wildcards, no broader access than the function requires — then verify it using IAM Access Analyzer or by testing that the function fails correctly when it tries something outside its granted scope.

**What this demonstrates:** genuine least-privilege policy-writing skill, which is a distinct, practiced ability separate from just knowing the concept. **What to show:** the policy itself, and evidence of the negative test (confirming the function *can't* do something it shouldn't be able to) — a policy that hasn't been tested against its own boundaries isn't verified, just written.

## Project 3: Detect and respond to a simulated SSRF/metadata-service exposure (Intermediate)

In a practice environment, deploy a deliberately vulnerable small application with an SSRF flaw, demonstrate extracting instance metadata/credentials through it with IMDSv1 enabled, then enable IMDSv2 enforcement and demonstrate the same exploitation attempt failing.

**What this demonstrates:** hands-on understanding of one of the most consequential real cloud attack classes (see Intermediate/Real World) and its concrete defense — far more convincing than describing IMDSv2 abstractly. **What to show:** both the successful exploitation (IMDSv1) and the blocked attempt (IMDSv2), side by side — the contrast is the actual point.

## Project 4: Build a CSPM finding triage and alerting pipeline (Intermediate/Advanced)

Take Security Hub or an equivalent CSPM tool's findings and build a simple pipeline that triages them by the internet-facing/privilege framework from Intermediate, routing high-priority findings to immediate alerting (even a simple Slack/email webhook) and lower-priority ones to a tracked backlog.

**What this demonstrates:** understanding that raw CSPM output isn't itself a security program — the triage and response workflow around it is what makes findings actionable rather than ignored. **What to show:** the triage logic itself (your actual prioritization criteria, not just "high/medium/low" labels with no defined meaning behind them).

## Project 5: Incident response tabletop exercise, documented (Advanced)

Write a realistic scenario (a leaked IAM access key, discovered via an unusual API call pattern) and walk through the full response process — detection, credential revocation, scope investigation via CloudTrail, root cause remediation — as a documented runbook, then actually execute it against a practice account with a real (test) leaked key.

**What this demonstrates:** the difference between knowing the theoretical response order (see Advanced) and having a genuinely practiced, fast process — this is exactly what real incident response interviews and senior security roles probe for. **What to show:** the runbook, plus a timed walkthrough of actually executing it — the elapsed time itself is a meaningful data point to include.
