# GKE — Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
# Create Standard cluster
gcloud container clusters create prod \
  --region asia-south1 --num-nodes 3 \
  --machine-type e2-standard-4 \
  --enable-autoscaling --min-nodes 1 --max-nodes 10 \
  --workload-pool=$(gcloud config get-value project).svc.id.goog \
  --enable-network-policy \
  --release-channel regular

# Create Autopilot cluster
gcloud container clusters create-auto prod \
  --region asia-south1 --release-channel regular

# Get credentials
gcloud container clusters get-credentials prod --region asia-south1

# List and describe
gcloud container clusters list
gcloud container clusters describe prod --region asia-south1

# Upgrade
gcloud container clusters upgrade prod --region asia-south1 --master  # Control plane
gcloud container clusters upgrade prod --region asia-south1 --node-pool=default-pool

# ── NODE POOLS ────────────────────────────────────────────
gcloud container node-pools list --cluster prod --region asia-south1
gcloud container node-pools create spot-pool \
  --cluster prod --region asia-south1 \
  --machine-type e2-standard-4 --spot \
  --enable-autoscaling --min-nodes 0 --max-nodes 50
gcloud container node-pools delete old-pool --cluster prod --region asia-south1

# ── WORKLOAD IDENTITY ─────────────────────────────────────
PROJECT=$(gcloud config get-value project)
gcloud iam service-accounts create app-gsa
gcloud iam service-accounts add-iam-policy-binding app-gsa@$PROJECT.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:$PROJECT.svc.id.goog[default/app-ksa]"
kubectl annotate sa app-ksa iam.gke.io/gcp-service-account=app-gsa@$PROJECT.iam.gserviceaccount.com

# ── ADDONS ────────────────────────────────────────────────
gcloud container clusters update prod --region asia-south1 \
  --update-addons=GcePersistentDiskCsiDriver=ENABLED
gcloud container clusters update prod --region asia-south1 \
  --enable-stackdriver-kubernetes   # Cloud Monitoring + Logging

# ── ARTIFACT REGISTRY ─────────────────────────────────────
gcloud auth configure-docker asia-south1-docker.pkg.dev
docker tag myapp asia-south1-docker.pkg.dev/$PROJECT/myrepo/myapp:v1
docker push asia-south1-docker.pkg.dev/$PROJECT/myrepo/myapp:v1
```
