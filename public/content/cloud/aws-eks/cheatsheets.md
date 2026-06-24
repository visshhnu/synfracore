# AWS EKS Cheatsheet

## Core EKS Commands
```bash
# Cluster management
aws eks create-cluster --name myCluster --region us-east-1 \
  --kubernetes-version 1.29 \
  --role-arn arn:aws:iam::123456789:role/EKSRole \
  --resources-vpc-config subnetIds=subnet-xxx,securityGroupIds=sg-xxx

aws eks update-kubeconfig --name myCluster --region us-east-1
aws eks list-clusters
aws eks describe-cluster --name myCluster

# Node groups
aws eks create-nodegroup --cluster-name myCluster \
  --nodegroup-name myNG --scaling-config minSize=2,maxSize=5,desiredSize=3 \
  --instance-types t3.medium --ami-type AL2_x86_64 \
  --node-role arn:aws:iam::123456789:role/NodeRole \
  --subnets subnet-xxx subnet-yyy

aws eks list-nodegroups --cluster-name myCluster
aws eks update-nodegroup-config --cluster-name myCluster \
  --nodegroup-name myNG --scaling-config desiredSize=4

# Add-ons
aws eks create-addon --cluster-name myCluster --addon-name vpc-cni
aws eks create-addon --cluster-name myCluster --addon-name coredns
aws eks create-addon --cluster-name myCluster --addon-name kube-proxy
aws eks list-addons --cluster-name myCluster
```

## Fargate Profiles
```bash
# Create Fargate profile (serverless pods)
aws eks create-fargate-profile \
  --cluster-name myCluster \
  --fargate-profile-name myProfile \
  --pod-execution-role-arn arn:aws:iam::123456789:role/FargateRole \
  --subnets subnet-xxx \
  --selectors namespace=default namespace=kube-system
```

## IAM + RBAC (IRSA)
```bash
# Enable OIDC provider
eksctl utils associate-iam-oidc-provider \
  --cluster myCluster --approve

# Create IAM service account (IRSA)
eksctl create iamserviceaccount \
  --cluster myCluster \
  --namespace default \
  --name my-service-account \
  --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
  --approve

# View aws-auth ConfigMap
kubectl -n kube-system get configmap aws-auth -o yaml
```

## eksctl Quick Reference
```bash
eksctl create cluster --name prod --region eu-west-1 \
  --nodegroup-name standard-workers --node-type t3.medium \
  --nodes 3 --nodes-min 1 --nodes-max 5 --managed

eksctl get cluster
eksctl delete cluster --name prod
eksctl upgrade cluster --name prod --approve
eksctl upgrade nodegroup --cluster prod --name standard-workers
```

## Key Concepts
| Concept | Detail |
|---------|--------|
| Control plane | Managed by AWS (no cost for EKS managed) |
| Node groups | Managed (AWS handles AMI updates) vs Self-managed |
| Fargate | Serverless, per-pod billing, no node management |
| IRSA | IAM Roles for Service Accounts (pod-level IAM) |
| ENI | Each pod gets its own IP via VPC CNI plugin |
| Add-ons | vpc-cni, coredns, kube-proxy, EBS CSI, EFS CSI |
