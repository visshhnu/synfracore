# Kubernetes — Cheatsheet

## kubectl Quick Reference

```bash
# ── CONTEXT AND CLUSTER ─────────────────────────────────────
kubectl config get-contexts
kubectl config use-context prod-cluster
kubectl config set-context --current --namespace=production
kubectx prod          # kubectx tool (faster)
kubens production     # kubens tool

# ── GET RESOURCES ────────────────────────────────────────────
kubectl get pods                          # Current namespace
kubectl get pods -n kube-system           # Specific namespace
kubectl get pods -A                       # All namespaces
kubectl get pods -o wide                  # With node and IP
kubectl get pods -l app=nginx             # Label selector
kubectl get all                           # Pods, SVCs, Deployments, RS
kubectl get events --sort-by=.lastTimestamp
kubectl get nodes -o custom-columns=NAME:.metadata.name,CPU:.status.capacity.cpu,MEM:.status.capacity.memory

# ── DESCRIBE (debug) ─────────────────────────────────────────
kubectl describe pod <name>               # Full details, events
kubectl describe node <name>             # Node capacity, pods running
kubectl describe deployment <name>

# ── LOGS ─────────────────────────────────────────────────────
kubectl logs <pod>                        # Current logs
kubectl logs <pod> -f                     # Follow (stream)
kubectl logs <pod> --previous            # Crashed container logs
kubectl logs <pod> -c <container>        # Multi-container pod
kubectl logs -l app=nginx --all-containers # All pods matching label
kubectl logs <pod> --since=1h           # Last hour
kubectl logs <pod> --tail=100            # Last 100 lines

# ── EXEC AND DEBUG ───────────────────────────────────────────
kubectl exec -it <pod> -- /bin/bash
kubectl exec -it <pod> -c <container> -- sh
kubectl debug <pod> -it --image=busybox  # Debug with sidecar
kubectl cp <pod>:/path/to/file ./local   # Copy from pod
kubectl port-forward pod/<name> 8080:80  # Local port → pod
kubectl port-forward svc/<name> 8080:80  # Local port → service

# ── APPLY AND MANAGE ─────────────────────────────────────────
kubectl apply -f manifest.yaml
kubectl apply -f ./k8s/                  # Apply entire directory
kubectl apply -k ./kustomize/            # Kustomize
kubectl delete -f manifest.yaml
kubectl delete pod <name> --force --grace-period=0  # Force delete
kubectl edit deployment <name>           # In-place edit

# ── ROLLOUT ──────────────────────────────────────────────────
kubectl rollout status deployment/<name>
kubectl rollout history deployment/<name>
kubectl rollout undo deployment/<name>
kubectl rollout undo deployment/<name> --to-revision=3
kubectl rollout restart deployment/<name>  # Rolling restart

# ── SCALE ────────────────────────────────────────────────────
kubectl scale deployment <name> --replicas=5
kubectl autoscale deployment <name> --min=2 --max=10 --cpu-percent=70

# ── RESOURCE USAGE ───────────────────────────────────────────
kubectl top nodes
kubectl top pods
kubectl top pods --containers
kubectl top pods -l app=nginx

# ── NODE MANAGEMENT ──────────────────────────────────────────
kubectl cordon <node>                    # Prevent new pods
kubectl uncordon <node>                  # Allow new pods
kubectl drain <node> --ignore-daemonsets --delete-emptydir-data

# ── QUICK CREATES ────────────────────────────────────────────
kubectl create deployment nginx --image=nginx:alpine --replicas=3
kubectl expose deployment nginx --port=80 --type=LoadBalancer
kubectl create configmap app-config --from-file=./config/
kubectl create secret generic db-secret --from-literal=password=secret123
kubectl create serviceaccount my-sa
kubectl run debug --image=busybox --rm -it --restart=Never -- sh  # Temp pod
```

## Common YAML Patterns

```yaml
# Minimal Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app
  labels: { app: app }
spec:
  replicas: 3
  selector:
    matchLabels: { app: app }
  template:
    metadata:
      labels: { app: app }
    spec:
      containers:
      - name: app
        image: myapp:1.0
        ports:
        - containerPort: 8080
        resources:
          requests: { cpu: 100m, memory: 128Mi }
          limits:   { cpu: 500m, memory: 512Mi }
        readinessProbe:
          httpGet: { path: /health, port: 8080 }
          initialDelaySeconds: 10
          periodSeconds: 5
        livenessProbe:
          httpGet: { path: /health, port: 8080 }
          initialDelaySeconds: 30
          periodSeconds: 10

# Service (ClusterIP)
apiVersion: v1
kind: Service
metadata:
  name: app-svc
spec:
  selector: { app: app }
  ports:
  - port: 80
    targetPort: 8080

# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: app.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: app-svc
            port: { number: 80 }
```

## Troubleshooting Checklist

```bash
# Pod not starting?
kubectl describe pod <name>              # Check Events section
kubectl logs <name> --previous           # If CrashLoopBackOff

# Pending pod?
kubectl describe pod <name> | grep -A5 Events
# "Insufficient cpu/memory" → resource issue
# "no nodes available" → taint/toleration issue
# "Unschedulable" → PodDisruptionBudget

# Service not reachable?
kubectl get endpoints <svc-name>         # Should have pod IPs
nslookup <svc-name>.<namespace>          # DNS resolution from pod

# OOMKilled?
kubectl describe pod <name> | grep -i oom
kubectl top pod <name> --containers      # Current memory usage
```
