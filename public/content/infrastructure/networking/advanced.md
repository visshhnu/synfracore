# Networking — Advanced

## eBPF Networking

```bash
# eBPF = run sandboxed programs inside Linux kernel
# Used by: Cilium (K8s CNI), Cloudflare, Meta, Netflix

# Cilium — eBPF-based Kubernetes networking
# Replaces iptables with eBPF programs (much faster)
# Features: NetworkPolicy, service mesh, observability, WireGuard encryption

# Install Cilium
cilium install --version 1.14.0
cilium status

# Cilium network policy (same syntax as K8s NetworkPolicy but more features)
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: allow-api-to-db
spec:
  endpointSelector:
    matchLabels:
      app: postgres
  ingress:
  - fromEndpoints:
    - matchLabels:
        app: api
    toPorts:
    - ports:
      - port: "5432"
        protocol: TCP

# Observe with Hubble (Cilium's observability tool)
cilium hubble enable
hubble observe --namespace production
hubble observe --pod api-server-xxx --follow
```

## Service Mesh (Istio)

```yaml
# Istio adds mTLS, observability, traffic management without code changes

# Install
istioctl install --set profile=production

# Enable sidecar injection for namespace
kubectl label namespace production istio-injection=enabled

# Traffic management — canary with weight
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: my-app
spec:
  hosts: [my-app]
  http:
  - match:
    - headers:
        x-canary:
          exact: "true"
    route:
    - destination:
        host: my-app
        subset: v2
  - route:
    - destination:
        host: my-app
        subset: v1
      weight: 90
    - destination:
        host: my-app
        subset: v2
      weight: 10

---
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: my-app
spec:
  host: my-app
  subsets:
  - name: v1
    labels: {version: v1}
  - name: v2
    labels: {version: v2}
  trafficPolicy:
    connectionPool:
      tcp: {maxConnections: 100}
    outlierDetection:      # Circuit breaking
      consecutive5xxErrors: 5
      interval: 10s
      baseEjectionTime: 30s
```

## BGP and Cloud Networking

```bash
# BGP (Border Gateway Protocol) — how the internet routes
# AS (Autonomous System) = collection of IP ranges under one admin
# BGP peers exchange route advertisements

# MetalLB — BGP LoadBalancer for bare-metal K8s
apiVersion: metallb.io/v1beta2
kind: BGPPeer
metadata:
  name: router
spec:
  myASN: 64512          # Your AS number (private: 64512-65534)
  peerASN: 64513        # Router's AS number
  peerAddress: 192.168.1.1

apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: production
spec:
  addresses: [192.168.10.0/24]

# Calico BGP (K8s CNI)
# Advertises pod CIDR to your physical routers
# Pods become directly routable in your DC without overlay
calicoctl node status

# AWS VPC BGP with Direct Connect
# On-premise BGP router peers with AWS Direct Connect router
# Routes your on-premise CIDRs to AWS and vice versa
```

## Network Performance Tuning

```bash
# Measure baseline
iperf3 -s                          # Start server
iperf3 -c server-ip -t 30          # Test for 30 seconds
iperf3 -c server-ip -P 4           # 4 parallel streams

# Kernel network buffer tuning (high-throughput servers)
# /etc/sysctl.conf:
net.core.rmem_max = 134217728       # 128MB receive buffer
net.core.wmem_max = 134217728       # 128MB send buffer
net.core.netdev_max_backlog = 5000  # Packet queue size
net.ipv4.tcp_rmem = 4096 87380 134217728
net.ipv4.tcp_wmem = 4096 65536 134217728

# Check interface statistics (drops = problem)
ip -s link show eth0
ethtool -S eth0 | grep -i drop

# CPU affinity for network interrupts (multi-queue NICs)
# Spread IRQs across all CPUs
cat /proc/interrupts | grep eth0
echo "ff" > /proc/irq/28/smp_affinity   # All 8 CPUs handle this IRQ

# Jumbo frames (for storage networks, HPC)
ip link set eth0 mtu 9000
# Verify end-to-end: ping -M do -s 8972 server-ip  (8972 + 28 header = 9000)
```
