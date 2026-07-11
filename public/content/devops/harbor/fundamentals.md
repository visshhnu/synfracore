# Harbor — Fundamentals

## What is Harbor?

|  | Harbor (self-hosted) | ECR/ACR/GCR | Docker Hub |
|---|---|---|---|
| Cost | Storage cost only | Storage + transfer fees | Free/paid tier |
| Air-gapped | Yes | No | No |
| RBAC | Project-based, LDAP/AD | IAM policies | Organisation teams |
| Vulnerability scan | Trivy built-in | ECR Inspector, ACR Tasks | Docker Scout (paid) |
| Multi-cloud | Yes — one registry for all | Cloud-specific | Universal but rate-limited |

**Real scenario — air-gapped telco:** a network management platform at a major telco runs in a data centre with no internet access. The development pipeline pushes images to an internet-facing Harbor. A replication rule syncs production-tagged images to the air-gapped Harbor inside the customer network every 4 hours. Production pods pull from the local registry — zero internet dependency, full vulnerability scanning in both environments.

```bash
# Minimal Harbor install for evaluation
helm repo add harbor https://helm.goharbor.io
helm install harbor harbor/harbor \
  --namespace harbor --create-namespace \
  --set expose.type=nodePort \
  --set externalURL=https://harbor.local \
  --set harborAdminPassword=ChangeMeNow123
```

## Key Features

```bash
# Projects — namespace isolation for images, each with its own RBAC/policies
harbor_cli project create --name production --public=false

# Vulnerability scanning — scan on push, block critical/high on deploy
# (configured via the Harbor UI: Project → Configuration →
#  "Prevent vulnerable images from running")

# Proxy cache — Harbor caches upstream images (e.g. Docker Hub) locally,
# so an air-gapped or rate-limited environment pulls from Harbor instead
harbor_cli registry create --name dockerhub-proxy \
  --type docker-hub --url https://hub.docker.com

# Tag retention — automatically prune old tags to control storage growth
harbor_cli retention create --project production \
  --rule "retain the last 10 tags matching **, for repos matching **"
```

## Image Signing

Image signing with Cosign answers: was this image actually built by our CI/CD? An attacker could push a malicious image with the same tag, and without signing, Kubernetes can't tell the difference. With Cosign plus a Kyverno policy, any unsigned image is rejected at the cluster level.

```bash
# Sign an image after a trusted CI build
cosign generate-key-pair
cosign sign --key cosign.key registry.company.com/production/myapp:v1

# Verify before deploy
cosign verify --key cosign.pub registry.company.com/production/myapp:v1
```
```yaml
# Kyverno policy — reject any pod using an unsigned image
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: verify-image-signature
spec:
  validationFailureAction: enforce
  rules:
    - name: check-signature
      match: { any: [{ resources: { kinds: [Pod] } }] }
      verifyImages:
        - imageReferences: ["registry.company.com/production/*"]
          attestors:
            - entries:
                - keys: { publicKeys: "<cosign.pub contents>" }
```

## Harbor Architecture and Components

| Component | What it does |
|---|---|
| Registry | Core Docker registry — stores image layers and manifests |
| Core | API server — handles all Harbor API calls, authentication, RBAC |
| Portal | Web UI — project management, vulnerability reports, replication |
| Database (PostgreSQL) | Stores metadata, users, policies, scan results |
| Redis | Job queue for async operations (replication, scanning) |
| Trivy / Clair | Vulnerability scanner — scans images on push or schedule |
| Notary | Content trust — signs images so only signed images can be deployed |

**Install Harbor on Kubernetes with Helm:**
```bash
helm repo add harbor https://helm.goharbor.io
helm repo update

helm install harbor harbor/harbor \
  --namespace harbor --create-namespace \
  --set expose.type=ingress \
  --set expose.ingress.hosts.core=registry.company.com \
  --set externalURL=https://registry.company.com \
  --set harborAdminPassword=AdminSecurePass123 \
  --set persistence.enabled=true \
  --set persistence.persistentVolumeClaim.registry.size=50Gi
```

## Projects, RBAC, Vulnerability Scanning

Every image in Harbor lives in a Project — Public (anyone can pull) or Private (requires authentication). RBAC is per-project: a developer can push to their team's project but not to production. Projects also carry policies for vulnerability scanning, content trust, and tag retention.

```bash
# Push an image to a Harbor project
docker login registry.company.com
docker tag myapp:v1 registry.company.com/production/myapp:v1
docker push registry.company.com/production/myapp:v1

# Give a cluster a pull secret for a private Harbor project
kubectl create secret docker-registry harbor-creds \
  --docker-server=registry.company.com \
  --docker-username=robot-account \
  --docker-password=robottoken123 \
  --namespace production
```

**Vulnerability scanning — scan on push.** Configure Harbor to automatically scan every image pushed to a project, and set a policy to prevent deployment of images with HIGH or CRITICAL vulnerabilities — when a cluster tries to pull a flagged image, Harbor's admission webhook rejects it before the pod starts.

| Scan trigger | When it runs |
|---|---|
| Scan on push | Automatic scan when an image is pushed — catches new images immediately |
| Scheduled scan | Re-scans all images on a schedule — catches newly-discovered CVEs in old, already-pushed images |
| Manual scan | Triggered from the UI or API for specific images |

**Replication — sync images across registries.** Harbor can replicate images between registries, either push-based (Harbor pushes to the target when an image is pushed) or pull-based (Harbor pulls from the source on a schedule). Common uses: replicate from a dev registry to a production registry, replicate from a cloud registry to an on-premise Harbor, or maintain a disaster-recovery copy in a second region.

```bash
curl -X POST https://registry.company.com/api/v2.0/replication/policies \
  -H "Authorization: Basic $(echo -n admin:password | base64)" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "sync-to-production",
    "src_registry": {"id": 1},
    "dest_registry": {"id": 2},
    "filters": [{"type": "name", "value": "production/**"}],
    "trigger": {"type": "event_based"},
    "deletion": false,
    "enabled": true
  }'
```

## Interview Questions

**Why would you run your own Harbor registry instead of using ACR or ECR?**
Four compelling reasons. First, air-gapped environments — banks, defence, and telcos often run in networks with no internet access at all, and a cloud-hosted registry simply isn't reachable; Harbor can run entirely inside that isolated network. Second, multi-cloud consistency — a team running workloads across AWS, Azure, and GCP simultaneously would otherwise need to manage ECR, ACR, and GCR separately with different tooling and RBAC models; Harbor provides one consistent registry across all of them. Third, cost at scale — cloud registries charge storage plus data-transfer fees that grow with usage, while Harbor's cost is largely just the storage itself, since data transfer within your own infrastructure is free. Fourth, built-in vulnerability scanning and image signing without needing separate paid add-ons — Trivy and Notary/Cosign integration come with Harbor directly, rather than being a separate, additional service to configure and pay for on top of the base registry.
