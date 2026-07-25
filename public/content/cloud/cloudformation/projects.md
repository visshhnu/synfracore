# AWS CloudFormation — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Multi-Stack Network + Compute with Change Sets

**Level:** Beginner-Intermediate | **Time:** 2 days

Build a real VPC + EC2 deployment as CloudFormation stacks, and practice the actual change-management workflow — not just `create-stack` once and stopping.

### Steps

1. Write a template provisioning a VPC, public/private subnets, and an EC2 instance with a security group — starting with `Parameters` and `Resources` only, adding `Outputs` for values other stacks might need
2. Deploy it, then make a deliberate change (e.g. a new security group rule) and generate a Change Set before applying it — read the Change Set output and confirm it matches what you expected to change
3. Use `!Ref` and `!GetAtt` to wire resources together and confirm CloudFormation correctly infers the dependency order (VPC before subnet before instance) without you specifying `DependsOn` manually
4. Deliberately introduce a template error (a typo in a resource property) and observe CloudFormation's automatic rollback behavior on a failed update
5. Tear down the stack with `delete-stack` and confirm every resource it created is actually gone, not just the top-level ones

### Skills Demonstrated

- Real CloudFormation stack lifecycle: create, Change Set review, update, rollback, delete
- Understanding automatic dependency inference via `!Ref`/`!GetAtt`
- Change Sets as a genuine pre-apply review step, not skipped

### GitHub Repo Name

`cloudformation-network-compute-changesets`

---

## Project 2: Serverless API with SAM

**Level:** Intermediate | **Time:** 3 days

Build a serverless REST API using the AWS SAM (Serverless Application Model) Transform — CloudFormation's native way to define Lambda + API Gateway without hand-writing the full underlying resource definitions.

### Steps

1. Design the API: endpoints, request/response formats
2. Use `AWS::Serverless::Function` and `AWS::Serverless::Api` resources under the `AWS::Serverless-2016-10-31` Transform, deployed as a standard CloudFormation stack
3. Add a DynamoDB table as the backend, and grant the Lambda function's execution role least-privilege access to it via SAM's policy templates, not a broad managed policy
4. Set up nested stacks or a SAM-packaged deployment pipeline for repeatable deploys
5. Load test and document actual cold-start behavior, then compare the SAM template's readability against the equivalent hand-written raw CloudFormation resources

### Skills Demonstrated

- SAM Transform usage for serverless infrastructure-as-code
- Least-privilege IAM scoping within a CloudFormation template
- Understanding what SAM abstracts away versus raw CloudFormation

### GitHub Repo Name

`cloudformation-sam-serverless-api`

---

## Project 3: Nested Stacks and StackSets for Multi-Account Deployment

**Level:** Advanced | **Time:** 4-5 days

Design a production-shaped CloudFormation setup: nested stacks for reusable components, and StackSets for deploying the same baseline across multiple AWS accounts/regions.

### Steps

1. Break a multi-tier application template into nested stacks (network stack, compute stack, database stack) with the parent stack passing outputs between them as parameters
2. Use a StackSet to deploy a consistent baseline (e.g. a security guardrail or logging configuration) across at least 2-3 target accounts/regions
3. Implement a drift detection check and deliberately modify a resource outside CloudFormation (via the console) to confirm drift detection actually catches the manual change
4. Add stack policies to protect specific critical resources (e.g. a database) from accidental deletion during a future stack update
5. Document the tradeoff between nested stacks (CloudFormation-native reuse) and a separate tool like Terraform modules, based on what you actually experienced building this

### Skills Demonstrated

- Nested stack composition for reusable infrastructure components
- StackSets for genuine multi-account/multi-region consistency
- Drift detection and stack policies as real production safeguards

### GitHub Repo Name

`cloudformation-nested-stacksets`

---

## Tips for Great CloudFormation Projects

**Use Change Sets before every real update.** A project that shows you reviewing a Change Set's output before applying it demonstrates the actual production discipline CloudFormation is built around.

**Show dependency inference, not manual DependsOn everywhere.** Understanding when CloudFormation correctly infers order via `!Ref`/`!GetAtt` versus when you genuinely need explicit `DependsOn` is a real signal of depth.

**Test rollback, not just successful deploys.** A template that's never failed an update and rolled back hasn't demonstrated CloudFormation's actual safety mechanism — deliberately breaking one is worth doing.

## Portfolio Checklist

- [ ] At least one project demonstrates a real Change Set review before an update was applied
- [ ] At least one project includes a deliberately triggered and observed rollback
- [ ] At least one project uses nested stacks or StackSets for genuine multi-component or multi-account reuse
- [ ] Each README explains the reasoning, not just the final template
- [ ] You can walk through any of these projects for 5+ minutes without notes
