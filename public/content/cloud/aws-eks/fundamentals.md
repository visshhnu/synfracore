# AWS EKS — Fundamentals

## The Hook

If you already know Kubernetes, EKS doesn't teach you a new API — `kubectl`, Deployments, Services, and Ingress all work identically. What EKS changes is everything *around* the cluster: how you authenticate to it (IAM instead of a static kubeconfig password), how pods get AWS permissions (IRSA/Pod Identity instead of hand-managed credentials), and how nodes join it (managed node groups or Fargate instead of you `kubeadm join`-ing boxes by hand).

**Analogy** — Think of EKS as a rental kitchen versus building your own restaurant kitchen from scratch. The stove, the oven, the walk-in fridge (the Kubernetes control plane) are already installed, inspected, and maintained by the building owner (AWS). You still bring your own recipes, ingredients, and staff (your Deployments, container images, and workloads) — and you're the one who decides how many cooks (worker nodes) you need on a given night.

## Create EKS Cluster (Terraform)

```hcl
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "prod-cluster"
  cluster_version = "1.30"

  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Cluster access — use IAM roles for authentication
  cluster_addons = {
    coredns                = { most_recent = true }
    kube-proxy             = { most_recent = true }
    vpc-cni                = { most_recent = true }
    aws-ebs-csi-driver     = { most_recent = true }  # For PersistentVolumes
  }

  # Managed node groups
  eks_managed_node_groups = {
    general = {
      instance_types = ["m6g.large"]  # Graviton — cheaper
      min_size       = 2
      max_size       = 10
      desired_size   = 3
      
      iam_role_additional_policies = {
        SSM = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
    
    spot = {
      instance_types = ["m5.large", "m5.xlarge", "m4.large"]
      capacity_type  = "SPOT"
      min_size       = 0
      max_size       = 20
      desired_size   = 0
      
      taints = [{
        key    = "spot"
        value  = "true"
        effect = "NO_SCHEDULE"
      }]
    }
  }

  # Enable IRSA (IAM Roles for Service Accounts)
  enable_irsa = true
}
```

## IAM Roles for Service Accounts (IRSA)

```bash
# Give pods AWS permissions without long-term credentials

# 1. Create OIDC provider for cluster
eksctl utils associate-iam-oidc-provider \
    --cluster prod-cluster --approve

# 2. Create IAM role that can be assumed by the pod's service account
CLUSTER_OIDC=$(aws eks describe-cluster \
    --name prod-cluster \
    --query "cluster.identity.oidc.issuer" \
    --output text | sed 's|https://||')

aws iam create-role \
    --role-name EKS-S3-Reader \
    --assume-role-policy-document "{
        \"Version\": \"2012-10-17\",
        \"Statement\": [{
            \"Effect\": \"Allow\",
            \"Principal\": {\"Federated\": \"arn:aws:iam::ACCOUNT:oidc-provider/$CLUSTER_OIDC\"},
            \"Action\": \"sts:AssumeRoleWithWebIdentity\",
            \"Condition\": {
                \"StringEquals\": {
                    \"${CLUSTER_OIDC}:sub\": \"system:serviceaccount:default:my-app\"
                }
            }
        }]
    }"

aws iam attach-role-policy \
    --role-name EKS-S3-Reader \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

```yaml
# 3. Annotate Kubernetes service account with IAM role ARN
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-app
  namespace: default
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::ACCOUNT:role/EKS-S3-Reader

# 4. Use service account in deployment
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    spec:
      serviceAccountName: my-app   # Pod inherits IAM role
      containers:
      - name: app
        image: myapp:latest
        # App uses AWS SDK — no credentials needed!
```

## Cluster Autoscaler

```yaml
# Cluster Autoscaler — automatically add/remove nodes
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cluster-autoscaler
  namespace: kube-system
spec:
  template:
    spec:
      serviceAccountName: cluster-autoscaler
      containers:
      - name: cluster-autoscaler
        image: registry.k8s.io/autoscaling/cluster-autoscaler:v1.30.0
        command:
        - ./cluster-autoscaler
        - --v=4
        - --stderrthreshold=info
        - --cloud-provider=aws
        - --skip-nodes-with-local-storage=false
        - --expander=least-waste
        - --node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/prod-cluster
        - --balance-similar-node-groups
        - --skip-nodes-with-system-pods=false
```

## EKS Add-ons vs Self-Managed

```bash
# EKS manages add-on lifecycle (updates, security patches)
aws eks list-addons --cluster-name prod-cluster

# Common managed add-ons:
# vpc-cni:           Pod networking (AWS VPC CNI plugin)
# coredns:           DNS for cluster
# kube-proxy:        Network rules on each node
# aws-ebs-csi-driver: EBS PersistentVolumes
# aws-efs-csi-driver: EFS PersistentVolumes (shared storage)

# Update an add-on
aws eks update-addon \
    --cluster-name prod-cluster \
    --addon-name coredns \
    --addon-version v1.11.1-eksbuild.4

# Key tools to also install (not EKS add-ons):
# AWS Load Balancer Controller: Replace classic ELB with ALB/NLB
# External DNS: Automatically create Route53 records
# Cert Manager: Automatic TLS certificates
# Metrics Server: Required for kubectl top and HPA
```

## Try It (2 Minutes)

If you have `eksctl` and AWS CLI access to a sandbox account, the fastest way to see IRSA end-to-end:
```bash
eksctl utils associate-iam-oidc-provider --cluster prod-cluster --approve
aws eks describe-cluster --name prod-cluster \
  --query "cluster.identity.oidc.issuer" --output text
# Note the OIDC issuer URL printed — this is the trust anchor IAM uses to
# believe a Kubernetes ServiceAccount token, without any long-lived AWS key
```
No AWS access handy? Reason through it instead: the IAM trust policy above scopes access with a `StringEquals` condition on `system:serviceaccount:default:my-app`. If a different namespace deployed a ServiceAccount with the exact same name (`my-app`) in `namespace: staging` instead of `default`, would that pod be able to assume the same IAM role? Why or why not?
