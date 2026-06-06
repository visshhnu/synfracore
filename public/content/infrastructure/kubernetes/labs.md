# Kubernetes Hands-on Labs

Practice in a real cluster. Each lab builds on the previous. Use Minikube, kind, or a cloud managed cluster.

---

## Lab Setup

```bash
# Option 1: Minikube (local)
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --cpus=4 --memory=8192

# Option 2: kind (Kubernetes in Docker)
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind && sudo mv ./kind /usr/local/bin/kind
kind create cluster --name lab-cluster

# Option 3: EKS/AKS/GKE (cloud)
# See Cloud Academy sections

# Verify
kubectl cluster-info
kubectl get nodes
```

---

## Lab 1 — Deploy Your First Application (Beginner)

**Objective:** Deploy Nginx, expose it as a Service, and access it.

**Duration:** 30 minutes

```bash
# Step 1: Create a Deployment
kubectl create deployment nginx --image=nginx:1.25 --replicas=3

# Step 2: Watch Pods come up
kubectl get pods -w

# Step 3: Expose as a Service
kubectl expose deployment nginx --port=80 --type=NodePort

# Step 4: Access it
minikube service nginx --url
# OR
kubectl port-forward svc/nginx 8080:80
# Open http://localhost:8080

# Step 5: Scale up
kubectl scale deployment nginx --replicas=5
kubectl get pods

# Step 6: Scale down
kubectl scale deployment nginx --replicas=2

# Step 7: Update the image
kubectl set image deployment/nginx nginx=nginx:1.26
kubectl rollout status deployment/nginx

# Step 8: Rollback
kubectl rollout undo deployment/nginx
kubectl rollout history deployment/nginx

# Cleanup
kubectl delete deployment nginx
kubectl delete svc nginx
```

**What you learned:** Deployment lifecycle, scaling, rolling updates, rollbacks.

---

## Lab 2 — ConfigMaps and Secrets (Beginner)

**Objective:** Inject configuration and secrets into a Pod.

**Duration:** 45 minutes

```bash
# Step 1: Create a ConfigMap
kubectl create configmap app-config \
  --from-literal=LOG_LEVEL=info \
  --from-literal=MAX_CONNECTIONS=100 \
  --from-literal=APP_ENV=production

kubectl describe configmap app-config

# Step 2: Create a Secret
kubectl create secret generic db-secret \
  --from-literal=DB_USERNAME=admin \
  --from-literal=DB_PASSWORD=SuperSecretPass123

# Verify (base64 encoded)
kubectl get secret db-secret -o yaml
kubectl get secret db-secret -o jsonpath='{.data.DB_PASSWORD}' | base64 -d

# Step 3: Deploy app using both
cat << 'EOF' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: busybox
        command: ["sh", "-c", "env && sleep 3600"]
        envFrom:
        - configMapRef:
            name: app-config
        env:
        - name: DB_USERNAME
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: DB_USERNAME
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: DB_PASSWORD
EOF

# Step 4: Verify environment variables
kubectl get pods
kubectl exec -it $(kubectl get pod -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- env | grep -E "LOG_LEVEL|DB_"

# Step 5: Mount ConfigMap as a file
cat << 'EOF' | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  nginx.conf: |
    server {
      listen 80;
      location /health {
        return 200 'healthy\n';
      }
    }
EOF

# Cleanup
kubectl delete deployment myapp
kubectl delete configmap app-config nginx-config
kubectl delete secret db-secret
```

---

## Lab 3 — Persistent Storage with PVC (Intermediate)

**Objective:** Deploy PostgreSQL with persistent storage that survives Pod restarts.

**Duration:** 1 hour

```bash
# Step 1: Create PersistentVolumeClaim
cat << 'EOF' | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-pvc
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
EOF

kubectl get pvc  # Should show Bound

# Step 2: Deploy PostgreSQL
cat << 'EOF' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
      - name: postgres
        image: postgres:15
        env:
        - name: POSTGRES_DB
          value: myapp
        - name: POSTGRES_USER
          value: admin
        - name: POSTGRES_PASSWORD
          value: password123
        ports:
        - containerPort: 5432
        volumeMounts:
        - name: postgres-storage
          mountPath: /var/lib/postgresql/data
      volumes:
      - name: postgres-storage
        persistentVolumeClaim:
          claimName: postgres-pvc
---
apiVersion: v1
kind: Service
metadata:
  name: postgres
spec:
  selector:
    app: postgres
  ports:
  - port: 5432
EOF

# Step 3: Write data
kubectl exec -it $(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}') \
  -- psql -U admin -d myapp -c "CREATE TABLE test (id SERIAL, name TEXT); INSERT INTO test(name) VALUES ('hello');"

# Step 4: Delete and recreate Pod (simulate crash)
kubectl delete pod -l app=postgres
# Wait for new pod
kubectl get pods -w

# Step 5: Verify data persisted
kubectl exec -it $(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}') \
  -- psql -U admin -d myapp -c "SELECT * FROM test;"
# Data should still be there!

# Cleanup
kubectl delete deployment postgres
kubectl delete svc postgres
kubectl delete pvc postgres-pvc
```

---

## Lab 4 — Horizontal Pod Autoscaling (Intermediate)

**Objective:** Automatically scale pods based on CPU load.

**Duration:** 1 hour

```bash
# Step 1: Install Metrics Server (required for HPA)
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# For minikube:
minikube addons enable metrics-server

# Wait until metrics are available
kubectl top nodes

# Step 2: Deploy a CPU-intensive app
cat << 'EOF' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-apache
spec:
  replicas: 1
  selector:
    matchLabels:
      app: php-apache
  template:
    metadata:
      labels:
        app: php-apache
    spec:
      containers:
      - name: php-apache
        image: registry.k8s.io/hpa-example
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 200m
          limits:
            cpu: 500m
---
apiVersion: v1
kind: Service
metadata:
  name: php-apache
spec:
  selector:
    app: php-apache
  ports:
  - port: 80
EOF

# Step 3: Create HPA
kubectl autoscale deployment php-apache \
  --cpu-percent=50 \
  --min=1 \
  --max=10

kubectl get hpa

# Step 4: Generate load (in a separate terminal)
kubectl run load-generator \
  --image=busybox:1.28 \
  --restart=Never \
  -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

# Step 5: Watch scaling (in original terminal)
watch kubectl get hpa
watch kubectl get pods

# Step 6: Stop load
kubectl delete pod load-generator

# Watch scale down (takes a few minutes)
watch kubectl get hpa

# Cleanup
kubectl delete deployment php-apache
kubectl delete svc php-apache
kubectl delete hpa php-apache
```

---

## Lab 5 — Network Policies (Advanced)

**Objective:** Implement microsegmentation — only allow specific pod-to-pod communication.

**Duration:** 1 hour

```bash
# Step 1: Create namespaces
kubectl create namespace frontend
kubectl create namespace backend
kubectl create namespace database

# Step 2: Deploy pods
kubectl run frontend --image=nginx -n frontend --labels="tier=frontend"
kubectl run backend --image=nginx -n backend --labels="tier=backend"
kubectl run database --image=nginx -n database --labels="tier=database"

# Create services
kubectl expose pod frontend --port=80 -n frontend
kubectl expose pod backend --port=80 -n backend
kubectl expose pod database --port=80 -n database

# Step 3: Test connectivity BEFORE NetworkPolicy (all should work)
kubectl exec -n frontend frontend -- curl -s http://database.database
# Should get nginx response

# Step 4: Apply deny-all in database namespace
cat << 'EOF' | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all
  namespace: database
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
EOF

# Step 5: Test — all connections to database should fail
kubectl exec -n frontend frontend -- curl -s --max-time 3 http://database.database
# Should timeout now

# Step 6: Allow only backend to reach database
cat << 'EOF' | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-backend-to-database
  namespace: database
spec:
  podSelector:
    matchLabels:
      tier: database
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: backend
      podSelector:
        matchLabels:
          tier: backend
    ports:
    - protocol: TCP
      port: 80
EOF

# Step 7: Test — backend can reach database, frontend cannot
kubectl exec -n backend backend -- curl -s --max-time 3 http://database.database  # Works
kubectl exec -n frontend frontend -- curl -s --max-time 3 http://database.database # Fails

# Cleanup
kubectl delete namespace frontend backend database
```

---

## Lab 6 — Full Production Deployment (Advanced)

**Objective:** Deploy a 3-tier application (frontend, backend, database) with all production best practices.

**Duration:** 2 hours

```bash
# Deploy the full stack
cat << 'EOF' | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: production
---
# Database Secret
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
  namespace: production
type: Opaque
stringData:
  POSTGRES_PASSWORD: "ProdSecurePass123"
---
# Database
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgres
  namespace: production
spec:
  serviceName: postgres
  replicas: 1
  selector:
    matchLabels:
      app: postgres
  template:
    metadata:
      labels:
        app: postgres
    spec:
      containers:
      - name: postgres
        image: postgres:15
        env:
        - name: POSTGRES_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: POSTGRES_PASSWORD
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          exec:
            command: ["pg_isready", "-U", "postgres"]
          initialDelaySeconds: 30
          periodSeconds: 10
        volumeClaimTemplates:
        - metadata:
            name: data
          spec:
            accessModes: ["ReadWriteOnce"]
            resources:
              requests:
                storage: 5Gi
---
apiVersion: v1
kind: Service
metadata:
  name: postgres
  namespace: production
spec:
  clusterIP: None   # Headless for StatefulSet
  selector:
    app: postgres
  ports:
  - port: 5432
---
# Backend API
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
  namespace: production
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: nginx:1.25   # Replace with your API image
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "500m"
        readinessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 5
        livenessProbe:
          httpGet:
            path: /
            port: 80
          initialDelaySeconds: 15
          periodSeconds: 10
---
apiVersion: v1
kind: Service
metadata:
  name: backend
  namespace: production
spec:
  selector:
    app: backend
  ports:
  - port: 80
---
# HPA for backend
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: backend-hpa
  namespace: production
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: backend
  minReplicas: 3
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 60
---
# PodDisruptionBudget
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: backend-pdb
  namespace: production
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: backend
EOF

# Verify everything
kubectl get all -n production
kubectl get pvc -n production

# Cleanup
kubectl delete namespace production
```

**What you learned:** Full production setup with StatefulSet, Secrets, resource limits, health probes, HPA, PDB, and RollingUpdate strategy.
