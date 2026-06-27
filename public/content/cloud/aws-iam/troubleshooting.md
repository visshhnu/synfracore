# AWS IAM Troubleshooting Guide

## Issue 1: AccessDeniedException — action not allowed

**Symptom:** API call returns `User: arn:aws:iam::123456789:user/dev is not authorized to perform: ec2:DescribeInstances`.

**Debug steps:**
```bash
# Simulate the policy decision
aws iam simulate-principal-policy   --policy-source-arn arn:aws:iam::123:user/dev   --action-names ec2:DescribeInstances   --resource-arns "*"

# Check what policies are attached
aws iam list-attached-user-policies --user-name dev
aws iam list-user-policies --user-name dev
aws iam list-groups-for-user --user-name dev

# Check all group policies
aws iam list-attached-group-policies --group-name Developers
```

**Fix:**
```json
// Add required permission to policy
{
  "Statement": [{
    "Effect": "Allow",
    "Action": ["ec2:DescribeInstances", "ec2:DescribeSecurityGroups"],
    "Resource": "*"
  }]
}
```

**Prevention:** Use IAM Access Analyzer. Test with least-privilege first. Use `aws:RequestedRegion` conditions to limit scope.

---

## Issue 2: Incorrect cross-account role assumption

**Symptom:** `aws sts assume-role` fails with `is not authorized to assume role`. Works for some users, not others.

**Root cause:** Trust policy on the target role doesn't include the calling account/user, or missing `sts:AssumeRole` permission on caller side.

**Debug steps:**
```bash
# Check the TRUST policy on the target role (who can assume it)
aws iam get-role --role-name CrossAccountRole   --query 'Role.AssumeRolePolicyDocument'

# Check caller's permissions
aws iam simulate-principal-policy   --policy-source-arn arn:aws:iam::SOURCE_ACCOUNT:user/dev   --action-names sts:AssumeRole   --resource-arns arn:aws:iam::TARGET_ACCOUNT:role/CrossAccountRole
```

**Fix:**
```json
// Trust policy on CrossAccountRole (account B)
{
  "Statement": [{
    "Effect": "Allow",
    "Principal": { "AWS": "arn:aws:iam::SOURCE_ACCOUNT_ID:root" },
    "Action": "sts:AssumeRole"
  }]
}
// Permission policy on source user/role (account A)
{
  "Statement": [{
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "arn:aws:iam::TARGET_ACCOUNT:role/CrossAccountRole"
  }]
}
```

---

## Issue 3: IAM role for EC2/ECS not working — NoCredentialProviders

**Symptom:** App on EC2/ECS gets `NoCredentialProviders: no valid providers in chain`.

**Root cause:** Instance profile not attached, role has no permissions, or app reads credentials wrong.

**Debug steps:**
```bash
# From inside EC2: check if instance profile exists
curl http://169.254.169.254/latest/meta-data/iam/info
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/

# Check role attached to EC2
aws ec2 describe-instances --instance-ids i-xxx   --query 'Reservations[].Instances[].IamInstanceProfile'

# For ECS: check task role
aws ecs describe-task-definition --task-definition myapp   --query 'taskDefinition.taskRoleArn'
```

**Fix:**
```bash
# Attach role to EC2
aws ec2 associate-iam-instance-profile   --instance-id i-xxx   --iam-instance-profile Name=MyInstanceProfile

# For ECS: set taskRoleArn in task definition
```

---

## Issue 4: Access key not working after rotation

**Symptom:** After creating a new access key and deleting the old one, API calls fail immediately.

**Root cause:** Old key still cached in environment, `~/.aws/credentials` pointing to old key, or application needs restart.

**Fix:**
```bash
# Update credentials
aws configure  # enter new key/secret

# Or directly edit ~/.aws/credentials
# [default]
# aws_access_key_id = NEW_KEY
# aws_secret_access_key = NEW_SECRET

# Clear environment variables
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY

# Verify new key works
aws sts get-caller-identity
```

---

## Issue 5: Permission boundary blocking allowed actions

**Symptom:** User has an explicit Allow policy but actions are still denied. `simulate-principal-policy` shows Allow but actual API call fails.

**Root cause:** Permission boundary set on user/role restricts effective permissions. IAM is the intersection of identity policy AND permission boundary.

**Debug steps:**
```bash
# Check permission boundaries
aws iam get-user --user-name dev   --query 'User.PermissionsBoundary'

aws iam get-role --role-name MyRole   --query 'Role.PermissionsBoundary'

# Simulate with boundary
aws iam simulate-custom-policy   --policy-input-list file://boundary-policy.json   --action-names s3:GetObject   --resource-arns "arn:aws:s3:::mybucket/*"
```

**Fix:** Either expand the permission boundary to include the needed action, or remove it if unnecessary. Permission boundaries are set via `aws iam put-user-permissions-boundary`.
