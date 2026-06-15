# Kubernetes — Intermediate

## Core K8s Objects (TechWorld with Nana)

As a K8s user, your main goal is to deploy and run applications with **high availability**. To do this you need to understand the core objects:

- **Pod** — smallest deployable unit, wraps one or more containers
- **Deployment** — manages ReplicaSets, rolling updates, rollbacks
- **ReplicaSet** — ensures N copies of a pod are always running
- **StatefulSet** — for stateful apps (databases) with stable network identity
- **Service** — stable network endpoint to access pods
- **ConfigMap** — non-sensitive configuration data
- **Secret** — sensitive data (passwords, tokens, keys)
- **Ingress** — HTTP/HTTPS routing to services
- **Volume** — persistent storage for pods
- **Namespace** — virtual cluster within a cluster

## Administrator vs User — Two Learning Paths

From the Nana roadmap: there are two sides to Kubernetes — learning both is important but tackle one at a time.

**K8s User** — deploy and manage applications:
- Write Deployment and Service manifests
- Configure environment variables, ConfigMaps, Secrets
- Set resource limits, health checks
- Understand rolling updates and rollbacks

**K8s Administrator** — manage the cluster itself:
- Set up and maintain the control plane
- Manage nodes, networking, storage
- Security policies, RBAC, certificates
- Monitoring and cluster upgrades

Start with User concepts first — then build Administrator knowledge on top.

## Pod

```yaml
# pod.yaml — simplest unit (usually managed via Deployment, not directly)
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: demo-app
spec:
  containers:
  - name: nginx-container
    image: nginx
    ports:
    - name: nginx
      containerPort: 80
```

```bash
kubectl apply -f pod.yaml         # create pod
kubectl get pods                  # list pods
kubectl get pods -o wide          # with IP and node info
kubectl describe pod nginx-pod    # full details
kubectl logs nginx-pod            # pod logs
kubectl exec -it nginx-pod -- bash  # shell into pod
kubectl delete pod nginx-pod      # delete pod
```

## Deployment

```yaml
# deployment.yaml — manages pods with self-healing and scaling
apiVersion: apps/v1
kind: Deployment
metadata:
  name: saifshah-regapp
  labels:
    app: saifshah-regapp
spec:
  replicas: 3                      # run 3 copies
  selector:
    matchLabels:
      app: saifshah-regapp
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1                  # max extra pods during update
      maxUnavailable: 0            # no downtime during update
  template:
    metadata:
      labels:
        app: saifshah-regapp
    spec:
      containers:
      - name: regapp
        image: saifshah/regapp:latest
        ports:
        - containerPort: 8080
        resources:
          requests:
            memory: "64Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
        env:
        - name: DB_HOST
          value: "postgres-service"
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: password
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5
```

```bash
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl rollout status deployment/saifshah-regapp  # watch rollout
kubectl rollout history deployment/saifshah-regapp  # view history
kubectl rollout undo deployment/saifshah-regapp     # rollback

# Update image (triggers rolling update)
kubectl set image deployment/saifshah-regapp regapp=saifshah/regapp:v2

# Scale
kubectl scale deployment saifshah-regapp --replicas=5
```

## Service

```yaml
# service.yaml — stable endpoint for accessing pods
# LoadBalancer — for cloud providers (AWS/GCP/Azure)
apiVersion: v1
kind: Service
metadata:
  name: saifshah-service
spec:
  selector:
    app: saifshah-regapp            # targets pods with this label
  ports:
  - name: nginx-port
    port: 80                        # port the service listens on
    targetPort: 80                  # port on the pod
  type: LoadBalancer                # provisions cloud load balancer
```

**Service Types:**
| Type | Description | Use Case |
|---|---|---|
| ClusterIP | Internal only, no external access (default) | Internal microservices |
| NodePort | Opens port on each node (30000-32767) | Dev/testing |
| LoadBalancer | Cloud load balancer (AWS ELB, GCP LB) | Production external access |
| ExternalName | Maps to DNS name | External services |

```bash
kubectl apply -f service.yaml
kubectl get services
kubectl get svc saifshah-service    # check EXTERNAL-IP (cloud LB IP)
kubectl describe service saifshah-service

# Real output from the notes (EKS deployment):
# NAME                TYPE           CLUSTER-IP      EXTERNAL-IP                              PORT(S)
# kubernetes          ClusterIP      10.100.0.1      <none>                                   443/TCP
# saifshah-service    LoadBalancer   10.100.156.66   a5cc757...us-east-1.elb.amazonaws.com    8080:30620/TCP
```

## ConfigMap and Secrets

```yaml
# configmap.yaml — non-sensitive configuration
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  DB_HOST: postgres-service
  DB_PORT: "5432"
  APP_ENV: production
  config.properties: |
    server.port=8080
    logging.level=INFO
```

```yaml
# secret.yaml — sensitive data (base64 encoded)
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  # Values must be base64 encoded
  # echo -n "mypassword" | base64
  password: bXlwYXNzd29yZA==
  username: YWRtaW4=
```

```bash
# Create secret from literal values (easier)
kubectl create secret generic db-secret \
  --from-literal=password=mypassword \
  --from-literal=username=admin

# Create from files
kubectl create secret generic tls-secret \
  --from-file=tls.crt=/path/to/cert.crt \
  --from-file=tls.key=/path/to/cert.key

# Use in pod
kubectl get configmap app-config
kubectl describe secret db-secret
```

## Deployment Strategies (from Nana roadmap)

**Rolling Update (default):**
- Replace pods one at a time
- Zero downtime
- Controlled by `maxSurge` and `maxUnavailable`

**Canary Deployment:**
- Deploy new version to small subset (e.g., 10% of pods)
- Test with real traffic before full rollout
- Use labels and separate Deployments

**Blue-Green Deployment:**
- Run old (blue) and new (green) versions simultaneously
- Switch Service selector from blue to green
- Instant cutover, easy rollback

```bash
# Rolling update
kubectl set image deployment/myapp container=myapp:v2
kubectl rollout status deployment/myapp
kubectl rollout undo deployment/myapp         # instant rollback

# Canary — deploy small subset
kubectl scale deployment myapp-v1 --replicas=9
kubectl scale deployment myapp-v2 --replicas=1
# 10% traffic to v2, 90% to v1

# Blue-Green — switch service selector
kubectl patch service myapp -p '{"spec":{"selector":{"version":"green"}}}'
```

## Namespaces

```bash
# Default namespaces
kubectl get namespaces
# NAME              STATUS   AGE
# default           Active   ...   ← your apps go here by default
# kube-system       Active   ...   ← K8s system components
# kube-public       Active   ...   ← publicly readable
# kube-node-lease   Active   ...   ← node heartbeats

# Create and use namespaces
kubectl create namespace production
kubectl create namespace staging

# Apply to specific namespace
kubectl apply -f deployment.yaml -n production
kubectl get pods -n production
kubectl get pods --all-namespaces    # or -A

# Set default namespace for current context
kubectl config set-context --current --namespace=production
```

## Essential kubectl Commands

```bash
# Cluster info
kubectl cluster-info
kubectl get nodes
kubectl get nodes -o wide           # with IP addresses
kubectl describe node node-name     # node details

# Resources
kubectl get all                     # pods, services, deployments, etc.
kubectl get all -n kube-system     # in system namespace
kubectl get pods -w                 # watch pods (live updates)

# Apply and delete
kubectl apply -f manifest.yaml      # create or update
kubectl delete -f manifest.yaml     # delete
kubectl delete pod mypod            # delete specific resource

# Debugging
kubectl logs pod-name               # pod logs
kubectl logs pod-name -c container  # specific container in multi-container pod
kubectl logs pod-name -f            # follow (tail -f)
kubectl logs pod-name --previous    # logs from crashed container
kubectl exec -it pod-name -- bash   # interactive shell
kubectl exec pod-name -- ls /app    # single command

# Port forwarding (dev/debugging only)
kubectl port-forward pod/mypod 8080:8080
kubectl port-forward service/myservice 8080:80

# Copy files
kubectl cp pod-name:/path/file.txt ./local/file.txt
kubectl cp ./local/file.txt pod-name:/path/file.txt

# Resource usage
kubectl top nodes                   # CPU/memory per node
kubectl top pods                    # CPU/memory per pod

# Events (useful for debugging)
kubectl get events --sort-by='.lastTimestamp'
kubectl get events -n default
```
