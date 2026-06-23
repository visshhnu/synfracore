# OpenShift Certification Guide

## Certifications Available

| Cert | Full Name | Time | Passing |
|------|-----------|------|---------|
| **EX280** | Red Hat Certified Specialist in OpenShift Administration | 3 hours | 210/300 |
| **EX288** | Red Hat Certified OpenShift Application Developer | 3 hours | 210/300 |
| **EX380** | Red Hat Certified Specialist in OpenShift Automation | 3 hours | 210/300 |

All Red Hat exams are **performance-based** (no multiple choice). Exam on real OpenShift cluster.

---

## EX280 OpenShift Administration — Task Areas

```bash
# ─── CORE OC COMMANDS ──────────────────────────────────────────────────────────
oc login https://api.cluster.example.com:6443 -u admin
oc whoami
oc config get-contexts
oc project production             # Switch project (namespace)

# Projects (= Kubernetes namespaces + extras)
oc new-project my-project --description "My App" --display-name "My Application"
oc get projects
oc delete project old-project

# Deploying applications
oc new-app --image=registry.access.redhat.com/ubi9/nginx-120:latest --name=myapp
oc new-app https://github.com/org/repo.git --name=myapp  # S2I build
oc expose svc/myapp               # Create Route (HTTP)
oc get route myapp                # Get the URL

# Scaling and rollout
oc scale deploy/myapp --replicas=3
oc rollout restart deploy/myapp
oc rollout status deploy/myapp
oc rollout undo deploy/myapp

# Builds (OpenShift-specific)
oc start-build myapp
oc get builds
oc logs build/myapp-1
oc cancel-build myapp-2
```

---

## Security Context Constraints (SCC) — Key OpenShift Difference

```bash
# SCCs control what security contexts pods can use
# Much stricter defaults than vanilla Kubernetes

oc get scc                            # List all SCCs
oc describe scc restricted-v2         # Most restrictive (default)
oc describe scc anyuid                # Run as any UID
oc describe scc privileged            # Full access

# Grant SCC to service account (common exam task)
oc adm policy add-scc-to-user anyuid -z default -n my-project
oc adm policy add-scc-to-group anyuid system:serviceaccounts:my-project

# Check which SCC a pod is using
oc get pod mypod -o jsonpath='{.metadata.annotations.openshift\.io/scc}'
```

---

## RBAC in OpenShift

```bash
# Roles
oc adm policy add-role-to-user admin alice -n my-project
oc adm policy add-role-to-user view bob -n my-project
oc adm policy add-role-to-group edit developers -n my-project
oc adm policy remove-role-from-user view bob -n my-project

# Cluster roles
oc adm policy add-cluster-role-to-user cluster-admin alice

# Review who has access
oc adm policy who-can create pods -n my-project
oc get rolebindings -n my-project -o wide
```

---

## Routes (OpenShift Ingress)

```yaml
# Edge termination (TLS at router, plain HTTP to pod)
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: myapp-secure
spec:
  host: myapp.apps.cluster.example.com
  to:
    kind: Service
    name: myapp
    weight: 100
  port:
    targetPort: 8080-tcp
  tls:
    termination: edge              # edge | passthrough | reencrypt
    insecureEdgeTerminationPolicy: Redirect

# Canary routing (traffic split)
oc set route-backends myapp myapp=80 myapp-canary=20
```

---

## Image Streams

```bash
# OpenShift-specific: abstract image references
oc import-image nginx:latest --from=docker.io/library/nginx:latest --confirm
oc get imagestream nginx
oc get imagestreamtag nginx:latest

# Tag and promote
oc tag myapp:latest myapp:production

# Trigger rollout on new image
oc set triggers deploy/myapp --from-image=myapp:production
```

---

## Exam Strategy

```
EX280 TIPS:
  Use: oc new-app, oc expose, oc get, oc describe, oc create
  Know: SCC (most OpenShift-specific topic), RBAC, Routes
  Know: DeploymentConfig (legacy) vs Deployment (Kubernetes-native)
  Remember: oc adm policy is for cluster-level + SCC operations
  Verify every task: oc get / oc describe after applying
  Time: 3 hours, approximately 20+ tasks

COMMON EX280 TASKS:
  Deploy app from image + expose as Route
  Configure TLS on Route (edge/passthrough)
  Grant SCC to service account
  Create user and assign RBAC role to project
  Set resource quotas and limits on project
  Configure persistent storage
  Build from source with S2I
```

## Revision Notes
```
OPENSHIFT vs KUBERNETES:
  Project = Namespace + additional metadata
  Route = Ingress (OpenShift's own implementation)
  SCC = PodSecurityPolicy (deprecated) equivalent — STRICTER defaults
  DeploymentConfig = OpenShift's extended Deployment (S2I integration)
  BuildConfig = OpenShift's CI/CD build system (S2I)
  ImageStream = abstract image reference (decouples app from registry)
  OperatorHub = marketplace for Operators

KEY COMMAND PREFIX: oc adm policy (for RBAC + SCC)

SCC ORDER (least → most privileged):
  restricted-v2 → restricted → nonroot → anyuid → hostmount-anyuid → privileged

ROUTES: edge (TLS at router) | passthrough (TLS to pod) | reencrypt (TLS both)
```
