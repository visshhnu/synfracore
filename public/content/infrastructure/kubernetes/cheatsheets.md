# Kubernetes Cheat Sheet

## kubectl Quick Reference

```bash
# Context
kubectl config get-contexts
kubectl config use-context prod-cluster
kubectl config current-context

# Get resources
kubectl get pods -A                          # All namespaces
kubectl get pods -o wide                     # Show node + IP
kubectl get pods --watch                     # Live updates
kubectl get all -n production                # Everything
kubectl get events --sort-by='.lastTimestamp'

# Describe (deep detail + events)
kubectl describe pod <pod> -n <ns>
kubectl describe node <node>
kubectl describe deployment <name>

# Logs
kubectl logs <pod> -f                        # Follow
kubectl logs <pod> --previous               # Crashed container
kubectl logs <pod> -c <container>           # Multi-container pod
kubectl logs -l app=myapp --tail=100        # By label

# Exec
kubectl exec -it <pod> -- bash
kubectl exec <pod> -- cat /etc/config

# Apply / Delete
kubectl apply -f manifest.yaml
kubectl delete -f manifest.yaml
kubectl delete pod <pod> --grace-period=0   # Force delete
```

## Deployment Operations

```bash
# Scale
kubectl scale deployment myapp --replicas=5

# Update image
kubectl set image deployment/myapp myapp=myapp:2.0

# Rollout
kubectl rollout status deployment/myapp
kubectl rollout history deployment/myapp
kubectl rollout undo deployment/myapp
kubectl rollout undo deployment/myapp --to-revision=3

# Pause / Resume rolling update
kubectl rollout pause deployment/myapp
kubectl rollout resume deployment/myapp
```

## Resource Management

```bash
# Resource usage
kubectl top nodes
kubectl top pods -A
kubectl top pods --sort-by=memory

# Quota and limits
kubectl get resourcequota -n production
kubectl describe limitrange -n production

# Labels and selectors
kubectl get pods -l app=myapp,env=prod
kubectl label pod mypod env=prod
kubectl annotate pod mypod owner=team-a
```

## Troubleshooting Commands

```bash
# Pod not starting
kubectl describe pod <pod>                   # Check Events section
kubectl logs <pod> --previous               # Crashed container logs
kubectl get events -n <ns> --sort-by='.lastTimestamp'

# Check endpoints (Service routing)
kubectl get endpoints <service-name>

# Shell into running pod
kubectl exec -it <pod> -- bash

# Debug with ephemeral container (K8s 1.23+)
kubectl debug -it <pod> --image=busybox

# Port forward to test locally
kubectl port-forward pod/<pod> 8080:8080
kubectl port-forward svc/<service> 8080:80

# Copy files
kubectl cp <pod>:/var/log/app.log ./app.log
kubectl cp ./config.yaml <pod>:/etc/config.yaml

# Check resource consumption
kubectl top pods --sort-by=cpu -A | head -20
```

## Namespace Operations

```bash
kubectl create namespace production
kubectl get namespaces
kubectl config set-context --current --namespace=production  # Set default ns

# ResourceQuota for namespace
kubectl apply -f - <<EOF
apiVersion: v1
kind: ResourceQuota
metadata:
  name: production-quota
  namespace: production
spec:
  hard:
    requests.cpu: "20"
    requests.memory: 40Gi
    limits.cpu: "40"
    limits.memory: 80Gi
    pods: "100"
EOF
```

## RBAC Quick Setup

```bash
# Create service account
kubectl create serviceaccount myapp-sa -n production

# Create role
kubectl create role pod-reader \
  --verb=get,list,watch \
  --resource=pods \
  -n production

# Bind role
kubectl create rolebinding read-pods \
  --role=pod-reader \
  --serviceaccount=production:myapp-sa \
  -n production

# Check permissions
kubectl auth can-i list pods -n production \
  --as=system:serviceaccount:production:myapp-sa
```

## Key YAML Snippets

```yaml
# Resource limits — always set these
resources:
  requests:
    memory: "128Mi"
    cpu: "100m"
  limits:
    memory: "256Mi"
    cpu: "500m"

# Health probes
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

# Node affinity
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: topology.kubernetes.io/zone
          operator: In
          values: [us-east-1a, us-east-1b]

# Pod anti-affinity (spread across nodes)
affinity:
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
    - weight: 100
      podAffinityTerm:
        labelSelector:
          matchLabels:
            app: myapp
        topologyKey: kubernetes.io/hostname

# Toleration (for tainted nodes)
tolerations:
- key: "dedicated"
  operator: "Equal"
  value: "gpu"
  effect: "NoSchedule"
```

## Critical Files to Know

```
/etc/kubernetes/manifests/     Static pod manifests (control plane)
/etc/kubernetes/pki/           Certificates
~/.kube/config                 Kubeconfig
/var/log/containers/           Container logs on node
/var/lib/kubelet/              Kubelet data
```

## Exit Codes

```
0    Success
1    Application error
137  OOMKilled (out of memory) or SIGKILL
139  Segmentation fault
143  SIGTERM (graceful shutdown requested)
```
