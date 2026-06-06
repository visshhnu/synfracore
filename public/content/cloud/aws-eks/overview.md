# AWS EKS — Elastic Kubernetes Service

EKS is AWS's managed Kubernetes service. Like AKS on Azure, AWS manages the control plane (API server, etcd, scheduler) for free — you pay only for worker nodes and data transfer.

## EKS vs Self-Managed Kubernetes

| | EKS | Self-Managed |
|--|--|--|
| **Control plane** | AWS managed, free | You manage, you pay |
| **Upgrades** | 1-click or CLI | Manual, complex |
| **HA control plane** | Built-in (multi-AZ) | You configure |
| **AWS integration** | Native (IAM, ALB, EBS) | Plugin-based |
| **Cost** | $0.10/hour per cluster + nodes | Just nodes |
| **Best for** | Most production workloads | Advanced customization |

## Create EKS Cluster

```bash
# Install eksctl (recommended tool for EKS)
curl --silent --location \
  "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" \
  | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Create cluster with eksctl
eksctl create cluster \
  --name prod-cluster \
  --region us-east-1 \
  --version 1.29 \
  --nodegroup-name standard-workers \
  --node-type m5.xlarge \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 20 \
  --managed \
  --asg-access \
  --with-oidc \
  --ssh-access \
  --ssh-public-key my-key

# Get kubeconfig
aws eks update-kubeconfig --name prod-cluster --region us-east-1

# Verify
kubectl get nodes
```

```yaml
# cluster.yaml — eksctl config file (recommended for production)
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: prod-cluster
  region: us-east-1
  version: "1.29"

# Availability zones
availabilityZones: ["us-east-1a", "us-east-1b", "us-east-1c"]

# IAM OIDC for pod-level IAM roles
iam:
  withOIDC: true

# VPC — use existing VPC
vpc:
  id: vpc-xxxxxxxx
  subnets:
    private:
      us-east-1a: { id: subnet-aaaa }
      us-east-1b: { id: subnet-bbbb }
      us-east-1c: { id: subnet-cccc }
    public:
      us-east-1a: { id: subnet-dddd }
      us-east-1b: { id: subnet-eeee }
      us-east-1c: { id: subnet-ffff }

# Node groups
managedNodeGroups:
  # System nodes
  - name: system-nodes
    instanceType: m5.large
    minSize: 2
    maxSize: 4
    desiredCapacity: 2
    labels:
      role: system
    taints:
      - key: CriticalAddonsOnly
        value: "true"
        effect: NoSchedule
    privateNetworking: true
    iam:
      attachPolicyARNs:
        - arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
        - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
        - arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

  # Application nodes
  - name: app-nodes
    instanceType: m5.2xlarge
    minSize: 3
    maxSize: 50
    desiredCapacity: 5
    labels:
      role: application
    privateNetworking: true
    amiFamily: AmazonLinux2
    iam:
      attachPolicyARNs:
        - arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
        - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
        - arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

  # Spot instance nodes (for batch/dev workloads)
  - name: spot-nodes
    instanceTypes: ["m5.xlarge", "m5a.xlarge", "m4.xlarge"]  # Diverse for availability
    spot: true
    minSize: 0
    maxSize: 20
    desiredCapacity: 0
    labels:
      role: spot
      lifecycle: Ec2Spot
    taints:
      - key: lifecycle
        value: Ec2Spot
        effect: NoSchedule

# Add-ons
addons:
  - name: vpc-cni
    version: latest
  - name: coredns
    version: latest
  - name: kube-proxy
    version: latest
  - name: aws-ebs-csi-driver
    version: latest
    wellKnownPolicies:
      ebsCSIController: true
```

```bash
# Deploy from config file
eksctl create cluster -f cluster.yaml
```

## IAM Roles for Service Accounts (IRSA)

IRSA is how pods get AWS permissions without static credentials — equivalent to Azure Workload Identity.

```bash
# Enable OIDC provider (if not done at cluster creation)
eksctl utils associate-iam-oidc-provider \
  --cluster prod-cluster \
  --approve

# Create IAM service account with S3 read access
eksctl create iamserviceaccount \
  --name myapp-sa \
  --namespace production \
  --cluster prod-cluster \
  --role-name myapp-s3-role \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
  --approve \
  --override-existing-serviceaccounts
```

```yaml
# Use the service account in your deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: production
spec:
  template:
    spec:
      serviceAccountName: myapp-sa    # This SA has AWS S3 access via IRSA
      containers:
      - name: myapp
        image: myapp:latest
        # boto3 / AWS SDK automatically picks up credentials via IRSA
        # No secrets needed!
```

```python
# Python — works automatically with IRSA
import boto3

s3 = boto3.client('s3')  # Credentials from IRSA token automatically
response = s3.list_objects_v2(Bucket='my-bucket')
```

## AWS Load Balancer Controller

For production-grade load balancing in EKS:

```bash
# Install AWS Load Balancer Controller
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=prod-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
```

```yaml
# Ingress using AWS ALB
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp-ingress
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:...
    alb.ingress.kubernetes.io/ssl-redirect: '443'
    alb.ingress.kubernetes.io/healthcheck-path: /health
spec:
  rules:
  - host: api.myapp.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: myapp
            port:
              number: 80
```

## Cluster Autoscaler

```bash
# Install Cluster Autoscaler
helm install cluster-autoscaler autoscaler/cluster-autoscaler \
  --namespace kube-system \
  --set autoDiscovery.clusterName=prod-cluster \
  --set awsRegion=us-east-1 \
  --set rbac.serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=arn:aws:iam::123456789:role/cluster-autoscaler
```

## EKS Add-ons

```bash
# List available add-ons
aws eks describe-addon-versions --region us-east-1

# Install EBS CSI Driver (required for PersistentVolumes)
aws eks create-addon \
  --cluster-name prod-cluster \
  --addon-name aws-ebs-csi-driver \
  --service-account-role-arn arn:aws:iam::123456789:role/ebs-csi-controller-role

# Install CoreDNS, kube-proxy, VPC CNI (usually pre-installed)
aws eks list-addons --cluster-name prod-cluster
```

## EKS Upgrade Process

```bash
# 1. Check current version
kubectl version

# 2. Upgrade control plane
aws eks update-cluster-version \
  --name prod-cluster \
  --kubernetes-version 1.29

# Wait for upgrade
aws eks wait cluster-active --name prod-cluster

# 3. Update add-ons
aws eks update-addon --cluster-name prod-cluster --addon-name vpc-cni
aws eks update-addon --cluster-name prod-cluster --addon-name coredns
aws eks update-addon --cluster-name prod-cluster --addon-name kube-proxy

# 4. Upgrade node groups (one at a time)
eksctl upgrade nodegroup \
  --name app-nodes \
  --cluster prod-cluster \
  --kubernetes-version 1.29

# OR create new node group with new version, drain old nodes
eksctl create nodegroup --config-file cluster.yaml --include app-nodes-v2
kubectl drain old-node --ignore-daemonsets --delete-emptydir-data
eksctl delete nodegroup --cluster prod-cluster --name app-nodes
```

## Interview Questions

**What is the difference between EKS managed and self-managed node groups?**
Managed node groups: AWS handles node provisioning, AMI updates, and termination. Upgrades are rolling and automated. Supports spot instances. Nodes are AWS-managed EC2s in an Auto Scaling Group that EKS owns. Self-managed: you control the AMI, bootstrapping script, and ASG configuration. More flexibility but more responsibility. Use managed for most workloads; self-managed when you need custom AMIs, specific networking configurations, or unsupported instance types.

**How does IRSA work and why is it better than instance profiles?**
With instance profiles (the old approach), ALL pods on a node share the same AWS permissions — a compromised pod could access any AWS service the node's role has access to. IRSA (IAM Roles for Service Accounts) uses OIDC federation: each Kubernetes ServiceAccount gets its own IAM role. When a pod starts, the EKS token webhook injects a projected service account token. The AWS SDK exchanges this token for temporary STS credentials scoped to just that role. If a pod is compromised, blast radius is limited to only that pod's permissions.
