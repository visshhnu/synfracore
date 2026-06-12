# AWS EKS — Advanced

## Multi-Cluster GitOps with ArgoCD

```yaml
# Register multiple EKS clusters with ArgoCD
# Use AWS load balancer, not exposed directly

# Create ArgoCD with external secrets for cluster credentials
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: prod-us-cluster-secret
  namespace: argocd
spec:
  secretStoreRef:
    name: aws-secretsmanager
    kind: ClusterSecretStore
  target:
    name: prod-us-cluster
    template:
      type: Opaque
      metadata:
        labels:
          argocd.argoproj.io/secret-type: cluster
  data:
    - secretKey: name
      remoteRef:
        key: k8s/prod-us
        property: cluster_name
    - secretKey: server
      remoteRef:
        key: k8s/prod-us
        property: endpoint
    - secretKey: config
      remoteRef:
        key: k8s/prod-us
        property: kubeconfig
```

## Cost Optimization at Scale

```bash
# Spot instance interruption handling
# Node termination handler — drain node gracefully on spot interruption

helm upgrade --install aws-node-termination-handler \
    oci://public.ecr.aws/aws-ec2/helm/aws-node-termination-handler \
    --namespace kube-system \
    --set enableSpotInterruptionDraining=true \
    --set enableScheduledEventDraining=true \
    --set enableRebalanceMonitoring=true \
    --set enableSQSTerminationDraining=true \
    --set queueURL=$QUEUE_URL

# Kubecost — Kubernetes cost attribution
helm upgrade --install kubecost oci://public.ecr.aws/kubecost/cost-analyzer \
    --namespace kubecost --create-namespace \
    --set global.prometheus.fqdn=http://prometheus:9090 \
    --set prometheus.enabled=false  # Use existing Prometheus

# Cost allocation by namespace/team/app
kubectl port-forward svc/kubecost-cost-analyzer 9090:9090 -n kubecost
# Browse: http://localhost:9090

# Goldilocks — right-size resource requests/limits
helm upgrade --install goldilocks fairwinds-stable/goldilocks \
    --namespace goldilocks --create-namespace
kubectl label namespace production goldilocks.fairwinds.com/enabled=true
# After 24h, get recommendations:
kubectl goldilocks dashboard
```

## EKS Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
aws eks list-clusters
aws eks describe-cluster --name prod-cluster
aws eks update-kubeconfig --name prod-cluster --region us-east-1
aws eks get-token --cluster-name prod-cluster  # Get auth token

# ── NODE GROUPS ───────────────────────────────────────────
aws eks list-nodegroups --cluster-name prod-cluster
aws eks describe-nodegroup --cluster-name prod-cluster --nodegroup-name workers
aws eks update-nodegroup-config --cluster-name prod-cluster \
    --nodegroup-name workers \
    --scaling-config minSize=2,maxSize=20,desiredSize=5

# ── UPGRADES ──────────────────────────────────────────────
# 1. Update control plane
aws eks update-cluster-version \
    --name prod-cluster \
    --kubernetes-version 1.30
aws eks wait cluster-active --name prod-cluster

# 2. Update add-ons
aws eks update-addon --cluster-name prod-cluster \
    --addon-name coredns --addon-version v1.11.1-eksbuild.4

# 3. Update managed node groups (rolling replacement)
aws eks update-nodegroup-version \
    --cluster-name prod-cluster \
    --nodegroup-name workers

# ── FARGATE ───────────────────────────────────────────────
aws eks create-fargate-profile \
    --cluster-name prod-cluster \
    --fargate-profile-name batch-jobs \
    --pod-execution-role-arn arn:aws:iam::123:role/FargatePodRole \
    --subnets subnet-a subnet-b \
    --selectors namespace=batch-jobs

# ── ACCESS ────────────────────────────────────────────────
# Add IAM role to cluster access
aws eks create-access-entry \
    --cluster-name prod-cluster \
    --principal-arn arn:aws:iam::123:role/DevOpsRole \
    --kubernetes-groups system:masters
```
