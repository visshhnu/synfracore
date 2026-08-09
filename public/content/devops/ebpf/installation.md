# eBPF & Cilium — Installation Guide

## Pre-Flight — Confirm Kernel Support

eBPF requires a sufficiently modern Linux kernel — confirm this before installing anything, especially on older nodes or minimal base images:

```bash
uname -r
# Most current managed Kubernetes node images (EKS, GKE, AKS) already
# meet this requirement; a genuinely old kernel is the main real
# blocker `(needs verification — recheck current Cilium docs for the
# exact minimum kernel version required)`
```

## Install Cilium as the Cluster CNI

The standard path — replacing the default CNI (often kube-proxy + a basic CNI) entirely, per Overview's framing:

```bash
helm repo add cilium https://helm.cilium.io/
helm repo update

helm install cilium cilium/cilium \
  --namespace kube-system \
  --set kubeProxyReplacement=true \
  --set hubble.relay.enabled=true \
  --set hubble.ui.enabled=true

# Verify installation health
cilium status
# Reports kube-proxy-replacement mode and overall health — this is
# the single most useful command for confirming Cilium is actually
# functioning correctly, not just that pods are Running
```

## Install the Cilium CLI

```bash
CILIUM_CLI_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/cilium-cli/main/stable.txt)
curl -L --remote-name-all "https://github.com/cilium/cilium-cli/releases/download/${CILIUM_CLI_VERSION}/cilium-linux-amd64.tar.gz"
tar xzvf cilium-linux-amd64.tar.gz -C /usr/local/bin

cilium version
```

## Install the Hubble CLI (Flow Observability)

```bash
HUBBLE_VERSION=$(curl -s https://raw.githubusercontent.com/cilium/hubble/master/stable.txt)
curl -L --remote-name-all "https://github.com/cilium/hubble/releases/download/${HUBBLE_VERSION}/hubble-linux-amd64.tar.gz"
tar xzvf hubble-linux-amd64.tar.gz -C /usr/local/bin

hubble status
```

## Bootstrapping a New Cluster With Cilium From the Start (kind, for Local Practice)

```bash
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  disableDefaultCNI: true   # Cilium replaces the default CNI entirely
EOF

helm install cilium cilium/cilium --namespace kube-system \
  --set kubeProxyReplacement=true --set hubble.relay.enabled=true --set hubble.ui.enabled=true
```

## Verify Everything Works

```bash
# 1. Confirm Cilium reports healthy
cilium status
# Look specifically for "KubeProxyReplacement: True" and no error states

# 2. Run Cilium's own built-in connectivity test
cilium connectivity test
# This deploys real test pods and verifies pod-to-pod, pod-to-service,
# and policy-enforcement connectivity end to end — the most thorough
# post-install check available

# 3. Confirm Hubble is observing real flows
hubble observe --namespace kube-system
```

## Common Installation Issues

**`cilium status` reports `KubeProxyReplacement: False` unexpectedly**
```bash
cilium status --verbose
# Confirm kubeProxyReplacement=true was actually set at install time —
# a missing or misspelled Helm flag silently falls back to a
# lower-capability mode rather than erroring
```

**Hubble UI shows no flow data**
This is the exact scenario covered in Troubleshooting: `hubble-relay` and per-node Hubble collection are two separate flags — both `hubble.relay.enabled=true` and Hubble being enabled per-node are required for the UI to show anything, even if `hubble observe` at the CLI works fine against a single node.

**Cilium pods stuck in `CrashLoopBackOff` after install**
```bash
kubectl logs -n kube-system -l k8s-app=cilium
# Most common cause on a fresh cluster: an incompatible or too-old
# kernel version, or a conflicting CNI still partially installed
```

**`cilium connectivity test` fails on cross-node traffic specifically**
```bash
cilium status --verbose | grep -i tunnel
# Confirms the encapsulation/tunneling mode Cilium is using — a
# mismatch between the configured mode and the actual network
# environment (e.g., cloud security groups blocking the tunnel port)
# is the usual cause
```

## What's Installed

After a successful Cilium installation:
- **Cilium agent** — DaemonSet running on every node, implementing the eBPF-based datapath (replacing kube-proxy if `kubeProxyReplacement=true`)
- **Cilium Operator** — cluster-level coordination
- **Hubble** (if enabled) — per-node flow observability, plus `hubble-relay` for cluster-wide aggregation and `hubble-ui` for the visual flow explorer

## Next Steps

Go to the **Fundamentals** section to explore Hubble flow data and write your first `CiliumNetworkPolicy`.
