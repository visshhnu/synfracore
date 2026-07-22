# Cloud Security — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: CSPM Misconfiguration Scanner and Remediation Report

**Level:** Beginner | **Time:** 2 days

Build a script that scans a real (or sandbox) cloud account against the top-10 misconfiguration list — public buckets, open SSH/RDP, unencrypted storage, missing MFA, overly permissive IAM policies — and produces a prioritized findings report, similar in spirit to what a CSPM tool (Security Hub, Defender for Cloud, SCC) does automatically.

### Steps

1. Pick a cloud provider and stand up a small sandbox account (or a Terraform-provisioned test environment you fully control — never scan an account you don't own)
2. Deliberately introduce 3-4 real misconfigurations from the top-10 list (a public S3 bucket, a security group open to 0.0.0.0/0 on port 22, an IAM user with AdministratorAccess and no MFA)
3. Write a script (Python + boto3, or Azure/GCP SDK equivalent) that checks for each misconfiguration class using the provider's API
4. Output a findings report with severity, affected resource, and the specific remediation command for each finding
5. Fix each finding using the IaC/CLI command the report recommends, then re-run the scan to confirm it's clean
6. Write up the before/after in the README, including exactly what real-world impact each misconfiguration would have had

### Skills Demonstrated

- Real misconfiguration detection logic, not just memorized checklist items
- Cloud provider SDK/API usage
- Security findings triage and remediation workflow

### GitHub Repo Name

`cloud-security-cspm-scanner`

---

## Project 2: Least-Privilege IAM Policy Generator from Access Logs

**Level:** Intermediate | **Time:** 3 days

Build a tool that analyzes an IAM principal's actual API call history (CloudTrail, Activity Log, or Cloud Audit Logs) over a period and generates a least-privilege policy containing only the actions that principal genuinely used — the same problem AWS IAM Access Analyzer's policy generation feature solves, built from scratch to actually understand the mechanics.

### Steps

1. Set up a sandbox IAM role/service account and generate realistic activity against it (a script exercising a handful of specific API calls, not a broad admin role)
2. Enable and collect the relevant audit log (CloudTrail, Azure Activity Log, or GCP Audit Logs) for that principal over the activity period
3. Parse the log to extract the distinct set of actions and resources actually called
4. Generate a minimal IAM policy document containing exactly those actions, scoped to the specific resources used
5. Apply the generated policy in place of the original broad one, then re-run the same activity to confirm nothing breaks
6. Document the before/after permission count and explain what blast-radius reduction this represents if the credential were ever compromised

### Skills Demonstrated

- Audit log parsing and analysis
- IAM policy authoring and least-privilege reasoning
- Practical blast-radius/attack-surface reduction

### GitHub Repo Name

`cloud-security-least-privilege-generator`

---

## Project 3: Automated Detection-to-Remediation Pipeline

**Level:** Advanced | **Time:** 5 days

Build an event-driven pipeline that detects a specific security event (a new public S3 bucket, an IAM key created outside business hours, a security group opened to 0.0.0.0/0) and automatically remediates it within minutes, with a full audit trail — the pattern real cloud security teams use to close the gap between "detected" and "fixed" from hours to minutes.

### Steps

1. Pick 2-3 specific detectable events from the top-10 misconfiguration list to target (don't try to cover everything)
2. Set up the detection source: GuardDuty findings, EventBridge rules on CloudTrail events, or Azure/GCP equivalents (Defender for Cloud alerts, Cloud Audit Log-triggered Cloud Functions)
3. Build the remediation function (Lambda, Azure Function, or Cloud Function) that receives the event and takes the specific fix action — e.g., automatically applying S3 Block Public Access, or revoking a security group's offending rule
4. Add a safety mechanism: remediation actions should be logged with full context (what triggered it, what was changed, when) before or as they execute, and genuinely destructive actions should go through an approval step rather than firing blind
5. Test end-to-end: deliberately trigger the misconfiguration in a sandbox, confirm detection fires, confirm remediation executes, confirm the audit trail captures the full sequence
6. Document the mean-time-to-remediation improvement this represents versus manual detection and fixing, and explicitly call out what this pipeline does NOT cover (false-positive risk, remediation actions that could break a legitimate use case)

### Skills Demonstrated

- Event-driven security automation
- Incident response pipeline design with audit trail
- Understanding the tradeoffs of automated remediation (speed vs. blast-radius risk from a bad automated action)

### GitHub Repo Name

`cloud-security-auto-remediation-pipeline`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a Kubernetes cluster to deploy my personal blog" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
