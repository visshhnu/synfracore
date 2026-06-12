# Kubernetes — Container Orchestration at Scale

Kubernetes (K8s) automatically deploys, scales, and manages containerized applications. When you have 10 containers that need to stay running across 5 servers, handle traffic spikes, restart on failures, and update without downtime — that's what Kubernetes does.

:::info Why Kubernetes?
Without K8s: You manually SSH into servers, run Docker commands, restart crashed containers, and stay up at 3am. With K8s: You declare "I want 3 replicas of my app always running" and Kubernetes makes it happen — forever.
:::

## Kubernetes Architecture

```svg
<svg viewBox="0 0 740 420" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Control Plane -->
  <rect x="10" y="10" width="340" height="200" rx="14" fill="#0F172A" stroke="#3B82F6" stroke-width="2"/>
  <text x="180" y="38" font-size="13" fill="#60A5FA" text-anchor="middle" font-weight="800" letter-spacing="1">CONTROL PLANE</text>

  <rect x="26" y="50" width="145" height="50" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="98" y="71" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">API Server</text>
  <text x="98" y="88" font-size="9" fill="#60A5FA" text-anchor="middle">Entry point for all requests</text>

  <rect x="179" y="50" width="145" height="50" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="251" y="71" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">etcd</text>
  <text x="251" y="88" font-size="9" fill="#60A5FA" text-anchor="middle">Cluster state database</text>

  <rect x="26" y="112" width="145" height="50" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="98" y="133" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">Scheduler</text>
  <text x="98" y="150" font-size="9" fill="#60A5FA" text-anchor="middle">Places pods on nodes</text>

  <rect x="179" y="112" width="145" height="50" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="251" y="133" font-size="11" fill="#93C5FD" text-anchor="middle" font-weight="700">Controller Manager</text>
  <text x="251" y="150" font-size="9" fill="#60A5FA" text-anchor="middle">Maintains desired state</text>

  <!-- kubectl -->
  <rect x="60" y="175" width="230" height="28" rx="6" fill="#172554" stroke="#1D4ED8" stroke-width="1"/>
  <text x="175" y="193" font-size="11" fill="#BFDBFE" text-anchor="middle" font-weight="600">kubectl → API Server</text>

  <!-- Workers -->
  <rect x="370" y="10" width="360" height="200" rx="14" fill="#0F172A" stroke="#10B981" stroke-width="2"/>
  <text x="550" y="38" font-size="13" fill="#34D399" text-anchor="middle" font-weight="800" letter-spacing="1">WORKER NODES</text>

  <!-- Node 1 -->
  <rect x="386" y="50" width="155" height="150" rx="10" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="463" y="72" font-size="11" fill="#6EE7B7" text-anchor="middle" font-weight="700">Node 1</text>
  <rect x="396" y="80" width="135" height="30" rx="6" fill="#065F46"/>
  <text x="463" y="99" font-size="10" fill="#A7F3D0" text-anchor="middle">kubelet (agent)</text>
  <rect x="396" y="118" width="60" height="30" rx="6" fill="#047857"/>
  <text x="426" y="137" font-size="10" fill="#D1FAE5" text-anchor="middle">Pod A</text>
  <rect x="464" y="118" width="67" height="30" rx="6" fill="#047857"/>
  <text x="497" y="137" font-size="10" fill="#D1FAE5" text-anchor="middle">Pod B</text>
  <rect x="396" y="156" width="135" height="30" rx="6" fill="#065F46" opacity="0.7"/>
  <text x="463" y="175" font-size="10" fill="#A7F3D0" text-anchor="middle">kube-proxy</text>

  <!-- Node 2 -->
  <rect x="557" y="50" width="155" height="150" rx="10" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="634" y="72" font-size="11" fill="#6EE7B7" text-anchor="middle" font-weight="700">Node 2</text>
  <rect x="567" y="80" width="135" height="30" rx="6" fill="#065F46"/>
  <text x="634" y="99" font-size="10" fill="#A7F3D0" text-anchor="middle">kubelet (agent)</text>
  <rect x="567" y="118" width="60" height="30" rx="6" fill="#047857"/>
  <text x="597" y="137" font-size="10" fill="#D1FAE5" text-anchor="middle">Pod C</text>
  <rect x="635" y="118" width="67" height="30" rx="6" fill="#047857"/>
  <text x="668" y="137" font-size="10" fill="#D1FAE5" text-anchor="middle">Pod D</text>
  <rect x="567" y="156" width="135" height="30" rx="6" fill="#065F46" opacity="0.7"/>
  <text x="634" y="175" font-size="10" fill="#A7F3D0" text-anchor="middle">kube-proxy</text>

  <!-- Arrow between control and workers -->
  <line x1="350" y1="110" x2="370" y2="110" stroke="#94A3B8" stroke-width="1.5" marker-end="url(#arr)"/>
  <defs><marker id="arr" markerWidth="8" markerHeight="6" refX="8" refY="3" orient="auto"><polygon points="0 0, 8 3, 0 6" fill="#94A3B8"/></marker></defs>

  <!-- K8s Objects -->
  <rect x="10" y="230" width="720" height="180" rx="14" fill="#0F172A" stroke="#8B5CF6" stroke-width="2"/>
  <text x="370" y="258" font-size="13" fill="#A78BFA" text-anchor="middle" font-weight="800" letter-spacing="1">KUBERNETES OBJECTS</text>

  <!-- Objects grid -->
  <rect x="26" y="268" width="120" height="56" rx="8" fill="#2D1B69" stroke="#7C3AED" stroke-width="1"/>
  <text x="86" y="290" font-size="12" fill="#C4B5FD" text-anchor="middle" font-weight="700">Pod</text>
  <text x="86" y="306" font-size="9" fill="#A78BFA" text-anchor="middle">1+ containers</text>
  <text x="86" y="318" font-size="9" fill="#7C3AED" text-anchor="middle">smallest unit</text>

  <rect x="162" y="268" width="120" height="56" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="222" y="290" font-size="12" fill="#93C5FD" text-anchor="middle" font-weight="700">Deployment</text>
  <text x="222" y="306" font-size="9" fill="#60A5FA" text-anchor="middle">manages pods</text>
  <text x="222" y="318" font-size="9" fill="#3B82F6" text-anchor="middle">rolling updates</text>

  <rect x="298" y="268" width="120" height="56" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="1"/>
  <text x="358" y="290" font-size="12" fill="#6EE7B7" text-anchor="middle" font-weight="700">Service</text>
  <text x="358" y="306" font-size="9" fill="#34D399" text-anchor="middle">stable IP/DNS</text>
  <text x="358" y="318" font-size="9" fill="#10B981" text-anchor="middle">load balancing</text>

  <rect x="434" y="268" width="120" height="56" rx="8" fill="#78350F" stroke="#F59E0B" stroke-width="1"/>
  <text x="494" y="290" font-size="12" fill="#FDE68A" text-anchor="middle" font-weight="700">ConfigMap</text>
  <text x="494" y="306" font-size="9" fill="#FCD34D" text-anchor="middle">non-secret config</text>
  <text x="494" y="318" font-size="9" fill="#F59E0B" text-anchor="middle">env vars / files</text>

  <rect x="570" y="268" width="120" height="56" rx="8" fill="#7F1D1D" stroke="#EF4444" stroke-width="1"/>
  <text x="630" y="290" font-size="12" fill="#FCA5A5" text-anchor="middle" font-weight="700">Secret</text>
  <text x="630" y="306" font-size="9" fill="#F87171" text-anchor="middle">sensitive config</text>
  <text x="630" y="318" font-size="9" fill="#EF4444" text-anchor="middle">passwords / keys</text>

  <rect x="26" y="334" width="120" height="56" rx="8" fill="#1E1B4B" stroke="#6366F1" stroke-width="1"/>
  <text x="86" y="356" font-size="12" fill="#A5B4FC" text-anchor="middle" font-weight="700">Ingress</text>
  <text x="86" y="372" font-size="9" fill="#818CF8" text-anchor="middle">HTTP routing</text>
  <text x="86" y="384" font-size="9" fill="#6366F1" text-anchor="middle">TLS termination</text>

  <rect x="162" y="334" width="120" height="56" rx="8" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="222" y="356" font-size="12" fill="#6EE7B7" text-anchor="middle" font-weight="700">HPA</text>
  <text x="222" y="372" font-size="9" fill="#34D399" text-anchor="middle">auto-scaling</text>
  <text x="222" y="384" font-size="9" fill="#10B981" text-anchor="middle">CPU / memory</text>

  <rect x="298" y="334" width="120" height="56" rx="8" fill="#1C1917" stroke="#78716C" stroke-width="1"/>
  <text x="358" y="356" font-size="12" fill="#D6D3D1" text-anchor="middle" font-weight="700">PersistentVolume</text>
  <text x="358" y="372" font-size="9" fill="#A8A29E" text-anchor="middle">storage</text>
  <text x="358" y="384" font-size="9" fill="#78716C" text-anchor="middle">EBS / NFS / EFS</text>

  <rect x="434" y="334" width="120" height="56" rx="8" fill="#0C4A6E" stroke="#0284C7" stroke-width="1"/>
  <text x="494" y="356" font-size="12" fill="#7DD3FC" text-anchor="middle" font-weight="700">Namespace</text>
  <text x="494" y="372" font-size="9" fill="#38BDF8" text-anchor="middle">logical isolation</text>
  <text x="494" y="384" font-size="9" fill="#0284C7" text-anchor="middle">multi-team</text>
</svg>
```

## Core Concepts Explained

### Pod — The Smallest Unit
A Pod wraps one or more containers that share network and storage. Containers in the same Pod communicate via `localhost`. In practice, most Pods have one container.

### Deployment — How You Run Apps
You never create Pods directly. You create a Deployment that says "keep 3 replicas of this container running." Kubernetes creates the Pods and continuously ensures that number stays correct — restarting crashed ones, replacing unhealthy ones.

### Service — Stable Network Identity
Pods come and go (new IP each time). A Service provides a stable DNS name (`my-app.default.svc.cluster.local`) and IP that routes to healthy Pods.

## Your First Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3                    # Keep 3 copies always running
  selector:
    matchLabels: { app: my-app }
  template:
    metadata:
      labels: { app: my-app }
    spec:
      containers:
      - name: my-app
        image: nginx:alpine
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector: { app: my-app }      # Routes to pods with this label
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer             # External access
```

```bash
kubectl apply -f deployment.yaml     # Deploy
kubectl get pods                     # Check status
kubectl logs -f my-app-abc123        # View logs
kubectl scale deployment my-app --replicas=5  # Scale up
```

:::warning Common Mistake
Never hardcode secrets in your YAML files. Use Kubernetes Secrets or an external secrets manager like AWS Secrets Manager. Your YAML files end up in Git — don't put passwords there.
:::
