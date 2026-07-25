# AWS CloudFormation — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day), assuming basic AWS resource knowledge already (VPC, EC2, IAM) — CloudFormation's template syntax is quick to learn; the real depth is in stack lifecycle management, dependency handling, and knowing when nested stacks/StackSets are actually warranted.

## Phase 1: Foundation (Week 1-2)

- Template anatomy: `Parameters`, `Resources`, `Outputs`, and (once comfortable with the basics) `Conditions`/`Mappings`
- The stack as the actual unit CloudFormation manages — creating, updating, and deleting a stack, and understanding that CloudFormation tracks what it created so it can clean it up correctly
- `!Ref` and `!GetAtt` intrinsic functions, and how CloudFormation automatically infers resource dependency order from them (VPC before subnet before instance) without manual sequencing
- YAML vs. JSON template format — functionally equivalent, but YAML is the more common, more readable choice in current practice

**Checkpoint:** can you explain why CloudFormation doesn't need you to manually specify that a subnet must be created after its VPC, when you're using `!Ref` to link them?

## Phase 2: Change Management (Week 2-3)

- Change Sets: previewing exactly what an update will add, modify, or replace before actually applying it — the real production-safety habit CloudFormation is built around
- Understanding "replacement" updates (some property changes force a resource to be destroyed and recreated) versus in-place updates, and why Change Sets specifically surface which kind you're about to trigger
- Automatic rollback on failed updates or creates, and what state a stack is left in when that happens
- `DependsOn` for the rare cases where dependency order isn't inferable from `!Ref`/`!GetAtt` alone

**Checkpoint:** can you explain why a Change Set showing a resource will be "replaced" (not just modified) is a genuinely important thing to notice before applying the update, especially for a stateful resource like a database?

## Phase 3: Serverless and Reusability (Week 3-5)

- AWS SAM (Serverless Application Model) as a CloudFormation Transform that simplifies defining Lambda + API Gateway resources, while still deploying as a standard CloudFormation stack underneath
- Nested stacks for breaking a large template into reusable, composable components (network stack, compute stack, database stack) with outputs passed between them
- Cross-stack references (`Export`/`Fn::ImportValue`) as an alternative to nested stacks for sharing values between genuinely separate, independently-managed stacks
- Complete Portfolio Project 1 (multi-stack network/compute) and Project 2 (SAM serverless API) from this course's Projects section

**Checkpoint:** can you explain the practical difference between a nested stack and a cross-stack reference, and when you'd reach for one over the other?

## Phase 4: Multi-Account Operations and Interview Readiness (Week 5-7)

- StackSets for deploying a consistent baseline (security guardrails, logging configuration) across multiple AWS accounts and regions from one operation
- Drift detection for identifying when a resource has been manually modified outside CloudFormation, and why that matters for keeping the template as the actual source of truth
- Stack policies for protecting specific critical resources from accidental modification/deletion during a future update
- Complete Portfolio Project 3 (nested stacks and StackSets) and review this course's Interview Q&A material, particularly the Change Set and dependency-inference questions

## Common Pitfalls Specific to CloudFormation

- **Applying updates without reviewing a Change Set first** — this is exactly the habit that catches an unexpected resource replacement before it happens in production, not after
- **Manually specifying `DependsOn` everywhere out of caution** — CloudFormation already infers most dependencies correctly via `!Ref`/`!GetAtt`; over-using explicit `DependsOn` adds noise without benefit
- **Making manual console changes to resources managed by a stack** — this creates drift that CloudFormation doesn't know about, and the next stack update can silently overwrite or conflict with the manual change
- **Reaching for nested stacks/StackSets before they're actually needed** — for a single-account, single-template deployment, this adds real complexity without a corresponding benefit

## Getting Your First CloudFormation-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (Change Set-driven stack lifecycle management, SAM serverless deployment, nested stacks/StackSets for multi-account consistency)
2. **Resume:** be specific — "eliminated configuration drift across 8 production stacks by implementing scheduled drift detection with automated alerting" is far stronger than "experience with CloudFormation"
3. **Know CloudFormation vs. Terraform tradeoffs:** interviewers often probe whether a candidate can reason about when AWS-native IaC is the right choice versus a multi-cloud tool, not just that they know CloudFormation syntax
4. **Certifications, if pursuing one:** CloudFormation is covered in AWS Solutions Architect Associate/Professional and DevOps Engineer Professional — see this course's own Certification Guide for current format and pricing
