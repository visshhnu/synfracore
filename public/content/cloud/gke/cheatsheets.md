# GKE Cheatsheet

## Core Commands
```bash
# Cluster management
gcloud container clusters create my-cluster \
  --num-nodes 3 --machine-type e2-standard-4 \
  --region us-central1 --enable-ip-alias \
  --release-channel regular

gcloud container clusters get-credentials my-cluster --region us-central1
gcloud container clusters list
gcloud container clusters describe my-cluster --region us-central1
gcloud container clusters delete my-cluster --region us-central1

# Node pools
gcloud container node-pools create gpu-pool \
  --cluster my-cluster --region us-central1 \
  --machine-type n1-standard-4 --accelerator type=nvidia-tesla-t4,count=1 \
  --num-nodes 2 --enable-autoscaling --min-nodes 0 --max-nodes 5

gcloud container node-pools delete gpu-pool --cluster my-cluster --region us-central1
gcloud container node-pools list --cluster my-cluster --region us-central1

# Resize / upgrade
gcloud container clusters resize my-cluster --num-nodes 5 --region us-central1
gcloud container clusters upgrade my-cluster --master --cluster-version 1.29
gcloud container clusters upgrade my-cluster --node-pool default-pool

# Get available versions
gcloud container get-server-config --region us-central1
```

## Autopilot Cluster
```bash
# Create Autopilot (simplest, fully managed)
gcloud container clusters create-auto my-autopilot \
  --region us-central1

# Autopilot billing = per pod resource requests (not per node)
# Deploy a pod with resource requests (required in Autopilot)
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: app
    image: nginx
    resources:
      requests:
        cpu: "250m"
        memory: "512Mi"
EOF
```

## Networking
```bash
# Enable Cloud NAT for private nodes internet access
gcloud compute routers create my-router --region us-central1 --network default
gcloud compute routers nats create my-nat --router my-router \
  --region us-central1 --auto-allocate-nat-external-ips \
  --nat-all-subnet-ip-ranges

# Create Load Balancer ingress (GKE-managed)
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
  annotations:
    kubernetes.io/ingress.class: "gce"
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-service
            port:
              number: 80
EOF
```

## Key GKE-specific Features
| Feature | Command |
|---------|---------|
| Vertical Pod Autoscaler | `--enable-vertical-pod-autoscaling` |
| Cluster Autoscaler | `--enable-autoscaling --min-nodes N --max-nodes M` |
| Dataplane V2 (Cilium) | `--enable-dataplane-v2` |
| Private cluster | `--enable-private-nodes` |
| Workload Identity | `--workload-pool=PROJECT.svc.id.goog` |
| Binary Authorization | Cluster policy + attestors |
| Node auto-provisioning | `--enable-autoprovisioning` |
| Spot VMs (preemptible) | `--spot` on node pool |
