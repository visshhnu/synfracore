# FluxCD

CI/CD & GitOps › FluxCD
🔄**FluxCD**
BeginnerEngineerArchitectGitOps pull model — GitRepository, Kustomize overlays, HelmRelease, Image Automation
[What is FluxCD](#sec-what)[Bootstrap](#sec-bootstrap)[Kustomize](#sec-kustomize)[Image Automation](#sec-image-auto)[Q&A](#sec-interview)


## 🔄 What is FluxCD?›


#### What is FluxCD?

FluxCD is a **GitOps operator for Kubernetes**. It continuously watches your Git repository and automatically syncs your Kubernetes cluster to match whatever is in Git. If a Helm values file changes in Git, Flux applies that change to the cluster. If someone manually edits a resource in the cluster, Flux detects the drift and reverts it.


Flux uses a **pull model** — agents running inside the cluster pull the desired state from Git. The cluster initiates contact with Git, not the other way around. No external CI/CD system needs access to the cluster API server.


#### FluxCD vs ArgoCD — key differences
|  | FluxCD | ArgoCD |
|---|---|---|
| UI | CLI only — no built-in web UI | Rich web dashboard |
| Architecture | Modular controllers (Source, Kustomize, Helm, Image) | Single application server |
| Image automation | Built-in — auto-updates image tags in Git | Requires Argo Image Updater (separate tool) |
| Kustomize | First-class native support | Supported as a source type |
| Bootstrap | flux bootstrap installs Flux AND stores its config in Git | Manual install + separate app config |
| Multi-tenancy | Namespace-scoped by design | Projects for isolation |


#### The pull model — why it is more secure

Push model (old way): CI/CD pipeline runs `kubectl apply` from outside the cluster. The pipeline needs cluster credentials stored somewhere. Cluster API server must be reachable from the internet or CI system. Pull model (Flux): agents inside the cluster watch Git every minute. The cluster never exposes its API to external systems. Git credentials are stored as K8s secrets inside the cluster. Much smaller attack surface.


## 🚀 Bootstrap and Core Resources›


#### Bootstrap — install Flux and store its own config in Git

The bootstrap command does two things at once: installs Flux controllers in the cluster, and commits the Flux configuration to your Git repository. Flux then manages itself — it will update its own controllers when you change the config in Git.


```
# Install Flux CLI
brew install fluxcd/tap/flux   # macOS
curl -s https://fluxcd.io/install.sh | sudo bash  # Linux

# Bootstrap to GitHub — installs Flux AND commits config to Git
flux bootstrap github \
--owner=myorg \
--repository=fleet-infra \
--branch=main \
--path=clusters/production \
--personal

# After bootstrap: Flux controllers run in flux-system namespace
# AND the Git repo has a flux-system/ folder with Flux config committed
kubectl get pods -n flux-system
```


#### Core Flux CRDs — the resources you create
| Resource | What it does |
|---|---|
| GitRepository | Defines a Git repo to watch. Source Controller fetches on schedule or webhook. |
| Kustomization | Applies a path from the GitRepository to the cluster. Can use Kustomize or plain YAML. |
| HelmRepository | Defines a Helm chart repo (HTTP or OCI) to watch. |
| HelmRelease | Manages a Helm release — reconciled continuously like a GitOps-managed helm upgrade. |
| ImageRepository | Watches a container registry for new image tags. |
| ImagePolicy | Selects which image tag to use (semver, regex, alphabetical). |
| ImageUpdateAutomation | Commits the new image tag back to Git automatically. |

```
# GitRepository — watch a repo every 1 minute
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
name: payment-service
namespace: flux-system
spec:
interval: 1m
url: https://github.com/company/payment-service
ref:
branch: main
---
# Kustomization — apply ./deploy folder from the GitRepository
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
name: payment-service
namespace: flux-system
spec:
interval: 5m
path: ./deploy
prune: true          # delete resources removed from Git
sourceRef:
kind: GitRepository
name: payment-service
targetNamespace: production
```


## 🗂️ Kustomize — Environment Overlays›


#### What is Kustomize?

Kustomize lets you customise Kubernetes YAML for different environments without templates or placeholders. You define base manifests once, then create per-environment overlays that patch specific fields. No Go template syntax — just plain Kubernetes YAML with structured patches.


#### Base + overlay directory structure

```
deploy/
├── base/
│   ├── kustomization.yaml     # lists base resources
│   ├── deployment.yaml        # base: 2 replicas, image tag = latest
│   └── service.yaml
└── overlays/
├── dev/
│   └── kustomization.yaml # patch: 1 replica, dev namespace
├── staging/
│   └── kustomization.yaml # patch: 3 replicas, staging namespace
└── production/
├── kustomization.yaml # patch: 5 replicas, prod namespace
└── resource-patch.yaml  # higher CPU/memory limits
```


```
# overlays/production/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: production
bases:
- ../../base
images:
- name: myapp
newTag: v2.1.0        # override image tag for production
patchesStrategicMerge:
- resource-patch.yaml  # patch CPU/memory limits

# overlays/production/resource-patch.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
name: payment-api
spec:
replicas: 5
template:
spec:
containers:
- name: payment-api
resources:
requests: { cpu: "500m", memory: "512Mi" }
limits:   { cpu: "2", memory: "2Gi" }
```


#### Kustomize vs Helm
|  | Kustomize | Helm |
|---|---|---|
| Approach | Base + patches — plain YAML | Templates wit
