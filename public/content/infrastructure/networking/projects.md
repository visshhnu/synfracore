# Networking — Portfolio Projects

Build these projects to demonstrate real networking skills to employers. Each is designed to be interview-worthy — something you can walk through in detail, including the failure modes you hit and fixed.

## Project 1: VPC Segmentation

**Level:** Beginner | **Time:** 1-2 days

Design and build a segmented VPC on a cloud free-tier account (AWS, GCP, or Azure) that separates a web tier, an application tier, and a database tier — with traffic only allowed to flow where it's actually needed, not wide open between subnets by default.

### Steps

1. Design the CIDR layout: one VPC, three subnets (public web, private app, private database), each sized appropriately with room to grow
2. Create the VPC and subnets, and route tables that route web-tier traffic to an internet gateway while keeping app/database subnets private (NAT gateway or NAT instance for their outbound-only needs)
3. Apply Security Groups so each tier can only reach the tier directly below it (web → app, app → database) — not web → database directly, and not lateral access between instances in the same tier unless explicitly required
4. Add Network ACLs as a second, stateless layer of defense at the subnet boundary, and be able to explain why they're a different control than Security Groups, not a redundant one
5. Launch a minimal instance in each tier and prove the segmentation actually holds: web can reach app, app can reach database, but web cannot reach database directly, and outside traffic cannot reach app or database at all
6. Write a README with the CIDR plan, a network diagram, and the specific Security Group/NACL rules with the reasoning behind each

### Skills Demonstrated

- CIDR planning and subnetting under a real constraint (not just calculating ranges on paper)
- Security Groups vs. NACLs — stateful vs. stateless, instance-level vs. subnet-level
- Least-privilege network segmentation between application tiers

### GitHub Repo Name

`vpc-segmented-network`

---

## Project 2: Kubernetes Zero-Trust Network Policies

**Level:** Intermediate | **Time:** 2-3 days

Deploy a multi-service application to a local Kubernetes cluster (minikube, kind, or k3s) with a default-deny NetworkPolicy applied to the namespace, then explicit allow rules opening up only the exact traffic each service actually needs — and prove both what's allowed and what's blocked.

### Steps

1. Deploy 3-4 services into one namespace (for example: a frontend, a backend API, a database, and a background worker) with normal Services and no NetworkPolicy yet — confirm everything can reach everything, which is the insecure default
2. Apply a default-deny NetworkPolicy for both ingress and egress in the namespace
3. Add narrowly-scoped allow rules: frontend → backend only, backend → database only, worker → database and worker → one external egress target (e.g., a webhook URL) — nothing else
4. Test the allow paths (confirm frontend can still reach backend, backend can still reach the database) and, just as important, test the deny paths (confirm frontend cannot reach the database directly, confirm a pod with no rule genuinely gets nothing)
5. Simulate the "break glass" scenario from an incident: an on-call engineer execs into a pod during an outage and needs to reach an external debugging tool or alerting webhook that the current policy blocks — add a documented, narrowly-scoped temporary policy (or a separate debug pod with different policy applied) rather than loosening the whole namespace
6. Write a README documenting the policy design, a diagram of what's allowed vs. blocked, and the break-glass procedure

### Skills Demonstrated

- Kubernetes NetworkPolicy design (default-deny plus explicit allow, not allow-by-default)
- Testing egress behavior under real operational conditions, not just ingress correctness
- Designing a pre-approved incident-response path that doesn't require loosening security under pressure

### GitHub Repo Name

`k8s-zero-trust-network-policies`

---

## Project 3: Automated Certificate Lifecycle with cert-manager

**Level:** Advanced | **Time:** 4-5 days

Automate TLS certificate issuance, renewal, and expiry alerting for services running on a local Kubernetes cluster, so no certificate in the cluster can silently expire the way a manually-issued one can.

### Steps

1. Install cert-manager on a local cluster (minikube, kind, or k3s) and configure a `ClusterIssuer` (Let's Encrypt staging, or a self-signed/CA issuer if no public DNS is available for this exercise)
2. Deploy an Ingress-fronted service and request a certificate for it via cert-manager, confirming automatic issuance completes and the service actually serves valid TLS
3. Force a renewal manually (or shorten the certificate's duration for the exercise) and confirm cert-manager renews it automatically without manual intervention
4. Add a monitoring check independent of cert-manager itself — a scheduled `openssl x509 -noout -enddate` check or a dedicated certificate-expiry exporter — that would page on an approaching expiry even if the automation silently failed
5. Deliberately break the automation (revoke the issuer's credentials, or point the Ingress at a non-existent issuer) and confirm the independent expiry check actually catches it before the certificate expires
6. Write a runbook: what "SSL certificate expired" looks like from a generic elevated-error-rate alert, and where "check certificate expiry" sits in the troubleshooting sequence — early, not last

### Skills Demonstrated

- cert-manager configuration (Issuers/ClusterIssuers, automatic renewal)
- Defense-in-depth monitoring that doesn't fully trust the automation it's monitoring
- Incident runbook writing grounded in a specific, previously-seen failure mode

### GitHub Repo Name

`k8s-cert-manager-lifecycle`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Segmented a VPC to stop my app tier from being directly reachable from the internet" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason — why Security Groups and NACLs together, why default-deny before allow rules, why an independent expiry check on top of automation.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] All 3 projects on GitHub with clear READMEs
- [ ] Each project includes a network/architecture diagram
- [ ] Each project demonstrates both what's allowed AND what's correctly blocked
- [ ] Projects are pinned on your GitHub profile
