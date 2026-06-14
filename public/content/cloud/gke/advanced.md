# GKE — Advanced

## Binary Authorization

```bash
# Binary Authorization: only allow signed container images in production
gcloud services enable binaryauthorization.googleapis.com

# Create attestor (who can sign images)
gcloud container binauthz attestors create prod-attestor \
  --attestation-authority-note=projects/$PROJECT/notes/prod-note \
  --attestation-authority-note-project=$PROJECT

# Policy: require attestation before deploying
cat > policy.yaml << 'EOF'
admissionWhitelistPatterns:
  - namePattern: gcr.io/google_containers/*
  - namePattern: k8s.gcr.io/*
defaultAdmissionRule:
  evaluationMode: REQUIRE_ATTESTATION
  enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
  requireAttestationsBy:
    - projects/PROJECT/attestors/prod-attestor
EOF
gcloud container binauthz policy import policy.yaml
```

## GKE Cost Optimization

```bash
# 1. Spot VMs for batch/fault-tolerant workloads (60-80% savings)
gcloud container node-pools create spot-pool \
  --cluster prod-cluster --region asia-south1 \
  --machine-type e2-standard-4 \
  --spot \
  --enable-autoscaling --min-nodes 0 --max-nodes 100

# 2. Committed Use Discounts (1 or 3 year)
gcloud compute commitments create k8s-commitment \
  --plan 1-year --region asia-south1 \
  --resources vcpu=100,memory=400GB

# 3. GKE cost allocation (chargeback by namespace/label)
gcloud container clusters update prod-cluster \
  --resource-usage-bigquery-dataset my_dataset \
  --enable-network-egress-metering \
  --enable-resource-consumption-metering

# 4. Right-size with Vertical Pod Autoscaler
kubectl apply -f https://github.com/kubernetes/autoscaler/releases/latest/download/vertical-pod-autoscaler.yaml
```
