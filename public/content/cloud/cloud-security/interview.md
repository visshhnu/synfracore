# Cloud Security — Interview Questions

**What is the AWS shared responsibility model?**
AWS is responsible for "security OF the cloud" — physical data centers, hardware, global infrastructure, managed service underlying security, hypervisor. Customer is responsible for "security IN the cloud" — data encryption, identity and access management (IAM), network configuration (VPC, security groups), OS patching (for EC2), application security, compliance. For managed services like RDS: AWS handles OS/database patching, you handle network access, encryption, backups, authentication. Boundary shifts as you move from IaaS (EC2) to PaaS (Lambda) to SaaS.

**How do you respond to a compromised AWS access key?**
Immediate: deactivate/delete the key immediately (IAM console or CLI). CloudTrail: query last 90 days of activity for the key — what actions were performed, what was created? Scope damage: check for new IAM users, EC2 instances, S3 changes, Route53 records, Lambda functions. Revoke sessions: aws iam delete-login-profile if console access was possible, revoke all sessions. Clean up: remove any resources created by attacker, change all secrets that may have been accessed. Rotate: rotate any credentials the attacker may have seen. Post-incident: add CloudTrail alarms, enable GuardDuty, implement MFA requirements.

**What is CloudTrail and why is it essential for security?**
CloudTrail logs every API call made to AWS services — who called what API, from which IP, at what time, on which resource. Essential because: it's the audit trail for all actions in your AWS account. Security uses: detect unauthorized API calls, investigate incidents (who deleted that S3 bucket?), compliance requirements (PCI-DSS, SOC2, ISO27001 require audit logs), detect configuration changes. Best practices: enable in all regions, send to CloudWatch for alerting, store in S3 with MFA delete protection, enable log file validation (detect tampering), never disable CloudTrail (alert on attempts).
