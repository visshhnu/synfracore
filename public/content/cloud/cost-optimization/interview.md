# Cost Optimization — Interview Questions

**What is the difference between Reserved Instances, Savings Plans, and Spot Instances?**
Reserved Instances: commit to specific instance type in a region for 1 or 3 years. 30-60% savings. EC2 only. Convertible RIs can change family/OS. Savings Plans: commit to a dollar amount of usage per hour. Compute Savings Plans apply to any EC2, Fargate, Lambda — most flexible. 40-66% savings. Spot Instances: use AWS spare capacity, up to 90% savings but can be interrupted with 2-minute notice. Best for: batch jobs, CI/CD, stateless workloads. Strategy: use Savings Plans for baseline, Spot for variable scale-out.

**How do you identify and eliminate cloud waste?**
Common waste: unattached EBS volumes (pay even when not used), unused Elastic IPs ($3.60/month each), stopped but not terminated EC2 (paying for EBS), over-provisioned EC2 (use Compute Optimizer), old EBS snapshots, idle load balancers, dev/test environments running 24/7 (stop after business hours). Tools: AWS Trusted Advisor, Compute Optimizer, Cost Explorer's right-sizing recommendations, CloudWatch metrics (low CPU utilization). Process: tag everything, create cost allocation reports, hold monthly cost review meetings.

**What is the FinOps model?**
FinOps is a cultural practice where engineering, finance, and business teams collaborate on cloud spending. Key phases: Inform (visibility — dashboards, tagging, showback), Optimize (reduce waste, right-size, use commitments), Operate (continuous cost optimization as part of culture). Key principles: teams that use cloud resources are responsible for their cost, cost is considered in architecture decisions, unit economics (cost per user/transaction) is more important than total bill. Outcomes: faster innovation because engineers don't need finance approval for experimentation, but accountability drives efficiency.
