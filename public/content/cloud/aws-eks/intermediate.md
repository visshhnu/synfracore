# AWS EKS — Intermediate

## Karpenter (Node Auto-Provisioning)

```yaml
# Karpenter — faster, smarter node scaling than Cluster Autoscaler
# Provisions nodes in seconds, right-sizes them for actual pod requests

# Install Karpenter
helm upgrade --install karpenter oci://public.ecr.aws/karpenter/karpenter \
    --version v0.33.0 \
    --namespace karp-system --create-namespace \
    --set settings.clusterName=$CLUSTER_NAME \
    --set settings.interruptionQueue=$QUEUE_NAME \
    --set controller.resources.requests.cpu=1 \
    --set controller.resources.requests.memory=1Gi

# NodePool — define what kind of nodes Karpenter can provision
apiVersion: karpenter.sh/v1beta1
kind: NodePool
metadata:
  name: default
spec:
  template:
    spec:
      nodeClassRef:
        name: default
      requirements:
        - key: karpenter.sh/capacity-type
          operator: In
          values: ["spot", "on-demand"]
        - key: kubernetes.io/arch
          operator: In
          values: ["amd64", "arm64"]  # Graviton support
        - key: node.kubernetes.io/instance-type
          operator: In
          values: ["m5.large","m5.xlarge","m5.2xlarge","m6g.large","m6g.xlarge"]

  disruption:
    consolidationPolicy: WhenUnderutilized  # Remove idle nodes
    consolidateAfter: 30s
    expireAfter: 720h   # Recycle nodes every 30 days

  limits:
    cpu: 1000           # Max CPUs in this pool
    memory: 4000Gi

---
apiVersion: karpenter.k8s.aws/v1beta1
kind: EC2NodeClass
metadata:
  name: default
spec:
  amiFamily: AL2023     # Amazon Linux 2023
  role: KarpenterNodeRole
  subnetSelectorTerms:
    - tags:
        karpenter.sh/discovery: $CLUSTER_NAME
  securityGroupSelectorTerms:
    - tags:
        karpenter.sh/discovery: $CLUSTER_NAME
  blockDeviceMappings:
    - deviceName: /dev/xvda
      ebs:
        volumeSize: 50Gi
        volumeType: gp3
        encrypted: true
```

## EKS Pod Identity

```bash
# EKS Pod Identity — simpler than IRSA (no OIDC provider needed)
# Available for Kubernetes 1.24+

# Enable Pod Identity agent add-on
aws eks create-addon \
    --cluster-name prod-cluster \
    --addon-name eks-pod-identity-agent

# Create IAM role and Pod Identity association
aws iam create-role \
    --role-name my-app-role \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [{
            "Effect": "Allow",
            "Principal": {"Service": "pods.eks.amazonaws.com"},
            "Action": ["sts:AssumeRole", "sts:TagSession"]
        }]
    }'

# Associate with service account
aws eks create-pod-identity-association \
    --cluster-name prod-cluster \
    --namespace production \
    --service-account my-app-sa \
    --role-arn arn:aws:iam::123:role/my-app-role

# Pod automatically gets credentials — no annotations needed!
# SDK picks up credentials from EKS Pod Identity endpoint
```

## EBS CSI Driver

```yaml
# Dynamic volume provisioning with EBS
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ebs-gp3
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  encrypted: "true"
  kmsKeyId: arn:aws:kms:us-east-1:123:key/my-key
volumeBindingMode: WaitForFirstConsumer  # Wait for pod scheduling to pick AZ
reclaimPolicy: Retain
allowVolumeExpansion: true

---
# Volume snapshot (for backup)
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: postgres-snapshot
spec:
  volumeSnapshotClassName: csi-aws-vsc
  source:
    persistentVolumeClaimName: postgres-data

---
# Restore from snapshot
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-restored
spec:
  dataSource:
    name: postgres-snapshot
    kind: VolumeSnapshot
    apiGroup: snapshot.storage.k8s.io
  accessModes: [ReadWriteOnce]
  resources:
    requests:
      storage: 50Gi
```
