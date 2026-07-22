# Cost Optimization — Portfolio Projects

Build these to prove you can actually find and eliminate waste, not just recite savings-plan percentages. Each project maps to a real FinOps practitioner task.

## Project 1: Automated Waste-Detection and Cleanup Pipeline

**Level:** Beginner | **Time:** 2 days

Build a scheduled Lambda function that scans an AWS account for the classic waste categories — unattached EBS volumes, unassociated Elastic IPs, snapshots older than 90 days, idle load balancers — and reports them (don't auto-delete on a first pass; that's how you accidentally delete something someone needed).

### Steps

1. Write a Lambda function using `describe-volumes`/`describe-addresses`/`describe-snapshots` to find each waste category
2. Tag each finding with an estimated monthly cost (EBS `$/GB-month`, EIP `$/hr` when unattached)
3. Publish a summary to SNS/Slack on a daily EventBridge schedule
4. Add a `--dry-run` vs `--delete` mode, defaulting to dry-run — document why auto-deletion without a grace period is risky (a "temporary" test resource someone's about to need again)
5. Track findings week over week to show whether the waste rate is actually improving

### Skills Demonstrated

- AWS SDK/CLI resource auditing
- Cost estimation from raw resource metadata
- Safe-by-default automation design (dry-run before destroy)

### GitHub Repo Name

`aws-waste-detection-pipeline`

---

## Project 2: Right-Sizing Recommendation Digest

**Level:** Intermediate | **Time:** 3 days

Build a weekly digest that pulls AWS Compute Optimizer's findings, cross-references them against actual CloudWatch utilization, and produces a ranked, dollar-estimated list of right-sizing opportunities — the kind of report a FinOps practitioner actually hands to engineering teams.

### Steps

1. Pull findings via `aws compute-optimizer get-ec2-instance-recommendations`
2. For each `OVER_PROVISIONED` finding, pull the instance's actual CPU/memory utilization over the trailing 2 weeks from CloudWatch, so the recommendation has real evidence attached, not just Compute Optimizer's verdict alone
3. Estimate the monthly savings for each recommended instance-type change
4. Rank by dollar impact, not alphabetically — the top of the report should be the instance costing the most for what it's actually using
5. Publish per-team (using cost-allocation tags) so each team sees only their own instances, not the whole account's

### Skills Demonstrated

- Compute Optimizer + CloudWatch integration
- Turning raw recommendations into an actionable, evidence-backed report
- Per-team cost attribution via tags

### GitHub Repo Name

`rightsizing-recommendation-digest`

---

## Project 3: Multi-Account Cost Allocation and Budget-Alert Platform

**Level:** Advanced | **Time:** 5 days

Design a cost-visibility platform across a multi-account AWS Organization: enforced tagging, per-team showback dashboards, and proactive budget alerts before a team blows through their monthly allocation — not after the bill arrives.

### Steps

1. Define a required-tags policy (Team/Project/Environment/Owner) and enforce it with an SCP or Config Rule that flags non-compliant resources
2. Pull consolidated billing data via Cost Explorer's API, grouped by tag, across all member accounts
3. Build a showback dashboard (even a simple QuickSight or Grafana view) so each team can see their own spend trend without needing account-admin access
4. Set AWS Budgets with alert thresholds (50%/80%/100% of monthly allocation) per team, notifying the team's own Slack channel — not just a central FinOps inbox nobody checks
5. Add a monthly "commitment coverage" report: what % of steady-state usage is covered by Reserved Instances/Savings Plans vs. still running On-Demand unnecessarily

### Skills Demonstrated

- AWS Organizations + Cost Explorer API at multi-account scale
- Tag-enforcement guardrails, not just tag-suggestion documentation
- Proactive (before-the-bill) vs. reactive (after-the-bill) cost governance

### GitHub Repo Name

`multi-account-cost-platform`

---

## Tips for Great Projects

**Make it real.** Run these against your own free-tier account first — a waste-detection tool that's never found a single unattached volume in a real account is a tool you haven't actually tested.

**Show the dollar figures.** "Found 3 unattached EBS volumes" is weaker than "Found 3 unattached EBS volumes costing an estimated $14/month — here's the math." FinOps is fundamentally about making cost visible in concrete terms, and your portfolio project should demonstrate that same instinct.

**Explain a real tradeoff.** Why dry-run by default? Why per-team dashboards instead of one account-wide view? Being able to explain the reasoning, not just the implementation, is what a FinOps interview actually probes for.

## Portfolio Checklist

- [ ] All 3 projects on GitHub with clear READMEs showing real (or realistic sandbox) findings, not mocked data
- [ ] At least one project outputs an actual dollar-estimated savings figure, with the math shown
- [ ] At least one project demonstrates safe-by-default automation (dry-run/confirmation before anything destructive)
- [ ] Each project's README explains why the specific cost-governance approach was chosen, not just what it does
