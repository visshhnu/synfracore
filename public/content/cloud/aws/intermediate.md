ate data subnets host RDS, ElastiCache — NO internet route at all, fully isolated. Security groups implement least-privilege: ALB-SG allows inbound 443 from anywhere. App-SG allows inbound only from ALB-SG. DB-SG allows inbound only from App-SG. VPC Flow Logs enabled for security audit. VPC endpoints for S3 and DynamoDB avoid NAT Gateway costs for AWS service traffic. At scale: inter-AZ data transfer costs money — keep app pods and their RDS AZ aligned.


AWS · ENGINEER
What is the difference between Security Groups and NACLs in AWS?
Security Groups are stateful — if you allow inbound traffic, return traffic is automatically allowed. They operate at the instance/ENI level. You can only create ALLOW rules. Changes take effect immediately. NACLs (Network ACLs) are stateless — you must explicitly allow both inbound and outbound traffic for a connection to work. They operate at the subnet level and apply to all instances in the subnet. Rules are evaluated in order by rule number — first match wins. You can create both ALLOW and DENY rules. Use case for NACLs: blocking a specific IP range at the subnet level (DDoS mitigation), quick emergency block. Use case for Security Groups: fine-grained instance-level control. Best practice: Security Groups for normal operations. NACLs as an additional layer for subnet-level blocking only.


AWS · ARCHITECT
Explain IRSA — IAM Roles for Service Accounts — and why it matters for EKS security.
Before IRSA: to give a pod AWS access, you stored access keys as Kubernetes secrets or gave the EC2 node role broad permissions (all pods on that node get all permissions). Both are security risks. IRSA uses OIDC federation: EKS cluster has an OIDC endpoint. You associate this with your AWS account. Create an IAM role with a trust policy allowing only the specific Kubernetes service account in a specific namespace. Pod uses that service account. At runtime, the pod automatically gets a temporary credential via the OIDC token. No keys stored anywhere. If the pod is compromised, credentials expire in 1 hour. Blast radius is limited to exactly the permissions in that role. Implementation: eksctl utils associate-iam-oidc-provider, then eksctl create iamserviceaccount. This is the production standard for EKS and what every AWS interview expects you to know for containerised workloads.


AWS · PRODUCTION
S3 bucket was accidentally made public. What do you do in the next 60 seconds?
First 60 seconds: block public access immediately at both account level and bucket level using aws s3control put-public-access-block with all four flags set to true. This stops new exposure instantly. Next 5 minutes: check what was in the bucket using aws s3api list-objects-v2. Check CloudTrail for GetObject API calls in the last hour to understand what was potentially accessed. Check the bucket policy and ACL that allowed public access. Next 30 minutes: file a security incident. Notify your security team. If the bucket contained PII, initiate your GDPR/data breach notification process (72 hours under GDPR). Fix the root cause: identify what Terraform/IaC missed the block_public_acls setting. Prevention for future: AWS Config rule s3-bucket-public-read-prohibited that fires immediately. SCP at organization level blocking all public bucket creation. In Terraform: always include aws_s3_bucket_public_access_block resource with all four booleans set to true.


AWS · ENGINEER
What is the difference between EBS, EFS, and S3 storage on AWS?
EBS (Elastic Block Store): block storage, attached to one EC2 instance at a time (ReadWriteOnce). Like a hard drive. Use for OS volumes, databases (RDS uses EBS), single-instance app data. High IOPS, low latency. Types: gp3 (general), io2 (high performance databases), st1 (throughput — Kafka), sc1 (cold, infrequent access). EFS (Elastic File System): network file system, multiple EC2 instances can mount simultaneously (ReadWriteMany). NFS protocol. Use for shared content (web tier accessing same files), EKS pods needing shared storage across nodes. More expensive than EBS. S3: object storage, HTTP API (not mountable as filesystem natively). Unlimited scale. Use for: backups, static content, data lake, application artifacts, logs. Cannot run a database on S3. Differences in EKS context: EBS for databases in StatefulSets, EFS for shared config or content across pods, S3 for application data and backups via SDK.


AWS · PRODUCTION
How do you troubleshoot an EC2 instance that is unreachable via SSH?
Systematic approach. First: check EC2 console — is the instance state Running? Check system status checks and instance status checks. System check failure means AWS hardware issue — stop and start the instance (this migrates to new hardware). Instance check failure means OS-level issue. Second: check Security Group — does it allow inbound 22 from your IP? Connections silently drop without SG rule. Third: check NACLs — is there a DENY rule on port 22? Fourth: check instance system log — EC2 Console → Get system log — shows Linux boot messages and any panic/crash. Fifth: if no SSH key access, use AWS Systems Manager Session Manager — no SSH needed, works through Systems Manager agent. Sixth: for EBS-backed instances, detach the root volume, attach to a working instance as secondary volume, fix the issue (bad sshd_config, full disk), reattach. Production rule: disable SSH entirely and use SSM Session Manager — no inbound ports, full audit trail.


AWS · ARCHITECT
How does AWS Auto Scaling work with ALB for a production application?
Full flow: ALB receives traffic, distributes to target group. Target group contains EC2 instances or EKS pods. Auto Scaling Group manages the EC2 instances. When CPU/memory/custom metric crosses threshold, ASG launches new instances, registers them with the target group, ALB starts sending traffic once health check passes. Scale-down: after cooldown period (300 seconds default), underutilised instances are terminated, deregistered from target group first so in-flight requests complete. Key settings: min/desired/max capacity, health check grace period (give new instances time to start), cooldown (prevent rapid scale-up/down flapping), instance warm-up (how long before new instance counted in metrics). ALB health check vs EC2 health check: ALB health check tests HTTP endpoint. If it fails, ALB removes instance from rotation but ASG does not know. Configure ASG to use ELB health checks to replace unhealthy instances automatically.


AWS · ENGINEER
What is IRSA in EKS and how does it compare to Azure Workload Identity?
IRSA (IAM Roles for Service Accounts) is EKS's mechanism for giving pods access to AWS services without storing credentials. It works through OIDC federation: the EKS cluster has an OIDC issuer URL. An IAM Role is created with a trust policy that trusts tokens from that OIDC issuer for a specific Kubernetes ServiceAccount. The pod uses that ServiceAccount and gets temporary AWS credentials automatically via the AWS SDK credential chain. The trust policy specifies: "I trust tokens from cluster X for ServiceAccount Y in namespace Z." When the payment pod calls S3, boto3 sees the ServiceAccount token in the pod filesystem, exchanges it for temporary AWS credentials, and makes the S3 call. No access keys stored anywhere. Comparison with Azure Workload Identity: identical concept, different implementation. Both use OIDC federation between Kubernetes ServiceAccounts and the cloud identity system (AWS IAM vs Azure AD). Both eliminate stored credentials. The practical difference: IRSA configuration is done per-cluster with eksctl or Terraform. Azure Workload Identity requires the federated credential to be set up on the Managed Identity resource. Both are the current production standard for their respective platforms — never use static access keys in pods.


AWS · ENGINEER
What is the difference between ALB and NLB in AWS? When do you use each?
ALB (Application Load Balancer) operates at Layer 7 (HTTP/HTTPS). It understands the content of the request: URL path routing (/api → backend, /static → S3), host-based routing (api.example.com → API service, app.example.com → frontend), gRPC, WebSocket, SSL termination, content-based routing, and WAF integration. Use ALB for: web applications, microservices with path-based routing, HTTP API endpoints, WebSocket applications. NLB (Network Load Balancer) operates at Layer 4 (TCP/UDP/TLS). It routes based on IP and port only, no content inspection. Handles millions of requests per second with ultra-low latency (microseconds vs milliseconds for ALB). Preserves the source IP of the client (ALB changes source IP to the ALB IP). Use NLB for: TCP/UDP applications (gaming servers, IoT), high-frequency trading where microsecond latency matters, applications requiring source IP preservation, EKS Services with type LoadBalancer where you need a static IP (NLB supports static Elastic IPs, ALB does not). In EKS: use the AWS Load Balancer Controller (LBC). Annotate Service type LoadBalancer with service.beta.kubernetes.io/aws-load-balancer-type: external to get an NLB, or use Ingress with IngressClass alb to get an ALB for HTTP routing.


AWS · ARCHITECT
How do you design a highly available three-tier application on AWS?
Three-tier (presentation, application, data) deployed across two AZs minimum. Presentation tier: static assets in S3 with CloudFront CDN in front. Dynamic frontend in ECS/EKS. ALB distributes across AZs. Auto Scaling Group maintains minimum 2 instances across AZs. Application tier: EKS with node groups spanning two AZs. HPA scales pods. Cluster Autoscaler adds nodes. ALB routes to the EKS service. Security groups allow only the ALB to reach the application tier — no direct internet access. Data tier: RDS with Multi-AZ deployment — primary in AZ-1, standby in AZ-2. Automatic failover if primary fails (1-2 minutes). Read replicas for read-heavy workloads. ElastiCache (Redis) in cluster mode across AZs for session storage and caching. All data tier resources in private subnets — no public access. Supporting services: Route53 for DNS with health checks and automatic failover. CloudFront for global CDN and DDoS protection (absorbs layer 7 attacks at edge). WAF attached to CloudFront and ALB for OWASP Top 10 protection. KMS encrypts all data at rest. Secrets Manager for database credentials (rotate automatically). CloudWatch for monitoring, CloudTrail for audit. For disaster recovery: S3 Cross-Region Replication for static assets, RDS cross-region read replica that can be promoted, infrastructure as Terraform code so you can rebuild in a new region from code.


AWS · PRODUCTION
EKS pods cannot access S3. Walk through your troubleshooting steps.
Step 1: check the error. From inside the pod: kubectl exec -it pod-name -- aws s3 ls s3://my-bucket. The error tells you everything. "Unable to locate credentials" means no IAM role attached. "Access Denied" means wrong permissions. "NoSuchBucket" means wrong bucket name or region. Step 2: verify IRSA setup. kubectl describe serviceaccount my-sa -n namespace — check for the annotation eks.amazonaws.com/role-arn. If missing: the ServiceAccount is not linked to an IAM role. Step 3: verify the pod is using the correct ServiceAccount. kubectl describe pod my-pod — check serviceAccountName. If it says "default", the deployment is not using the annotated ServiceAccount. Step 4: verify the IAM role trust policy. aws iam get-role --role-name MyEKSRole -- check the trust policy allows the EKS cluster OIDC issuer and the specific ServiceAccount. Common mistake: trust policy says the right cluster but wrong namespace or ServiceAccount name. Step 5: verify the IAM role has the right permissions. aws iam simulate-principal-policy checks whether the role can perform s3:GetObject on the bucket ARN without actually doing it. Step 6: check the bucket policy. The S3 bucket might have a policy that denies access regardless of IAM role. Also check if the bucket is in a different region and you need --region flag. Step 7: token expiry. IRSA tokens expire after 24 hours by default. Check pod age — if very old pod, restart it to get fresh credentials.


id="sec-roadmap">

## 🗺️ Roadmap›





Week 1
Foundations

Create AWS free account
Understand regions and AZs
IAM users, groups, policies
Launch first EC2, SSH in



Week 2
Networking

Create VPC from scratch (not default)
Public + private subnets
Security groups + NACLs
NAT Gateway



Week 3-4
Core Services

S3 with versioning + encryption
RDS Multi-AZ
ALB + Auto Scaling Group
CloudWatch alarms



Month 2
DevOps on AWS

EKS cluster with eksctl
IRSA for pod permissions
Terraform for all infrastructure
AWS Solutions Architect exam prep


Continue Learning
[☸️ Kubernetes](/devops/kubernetes.html)[🔷 Terraform](/devops/terraform.html)[🔵 Azure](/cloud/azure.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
