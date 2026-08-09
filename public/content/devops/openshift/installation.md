# OpenShift OCP 4.x — Installation Guide

## Option 1: Red Hat Developer Sandbox (Free, No Install)

The fastest path to a real OpenShift environment with zero local setup, matching Roadmap's own recommendation:

1. Go to **developers.redhat.com/developer-sandbox** and sign up for a free account
2. A time-limited (renewable), real OpenShift namespace is provisioned automatically
3. Access via the web console or by installing the `oc` CLI locally and logging in with the provided token

```bash
oc login --token=<sandbox-token> --server=<sandbox-api-url>
oc whoami
```

## Option 2: OpenShift Local (`crc`) — Local Single-Node Cluster

For offline practice or deeper hands-on work with cluster-admin-level access:

```bash
# Download crc from Red Hat's official site (requires a free Red Hat account
# for the pull secret)
crc setup
crc start
# This downloads and boots a single-node OpenShift cluster locally —
# expect this to take real time and meaningful local resources

crc console   # Opens the web console
eval $(crc oc-env)
oc login -u developer https://api.crc.testing:6443
```

## Install the `oc` CLI Standalone

If you're connecting to an existing cluster (Sandbox, a shared dev cluster) without needing `crc`:

```bash
# Linux
curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz
tar xvzf openshift-client-linux.tar.gz -C /usr/local/bin oc

oc version
```

## Full Cluster Installation (`openshift-install`) — Advanced/Production Only

Referenced in Fundamentals — this provisions a real multi-node production cluster and is genuinely heavyweight; not the recommended path for initial learning:

```bash
# Requires an install-config.yaml, consumed ONCE during install
openshift-install create cluster --dir=./cluster-install

# This provisions Bootstrap, Control Plane, and Worker nodes per
# Overview's four-node-type architecture, then decommissions the
# Bootstrap node automatically once the Control Plane is self-sufficient
```

## Verify Everything Works

```bash
# 1. Confirm you're authenticated and can see cluster info
oc whoami
oc cluster-info

# 2. Confirm you can create and interact with a project (OCP's
#    namespace-equivalent, with extra scaffolding)
oc new-project my-first-project
oc get pods -n my-first-project

# 3. Deploy a test application using oc's higher-level app-creation command
oc new-app --name=hello-openshift \
  registry.access.redhat.com/openshift3/ose-hello-openshift

oc expose svc/hello-openshift   # Creates a Route (not an Ingress)
oc get route hello-openshift
```

## Common Installation Issues

**`crc start` fails with insufficient resources**
```bash
crc config set memory 16384
crc config set cpus 6
# crc genuinely needs meaningful local resources — this is expected
# on an under-resourced machine, not a bug
```

**`oc login` succeeds but every command fails with permission errors**
```bash
oc whoami
oc auth can-i create pods
# Confirm you're actually in the correct project/namespace scope —
# a common early mistake is assuming project-scoped RBAC works the
# same as cluster-admin access on a personal crc instance
```

**Route created but not reachable externally**
```bash
oc get route hello-openshift -o yaml
# Confirm the Route's host actually resolves in your environment —
# on crc specifically, this typically requires crc's own DNS/hosts
# configuration to be set up correctly, not just the Route object existing
```

**Developer Sandbox session expires**
The free Sandbox is genuinely time-limited and needs periodic renewal `(needs verification — recheck against current source for the current Sandbox duration/renewal policy)` — this is expected behavior, not an error.

## What's Installed

- **`oc` CLI** — the `kubectl` superset used for virtually all hands-on interaction in this guide
- **A working OpenShift environment** — either a free Sandbox namespace, a local `crc` single-node cluster, or (advanced) a full multi-node cluster via `openshift-install`
- Access to OCP-specific objects immediately available to practice with — Routes, Projects, and (with sufficient access) SCCs and Operators

## Next Steps

Go to the **Fundamentals** section to explore OCP's architecture and create your first Route.
