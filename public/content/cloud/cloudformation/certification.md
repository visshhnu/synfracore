# AWS CloudFormation Certification Guide

## Primary Certification

**AWS DevOps Engineer Professional (DOP-C02)**

*Format*: 75 questions | 180 minutes | 750/1000 | $300 USD

## Related Certifications

- AWS SysOps Administrator Associate
- AWS Solutions Architect Associate

## Key Exam Topics

- Template sections: Parameters, Mappings, Conditions, Resources (required), Outputs
- Intrinsic functions: !Ref, !GetAtt, !Sub, !Join, !If, !Select, !FindInMap, !ImportValue
- Stack operations: create/update/delete, drift detection, stack policies
- ChangeSets: preview changes before apply; safe production deployments
- Nested stacks: break large templates; cross-stack references via Outputs + ImportValue
- StackSets: deploy stacks to multiple accounts/regions from single template
- Custom resources: Lambda-backed for non-native AWS resources or external APIs

## Must-Know CLI Commands

```bash
aws cloudformation create-stack --stack-name my-stack --template-body file://template.yaml --parameters ParameterKey=Env,ParameterValue=prod
aws cloudformation create-change-set --stack-name my-stack --change-set-name my-change --template-body file://template.yaml
aws cloudformation execute-change-set --stack-name my-stack --change-set-name my-change
aws cloudformation detect-stack-drift --stack-name my-stack
aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id xxx
```

## Exam Tips

- DeletionPolicy: Retain (keep resource) | Snapshot (EBS/RDS) | Delete (default)
- UpdateReplacePolicy: same options but for stack updates (replaces resource)
- cfn-init and cfn-signal: bootstrap EC2 instances; signal success/failure to stack
- Stack rollback on failure: CloudFormation auto-rolls back on deployment failure

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: AWS DevOps Engineer Professional (DOP-C02)

TOP TOPICS:
  Template sections: Parameters, Mappings, Conditions, Resources (required), Outpu
  Intrinsic functions: !Ref, !GetAtt, !Sub, !Join, !If, !Select, !FindInMap, !Impo
  Stack operations: create/update/delete, drift detection, stack policies
  ChangeSets: preview changes before apply; safe production deployments
```
