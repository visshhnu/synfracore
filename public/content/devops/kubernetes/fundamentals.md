# Kubernetes Fundamentals

**Assumed from Overview:** you know Kubernetes runs Pods across a cluster of Nodes, and that the control plane makes scheduling decisions while worker Nodes actually run your containers. This tab covers the actual objects you create and the command-line tool you use to manage them.

## kubectl — The CLI

`kubectl` (pronounced "kube-control" or "kube-C-T-L" — people say it both ways) is the command-line tool you use to talk to a cluster's API Server — every command below sends a request to the API Server, which is the single front door for the whole cluster (see Overview's Module 02). You point `kubectl` at a specific cluster using a **context** — if you only ever work with one cluster you can ignore this, but most engineers switch between a local test cluster and a real production one, so knowing how to check and switch context matters before you accidentally run something against the wrong cluster.

```bash
# Context management
kubectl config get-contexts          # List clusters/contexts
kubectl config use-context prod      # Switch cluster
kubectl config current-context       # Show current

# Get resources
kubectl get pods                     # Pods in default namespace
kubectl get pods -n kube-system      # Specific namespace
kubectl get pods -A                  # All namespaces
kubectl get pods -o wide             # Show node and IP
kubectl get pods -o yaml             # Full YAML output
kubectl get all                      # All common resources
kubectl get nodes                    # Cluster nodes

# Describe (events, details)
kubectl describe pod mypod
kubectl describe node node01
kubectl describe deployment myapp

# Logs
kubectl logs mypod                   # Pod logs
kubectl logs mypod -c container      # Specific container
kubectl logs -f mypod                # Follow
kubectl logs --previous mypod        # Previous crashed container

# Execute
kubectl exec -it mypod -- bash       # Shell into pod
kubectl exec mypod -- cat /etc/hosts # Run command

# Apply and delete
kubectl apply -f manifest.yaml       # Create/update from file
kubectl delete -f manifest.yaml      # Delete from file
kubectl delete pod mypod             # Delete by name
kubectl delete pod mypod --grace-period=0  # Force delete
```

## Pod Manifest

A **manifest** is just a YAML file describing what you want Kubernetes to create — you write the desired state down, then `kubectl apply -f` it, and Kubernetes does the work of making the cluster match. Below is the manifest for a single Pod (as Overview explained, the smallest thing Kubernetes schedules and runs) — in practice you'll rarely write a bare Pod like this directly, since a Deployment (next section) manages Pods for you and gives you restart/scaling behavior for free, but understanding the raw Pod shape first makes the Deployment manifest below much easier to read, since a Deployment's `template:` section is exactly a Pod spec.

A few fields worth knowing before reading the YAML: **`requests`** is the CPU/memory a container is guaranteed to get; **`limits`** is the hard ceiling it's not allowed to exceed. Skipping these is a real production mistake — Kubernetes has no way to protect a Pod with no requests/limits set from being starved or evicted first when a Node runs low on resources (see the Advanced tab's "QoS classes" for exactly how this plays out). A **probe** is an automated health check Kubernetes runs against your running container: a `livenessProbe` asks "is this container still alive, or should it be restarted?"; a `readinessProbe` asks "is this container ready to receive traffic right now?" — a Pod can be alive but not yet ready (still loading data, for example), and Kubernetes won't send it traffic until the readiness probe passes.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp
  namespace: production
  labels:
    app: myapp
    version: "1.0"
spec:
  containers:
  - name: myapp
    image: myapp:1.0
    ports:
    - containerPort: 3000

    # Resource limits (ALWAYS set these!)
    resources:
      requests:
        memory: "128Mi"
        cpu: "100m"      # 100 millicores = 0.1 CPU
      limits:
        memory: "256Mi"
        cpu: "500m"

    # Environment variables
    env:
    - name: DB_HOST
      value: "postgres-service"
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: password

    # Health checks (critical for production)
    livenessProbe:
      httpGet:
        path: /health
        port: 3000
      initialDelaySeconds: 30
      periodSeconds: 10
      failureThreshold: 3

    readinessProbe:
      httpGet:
        path: /ready
        port: 3000
      initialDelaySeconds: 5
      periodSeconds: 5
```

## Deployment

Writing individual Pod manifests by hand doesn't scale — if a Pod crashes or its Node dies, nothing recreates it, and running multiple identical copies means copy-pasting the manifest and manually tracking each one. A **Deployment** solves this: you declare how many identical copies ("**replicas**") of a Pod you want, and Kubernetes' Controller Manager continuously keeps that many running, recreating any that disappear. It also manages rolling updates — replacing old Pods with new ones gradually, rather than all at once, so the app stays available throughout.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: production
spec:
  replicas: 3

  selector:
    matchLabels:
      app: myapp

  # Rolling update strategy
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1         # Max pods above desired during update
      maxUnavailable: 0   # No downtime (always 3 running)

  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:1.0
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
```

The `maxSurge`/`maxUnavailable` settings above control exactly how a rolling update behaves: `maxSurge: 1` allows one extra Pod above the desired count while updating (so capacity never drops during the swap), and `maxUnavailable: 0` means none of the existing 3 Pods are removed until their replacement is up and ready — the practical result is zero downtime during a deploy.

```bash
# Deployment operations
kubectl rollout status deployment/myapp    # Watch rollout progress
kubectl rollout history deployment/myapp   # Rollout history
kubectl rollout undo deployment/myapp      # Rollback
kubectl rollout undo deployment/myapp --to-revision=2
kubectl scale deployment myapp --replicas=5
kubectl set image deployment/myapp myapp=myapp:2.0  # Update image
```

## Services

As Overview explained: Pods are constantly replaced, and each new one gets a brand-new IP address — so nothing in the cluster can reliably remember a Pod's address directly. A **Service** fixes this by giving a stable, permanent address that automatically forwards traffic to whichever Pods currently match its `selector` (a label filter), no matter how many times those Pods have been recreated. There are a few types, differing in *who* can reach the Service: `ClusterIP` (the default) is reachable only from inside the cluster — the right choice for a database or internal API that nothing outside the cluster should touch directly. `LoadBalancer` additionally provisions a real external address (via your cloud provider) so traffic from the internet can reach it.

```yaml
# ClusterIP - internal only (default)
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp           # Routes to pods with this label
  ports:
  - port: 80             # Service port
    targetPort: 3000     # Container port
  type: ClusterIP

---
# LoadBalancer - external access (creates cloud load balancer)
apiVersion: v1
kind: Service
metadata:
  name: myapp-lb
spec:
  selector:
    app: myapp
  ports:
  - port: 80
    targetPort: 3000
  type: LoadBalancer
```

## ConfigMaps and Secrets

Hardcoding configuration (a log level, a feature flag) or credentials (a database password) directly into a Pod's manifest or container image means changing them requires rebuilding and redeploying — and for credentials, baking them into an image is a real security risk (see Docker's own Intermediate tab's `.dockerignore` note, and Overview's security interview answer, on why secrets shouldn't live in an image). A **ConfigMap** holds non-sensitive configuration as key-value pairs, separately from the Pod, so it can be updated independently. A **Secret** holds sensitive values the same way — but worth knowing plainly: by default a Secret is only **base64-encoded**, not encrypted, meaning it's trivially decodable by anyone with read access to it, not cryptographically protected. (The Intermediate tab covers what real protection actually requires.)

```conceptgrid
{
  "boxes": [
    { "title": "ConfigMap", "description": "Non-sensitive config — key-value pairs, updated independently of the Pod", "color": "blue" },
    { "title": "Secret", "description": "Same mechanism, for sensitive values — but only base64-encoded by default, NOT encrypted", "color": "red" }
  ]
}
```

```bash
# Create ConfigMap
kubectl create configmap app-config \
  --from-literal=LOG_LEVEL=info \
  --from-literal=MAX_CONNECTIONS=100

# Create Secret
kubectl create secret generic db-secret \
  --from-literal=username=admin \
  --from-literal=password=s3cr3t

# View (secrets are base64 encoded)
kubectl get secret db-secret -o jsonpath='{.data.password}' | base64 -d
```

```yaml
# Use in Pod
spec:
  containers:
  - name: app
    envFrom:
    - configMapRef:
        name: app-config        # All keys as env vars
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: app-config
```
