# OpenShift Interview Q&A — Admin & Production Focus

## Section 8: OCP Interview Questions

**&****A — ADMIN FOCUS**

**8.1  Architecture Questions**

**Q: What is the difference between a DeploymentConfig and a Deployment in OCP?**

A: DeploymentConfig is OCP-specific (legacy) — it was the original OCP deployment object with features like lifecycle hooks and custom deployment strategies. Kubernetes-native Deployment is now preferred in OCP 4.x because it's standard, has better ecosystem support, and Red Hat has aligned OCP with upstream Kubernetes. DeploymentConfig is still supported but should not be used for new workloads.

**Q: What are SCCs and why are they important?**

A: Security Context Constraints are OCP-specific security policies that control what a pod can do at the OS level — whether it can run as root, use privileged mode, access host networks/paths, or use specific volume types. Every pod gets an SCC at admission. The default 'restricted' SCC prevents root access. This is the most common source of pod failures when migrating workloads from vanilla K8s to OCP.

**Q: How does OCP authentication work?**

A: OCP has a built-in OAuth server. You configure Identity Providers (IdPs) via the OAuth cluster object — supported providers include HTPasswd (local users), LDAP/AD, GitHub, GitLab, Google, OIDC. Users authenticate via the OAuth server and receive a token. The token is used for all subsequent API calls.

**8.2  Operations Questions**

**Q: A pod is in CrashLoopBackOff — walk me through your troubleshooting steps.**

A: (1) oc describe pod <pod> -n <ns> — check Events section for immediate clues. (2) oc logs <pod> --previous — logs from the crashed container instance. (3) Check resource limits — OOMKilled means memory limit hit. (4) Check liveness probe configuration — too aggressive probes cause restarts. (5) oc exec into a healthy instance (if exists) to verify env vars and config. (6) Check if the image itself is the issue — run locally.

**Q: How would you perform a zero-downtime deployment on OCP?**

A: Ensure readinessProbe is configured — traffic only routes to ready pods. Use RollingUpdate strategy with maxUnavailable=0 (never take pods down before new ones are ready). Set appropriate resource requests so scheduler can place new pods. Use PodDisruptionBudget to ensure minimum available pods. For critical releases, use Blue/Green — spin up a completely new deployment, test it, then switch the Route.

**Q: How do you upgrade an OCP cluster?**

A: (1) Check current version and available updates: oc adm upgrade. (2) Review Red Hat upgrade notes for the target version. (3) Ensure all Cluster Operators are healthy: oc get co. (4) Apply upgrade: oc adm upgrade --to-latest=true. (5) Monitor: oc get clusterversion, oc get co, watch nodes. (6) Workers upgrade via MachineConfigPool rolling drain+reboot. Total time 1-3 hours. Always do non-prod first.

**Q: What is GitOps and how does ArgoCD work on OpenShift?**

A: GitOps is the practice of using Git as the single source of truth for infrastructure and application configuration. ArgoCD (OpenShift GitOps) watches a Git repository and continuously reconciles the cluster state with what's in Git. If someone manually changes a resource in the cluster (drift), ArgoCD detects it and can automatically revert it. This gives us full audit trail, easy rollback (just revert the Git commit), and consistent environments.

**8.3  HPE/Telecom Context Questions**

**Q: Describe your experience with OCP at HPE.**

A: At HPE, I was the platform engineer for OCP 4.16 running the DU (Dubai Unified)/Vodafone UAE telecom provisioning platform. I managed 3 environments (dev, test, prod) each with 50+ pods covering microservices for Service Order Management (SOM), Catalog (COM/CFS), and Resource Fulfillment (RFS). I handled full day-2 operations: RBAC, deployments, upgrades, SCC troubleshooting, Helm releases, ArgoCD GitOps, and P1 incident response. We maintained 99.9% SLA on production.

---

## Additional Interview Preparation

**OpenShift DevOps Interview**

B. Vishnu | 11+ Years Experience | HPE | DevOps Engineer

# **1. OpenShift — Core Platform Management**

| **Q1** | **You have a pod stuck in CrashLoopBackOff in production. Walk me through exactly how you diagnose and fix it.** |
| --- | --- |
| **ANS** | First I run: kubectl get pods -n <namespace> to confirm which pod is crashing. Then: kubectl describe pod <pod-name> -n <namespace> — I check the Events section for the root cause (OOMKilled, image pull errors, liveness probe failures, etc.). Then: kubectl logs <pod-name> -n <namespace> --previous — I check logs from the previous crashed container. Common causes and fixes: • OOMKilled → increase memory limits in the deployment spec • ImagePullBackOff → check image name/tag, registry credentials (secret) • Liveness probe failure → check probe config, ensure app starts within initialDelaySeconds • Config/secret missing → check env vars and mounted secrets Once root cause is found, I fix the deployment YAML, raise a Change Request if it's production, and apply. I always test in lower environment first. |
| **TIP** | *Use your real HPE story here — certificate expiry causing ImagePullBackOff. That's a perfect answer.* |

| **Q2** | **How do you manage ConfigMaps and Secrets in OpenShift? What's the difference and when do you use each?** |
| --- | --- |
| **ANS** | ConfigMaps store non-sensitive configuration data — environment variables, config files, port numbers. For example: database hostname, feature flags, log levels. Secrets store sensitive data — passwords, tokens, certificates, API keys. They are base64-encoded (not encrypted by default, but can be encrypted at rest with etcd encryption). In practice: • I mount ConfigMaps as environment variables or as files inside pods • I mount Secrets as environment variables or volumes — never hardcode them in the container image • For production, I integrate with Azure Key Vault or HashiCorp Vault so secrets are fetched at runtime using workload identity — the pod never stores the secret itself I manage these via Terraform for consistency — not manually created in the console. |
| **TIP** | *Mention that you use Terraform to manage these, not manual console changes. Shows maturity.* |

| **Q3** | **What are OpenShift Routes and how are they different from Kubernetes Ingress?** |
| --- | --- |
| **ANS** | In standard Kubernetes, Ingress is the resource for exposing HTTP/HTTPS traffic to services, and you need a separate Ingress controller (Nginx, Traefik, etc.). OpenShift Routes are OpenShift's native equivalent — built on top of HAProxy. They are easier to use and come pre-configured in OpenShift without needing a separate controller. Route features: • TLS termination (edge, passthrough, re-encrypt) • Custom hostnames • Load balancing across pods In practice at HPE, I used Routes to expose our telecom microservices externally with TLS termination at the route level, keeping the pod-to-pod traffic unencrypted internally for performance. |
| **TIP** | *The key point: Routes are OpenShift-native, Ingress is Kubernetes-standard. Both do the same job.* |

| **Q4** | **How do you perform a zero-downtime deployment in OpenShift? Explain blue/green and rolling strategies.** |
| --- | --- |
| **ANS** | Rolling deployment (default): OpenShift terminates old pods one at a time and starts new ones gradually. Traffic shifts incrementally. Risk: if the new version is broken, some users see the bad version before you roll back. Blue/green deployment: You run two identical environments — blue (current) and green (new). You deploy the new version to green, test it, then switch the Route to point to green. If something breaks, you flip the Route back to blue instantly. At HPE, I used rolling deployments for routine releases and blue/green for major version upgrades where we needed instant rollback capability. Rollback: kubectl rollout undo deployment/<name> — reverts to the previous ReplicaSet in seconds. I always set readinessProbes so OpenShift only routes traffic to a pod once it's actually ready to serve. |
| **TIP** | *Mention readinessProbe — it's what makes zero-downtime possible. Many candidates miss this.* |

| **Q5** | **Describe your day-to-day OpenShift operational responsibilities. What does 'platform ownership' mean in practice?** |
| --- | --- |
| **ANS** | At HPE, platform ownership means: • Morning health check: check Grafana dashboards for overnight alerts, pod restarts, node CPU/memory, Kafka consumer lag • Pipeline management: ensure Jenkins/ArgoCD pipelines are running cleanly, no stuck jobs • Change management: review and execute scheduled deployments following ITIL process — raise CR, get approval, deploy in maintenance window, verify, close CR • Incident response: on-call for P1/P2 — diagnose fast using kubectl describe/logs, coordinate fix with dev team, apply fix, do RCA • Capacity planning: monitor resource utilization trends, recommend node scaling before issues hit • Certificate and license tracking: I maintain Grafana alerts for 30-day expiry warnings so we're never caught off guard • Documentation: keep runbooks updated so any team member can handle routine operations |
| **TIP** | *This shows you think like an operator, not just a deployer. The ITIL process mention is key for enterprise roles.* |

# **2. CI/CD ****&**** ArgoCD / GitOps**

| **Q1** | **How have you implemented GitOps with ArgoCD? Walk me through the end-to-end flow.** |
| --- | --- |
| **ANS** | GitOps means Git is the single source of truth for what should be running in the cluster. ArgoCD watches a Git repo and automatically syncs the cluster state to match what's in the repo. Our flow at HPE: 1. Developer pushes code to feature branch → PR reviewed and merged to main 2. Jenkins CI pipeline triggers: build → unit test → Docker build → push image to registry (with commit SHA as tag) 3. Jenkins then updates the Helm values file in the GitOps repo with the new image tag and commits it 4. ArgoCD detects the change in the GitOps repo and syncs it to the OpenShift cluster 5. ArgoCD deploys the new version using the Helm chart — rolling update by default 6. If drift is detected (someone manually changed something in the cluster), ArgoCD alerts and can auto-correct Benefits: full audit trail in Git, rollback = git revert, no direct kubectl access needed by developers. |
| **TIP** | *The key point interviewers love: 'rollback = git revert'. That's GitOps maturity.* |

| **Q2** | **Your Jenkins pipeline is failing intermittently — builds pass locally but fail in CI. How do you troubleshoot it?** |
| --- | --- |
| **ANS** | Intermittent failures are usually caused by: flaky tests, external dependency timeouts, resource contention on the agent, or environment differences. My approach: 1. Check Jenkins console output for the exact error — is it a test failure, network timeout, Docker build error? 2. Check if it's agent-specific: does it fail on one agent and pass on others? Could be disk space, memory, or a stale Docker layer 3. Check if it's time-related: does it fail at peak hours? Could be resource contention or external API rate limiting 4. Add retry blocks in the pipeline for known flaky external calls 5. If it's test flakiness: isolate the failing test, check for shared state or timing issues 6. For environment differences: use Docker containers as build agents so the build environment is identical every time At HPE, I resolved an intermittent failure caused by a Kafka dependency that wasn't ready during integration tests — I added a health check wait loop before the test stage. |
| **TIP** | *Mention Docker agents for consistent environments — shows you think about build reproducibility.* |

| **Q3** | **How do you implement a rollback strategy in your CI/CD pipeline? Walk me through a real scenario.** |
| --- | --- |
| **ANS** | Rollback strategy has two levels: 1. Application rollback: If a deployment fails, kubectl rollout undo deployment/<name> rolls back to the previous ReplicaSet — takes about 2 minutes, zero downtime. 2. Pipeline-level rollback: In Jenkins, I add automated smoke tests after deployment. If smoke tests fail, the pipeline automatically triggers kubectl rollout undo. No human needed. 3. GitOps rollback: In ArgoCD, I do git revert on the values file — ArgoCD picks it up and rolls back the cluster state. Real scenario at HPE: During a platform upgrade, one microservice failed compatibility checks in production. The pipeline detected failed readiness probes, triggered automatic rollback, and we were back to stable state in 3 minutes. We then opened an RCA, fixed the compatibility issue in staging, and redeployed in the next maintenance window. Key principle: always test rollback in your lower environment before you need it in production. |
| **TIP** | *The automated smoke test triggering rollback is a senior-level answer. It shows you automate everything, not just happy path.* |

| **Q4** | **How do you manage secrets in your CI/CD pipeline? How do you ensure credentials are never stored in Git?** |
| --- | --- |
| **ANS** | Never store secrets in Git — even encrypted. This is non-negotiable. How I manage pipeline secrets: • Jenkins credentials store: database passwords, API tokens stored as Jenkins credentials, referenced in pipeline as credentials('my-secret') — never printed in logs • For Kubernetes deployments: secrets are stored in HashiCorp Vault or Azure Key Vault, and fetched at runtime using workload identity (managed identity). The pod authenticates to Key Vault with its identity — no password stored anywhere • For Docker registry: ImagePullSecrets stored as Kubernetes secrets, created once via Terraform, referenced in pod spec • Git scanning: I use tools like git-secrets or GitHub's secret scanning to prevent accidental commits • Pipeline logs: I mask all sensitive values in Jenkins using the Mask Passwords plugin so they never appear in build logs • Rotation: secrets have defined rotation schedules — certificates 30 days before expiry (Grafana alert), passwords quarterly |
| **TIP** | *Mention the Grafana certificate alert — connects your real experience to this answer.* |

| **Q5** | **What's the difference between Jenkins declarative and scripted pipelines? Which do you prefer and why?** |
| --- | --- |
| **ANS** | Scripted pipeline: uses Groovy scripting directly — very flexible, can do anything, but complex and hard to read. Declarative pipeline: structured format with predefined sections (pipeline, agent, stages, steps) — easier to read, validate, and maintain. Introduced to standardize how pipelines are written. I prefer Declarative for 95% of use cases because: • Easier for team members to read and maintain • Built-in validation catches errors before runtime • Clear structure: pipeline → stages → steps • Can embed scripted blocks using script{} when you need extra flexibility At HPE, I standardized all pipelines to declarative format across teams — reduced onboarding time for new engineers significantly and made PR reviews faster because everyone used the same structure. |
| **TIP** | *Say you standardized across teams. That shows leadership and initiative, not just technical knowledge.* |

# **3. AWS — EKS, IAM, S3, EC2**

| **Q1** | **How is AWS EKS different from OpenShift? How would you apply your OpenShift experience to EKS?** |
| --- | --- |
| **ANS** | EKS is AWS's managed Kubernetes service — AWS manages the control plane, you manage worker nodes and workloads. OpenShift is Red Hat's enterprise Kubernetes distribution with additional features on top. Key differences: • OpenShift has stricter security defaults (no root containers by default, Security Context Constraints) • OpenShift has Routes built-in; EKS uses standard Kubernetes Ingress with a controller (AWS Load Balancer Controller) • OpenShift has a built-in image registry; EKS uses ECR (Elastic Container Registry) • Both run standard Kubernetes pods, deployments, services, namespaces, ConfigMaps, Secrets My OpenShift experience transfers directly to EKS: • kubectl commands are identical • Pod lifecycle, deployments, rolling updates, rollbacks — same concepts • RBAC, namespaces, network policies — same • ArgoCD works on both Main learning curve: AWS-specific tooling (eksctl, AWS CLI, ECR instead of OpenShift internal registry, ALB Ingress controller instead of Routes). |
| **TIP** | *Lead with: 'The core Kubernetes concepts are identical — my OpenShift experience transfers directly.' That's confidence.* |

| **Q2** | **How does AWS IAM work and how do you use it to control access to AWS resources from pods running in EKS?** |
| --- | --- |
| **ANS** | AWS IAM (Identity and Access Management) controls who can do what in AWS. You create IAM policies (what actions are allowed on which resources) and attach them to IAM roles. For EKS pod-level access, I use IRSA — IAM Roles for Service Accounts: 1. Create an IAM role with the permissions the pod needs (e.g., read from S3 bucket) 2. Create a Kubernetes service account and annotate it with the IAM role ARN 3. The pod uses that service account — when it makes AWS API calls, it automatically gets temporary credentials from the IAM role 4. No access keys stored in the pod. Credentials are short-lived and auto-rotated by AWS STS This is equivalent to Azure Workload Identity / Managed Identity that I use in AKS. For cluster-level access: I use aws-auth ConfigMap to map AWS IAM users/roles to Kubernetes RBAC groups — controlling who can run kubectl against the cluster. |
| **TIP** | *IRSA is the AWS equivalent of Azure Managed Identity. Saying that shows you understand the pattern, not just the tool.* |

| **Q3** | **How would you use S3 in a Kubernetes/EKS environment? Give concrete use cases.** |
| --- | --- |
| **ANS** | S3 is AWS object storage — equivalent to Azure Blob Storage. Common use cases in a Kubernetes environment: 1. Artifact storage: Store build artifacts, Docker layer caches, test reports from CI/CD pipelines 2. Terraform state: Store Terraform state files in S3 with DynamoDB locking — ensures team doesn't overwrite each other's state 3. Application data: Pods that need to read/write files (reports, uploads, exports) use S3 via AWS SDK — no local disk dependency means pods can scale horizontally 4. Log archival: Ship logs from ELK/CloudWatch to S3 for long-term retention — cheaper than keeping in hot storage 5. Backup storage: Database backups, config backups stored in S3 with lifecycle policies to auto-delete after 30/60/90 days Access control: pods access S3 using IRSA (IAM role for service account) — no hardcoded AWS keys. S3 bucket policies restrict which roles can read/write. |
| **TIP** | *Terraform state in S3 — mention this specifically. It shows you use S3 in your actual DevOps work, not just theory.* |

| **Q4** | **How do you approach cost optimization in AWS? What specific strategies have you used?** |
| --- | --- |
| **ANS** | Cost optimization works at multiple levels: 1. Right-sizing: Use CloudWatch metrics to identify over-provisioned EC2 instances — downsize instances running below 20% CPU 2. Auto-scaling: Implement Horizontal Pod Autoscaler in EKS so pods scale down during low traffic. Use cluster autoscaler so nodes scale down when pods are removed 3. Spot instances: Use EC2 Spot Instances for dev/test environments and batch workloads — up to 90% cheaper than on-demand. Not for production stateful workloads 4. Reserved Instances: For predictable production workloads, buy 1-year Reserved Instances — up to 40% saving over on-demand 5. S3 lifecycle policies: Auto-transition old data to cheaper storage tiers (S3-IA, Glacier) — set based on access patterns 6. Right storage class: Use gp3 EBS volumes instead of gp2 — same performance, 20% cheaper At HPE on Azure, I implemented HPA which significantly reduced our compute costs during low-traffic periods. Same principle applies to AWS. |
| **TIP** | *Spot instances for dev/test, Reserved for production. That's the standard pattern — say it confidently.* |

| **Q5** | **How does AWS CloudWatch compare to Prometheus and Grafana? When would you use each?** |
| --- | --- |
| **ANS** | CloudWatch is AWS's native monitoring service — managed, no setup required, integrates directly with AWS services. It collects metrics from EC2, EKS, RDS, Lambda automatically. Prometheus + Grafana is open-source — more flexible, more control, better for application-level metrics, works across clouds. When to use each: • CloudWatch: For AWS infrastructure metrics (EC2 CPU, ELB request count, RDS connections) and AWS service alarms — it's already there, no setup needed • Prometheus + Grafana: For application-level metrics, custom business metrics, multi-cloud environments, and richer dashboards In EKS, I'd use both together: • CloudWatch Container Insights for node-level and cluster-level metrics • Prometheus scraping application metrics from pods • Grafana as the unified dashboard showing both CloudWatch data (via CloudWatch data source) and Prometheus data At HPE, I used Prometheus + Grafana for application monitoring and AppDynamics for APM — same multi-tool approach. |
| **TIP** | *Saying 'I'd use both together' shows architectural maturity — not either/or thinking.* |

# **4. Security — RBAC, Network Policies, Access Control**

| **Q1** | **Walk me through setting up RBAC in OpenShift for a team with developers, testers, and ops engineers.** |
| --- | --- |
| **ANS** | RBAC in Kubernetes/OpenShift has three components: Role (what you can do), RoleBinding (who gets that role), and the subject (user, group, or service account). Setup for three teams: 1. Developers: ClusterRole with permissions to create/update/delete deployments, pods, services in dev and staging namespaces only. RoleBinding in dev and staging namespaces. Read-only in production. 2. Testers: Role with permissions to read pods, logs, exec into pods in test namespace. Cannot deploy or modify resources. 3. Ops: ClusterAdmin or a custom role with full permissions across all namespaces. Only ops can deploy to production. Implementation: I integrate with Azure AD / LDAP groups. Instead of binding individual users, I bind the AD group — so when someone joins the dev team, they get added to the AD group and automatically inherit the right permissions. When they leave, one change removes all access. In Terraform: I define all Roles and RoleBindings as code — no manual console changes. This ensures consistency and auditability. |
| **TIP** | *AD group binding is the enterprise answer. Individual user bindings don't scale. Say this explicitly.* |

| **Q2** | **Explain Kubernetes Network Policies. Set up a policy that allows only the API pod to access the database pod.** |
| --- | --- |
| **ANS** | Network Policies control pod-to-pod traffic at the IP/port level. By default, all pods can talk to all other pods. Network Policies let you restrict this. Scenario: frontend → API → database. Database should only accept traffic from the API pod. The network policy on the database pod:   podSelector: matchLabels: app: database   policyTypes: Ingress   ingress:     from:       podSelector: matchLabels: app: api     ports: 5432 (PostgreSQL) This means: only pods with label 'app: api' can send traffic to pods with label 'app: database' on port 5432. All other ingress is denied. Additional policies: • Frontend → API only (not directly to database) • Deny all egress from database pod (database doesn't initiate connections) I use Calico as the network policy engine in OpenShift — it supports more advanced policies than the built-in NetworkPolicy object, including egress policies and namespace-level policies. All network policies are defined in Terraform — never applied manually. |
| **TIP** | *Calico is the industry standard for advanced network policies. Mention it — shows depth beyond basics.* |

| **Q3** | **How do you handle certificate management in OpenShift? How do you prevent certificate expiry incidents?** |
| --- | --- |
| **ANS** | Certificate management is critical — expired certificates cause immediate production outages (pods go to ImagePullBackOff, services stop trusting each other). My approach: 1. Inventory: Maintain a complete list of all certificates — TLS certs for Routes, internal CA certs, container registry certs, Kafka TLS certs 2. Monitoring: Set up Prometheus exporters (blackbox-exporter or cert-exporter) to scrape certificate expiry dates. Alert in Grafana 30 days before expiry 3. Email alerts: Configure Alertmanager to send email to the ops team when expiry is within 30 days 4. Renewal process: Raise a Change Request 25 days before expiry, renew in lower environment first, deploy to production following ITIL process 5. Automation: For internal certificates, use cert-manager in Kubernetes — it automatically renews certificates before they expire Real incident at HPE: Container registry certificate expired without warning — all pods went to ImagePullBackOff. I diagnosed with kubectl describe, swapped to backup registry, fixed same day, and implemented the 30-day Grafana alert to prevent recurrence. |
| **TIP** | *Always connect theory to your real HPE incident. It's your strongest differentiator in this interview.* |

| **Q4** | **What is Artifactory and how does it fit into a CI/CD pipeline?** |
| --- | --- |
| **ANS** | Artifactory is a universal artifact repository manager — it stores and manages build artifacts, Docker images, Helm charts, Maven JARs, npm packages, Python packages, and more. Think of it as a private registry for everything your build produces. How it fits into CI/CD: 1. Build: Jenkins builds the application and produces artifacts (JAR, Docker image, Helm chart) 2. Push to Artifactory: Jenkins pushes artifacts to Artifactory with version metadata 3. Promotion: Artifacts are promoted through repositories (dev → staging → prod) — the same artifact is tested and promoted, not rebuilt 4. Deploy: ArgoCD or Kubernetes pulls the Docker image and Helm chart from Artifactory 5. Retention: Artifactory policies automatically clean up old artifacts to save storage Security in Artifactory: • Access control: repo-level permissions — dev team can push to dev repo only, ops can promote to prod repo • Immutable artifacts: once published, artifacts cannot be overwritten — ensures build reproducibility • Vulnerability scanning: integrate with Xray to scan for security vulnerabilities in artifacts before promotion |
| **TIP** | *Artifact promotion — same artifact, different repositories — is the key concept. Say that explicitly.* |

| **Q5** | **How do you ensure security scanning is part of your CI/CD pipeline?** |
| --- | --- |
| **ANS** | Security must be shift-left — catch issues early in the pipeline, not in production. My pipeline security stages: 1. SAST (Static Application Security Testing): In the build stage, tools like SonarQube scan source code for vulnerabilities, code smells, and security hotspots. Pipeline fails if critical issues are found. 2. Dependency scanning: Check third-party libraries for known CVEs using OWASP Dependency Check or Snyk. Flag if any critical CVEs exist. 3. Docker image scanning: After Docker build, scan the image with Trivy or Aqua before pushing to registry. If critical CVEs found, pipeline fails — image is never pushed. 4. Infrastructure scanning: Terraform code scanned with Checkov or tfsec before apply — catches misconfigurations like open security groups, unencrypted storage. 5. Secret scanning: git-secrets or GitHub secret scanning prevents credentials being committed to Git. 6. Runtime security: Falco monitors running containers for suspicious behavior (unexpected processes, file system writes). At HPE, I integrated SonarQube into Jenkins pipelines — developers see security feedback immediately in the PR before merge. |
| **TIP** | *Shift-left security is the buzzword. Use it. And mention Trivy for image scanning — it's the most popular free tool.* |

# **5. Monitoring, Incident Response ****&**** Reliability**

| **Q1** | **How do you set up comprehensive monitoring for an OpenShift/Kubernetes cluster? What metrics matter most?** |
| --- | --- |
| **ANS** | I monitor at three layers: 1. Infrastructure layer (nodes): CPU utilization, memory pressure, disk I/O, network throughput, node availability. Alert if node CPU >80% for 5+ minutes. 2. Platform layer (Kubernetes): Pod restart count, pending pods, failed deployments, PVC utilization, API server latency. Alert if any pod restarts >3 times in 10 minutes. 3. Application layer (pods): Request rate, error rate, response latency (P95, P99), database connection pool utilization, Kafka consumer lag. Tools: • Prometheus: scrapes metrics from all layers via exporters (node_exporter for nodes, kube-state-metrics for Kubernetes objects, application /metrics endpoint) • Grafana: unified dashboards. I maintain dashboards for infrastructure health, deployment status, and application SLOs • Alertmanager: routes alerts to email, Slack, or PagerDuty based on severity • ELK Stack: log aggregation — searchable logs for post-incident analysis • AppDynamics: APM for application performance tracing at HPE Proactive monitoring I added at HPE: certificate expiry alerts (30 days), Kafka consumer lag (detect processing backlog before users see delays), and disk utilization trends (predict when storage will run out). |
| **TIP** | *Three-layer monitoring is the framework. Use it to structure your answer — infrastructure, platform, application.* |

| **Q2** | **Walk me through how you handle a P1 production incident. What's your process from alert to resolution?** |
| --- | --- |
| **ANS** | P1 means production is down or severely degraded. Speed and communication are critical. My process: 1. Alert fires: Grafana/Alertmanager sends notification. I acknowledge immediately in the ITSM tool to show I'm investigating. 2. Initial diagnosis (first 5 minutes): kubectl get nodes — are nodes healthy? kubectl get pods -n production -- any pods crashing? kubectl describe pod — what's the error? Check Grafana dashboard for spike/drop in metrics. 3. Communicate: Post in the incident channel immediately — 'P1 declared, investigating. Production platform showing [symptom]. ETA for update: 10 minutes.' Stakeholders need to know you're on it. 4. Isolate and mitigate: Can I restore service quickly? Rollback? Restart pods? Scale up? Prioritize restoring service over finding root cause. 5. Fix and verify: Apply fix, verify service is restored, check error rates back to normal. 6. Close and communicate: 'P1 resolved at [time]. Root cause: [brief]. Full RCA to follow within 24 hours.' 7. RCA: Document timeline, root cause, contributing factors, immediate fix, and preventive measures. Share with team. At HPE, I resolved a certificate expiry P1 same day — diagnosed, mitigated with backup registry, got permanent fix, opened RCA, implemented preventive monitoring. |
| **TIP** | *Communicate first, fix second. Interviewers look for this — it's what separates senior engineers from junior ones.* |

| **Q3** | **How do you implement high availability in OpenShift/Kubernetes? What would you do to achieve 99.9% SLA?** |
| --- | --- |
| **ANS** | 99.9% SLA means less than 8.7 hours downtime per year. Achieving this requires eliminating single points of failure at every layer. At the cluster level: • Multi-node: Minimum 3 control plane nodes (master HA) + multiple worker nodes • Multi-zone: Spread worker nodes across availability zones so a datacenter failure doesn't take down the cluster At the pod level: • Replicas: Always run minimum 2 replicas for production workloads — never single pods • Pod Disruption Budgets (PDB): Ensure at least 1 pod is always running during node maintenance (kubectl drain) • Anti-affinity rules: Spread pod replicas across different nodes — don't let all replicas land on the same node • Readiness probes: OpenShift only routes traffic to pods that pass readiness checks — broken pods never receive traffic • Liveness probes: Auto-restart pods that become unresponsive At the application level: • Graceful shutdown: Pods handle SIGTERM properly — drain in-flight requests before stopping • Rolling deployments: New version deployed gradually — never all pods replaced at once At HPE, I maintained 99.9% SLA for our telecom provisioning platform managing 50+ pods across multiple environments using exactly these practices. |
| **TIP** | *Anti-affinity rules are often missed by candidates. Mention it — shows you understand distributed systems.* |

| **Q4** | **How do you perform root cause analysis (RCA)? Walk me through your RCA process for a real incident.** |
| --- | --- |
| **ANS** | RCA is about finding the underlying cause, not just the symptom, and preventing recurrence. My RCA process: 1. Incident timeline: Document exactly what happened and when — alert fired at X, I logged in at X+2, saw error at X+5, applied fix at X+20, service restored at X+22. 2. Five Whys: Keep asking 'why' until you reach the root cause.    Why did pods crash? → ImagePullBackOff    Why couldn't they pull the image? → Registry certificate expired    Why did it expire without warning? → No certificate monitoring in place    Root cause: Gap in monitoring — no certificate expiry alerts 3. Contributing factors: What made it worse? No runbook, no backup registry configured, on-call engineer was unaware of the registry dependency. 4. Immediate fix: What was done to restore service? (Swap to backup registry) 5. Preventive actions: What changes prevent recurrence? (Grafana 30-day certificate expiry alert, runbook created, backup registry always pre-configured) 6. Owner and deadline: Each preventive action has an owner and a date Real RCA at HPE: Certificate expiry incident. Root cause: no monitoring. Preventive action: Grafana alert implemented within 48 hours of incident. |
| **TIP** | *The Five Whys framework — use it by name. It shows structured thinking, not just gut instinct.* |

| **Q5** | **How do you use Prometheus and Grafana together? How do you set up alerts?** |
| --- | --- |
| **ANS** | Prometheus and Grafana work as a pair — Prometheus collects and stores metrics, Grafana visualizes them and can send alerts. Prometheus setup: • Installed via Helm chart into the OpenShift cluster • Configured with ServiceMonitor resources that tell Prometheus which pods to scrape and on which port/path (usually /metrics) • Prometheus scrapes every 15-30 seconds, stores time-series data • AlertRules defined in Prometheus: e.g. if pod_restart_count > 3 in 10 minutes → fire alert Grafana setup: • Connected to Prometheus as a data source • Dashboards built using PromQL queries — e.g. rate(http_requests_total[5m]) for request rate • Alert rules can also be in Grafana — when a metric crosses a threshold, Grafana triggers a notification Alertmanager: • Sits between Prometheus and notification channels • Routes alerts based on labels: P1 alerts go to PagerDuty, P2/P3 to email/Slack • Silences: temporarily mute alerts during planned maintenance At HPE, I built dashboards monitoring pod health, Kafka consumer lag, API response times, and certificate expiry. The certificate alert (30 days before expiry) was the key preventive measure after our P1 incident. |
| **TIP** | *PromQL is the query language for Prometheus. You don't need to memorize queries, just say you use PromQL to write dashboard queries.* |

**Before You Walk In — Final Reminders**

| **Slow down** | You know your material. Nervousness makes you rush. Pause between stories. Let each one land. |
| --- | --- |

| **Lead with breadth** | When they ask 'what Azure/AWS services do you know' — list all of them: AKS, Azure DevOps, Azure Monitor, Azure AD, Key Vault, ECR, EKS, IAM, S3, CloudWatch. Never say 'only OpenShift'. |
| --- | --- |

| **Use your HPE stories** | Certificate crisis → P1 incident questions. Pipeline optimization → CI/CD questions. HPA for cost → cost optimization questions. You have real stories — use them. |
| --- | --- |

| **STAR method** | Situation → Task → Action → Result. Every behavioral question answered this way. |
| --- | --- |

| **Be honest about gaps** | If you haven't used Artifactory: 'I haven't used Artifactory directly but I understand artifact repository management and I'm confident I can ramp up quickly.' Never bluff. |
| --- | --- |

| **Ask smart questions** | What version of OpenShift are you running? What's your current CI/CD stack? What's the biggest reliability challenge the team is facing right now? |
| --- | --- |

**Question 1: What load balancers have you used and how did you configure them?**

Here's your answer:

"I've worked with two types of load balancers. In OpenShift, HAProxy is the built-in load balancer — it works through Routes. When I create a Route for a service, OpenShift automatically configures HAProxy to distribute traffic across all healthy pods. I've configured TLS termination at the Route level so traffic is encrypted externally but lightweight internally. In Azure, I've used Azure Load Balancer and Azure Application Gateway — the Application Gateway acts as a Layer 7 load balancer with path-based routing, SSL termination, and WAF capabilities. In Kubernetes/AKS, a Service of type LoadBalancer automatically provisions an Azure Load Balancer that routes external traffic to the pods."

**Key points to remember:**

- OpenShift → HAProxy via Routes

- Azure/AKS → Azure Load Balancer (Layer 4) or Application Gateway (Layer 7)

- Kubernetes Service type LoadBalancer automatically provisions the cloud load balancer

**Question 2: How do you configure database storage in Kubernetes/AKS and OpenShift?**

Here's your answer:

"Databases need persistent storage — unlike stateless pods, if a database pod restarts, the data must survive. In Kubernetes and OpenShift I handle this using Persistent Volumes. Here's the flow: I create a StorageClass that defines the type of storage — in AKS that's Azure Managed Disks for databases (fast, block storage) or Azure Files for shared storage. Then I create a PersistentVolumeClaim — the pod requests storage of a specific size and type. Kubernetes automatically provisions the disk and binds it to the pod. Even if the pod restarts or moves to another node, the PVC stays attached and the data is safe. For databases specifically I always use ReadWriteOnce access mode — only one pod writes to the disk at a time, which prevents data corruption. In OpenShift it works identically — same PVC concept, different StorageClass names. For production databases at HPE I also ensured the storage was in the same availability zone as the pod to avoid latency."

**Key points to remember:**

- StatefulSet → for databases, not Deployment

- StorageClass → defines the disk type (Azure Managed Disk, Azure Files)

- PersistentVolumeClaim → pod requests storage

- ReadWriteOnce → one pod writes, prevents corruption

- Same availability zone → avoids latency

B. Vishnu — OpenShift Interview Prep | Page
