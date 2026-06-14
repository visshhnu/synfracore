export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_cloud: TechLabs = {
"aws-iam": [
  { id: "iam-lab-1", title: "IAM Users, Roles, and Policies", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Create users, groups, roles and write least-privilege policies",
    interface: "terminal",
    steps: [
      { id: "iam1", title: "Create an IAM user with CLI", type: "command",
        description: "Create a developer user, add to a group, and generate access keys.",
        code: `aws iam create-user --user-name dev-alice
aws iam create-group --group-name developers
aws iam add-user-to-group --user-name dev-alice --group-name developers
aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table`,
        explanation: "Never create IAM users for services — use IAM roles. IAM users are for humans. Enable MFA for all IAM users with console access." },
      { id: "iam2", title: "Write a least-privilege policy", type: "code",
        description: "Grant only S3 read access to a specific bucket — principle of least privilege.",
        language: "json",
        code: `cat > s3-readonly-policy.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["s3:GetObject","s3:ListBucket"],
    "Resource": ["arn:aws:s3:::my-app-data","arn:aws:s3:::my-app-data/*"]
  }]
}
EOF
aws iam create-policy --policy-name S3ReadOnly --policy-document file://s3-readonly-policy.json`,
        explanation: "Least privilege: grant only minimum needed. Use conditions to restrict further. Always test with IAM Policy Simulator before attaching to users." },
    ],
  },
],

// ═══ CLOUD: AWS EC2 ═══

"aws-ec2": [
  { id: "ec2-lab-1", title: "Launch and Configure EC2", difficulty: "Beginner", duration: "20 min",
    tools: ["aws-cli"], objective: "Launch EC2, connect via SSM, install software with user data",
    interface: "terminal",
    steps: [
      { id: "ec21", title: "Launch an EC2 instance", type: "command",
        description: "Launch Amazon Linux 2023 instance using the AWS CLI.",
        code: `AMI=$(aws ec2 describe-images --owners amazon \
  --filters "Name=name,Values=al2023-ami-*-x86_64" \
  --query 'sort_by(Images,&CreationDate)[-1].ImageId' --output text)

aws ec2 run-instances \
  --image-id $AMI --instance-type t3.micro \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web-server}]' \
  --query 'Instances[0].InstanceId' --output text`,
        explanation: "Always tag instances: Name, Environment, Owner, Project. Use SSM Session Manager instead of SSH — no key pairs, no port 22, all sessions logged." },
      { id: "ec22", title: "Bootstrap with user data", type: "command",
        description: "User data script runs at first boot to install software automatically.",
        code: `cat > userdata.sh << 'EOF'
#!/bin/bash
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html
EOF

aws ec2 run-instances --image-id $AMI --instance-type t3.micro --user-data file://userdata.sh`,
        explanation: "User data runs as root at first boot — perfect for installing packages, configuring services, pulling app code. For complex bootstrapping, use Ansible or Systems Manager." },
    ],
  },
],

// ═══ CLOUD: AWS S3 ═══

"aws-s3": [
  { id: "s3-lab-1", title: "S3: Buckets, Security, and Lifecycle", difficulty: "Beginner", duration: "20 min",
    tools: ["aws-cli"], objective: "Create secure S3 buckets, upload files, configure lifecycle rules",
    interface: "terminal",
    steps: [
      { id: "s31", title: "Create and secure a bucket", type: "command",
        description: "Create a bucket with versioning, encryption, and public access blocked.",
        code: `BUCKET="myapp-$(aws sts get-caller-identity --query Account --output text)"
aws s3api create-bucket --bucket $BUCKET --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-public-access-block --bucket $BUCKET \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
aws s3api put-bucket-versioning --bucket $BUCKET --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket $BUCKET \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'`,
        explanation: "Block public access at account level for all new buckets. Enable versioning to recover deleted files. Server-side encryption protects data at rest." },
      { id: "s32", title: "Upload and share files", type: "command",
        description: "Copy files to S3 and generate time-limited presigned URLs.",
        code: `echo "Hello S3" > test.txt
aws s3 cp test.txt s3://$BUCKET/data/test.txt
aws s3 sync ./local/ s3://$BUCKET/uploads/ --exclude "*.tmp"
aws s3 ls s3://$BUCKET/ --recursive --human-readable
# Share privately for 1 hour
aws s3 presign s3://$BUCKET/data/test.txt --expires-in 3600`,
        explanation: "s3 sync only transfers changed files. Presigned URLs let you share private objects without changing bucket permissions — URL valid for specified duration then expires." },
    ],
  },
],

// ═══ CLOUD: AWS VPC ═══

"aws-vpc": [
  { id: "vpc-lab-1", title: "Build a Production VPC", difficulty: "Intermediate", duration: "30 min",
    tools: ["aws-cli"], objective: "Create a 3-tier VPC: public, private, and data subnets",
    interface: "terminal",
    steps: [
      { id: "vpc1", title: "Create VPC and subnets", type: "command",
        description: "Build isolated network with public subnets for LBs and private for apps.",
        code: `VPC=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)
aws ec2 modify-vpc-attribute --vpc-id $VPC --enable-dns-hostnames
PUB=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a --query 'Subnet.SubnetId' --output text)
PRIV=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.0.11.0/24 --availability-zone ap-south-1a --query 'Subnet.SubnetId' --output text)
echo "VPC: $VPC | Public: $PUB | Private: $PRIV"`,
        explanation: "3-tier architecture: Public (internet-facing LBs), Private App (applications), Private Data (databases). Span 2+ AZs for high availability. Use 10.0.0.0/16 for VPC to give 65K IPs." },
      { id: "vpc2", title: "Internet Gateway and NAT", type: "command",
        description: "Connect public subnets to internet. Private subnets get outbound via NAT.",
        code: `IGW=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --vpc-id $VPC --internet-gateway-id $IGW
PUB_RT=$(aws ec2 create-route-table --vpc-id $VPC --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id $PUB_RT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW
aws ec2 associate-route-table --subnet-id $PUB --route-table-id $PUB_RT`,
        explanation: "Internet Gateway: bidirectional internet access (public subnets). NAT Gateway: outbound-only (private subnets for updates/patches). NAT Gateway costs $0.045/hr — turn off in dev/test environments." },
    ],
  },
],

// ═══ DATABASES: MYSQL ═══

"aws-rds": [
  { id: "rds-lab-1", title: "AWS RDS: Deploy and Manage PostgreSQL", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli", "psql"], objective: "Launch RDS PostgreSQL, configure security, connect, create snapshots",
    interface: "terminal",
    steps: [
      { id: "rds1", title: "Launch an RDS instance", type: "command",
        description: "Create a production-grade RDS PostgreSQL instance with Multi-AZ.",
        code: `aws rds create-db-instance \
  --db-instance-identifier prod-postgres \
  --db-instance-class db.t3.medium \
  --engine postgres \
  --engine-version 16.1 \
  --master-username dbadmin \
  --master-user-password "$(openssl rand -base64 16)" \
  --allocated-storage 100 \
  --storage-type gp3 \
  --multi-az \
  --no-publicly-accessible \
  --backup-retention-period 7 \
  --deletion-protection

aws rds wait db-instance-available --db-instance-identifier prod-postgres
aws rds describe-db-instances --db-instance-identifier prod-postgres   --query 'DBInstances[0].[DBInstanceStatus,Endpoint.Address,MultiAZ]'`,
        explanation: "Multi-AZ: standby replica in another AZ, automatic failover in 1-2 min. no-publicly-accessible: only reachable from within VPC. deletion-protection prevents accidental deletion. backup-retention: 7 days of automated backups." },
      { id: "rds2", title: "Connect and manage database", type: "command",
        description: "Connect via psql, create databases, and monitor performance.",
        code: `ENDPOINT=$(aws rds describe-db-instances --db-instance-identifier prod-postgres --query 'DBInstances[0].Endpoint.Address' --output text)
psql -h $ENDPOINT -U dbadmin -d postgres

CREATE DATABASE myapp;
CREATE USER appuser WITH PASSWORD 'strong-password-here';
GRANT ALL PRIVILEGES ON DATABASE myapp TO appuser;

# Monitor
aws rds describe-db-log-files --db-instance-identifier prod-postgres
aws cloudwatch get-metric-statistics   --namespace AWS/RDS --metric-name DatabaseConnections   --dimensions Name=DBInstanceIdentifier,Value=prod-postgres   --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)   --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ)   --period 60 --statistics Maximum`,
        explanation: "Never use master user for application connections. Create a dedicated app user with minimal privileges. Monitor: DatabaseConnections, CPUUtilization, FreeStorageSpace, ReadLatency, WriteLatency." },
    ],
  },
],

// ═══ CLOUD: AWS LAMBDA ═══

"aws-lambda": [
  { id: "lambda-lab-1", title: "AWS Lambda: Serverless Functions", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli", "python"], objective: "Deploy a Lambda function, trigger it, handle events, monitor logs",
    interface: "terminal",
    steps: [
      { id: "lam1", title: "Create and deploy a Lambda function", type: "command",
        description: "Deploy a Python Lambda that processes S3 events.",
        code: `cat > lambda_function.py << 'EOF'
import json
import boto3

def lambda_handler(event, context):
    print(f"Event: {json.dumps(event)}")
    
    # Process S3 event
    for record in event.get('Records', []):
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"Processing: s3://{bucket}/{key}")
    
    return {'statusCode': 200, 'body': json.dumps('OK')}
EOF

zip function.zip lambda_function.py

aws lambda create-function   --function-name process-uploads   --runtime python3.12   --role arn:aws:iam::ACCOUNT:role/LambdaBasicRole   --handler lambda_function.lambda_handler   --zip-file fileb://function.zip   --timeout 30   --memory-size 256   --environment "Variables={LOG_LEVEL=INFO}"`,
        explanation: "Lambda auto-scales: 0 to 10,000 concurrent executions. Pricing: pay only when running (no idle cost). timeout: max 15 minutes. memory-size: more memory = more CPU (vCPU scales linearly with memory)." },
      { id: "lam2", title: "Invoke and monitor Lambda", type: "command",
        description: "Test the function, check logs, set up alarms.",
        code: `# Invoke directly
aws lambda invoke   --function-name process-uploads   --payload '{"Records":[{"s3":{"bucket":{"name":"my-bucket"},"object":{"key":"test.csv"}}}]}'   --cli-binary-format raw-in-base64-out   output.json
cat output.json

# Check logs
aws logs tail /aws/lambda/process-uploads --follow --since 5m

# Monitor errors
aws cloudwatch get-metric-statistics   --namespace AWS/Lambda   --metric-name Errors   --dimensions Name=FunctionName,Value=process-uploads   --start-time $(date -u -d '1 hour ago' +%Y-%m-%dT%H:%M:%SZ)   --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ)   --period 60 --statistics Sum`,
        explanation: "Lambda logs go to CloudWatch Logs automatically. Key metrics: Duration (latency), Errors (failures), Throttles (concurrent limit hit), ConcurrentExecutions. Set alarms on Errors > 0 for production functions." },
    ],
  },
],

// ═══ CLOUD: AWS EKS ═══

"aws-eks": [
  { id: "eks-lab-1", title: "AWS EKS: Managed Kubernetes", difficulty: "Advanced", duration: "35 min",
    tools: ["aws-cli", "kubectl", "eksctl"], objective: "Create EKS cluster, deploy workloads, configure autoscaling",
    interface: "terminal",
    steps: [
      { id: "eks1", title: "Create EKS cluster with eksctl", type: "command",
        description: "eksctl is the official CLI for creating EKS clusters — simplifies the process significantly.",
        code: `cat > cluster.yaml << 'EOF'
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig
metadata:
  name: prod-cluster
  region: ap-south-1
  version: "1.30"

managedNodeGroups:
  - name: workers
    instanceType: t3.medium
    desiredCapacity: 2
    minSize: 1
    maxSize: 10
    privateNetworking: true
    labels: {role: worker}
    tags:
      Environment: production

addons:
  - name: vpc-cni
  - name: coredns
  - name: kube-proxy
  - name: aws-ebs-csi-driver
EOF

eksctl create cluster -f cluster.yaml
aws eks update-kubeconfig --name prod-cluster --region ap-south-1`,
        explanation: "eksctl creates VPC, subnets, IAM roles, and the cluster. privateNetworking: nodes in private subnets (no public IP). Managed node groups handle OS patching and node replacement automatically." },
      { id: "eks2", title: "Deploy and autoscale", type: "command",
        description: "Deploy an app with HPA for CPU-based autoscaling.",
        code: `kubectl apply -f - <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
spec:
  replicas: 2
  selector:
    matchLabels: {app: webapp}
  template:
    metadata:
      labels: {app: webapp}
    spec:
      containers:
      - name: webapp
        image: nginx:alpine
        resources:
          requests: {cpu: "100m", memory: "128Mi"}
          limits:   {cpu: "200m", memory: "256Mi"}
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: webapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: webapp
  minReplicas: 2
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
EOF
kubectl get hpa`,
        explanation: "HPA scales pods based on CPU/memory metrics. Resource requests are required for HPA to work — it compares actual usage to requested CPU%. Cluster Autoscaler or Karpenter scales nodes when pods can't be scheduled." },
    ],
  },
],

// ═══ CLOUD: CLOUDFORMATION ═══

"cloudformation": [
  { id: "cfn-lab-1", title: "CloudFormation: Infrastructure as YAML", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Write a CloudFormation template, deploy a stack, update and rollback",
    interface: "terminal",
    steps: [
      { id: "cfn1", title: "Write and deploy a stack", type: "command",
        description: "Create an EC2 with security group using CloudFormation.",
        code: `cat > template.yaml << 'EOF'
AWSTemplateFormatVersion: '2010-09-09'
Parameters:
  EnvironmentName:
    Type: String
    Default: dev
    AllowedValues: [dev, staging, prod]

Resources:
  WebSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: !Sub "\${EnvironmentName} web server SG"
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0
      Tags:
        - Key: Name
          Value: !Sub "\${EnvironmentName}-web-sg"

Outputs:
  SecurityGroupId:
    Value: !Ref WebSecurityGroup
    Export:
      Name: !Sub "\${EnvironmentName}-WebSG"
EOF

aws cloudformation deploy   --template-file template.yaml   --stack-name my-web-stack   --parameter-overrides EnvironmentName=dev

aws cloudformation describe-stacks --stack-name my-web-stack   --query 'Stacks[0].Outputs'`,
        explanation: "!Sub substitutes variables. !Ref returns the resource's ID. Outputs can be imported by other stacks. CloudFormation maintains state and handles rollback on failure automatically." },
    ],
  },
],

// ═══ CLOUD: AZURE VMS ═══

"azure-vms": [
  { id: "azvm-lab-1", title: "Azure VMs: Deploy and Manage", difficulty: "Intermediate", duration: "25 min",
    tools: ["az-cli"], objective: "Create a VM, connect via Bastion, install software, create a custom image",
    interface: "terminal",
    steps: [
      { id: "azvm1", title: "Create VM with Azure CLI", type: "command",
        description: "Deploy a Ubuntu VM with managed identity — no passwords or keys stored.",
        code: `az group create --name prod-rg --location eastus

az vm create   --resource-group prod-rg   --name web-vm-01   --image Ubuntu2204   --size Standard_D2s_v3   --admin-username azureuser   --generate-ssh-keys   --assign-identity '[system]'   --no-wait

az vm list --resource-group prod-rg --output table
az vm show --resource-group prod-rg --name web-vm-01 --query '{status:powerState,ip:publicIps}'`,
        explanation: "assign-identity '[system]' creates a system-assigned managed identity — the VM can access Azure services without storing credentials. generate-ssh-keys creates keys if they don't exist." },
    ],
  },
],

// ═══ CLOUD: GKE ═══

"gke": [
  { id: "gke-lab-1", title: "GKE Autopilot: Managed Kubernetes on GCP", difficulty: "Intermediate", duration: "25 min",
    tools: ["gcloud", "kubectl"], objective: "Create GKE Autopilot cluster, deploy workloads, use Workload Identity",
    interface: "terminal",
    steps: [
      { id: "gke1", title: "Create GKE Autopilot cluster", type: "command",
        description: "Autopilot: fully managed nodes, pay per pod, automatic security hardening.",
        code: `gcloud container clusters create-auto prod-cluster   --region asia-south1   --release-channel regular   --enable-master-authorized-networks   --master-authorized-networks "$(curl -s ifconfig.me)/32"

gcloud container clusters get-credentials prod-cluster --region asia-south1
kubectl get nodes`,
        explanation: "GKE Autopilot: Google manages nodes (OS patching, node provisioning, scaling). You only pay for pod resources. Standard clusters give more control but require managing node pools." },
    ],
  },
],

// ═══ CLOUD: BIGQUERY ═══

"bigquery": [
  { id: "bq-lab-1", title: "BigQuery: Serverless Analytics at Scale", difficulty: "Intermediate", duration: "25 min",
    tools: ["bq", "gcloud"], objective: "Query public datasets, write optimized SQL, create partitioned tables",
    interface: "terminal",
    steps: [
      { id: "bq1", title: "Query public BigQuery datasets", type: "command",
        description: "BigQuery has petabytes of public data — great for learning without loading your own.",
        code: `# Query GitHub data (public dataset)
bq query --use_legacy_sql=false '
SELECT
  repo_name,
  COUNT(*) AS pushes,
  COUNT(DISTINCT actor.login) AS contributors
FROM bigquery-public-data.github_repos.commits
WHERE author.date > "2023-01-01"
GROUP BY repo_name
ORDER BY pushes DESC
LIMIT 10'

# Check bytes processed BEFORE running (cost control)
bq query --dry_run --use_legacy_sql=false 'SELECT COUNT(*) FROM bigquery-public-data.github_repos.commits'`,
        explanation: "BigQuery charges per bytes scanned ($5/TB). --dry_run shows bytes without running query. Use partitioned tables and WHERE on partition column to reduce scan. SELECT * on large tables = expensive mistake." },
    ],
  },
],

// ═══ CLOUD: COST OPTIMIZATION ═══

"cost-optimization": [
  { id: "co-lab-1", title: "AWS Cost Analysis and Optimization", difficulty: "Intermediate", duration: "25 min",
    tools: ["aws-cli"], objective: "Find idle resources, analyze spend, apply savings plans",
    interface: "terminal",
    steps: [
      { id: "co1", title: "Find waste with AWS tools", type: "command",
        description: "Identify unattached EBS volumes, unused EIPs, idle load balancers.",
        code: `# Unattached EBS volumes (you pay even when not attached!)
aws ec2 describe-volumes   --filters Name=status,Values=available   --query 'Volumes[*].[VolumeId,Size,VolumeType,CreateTime]'   --output table

# Unassociated Elastic IPs ($0.005/hr when not attached = $3.60/month)
aws ec2 describe-addresses   --query 'Addresses[?AssociationId==null].[AllocationId,PublicIp]'   --output table

# Compute Optimizer recommendations
aws compute-optimizer get-ec2-instance-recommendations   --filters name=Finding,values=OVER_PROVISIONED   --query 'instanceRecommendations[*].[instanceArn,finding,recommendationOptions[0].instanceType]'   --output table

# Cost by service this month
aws ce get-cost-and-usage   --time-period Start=$(date -u +%Y-%m-01),End=$(date -u +%Y-%m-%d)   --granularity MONTHLY --metrics BlendedCost   --group-by Type=DIMENSION,Key=SERVICE`,
        explanation: "Typical quick wins: delete unattached EBS (easy), release unused EIPs (easy), right-size over-provisioned EC2 (saves 20-40%), stop dev instances outside business hours (saves 65%)." },
    ],
  },
],

// ═══ CLOUD: OTHER AZURE ═══

"azure-vnets": [
  { id: "vnet-lab-1", title: "Azure VNets: Network Architecture", difficulty: "Intermediate", duration: "20 min",
    tools: ["az-cli"], objective: "Build a hub-spoke VNet topology with peering and NSGs",
    interface: "terminal",
    steps: [
      { id: "vnet1", title: "Create VNet with subnets", type: "command",
        description: "Build a production VNet with public and private subnets.",
        code: `az network vnet create --name prod-vnet --resource-group prod-rg --address-prefix 10.0.0.0/16
az network vnet subnet create --vnet-name prod-vnet --resource-group prod-rg --name web-subnet --address-prefix 10.0.1.0/24
az network vnet subnet create --vnet-name prod-vnet --resource-group prod-rg --name app-subnet --address-prefix 10.0.2.0/24
az network nsg create --name web-nsg --resource-group prod-rg
az network nsg rule create --nsg-name web-nsg --resource-group prod-rg --name allow-https --priority 100 --protocol Tcp --destination-port-ranges 443`,
        explanation: "NSG (Network Security Group) is like AWS Security Group — stateful firewall at subnet or NIC level. Azure NSG rules have priorities (lower = higher priority). 100 is high priority." },
    ],
  },
],

"azure-entra": [
  { id: "entra-lab-1", title: "Azure Entra ID: Identity and RBAC", difficulty: "Intermediate", duration: "20 min",
    tools: ["az-cli"], objective: "Configure managed identities, assign RBAC roles, create service principals",
    interface: "terminal",
    steps: [
      { id: "entra1", title: "Assign RBAC roles", type: "command",
        description: "Azure RBAC: who can do what on which resource.",
        code: `az role assignment create   --assignee user@company.com   --role "Contributor"   --scope "/subscriptions/SUB-ID/resourceGroups/prod-rg"

az role assignment create   --assignee user@company.com   --role "Storage Blob Data Reader"   --scope "/subscriptions/SUB-ID/resourceGroups/prod-rg/providers/Microsoft.Storage/storageAccounts/mystorageaccount"

az role assignment list --assignee user@company.com --output table`,
        explanation: "Azure RBAC scope: management group → subscription → resource group → resource. Narrower scope = less access. Use built-in roles first. Create custom roles only when built-ins don't fit." },
    ],
  },
],

"azure-aks": [
  { id: "aks-lab-1", title: "Azure AKS: Managed Kubernetes", difficulty: "Advanced", duration: "30 min",
    tools: ["az-cli", "kubectl"], objective: "Create AKS cluster, deploy workloads, configure KEDA autoscaling",
    interface: "terminal",
    steps: [
      { id: "aks1", title: "Create AKS cluster", type: "command",
        description: "Deploy AKS with OIDC, Workload Identity, and auto-upgrades enabled.",
        code: `az aks create   --resource-group prod-rg   --name prod-aks   --node-count 3   --node-vm-size Standard_D4s_v5   --enable-oidc-issuer   --enable-workload-identity   --enable-cluster-autoscaler   --min-count 1 --max-count 10   --auto-upgrade-channel rapid   --network-plugin azure

az aks get-credentials --resource-group prod-rg --name prod-aks
kubectl get nodes`,
        explanation: "Workload Identity: pods authenticate to Azure services via OIDC (no credentials in pods). auto-upgrade-channel: AKS auto-patches Kubernetes version. Cluster autoscaler: scales node count based on pending pods." },
    ],
  },
],

"azure-devops": [
  { id: "ado-lab-1", title: "Azure DevOps: CI/CD Pipelines", difficulty: "Intermediate", duration: "30 min",
    tools: ["azure-devops", "yaml"], objective: "Create a YAML pipeline with stages, environments, and approvals",
    interface: "none",
    steps: [
      { id: "ado1", title: "Write a multi-stage pipeline", type: "code",
        description: "Azure DevOps YAML pipeline with build → test → deploy stages.",
        language: "yaml",
        code: `trigger:
  branches:
    include: [main, develop]

pool:
  vmImage: ubuntu-latest

variables:
  DOCKER_REGISTRY: myregistry.azurecr.io
  IMAGE_NAME: myapp
  IMAGE_TAG: $(Build.BuildId)

stages:
- stage: Build
  jobs:
  - job: BuildTest
    steps:
    - task: NodeTool@0
      inputs: {versionSpec: '20.x'}
    - script: npm ci && npm test
    - task: Docker@2
      inputs:
        containerRegistry: ACR-Connection
        repository: $(IMAGE_NAME)
        command: buildAndPush
        tags: $(IMAGE_TAG)

- stage: DeployStaging
  dependsOn: Build
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: Deploy
    environment: staging    # Configure approvals in Environments UI
    strategy:
      runOnce:
        deploy:
          steps:
          - task: HelmDeploy@0
            inputs:
              kubernetesServiceEndpoint: aks-staging
              command: upgrade
              chartName: myapp
              releaseName: myapp
              overrideValues: image.tag=$(IMAGE_TAG)`,
        explanation: "condition: only deploy to staging from main branch. Environments: configure required approvals so production needs 2 approvers. dependsOn: ensures stages run in order." },
    ],
  },
],

"cloud-run": [
  { id: "cr-lab-1", title: "Google Cloud Run: Serverless Containers", difficulty: "Intermediate", duration: "20 min",
    tools: ["gcloud", "docker"], objective: "Deploy a containerized app to Cloud Run with auto-scaling",
    interface: "terminal",
    steps: [
      { id: "cr1", title: "Deploy to Cloud Run", type: "command",
        description: "Cloud Run: serverless containers — auto-scales to 0, pay per request.",
        code: `# Build and push to Artifact Registry
gcloud auth configure-docker asia-south1-docker.pkg.dev
docker build -t asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest .
docker push asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest

# Deploy to Cloud Run
gcloud run deploy myapp   --image asia-south1-docker.pkg.dev/PROJECT/repo/myapp:latest   --region asia-south1   --allow-unauthenticated   --min-instances 0   --max-instances 100   --memory 512Mi   --cpu 1   --concurrency 80

gcloud run services describe myapp --region asia-south1`,
        explanation: "min-instances 0: scales to zero (no traffic = no cost). concurrency 80: one instance handles 80 concurrent requests. Cloud Run is perfect for APIs, webhooks, batch jobs — anything containerizable." },
    ],
  },
],

"cloud-security": [
  { id: "cs-lab-1", title: "Cloud Security Posture Management", difficulty: "Advanced", duration: "25 min",
    tools: ["aws-cli", "prowler"], objective: "Audit cloud security with automated CSPM tools and fix findings",
    interface: "terminal",
    steps: [
      { id: "csec1", title: "Run security audit with Prowler", type: "command",
        description: "Prowler is the most popular open-source CSPM tool — scans AWS, Azure, GCP.",
        code: `# Install Prowler
pip install prowler

# Run all checks (takes 10-30 min)
prowler aws --output-formats json html

# Run only specific services
prowler aws -s s3 iam guardduty

# CIS benchmark only
prowler aws --compliance cis_level2_aws

# Quick critical findings summary
prowler aws --output-formats json | python3 -c "
import json,sys
data=[json.loads(l) for l in sys.stdin if l.strip()]
critical=[d for d in data if d.get('Status')=='FAIL' and d.get('Severity')=='critical']
print(f'Critical findings: {len(critical)}')
for c in critical[:5]:
    print(f'  [{c["ServiceName"]}] {c["CheckTitle"]}')"`,
        explanation: "CSPM = Cloud Security Posture Management. Prowler checks 300+ AWS security controls: public S3 buckets, open security groups, unencrypted volumes, missing MFA, CloudTrail disabled, etc." },
    ],
  },
],

"landing-zones": [
  { id: "lz-lab-1", title: "AWS Landing Zone with Control Tower", difficulty: "Advanced", duration: "30 min",
    tools: ["aws-cli"], objective: "Understand multi-account strategy and set up AWS Organizations with SCPs",
    interface: "terminal",
    steps: [
      { id: "lz1", title: "Set up AWS Organizations", type: "command",
        description: "Create an organization and apply Service Control Policies for governance.",
        code: `aws organizations create-organization --feature-set ALL

# Create OUs (Organizational Units)
ROOT_ID=$(aws organizations list-roots --query 'Roots[0].Id' --output text)
aws organizations create-organizational-unit --parent-id $ROOT_ID --name Production
aws organizations create-organizational-unit --parent-id $ROOT_ID --name Sandbox

# Apply SCP: restrict to specific regions only
cat > region-restriction.json << 'EOF'
{"Version":"2012-10-17","Statement":[{
  "Effect":"Deny",
  "NotAction":["iam:*","organizations:*","support:*"],
  "Resource":"*",
  "Condition":{"StringNotEquals":{"aws:RequestedRegion":["ap-south-1","us-east-1"]}}
}]}
EOF

SCP_ID=$(aws organizations create-policy --name RegionRestriction --type SERVICE_CONTROL_POLICY --content file://region-restriction.json --query 'Policy.PolicySummary.Id' --output text)

PROD_OU=$(aws organizations list-children --parent-id $ROOT_ID --child-type ORGANIZATIONAL_UNIT --query 'Children[?Name==Production].Id' --output text)
aws organizations attach-policy --policy-id $SCP_ID --target-id $PROD_OU`,
        explanation: "SCPs set maximum permissions for all accounts in an OU. Even the root user can't exceed SCP limits. Key SCPs: restrict regions, prevent leaving org, require MFA, prevent disabling CloudTrail, prevent deleting security services." },
    ],
  },
],

"route53": [
  { id: "r53-lab-1", title: "Route53: DNS and Traffic Routing", difficulty: "Intermediate", duration: "20 min",
    tools: ["aws-cli"], objective: "Create hosted zones, DNS records, health checks, and weighted routing",
    interface: "terminal",
    steps: [
      { id: "r531", title: "Create hosted zone and records", type: "command",
        description: "Create a hosted zone and configure various record types.",
        code: `ZONE_ID=$(aws route53 create-hosted-zone   --name example.com   --caller-reference "$(date +%s)"   --query 'HostedZone.Id' --output text | cut -d'/' -f3)

# A record
aws route53 change-resource-record-sets   --hosted-zone-id $ZONE_ID   --change-batch '{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"api.example.com","Type":"A","TTL":300,"ResourceRecords":[{"Value":"203.0.113.1"}]}}]}'

# MX record for email
aws route53 change-resource-record-sets   --hosted-zone-id $ZONE_ID   --change-batch '{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"example.com","Type":"MX","TTL":300,"ResourceRecords":[{"Value":"10 mail.example.com"}]}}]}'

aws route53 list-resource-record-sets --hosted-zone-id $ZONE_ID`,
        explanation: "Route53 ALIAS records are free and resolve instantly (unlike CNAMEs). Always use ALIAS for: ALB/NLB, CloudFront distributions, S3 website endpoints. CNAME can't be used at domain apex (example.com) — use ALIAS." },
    ],
  },
],

// ═══ SECURITY: SECURITY FUNDAMENTALS ═══
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_cloud[tech] || [];
}
