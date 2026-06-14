# AWS EKS — Cheatsheet

```bash
# ── CLUSTER MANAGEMENT ────────────────────────────────────
# Create cluster with eksctl
eksctl create cluster --name prod   --region ap-south-1 --version 1.30   --nodegroup-name workers --node-type t3.medium   --nodes 3 --nodes-min 1 --nodes-max 10   --managed

# Get kubeconfig
aws eks update-kubeconfig --name prod --region ap-south-1

# Cluster info
aws eks describe-cluster --name prod --query 'cluster.[status,version,endpoint]' --output text
eksctl get cluster --region ap-south-1

# ── NODE GROUPS ───────────────────────────────────────────
eksctl create nodegroup --cluster prod   --name spot-workers --node-type m5.large   --spot --nodes 0 --nodes-min 0 --nodes-max 20

eksctl scale nodegroup --cluster prod --name workers --nodes 5
eksctl delete nodegroup --cluster prod --name old-workers --drain

# ── ADDONS ────────────────────────────────────────────────
aws eks create-addon --cluster-name prod --addon-name vpc-cni --resolve-conflicts OVERWRITE
aws eks create-addon --cluster-name prod --addon-name coredns
aws eks create-addon --cluster-name prod --addon-name kube-proxy
aws eks create-addon --cluster-name prod --addon-name aws-ebs-csi-driver
aws eks list-addons --cluster-name prod

# ── WORKLOAD IDENTITY (IRSA) ──────────────────────────────
# Create OIDC provider
eksctl utils associate-iam-oidc-provider --cluster prod --approve

# Create service account with IAM role
eksctl create iamserviceaccount   --cluster prod   --namespace default   --name s3-reader   --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess   --approve

# ── ALB INGRESS ───────────────────────────────────────────
# Install AWS Load Balancer Controller
helm install aws-load-balancer-controller eks/aws-load-balancer-controller   -n kube-system   --set clusterName=prod   --set serviceAccount.create=false   --set serviceAccount.name=aws-load-balancer-controller

# ── AUTOSCALING ───────────────────────────────────────────
# Cluster Autoscaler
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

# Karpenter (modern alternative - faster, cheaper)
helm install karpenter oci://public.ecr.aws/karpenter/karpenter   --namespace karpenter --create-namespace   --set settings.clusterName=prod

# ── UPGRADE ───────────────────────────────────────────────
# Update control plane
aws eks update-cluster-version --name prod --kubernetes-version 1.31
aws eks wait cluster-active --name prod

# Update node group
aws eks update-nodegroup-version --cluster-name prod --nodegroup-name workers
```
