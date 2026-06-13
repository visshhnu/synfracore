# Cloud Security — Advanced + Interview + Cheatsheet

## Cloud Security Posture Management (CSPM)

```bash
# Prowler — open source CSPM for AWS, Azure, GCP
pip install prowler
prowler aws                    # All checks
prowler aws --severity critical high
prowler aws -c s3_bucket_public_access --output-formats json html
prowler azure --subscription-id xxxxx

# ScoutSuite — multi-cloud security auditing
pip install scoutsuite
scout aws --report-name report
scout azure --tenant xxx --subscription xxx
scout gcp --project my-project

# Results show: misconfigurations, excessive permissions,
# exposed services, compliance gaps (CIS benchmarks)

# Checkov — scan IaC for misconfigs before deploy
pip install checkov
checkov -d ./terraform/          # Scan Terraform
checkov -f cloudformation.yaml  # Scan CloudFormation
checkov -d ./k8s/               # Scan Kubernetes manifests
checkov --framework arm         # Azure ARM templates
```

## Cloud Security Cheatsheet + Interview

```bash
# ── DETECTIVE CONTROLS ────────────────────────────────────
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=ConsoleLogin
aws cloudtrail lookup-events --lookup-attributes AttributeKey=Username,AttributeValue=root

aws guardduty list-findings --detector-id xxx
aws securityhub get-findings --filters '{"SeverityLabel":[{"Value":"CRITICAL","Comparison":"EQUALS"}]}'

aws config get-compliance-summary-by-config-rule
aws config get-compliance-details-by-config-rule --config-rule-name s3-bucket-public-read-prohibited

# ── COMMON CLOUD SECURITY ISSUES ─────────────────────────
S3 bucket open to public               → Block public access at account level
Long-term IAM access keys              → Use IAM roles, SSO for humans
Root account used without MFA         → Enable MFA, stop using root
Security groups with 0.0.0.0/0 SSH    → Restrict to known IPs or use SSM
Unencrypted EBS volumes                → Enforce encryption by default
No CloudTrail in some regions          → Enable multi-region trail
RDS publicly accessible               → Set publicly-accessible=false
Lambda with excessive IAM permissions  → Least privilege per function

# ── INTERVIEW QUESTIONS ───────────────────────────────────
Q: What is the shared responsibility model?
A: Provider: hardware, infrastructure, managed service security.
   Customer: data, identity, network config, OS patching (for IaaS),
   application security, compliance.

Q: How do you detect an EC2 instance doing crypto mining?
A: GuardDuty CryptoCurrency finding (ML-detected unusual traffic).
   CloudWatch: CPU spike to 100% sustained.
   VPC Flow Logs: unusual outbound connections to mining pool IPs.
   Cost alerts: unexpected EC2 cost increase.

Q: How do you respond to a compromised IAM access key?
A: 1. Deactivate/delete the key immediately.
   2. CloudTrail: audit what the key was used for.
   3. Revoke any sessions (aws iam delete-login-profile if console).
   4. Check for resources created (EC2, IAM users, S3 changes).
   5. Remove any persistence mechanisms (new IAM users, roles).
   6. Rotate all credentials that may have been exposed.
```
