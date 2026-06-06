# Kubernetes Security — CKS & Production Hardening

Kubernetes security is a layered discipline covering cluster hardening, workload isolation, supply chain security, runtime threat detection, and compliance. The CKS (Certified Kubernetes Security Specialist) exam covers all of these domains.

## The 4Cs of Cloud Native Security

```
Cloud (Infrastructure)
  └── Cluster (Kubernetes)
        └── Container (Image)
              └── Code (Application)
```

Security at each layer:
- **Cloud** — IAM, VPC, firewall rules, encryption at rest
- **Cluster** — API server hardening, RBAC, network policies, audit logging
- **Container** — Non-root user, read-only filesystem, no privileged, minimal image
- **Code** — Input validation, dependency scanning, secrets management

## CKS Exam Domains

| Domain | Weight |
|--------|--------|
| Cluster Setup | 10% |
| Cluster Hardening | 15% |
| System Hardening | 15% |
| Minimize Microservice Vulnerabilities | 20% |
| Supply Chain Security | 20% |
| Monitoring, Logging, Runtime Security | 20% |

## RBAC — Role-Based Access Control

The most important Kubernetes security primitive.

```yaml
# Role — namespace-scoped permissions
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: production
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log"]
  verbs: ["get", "list", "watch"]

---
# ClusterRole — cluster-wide permissions
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: node-reader
rules:
- apiGroups: [""]
  resources: ["nodes"]
  verbs: ["get", "list", "watch"]

---
# RoleBinding — bind role to subject
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: read-pods
  namespace: production
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
- kind: ServiceAccount
  name: monitoring-sa
  namespace: monitoring
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

## Network Policies

By default, all pods can communicate with all other pods. Network Policies restrict this.

```yaml
# Deny all ingress by default (start here!)
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all-ingress
  namespace: production
spec:
  podSelector: {}           # Applies to all pods in namespace
  policyTypes:
  - Ingress

---
# Allow only from specific namespace + port
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: frontend-ns
      podSelector:
        matchLabels:
          app: frontend
    ports:
    - protocol: TCP
      port: 8080
```

## Pod Security

```yaml
# SecurityContext — enforce at pod level
spec:
  securityContext:
    runAsNonRoot: true        # Don't run as root
    runAsUser: 1000           # Specific UID
    runAsGroup: 3000
    fsGroup: 2000             # Volume ownership
    seccompProfile:
      type: RuntimeDefault    # Default seccomp profile
      
  containers:
  - name: app
    image: myapp:1.0
    securityContext:
      allowPrivilegeEscalation: false   # Critical!
      readOnlyRootFilesystem: true      # Can't write to FS
      capabilities:
        drop:
        - ALL                           # Drop all Linux capabilities
        add:
        - NET_BIND_SERVICE              # Only add what's needed
```

## Pod Security Admission (PSA)

Replaced PodSecurityPolicy in K8s 1.25+.

```yaml
# Label namespace for enforcement level
apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    pod-security.kubernetes.io/enforce: restricted    # Block violations
    pod-security.kubernetes.io/audit: restricted      # Log violations
    pod-security.kubernetes.io/warn: restricted       # Warn violations
```

Three profiles:
- **privileged** — No restrictions
- **baseline** — Prevent known privilege escalations
- **restricted** — Hardened, requires non-root, no privileged containers

## Secrets Management

```bash
# Built-in Secrets (base64 encoded, not encrypted by default!)
kubectl create secret generic db-creds \
  --from-literal=username=admin \
  --from-literal=password=s3cr3t

# Enable encryption at rest (kube-apiserver flag)
--encryption-provider-config=/etc/kubernetes/encryption.yaml

# encryption.yaml
apiVersion: apiserver.config.k8s.io/v1
kind: EncryptionConfiguration
resources:
- resources:
  - secrets
  providers:
  - aescbc:
      keys:
      - name: key1
        secret: <base64-encoded-32-byte-key>
  - identity: {}   # Fallback for unencrypted secrets
```

**Production recommendation:** Use external secrets management:
- **AWS Secrets Manager** with External Secrets Operator
- **HashiCorp Vault** with Vault Agent Injector
- **Sealed Secrets** (encrypt secrets for GitOps)
