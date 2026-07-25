# AWS VPC — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Multi-Tier VPC from Scratch

**Level:** Beginner-Intermediate | **Time:** 2 days

Design and build a real public/private subnet architecture — the foundational VPC pattern almost every production AWS environment uses in some form.

### Steps

1. Design a VPC with public subnets (for a load balancer) and private subnets (for application servers and a database) across at least 2 Availability Zones
2. Provision it via Terraform or CloudFormation (not the console, so it's reproducible) — Internet Gateway, route tables, NAT Gateway for private-subnet outbound access
3. Deploy an EC2 instance in a private subnet and confirm it can reach the internet (e.g. `apt update`) through the NAT Gateway but is not directly reachable from the internet
4. Configure security groups (not NACLs) as the primary access control, and explain in your README why security groups are usually sufficient without also hand-tuning NACLs
5. Document the actual request path a user's browser traffic takes to reach the private application server

### Skills Demonstrated

- Real multi-AZ VPC design, not a single-subnet toy example
- Understanding the Internet Gateway / NAT Gateway distinction in practice, not just definition
- IaC-based, reproducible network provisioning

### GitHub Repo Name

`vpc-multi-tier-architecture`

---

## Project 2: VPC Peering and Transit Gateway Comparison

**Level:** Intermediate | **Time:** 3 days

Build both VPC Peering and Transit Gateway connectivity between multiple VPCs, and document the real tradeoff between them.

### Steps

1. Create 3 separate VPCs representing different teams/environments
2. Connect two of them via VPC Peering and confirm resources in each can reach the other via private IP
3. Connect all three via a Transit Gateway instead, and confirm the same connectivity works through a hub-and-spoke model
4. Deliberately test the actual limitation of VPC Peering that Transit Gateway solves: attempt transitive routing through a peered VPC (A→B→C) and document that it doesn't work with peering alone
5. Write a README comparing cost, complexity, and when each approach is actually the right choice for a given number of VPCs

### Skills Demonstrated

- Real, tested understanding of VPC Peering's non-transitive routing limitation
- Transit Gateway hub-and-spoke architecture for connecting many VPCs
- Cost/complexity tradeoff reasoning backed by an actual built comparison, not just documentation reading

### GitHub Repo Name

`vpc-peering-vs-transit-gateway`

---

## Project 3: Network Troubleshooting and VPC Flow Logs

**Level:** Advanced | **Time:** 3-4 days

Build genuine network diagnostic skill — deliberately break connectivity and use real AWS tools to find and fix it.

### Steps

1. Build a working multi-tier VPC (reuse Project 1's setup) and enable VPC Flow Logs to CloudWatch Logs or S3
2. Deliberately introduce 3 different real connectivity breaks: a missing route table entry, an overly-restrictive security group, and a misconfigured NACL rule
3. For each break, use VPC Flow Logs and the actual AWS Reachability Analyzer to diagnose the specific cause — not by guessing, by reading the evidence
4. Fix each issue and confirm resolution by re-running the same diagnostic tool
5. Write up each scenario as a mini incident report: symptom, diagnostic steps, root cause, fix

### Skills Demonstrated

- Real network troubleshooting methodology using VPC Flow Logs and Reachability Analyzer
- Understanding the distinct failure signatures of route table, security group, and NACL misconfigurations
- Systematic diagnosis over guesswork

### GitHub Repo Name

`vpc-troubleshooting-flowlogs`

---

## Tips for Great VPC Projects

**Test connectivity, don't just configure it.** A route table or security group that "should work" based on the configuration is a weaker claim than one you've actually confirmed with a real request from a real instance.

**Understand the security group vs. NACL distinction precisely.** Security groups are stateful and instance-level; NACLs are stateless and subnet-level. A strong project explains which one is doing the actual work in a given scenario.

**Show the failure case, not just the working case.** Documenting what happens when a route or rule is missing is more convincing evidence of real understanding than only showing the final, working configuration.

## Portfolio Checklist

- [ ] At least one project demonstrates a real multi-AZ public/private subnet architecture, provisioned via IaC
- [ ] At least one project includes a documented, tested network failure and its diagnosis/fix
- [ ] At least one project compares two networking approaches (e.g. Peering vs. Transit Gateway) with real, built evidence
- [ ] Each README explains the reasoning, not just the final network diagram
- [ ] You can walk through any of these projects for 5+ minutes without notes
