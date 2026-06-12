# Kubernetes — Intermediate

## ConfigMaps and Secrets

```yaml
# ConfigMap — non-sensitive configuration
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
  namespace: production
data:
  APP_ENV: "production"
  LOG_LEVEL: "info"
  MAX_CONNECTIONS: "100"
  config.yaml: |
    server:
      port: 8080
      timeout: 30s
    database:
      pool_size: 10

---
# Secret — sensitive data (base64 encoded, encrypt with KMS at rest)
apiVersion: v1
kind: Secret
metadata:
  name: app-secrets
  namespace: production
type: Opaque
data:
  db-password: cGFzc3dvcmQxMjM=   # base64 encode: echo -n "password123" | base64
  api-key: c2VjcmV0a2V5          # Use External Secrets Operator in production!

---
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    spec:
      containers:
      - name: app
        envFrom:
        - configMapRef:
            name: app-config          # All ConfigMap keys as env vars
        - secretRef:
            name: app-secrets
        env:
        - name: DB_PASSWORD           # Single secret key as specific env var
          valueFrom:
            secretKeyRef:
              name: app-secrets
              key: db-password
        volumeMounts:
        - name: config-volume
          mountPath: /etc/config
      volumes:
      - name: config-volume
        configMap:
          name: app-config            # Mount as files
          items:
          - key: config.yaml
            path: config.yaml
```

## Resource Management

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    spec:
      containers:
      - name: app
        resources:
          requests:
            memory: "256Mi"   # Guaranteed minimum (used for scheduling)
            cpu: "250m"       # 250 millicores = 0.25 CPU
          limits:
            memory: "512Mi"   # Hard limit — container killed if exceeded (OOMKilled)
            cpu: "500m"       # Soft limit — throttled, not killed

# Memory: 1Gi = 1073741824 bytes, 256Mi = 268435456 bytes
# CPU: 1000m = 1 core, 100m = 0.1 core

# LimitRange — defaults for namespace
apiVersion: v1
kind: LimitRange
metadata:
  name: default-limits
spec:
  limits:
  - default:
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"
    type: Container

# ResourceQuota — total limits for namespace
apiVersion: v1
kind: ResourceQuota
metadata:
  name: namespace-quota
spec:
  hard:
    requests.cpu: "10"
    requests.memory: 20Gi
    limits.cpu: "20"
    limits.memory: 40Gi
    pods: "50"
    persistentvolumeclaims: "10"
```

## Horizontal Pod Autoscaler

```yaml
# Scale based on CPU/memory (requires Metrics Server)
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: app-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-app
  minReplicas: 2
  maxReplicas: 50
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70       # Scale out when avg CPU > 70%
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 60
      policies:
      - type: Pods
        value: 4
        periodSeconds: 60             # Add up to 4 pods per minute
    scaleDown:
      stabilizationWindowSeconds: 300 # Wait 5 min before scaling down
      policies:
      - type: Percent
        value: 20
        periodSeconds: 60             # Remove up to 20% per minute
```

## Network Policies

```yaml
# By default, all pods can communicate with all pods
# Network Policy restricts this

# Allow only app pods to reach database, from within namespace
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: db-access-policy
  namespace: production
spec:
  podSelector:
    matchLabels:
      role: database                   # Apply to database pods
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          role: backend                # Only backend pods can connect
    - namespaceSelector:
        matchLabels:
          name: production             # Only from production namespace
    ports:
    - protocol: TCP
      port: 5432
  egress: []                           # No egress from database pods
```

## Persistent Storage

```yaml
# StorageClass — defines how to provision storage
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-ssd
provisioner: ebs.csi.aws.com
parameters:
  type: gp3
  iops: "3000"
  throughput: "125"
reclaimPolicy: Retain          # Keep data when PVC deleted
allowVolumeExpansion: true

---
# PersistentVolumeClaim — request storage
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-data
spec:
  accessModes:
  - ReadWriteOnce              # Single node read/write
  # ReadWriteMany = multiple nodes (EFS/NFS required)
  storageClassName: fast-ssd
  resources:
    requests:
      storage: 50Gi

---
# Use in StatefulSet (databases, message queues)
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: postgres
spec:
  serviceName: postgres
  replicas: 1
  template:
    spec:
      containers:
      - name: postgres
        image: postgres:16-alpine
        volumeMounts:
        - name: data
          mountPath: /var/lib/postgresql/data
  volumeClaimTemplates:         # Each pod gets its own PVC
  - metadata:
      name: data
    spec:
      accessModes: [ReadWriteOnce]
      storageClassName: fast-ssd
      resources:
        requests:
          storage: 50Gi
```
