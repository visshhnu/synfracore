# Harbor

Containers › Harbor
📦**Harbor**
BeginnerEngineerProductionArchitectEnterprise container registry — RBAC, vulnerability scanning, replication, image signing
[What is Harbor](#sec-what)[Key Features](#sec-features)[Image Signing](#sec-security)[Interview Q&A](#sec-interview)


## 📦 What is Harbor?›


#### Why self-hosted registry?

|  | Harbor (self-hosted) | ECR/ACR/GCR | Docker Hub |
|---|---|---|---|
| Cost | Storage cost only | Storage + transfer fees | Free/paid tier |
| Air-gapped | Yes | No | No |
| RBAC | Project-based, LDAP/AD | IAM policies | Organisation teams |
| Vulnerability scan | Trivy built-in | ECR Inspector, ACR Tasks | Docker Scout (paid) |
| Multi-cloud | Yes — one registry for all | Cloud-specific | Universal but rate-limited |


**Real Scenario — Air-gapped Telco**TeMIP network management platform at a major telco runs in a data centre with no internet access. Development pipeline pushes images to internet-facing Harbor. A replication rule syncs production-tagged images to the air-gapped Harbor inside the customer network every 4 hours. Production pods pull from local registry — zero internet dependency, full vulnerability scanning in both environments.


Install Harbor + core featuresCopy

```

```


## ⚙️ Key Features›


Projects, scanning, replication, proxy cache, retentionCopy

```

```


## 🔏 Image Signing›


#### Supply chain security — prove your image is authentic

Image signing with Cosign answers: was this image actually built by our CI/CD? An attacker could push a malicious image with the same tag. Without signing, Kubernetes cannot tell the difference. With Cosign + Kyverno policy, any unsigned image is rejected at the cluster level.


Cosign signing + Kyverno enforcementCopy

```

```


## 🏗️ Harbor Architecture and Components›


#### Harbor is an enterprise container registry with security built in

| Component | What it does |
|---|---|
| Registry | Core Docker registry — stores image layers and manifests |
| Core | API server — handles all Harbor API calls, authentication, RBAC |
| Portal | Web UI — project management, vulnerability reports, replication |
| Database (PostgreSQL) | Stores metadata, users, policies, scan results |
| Redis | Job queue for async operations (replication, scanning) |
| Trivy / Clair | Vulnerability scanner — scans images on push or schedule |
| Notary | Content trust — signs images so only signed images can be deployed |


#### Install Harbor on Kubernetes with Helm

```
helm repo add harbor https://helm.goharbor.io
helm repo update

helm install harbor harbor/harbor   --namespace harbor --create-namespace   --set expose.type=ingress   --set expose.ingress.hosts.core=registry.company.com   --set externalURL=https://registry.company.com   --set harborAdminPassword=AdminSecurePass123   --set persistence.enabled=true   --set persistence.persistentVolumeClaim.registry.size=50Gi
```


## 🔒 Projects, RBAC, Vulnerability Scanning›


#### Projects — namespace isolation for images

Every image in Harbor lives in a Project. Projects can be Public (anyone can pull) or Private (requires authentication). RBAC is per-project: a developer can push to their team's project but not production. Projects also contain policies for vulnerability scanning, content trust, and tag retention.


```
# Push image to Harbor project
docker login registry.company.com
docker tag myapp:v1 registry.company.com/production/myapp:v1
docker push registry.company.com/production/myapp:v1

# AKS pull from Harbor — create imagePullSecret
kubectl create secret docker-registry harbor-creds   --docker-server=registry.company.com   --docker-username=robot-account   --docker-password=robottoken123   --namespace production
```


#### Vulnerability scanning — scan on push

Configure Harbor to automatically scan every image pushed to a project. Set a policy: **Prevent deployment of vulnerable images** with severity HIGH or CRITICAL. When AKS tries to pull a flagged image, Harbor's admission webhook rejects it before the pod starts.


| Scan trigger | When it runs |
|---|---|
| Scan on push | Automatic scan when image is pushed — catches new images immediately |
| Scheduled scan | Re-scan all images on a schedule — catches newly-discovered CVEs in old images |
| Manual scan | Triggered from UI or API for specific images |


#### Replication — sync images across registries

Harbor can replicate images between registries: push-based (Harbor pushes to target when image is pushed) or pull-based (Harbor pulls from source on schedule). Use cases: replicate from dev registry to production registry, replicate from ACR to on-premise Harbor, disaster recovery by keeping a copy in a second region.


```
# Harbor replication policy via CLI (Harbor API)
curl -X POST https://registry.company.com/api/v2.0/replication/policies   -H "Authorization: Basic $(echo -n admin:password | base64)"   -H "Content-Type: application/json"   -d '{
"name": "sync-to-production",
"src_registry": {"id": 1},
"dest_registry": {"id": 2},
"filters": [{"type": "name", "value": "production/**"}],
"trigger": {"type": "event_based"},
"deletion": false,
"enabled": true
}'
```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


HARBOR · ARCHITECT
Why would you run your own Harbor registry instead of using ACR or ECR?
There are four compelling reasons. First: air-gapped environments. Banks, defence, and telcos often run in networks with no interne
