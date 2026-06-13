# Security Fundamentals — Intermediate

## PKI and Certificate Management

```bash
# Generate CA and certificates with OpenSSL
# Step 1: Create private CA
openssl genrsa -aes256 -out ca-key.pem 4096
openssl req -new -x509 -days 3650 -key ca-key.pem -out ca-cert.pem \
    -subj "/C=IN/ST=KA/L=Bangalore/O=MyOrg/CN=MyOrg-CA"

# Step 2: Create server certificate
openssl genrsa -out server-key.pem 2048
openssl req -new -key server-key.pem -out server-csr.pem \
    -subj "/CN=api.example.com"

# SAN extension (required by modern browsers)
cat > server-ext.cnf << 'EXTEOF'
[SAN]
subjectAltName=DNS:api.example.com,DNS:*.api.example.com,IP:10.0.0.1
EXTEOF

openssl x509 -req -days 365 -in server-csr.pem \
    -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial \
    -out server-cert.pem -extfile server-ext.cnf -extensions SAN

# Verify certificate
openssl x509 -in server-cert.pem -text -noout | grep -A5 "Subject Alternative Name"
openssl verify -CAfile ca-cert.pem server-cert.pem

# Check certificate expiry (critical for ops)
echo | openssl s_client -connect api.example.com:443 -servername api.example.com 2>/dev/null \
    | openssl x509 -noout -dates

# cert-manager in Kubernetes (automates Let's Encrypt)
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml

# ClusterIssuer for Let's Encrypt
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: admin@example.com
    privateKeySecretRef: { name: letsencrypt-prod }
    solvers:
    - http01:
        ingress:
          class: nginx
```

## IAM and Zero Trust

```python
# Zero Trust: verify every request, trust nothing by default
# Implement RBAC with fine-grained permissions

from dataclasses import dataclass
from typing import set as Set
import jwt, datetime

@dataclass
class Permission:
    resource: str   # e.g., "deployments", "secrets"
    actions: Set[str]  # e.g., {"read", "write", "delete"}
    conditions: dict = None  # e.g., {"namespace": "production"}

ROLES = {
    "developer": [
        Permission("deployments", {"read", "write"}, {"namespace": "dev"}),
        Permission("pods", {"read", "exec"}, {"namespace": "dev"}),
        Permission("logs", {"read"}),
    ],
    "devops": [
        Permission("deployments", {"read", "write", "delete"}),
        Permission("nodes", {"read"}),
        Permission("secrets", {"read"}, {"namespace": "monitoring"}),
    ],
    "admin": [
        Permission("*", {"*"}),  # Full access
    ]
}

def check_permission(user_roles: list, resource: str, action: str, context: dict = {}) -> bool:
    for role in user_roles:
        for perm in ROLES.get(role, []):
            # Check resource match
            if perm.resource != "*" and perm.resource != resource:
                continue
            # Check action match
            if "*" not in perm.actions and action not in perm.actions:
                continue
            # Check conditions
            if perm.conditions:
                if not all(context.get(k) == v for k, v in perm.conditions.items()):
                    continue
            return True  # Permission granted
    return False

# JWT with short expiry + refresh tokens
def create_token(user_id: str, roles: list, secret: str) -> dict:
    now = datetime.datetime.utcnow()
    access_token = jwt.encode({
        "sub": user_id,
        "roles": roles,
        "iat": now,
        "exp": now + datetime.timedelta(minutes=15),  # Short-lived!
        "type": "access"
    }, secret, algorithm="HS256")
    
    refresh_token = jwt.encode({
        "sub": user_id,
        "exp": now + datetime.timedelta(days=7),
        "type": "refresh"
    }, secret, algorithm="HS256")
    
    return {"access_token": access_token, "refresh_token": refresh_token}
```

## Container Security

```yaml
# Kubernetes security context — defense in depth
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    spec:
      # Pod-level security
      securityContext:
        runAsNonRoot: true
        runAsUser: 1000
        runAsGroup: 3000
        fsGroup: 2000
        seccompProfile:
          type: RuntimeDefault    # Restrict syscalls

      containers:
      - name: app
        # Container-level security
        securityContext:
          allowPrivilegeEscalation: false
          readOnlyRootFilesystem: true   # Immutable filesystem
          capabilities:
            drop: [ALL]                   # Drop ALL Linux capabilities
            add: [NET_BIND_SERVICE]       # Re-add only what's needed
        
        # Writable directories via emptyDir
        volumeMounts:
        - name: tmp
          mountPath: /tmp
        - name: cache
          mountPath: /app/cache
      
      volumes:
      - name: tmp
        emptyDir: {}
      - name: cache
        emptyDir: {}
```

```bash
# Scan images with Trivy
trivy image --severity HIGH,CRITICAL myapp:latest
trivy image --format json --output scan.json myapp:latest

# Scan Kubernetes configs
trivy k8s --report summary cluster

# OPA Gatekeeper — policy enforcement
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.14/deploy/gatekeeper.yaml

# ConstraintTemplate: require resource limits
apiVersion: templates.gatekeeper.sh/v1
kind: ConstraintTemplate
metadata:
  name: requireresourcelimits
spec:
  crd:
    spec:
      names: { kind: RequireResourceLimits }
  targets:
  - target: admission.k8s.gatekeeper.sh
    rego: |
      package requireresourcelimits
      violation[{"msg": msg}] {
        container := input.review.object.spec.containers[_]
        not container.resources.limits.cpu
        msg := sprintf("Container %v missing CPU limit", [container.name])
      }
```
