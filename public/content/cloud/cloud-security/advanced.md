# Cloud Security — Advanced

## Zero Trust Architecture on AWS

```
Zero Trust principles:
  Never trust, always verify — even internal traffic
  Least privilege access — minimal permissions at all times
  Assume breach — design as if attacker is already inside
  Verify explicitly — authenticate and authorize every request
  Use multiple verification signals — identity + device + location

AWS implementation:
  Identity: IAM Identity Center (SSO) + MFA for all humans
  Network: VPC endpoints (no public internet), PrivateLink
  Workload: IMDSv2 (block SSRF attacks), no public subnets
  Data: encryption at rest + in transit, Macie for PII discovery
  Monitoring: CloudTrail + GuardDuty + Security Hub + Config
```

## Secrets Rotation Automation

```python
# Lambda function for automatic RDS password rotation
import boto3, json, string, random

def lambda_handler(event, context):
    secret_id = event['SecretId']
    step = event['Step']
    sm = boto3.client('secretsmanager')
    rds = boto3.client('rds-data')
    
    if step == 'createSecret':
        # Generate new password
        new_password = ''.join(random.choices(string.ascii_letters + string.digits, k=32))
        sm.put_secret_value(
            SecretId=secret_id,
            ClientRequestToken=event['ClientRequestToken'],
            SecretString=json.dumps({'password': new_password}),
            VersionStages=['AWSPENDING']
        )
    
    elif step == 'setSecret':
        # Update the actual database password
        pending = json.loads(sm.get_secret_value(SecretId=secret_id, VersionStage='AWSPENDING')['SecretString'])
        current = json.loads(sm.get_secret_value(SecretId=secret_id, VersionStage='AWSCURRENT')['SecretString'])
        # rds.execute_statement(sql=f"ALTER USER '{current['username']}' PASSWORD '{pending['password']}'")
    
    elif step == 'finishSecret':
        # Promote PENDING to CURRENT
        metadata = sm.describe_secret(SecretId=secret_id)
        current_version = [k for k,v in metadata['VersionIdsToStages'].items() if 'AWSCURRENT' in v][0]
        sm.update_secret_version_stage(
            SecretId=secret_id,
            VersionStage='AWSCURRENT',
            MoveToVersionId=event['ClientRequestToken'],
            RemoveFromVersionId=current_version
        )
```
