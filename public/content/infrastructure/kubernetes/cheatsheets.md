# Kubernetes Cheatsheet

## kubectl Quick Reference

```bash
# Context and cluster
kubectl config get-contexts
kubectl config use-context prod-cluster
kubectl config set-context --current --namespace=myapp

# Get resources
kubectl get pods -A                          # all namespaces
kubectl get pods -n myapp -o wide            # with node info
kubectl get pods -l app=api,env=prod         # by label
kubectl get all -n myapp                     # pods, services, deployments

# Describe and logs
kubectl describe pod <pod-name> -n myapp
kubectl logs <pod-name> -n myapp -f          # follow
kubectl logs <pod-name> -n myapp -c sidecar  # specific container
kubectl logs <pod-name> --previous           # crashed container logs

# Execute into pod
kubectl exec -it <pod-name> -- /bin/sh
kubectl exec -it <pod-name> -c <container> -- bash

# Port forward
kubectl port-forward pod/<pod-name> 8080:80
kubectl port-forward svc/<service> 5432:5432

# Copy files
kubectl cp <pod>:/app/logs/app.log ./app.log
kubectl cp ./config.yaml <pod>:/app/config.yaml

# Scale
kubectl scale deployment <name> --replicas=5
kubectl autoscale deployment <name> --min=2 --max=10 --cpu-percent=70

# Rollout
kubectl rollout status deployment/<name>
kubectl rollout history deployment/<name>
kubectl rollout undo deployment/<name>
kubectl rollout undo deployment/<name> --to-revision=3
kubectl set image deployment/<name> <container>=<image>:<tag>

# Apply and delete
kubectl apply -f manifest.yaml
kubectl apply -f ./k8s/                      # all files in dir
kubectl delete -f manifest.yaml
kubectl delete pod <name> --grace-period=0   # force delete

# Debugging
kubectl get events -n myapp --sort-by='.lastTimestamp'
kubectl top pods -n myapp
kubectl top nodes
kubectl debug -it <pod> --image=busybox --target=<container>
```

## Resource Manifests Quick Reference

```yaml
# Deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api
  namespace: myapp
spec:
  replicas: 3
  selector:
    matchLabels: {app: api}
  strategy:
    type: RollingUpdate
    rollingUpdate: {maxSurge: 1, maxUnavailable: 0}
  template:
    metadata:
      labels: {app: api, version: "1.0"}
    spec:
      containers:
      - name: api
        image: registry/api:v1.0
        ports: [{containerPort: 8080}]
        resources:
          requests: {cpu: 100m, memory: 128Mi}
          limits:   {cpu: 500m, memory: 512Mi}
        readinessProbe:
          httpGet: {path: /health, port: 8080}
          initialDelaySeconds: 10
        livenessProbe:
          httpGet: {path: /health, port: 8080}
          periodSeconds: 30
        env:
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef: {name: db-secret, key: password}
---
# Service
apiVersion: v1
kind: Service
metadata: {name: api, namespace: myapp}
spec:
  selector: {app: api}
  ports:
  - port: 80
    targetPort: 8080
  type: ClusterIP
---
# HPA
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata: {name: api-hpa, namespace: myapp}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: api
  minReplicas: 2
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target: {type: Utilization, averageUtilization: 70}
---
# ConfigMap
apiVersion: v1
kind: ConfigMap
metadata: {name: app-config, namespace: myapp}
data:
  LOG_LEVEL: "info"
  config.yaml: |
    server:
      port: 8080
      timeout: 30s
---
# Secret
apiVersion: v1
kind: Secret
metadata: {name: db-secret, namespace: myapp}
type: Opaque
stringData:
  password: "supersecret"   # Use sealed-secrets or ESO in production
---
# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: api-ingress
  namespace: myapp
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
spec:
  ingressClassName: nginx
  tls:
  - hosts: [api.example.com]
    secretName: api-tls
  rules:
  - host: api.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service: {name: api, port: {number: 80}}
---
# PersistentVolumeClaim
apiVersion: v1
kind: PersistentVolumeClaim
metadata: {name: data-pvc, namespace: myapp}
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: gp3
  resources:
    requests: {storage: 20Gi}
```

## Common Troubleshooting

```bash
# Pod stuck in Pending
kubectl describe pod <pod> | grep -A 10 Events
# → Insufficient cpu/memory: scale up nodes or reduce requests
# → No nodes match selector: check nodeSelector/taints
# → PVC not bound: check StorageClass, PV availability

# CrashLoopBackOff
kubectl logs <pod> --previous   # logs before crash
kubectl describe pod <pod>      # check exit code, OOM kill

# ImagePullBackOff
kubectl describe pod <pod> | grep -A 5 "Failed"
# → Check image name/tag, registry credentials (imagePullSecrets)

# Service not routing traffic
kubectl get endpoints <service>  # should show pod IPs
# → No endpoints: label selector mismatch between Service and Pod
# → Check: kubectl get pod --show-labels

# Check RBAC
kubectl auth can-i create deployments --as system:serviceaccount:myapp:default
kubectl auth can-i list pods -n kube-system
```
