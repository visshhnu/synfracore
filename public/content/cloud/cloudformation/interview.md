# CloudFormation — Interview Questions

**What is the difference between CloudFormation and Terraform?**
Both are IaC tools but differ in approach. CloudFormation is AWS-native: deep integration, no separate state file (AWS manages state), supports StackSets for multi-account, free to use. Terraform is multi-cloud: works with AWS, Azure, GCP and 1000+ providers, stores state in S3/Terraform Cloud, larger community, HCL syntax is more flexible. CloudFormation is often preferred for AWS-only shops; Terraform for multi-cloud environments.

**What happens if a CloudFormation stack fails mid-deployment?**
By default, CloudFormation rolls back to the previous known-good state. All resources created in the failed update are deleted or reverted. You can configure `--on-failure DO_NOTHING` or `--on-failure ROLLBACK` (default). The stack goes to ROLLBACK_COMPLETE or UPDATE_ROLLBACK_COMPLETE status. Check stack events to see which resource failed and why. Use `--disable-rollback` for debugging (lets you inspect failed resources before cleanup).

**How do you handle secrets in CloudFormation?**
Never hardcode secrets in templates. Use `{{resolve:secretsmanager:MySecret:SecretString:password}}` to dynamically retrieve from Secrets Manager at deploy time. Use `{{resolve:ssm-secure:/prod/db/password}}` for SSM Parameter Store SecureString. CloudFormation doesn't store these values in the template or state — it fetches them fresh during deployment. Rotate secrets independently; next CloudFormation update will fetch the new value.

**What is the difference between a CloudFormation change set and direct update?**
Direct update: immediately applies changes with rollback on failure. Change set: generates a preview of what will change (add/modify/delete) without applying — review then execute. Change sets are strongly recommended for production because they show you `Replacement: True` (resource will be deleted and recreated, causing downtime) before you commit. You can also compare multiple change sets before deciding which to execute.
