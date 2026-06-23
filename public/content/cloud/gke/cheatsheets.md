# Google GKE Quick Reference

## gcloud container Commands
```bash
# Cluster management
gcloud container clusters create my-cluster \
  --region us-central1 --num-nodes 3 \
  --machine-type n2-standard-4 \
  --enable-ip-alias --workload-pool=PROJECT.svc.id.goog

gcloud container clusters get-credentials my-cluster --region us-central1
gcloud container clusters describe my-cluster --region us-central1
gcloud container clusters upgrade my-cluster --master --cluster-version 1.29
gcloud container clusters delete my-cluster --region us-central1

# Node pools
gcloud container node-pools create spot-pool --cluster my-cluster \
  --region us-central1 --spot --machine-type n2-standard-4 \
  --enable-autoscaling --min-nodes 0 --max-nodes 20
gcloud container node-pools delete old-pool --cluster my-cluster --region us-central1

# Workload Identity
gcloud container clusters update my-cluster --region us-central1 \
  --workload-pool=PROJECT.svc.id.goog
gcloud iam service-accounts add-iam-policy-binding GSA@PROJECT.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member 'serviceAccount:PROJECT.svc.id.goog[NAMESPACE/KSA]'
kubectl annotate sa KSA iam.gke.io/gcp-service-account=GSA@PROJECT.iam.gserviceaccount.com
```

## Key Reference
```
Standard vs Autopilot:
  Standard:  manage nodes yourself, pay per node
  Autopilot: Google manages nodes, pay per pod (recommended for most)

VPC-native (--enable-ip-alias): real VPC IPs per pod
Private cluster (--enable-private-nodes): no external node IPs

Spot nodes: 60-91% cheaper, preemptible in 24hr
Node auto-provisioning: creates new pools as needed
```
