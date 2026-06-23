# AWS EKS Quick Reference

## eksctl Commands
```bash
# Cluster management
eksctl create cluster --name my-cluster --region us-east-1 --nodegroup-name workers \
  --node-type m5.large --nodes 3 --nodes-min 2 --nodes-max 5 --managed
eksctl delete cluster --name my-cluster
eksctl get cluster
eksctl upgrade cluster --name my-cluster --approve

# Node groups
eksctl create nodegroup --cluster my-cluster --name gpu-pool \
  --node-type g4dn.xlarge --nodes 2 --nodes-min 0 --nodes-max 5
eksctl delete nodegroup --cluster my-cluster --name old-nodes
eksctl scale nodegroup --cluster my-cluster --name workers --nodes 5

# IRSA
eksctl utils associate-iam-oidc-provider --cluster my-cluster --approve
eksctl create iamserviceaccount --cluster my-cluster \
  --name s3-reader --namespace default \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --approve
```

## aws eks Commands
```bash
aws eks list-clusters
aws eks describe-cluster --name my-cluster
aws eks update-kubeconfig --name my-cluster --region us-east-1
aws eks get-token --cluster-name my-cluster  # Get auth token

# Add-ons
aws eks list-addons --cluster-name my-cluster
aws eks create-addon --cluster-name my-cluster --addon-name vpc-cni
aws eks update-addon --cluster-name my-cluster --addon-name vpc-cni \
  --addon-version v1.18.0-eksbuild.1
```

## Key Reference
```
Node options:
  Managed Node Groups: AWS manages EC2 lifecycle
  Fargate:             serverless pods (no nodes), pay per pod
  Karpenter:           smart right-sized provisioning

VPC CNI limits (IPs per node):
  ENIs × IPs per ENI - 1 = max pods
  m5.large: 3 ENIs × 10 IPs = 29 max pods
  Enable prefix delegation: 3 × 10 × 16 = 480 pod IPs

EKS Auth (aws-auth ConfigMap):
  Maps IAM roles/users to K8s RBAC
  kubectl edit configmap aws-auth -n kube-system
  Or use: eksctl create iamidentitymapping
```
