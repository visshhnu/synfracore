# Kubernetes Fundamentals

## kubectl — The CLI

\`\`\`bash
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
\`\`\`

## Pod Manifest

\`\`\`yaml
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
\`\`\`

## Deployment

\`\`\`yaml
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
\`\`\`

\`\`\`bash
# Deployment operations
kubectl rollout status deployment/myapp    # Watch rollout progress
kubectl rollout history deployment/myapp   # Rollout history
kubectl rollout undo deployment/myapp      # Rollback
kubectl rollout undo deployment/myapp --to-revision=2
kubectl scale deployment myapp --replicas=5
kubectl set image deployment/myapp myapp=myapp:2.0  # Update image
\`\`\`

## Services

\`\`\`yaml
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
\`\`\`

## ConfigMaps and Secrets

\`\`\`bash
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
\`\`\`

\`\`\`yaml
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
\`\`\`