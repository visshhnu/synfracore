# KEDA — Installation Guide

## Install KEDA via Helm

The standard installation path, matching Overview's Module 01 example:

```bash
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

helm install keda kedacore/keda \
  --namespace keda \
  --create-namespace

# Verify both core components are running
kubectl get pods -n keda
# keda-operator-xxx        Running
# keda-metrics-apiserver   Running
```

## Install KEDA With High Availability (Production)

For a production-grade install with the leader-election-based HA pattern covered in Advanced:

```bash
helm install keda kedacore/keda \
  --namespace keda --create-namespace \
  --set operator.replicaCount=2
```

## Install the KEDA HTTP Add-on (Optional)

Needed only if scale-to-zero for synchronous HTTP services is required, per Intermediate's coverage:

```bash
helm install http-add-on kedacore/keda-add-ons-http \
  --namespace keda

kubectl get pods -n keda -l app=keda-add-ons-http-interceptor
```

## Verify Everything Works

```bash
# 1. Confirm both core KEDA components are healthy
kubectl get pods -n keda

# 2. Confirm the CRDs are registered
kubectl get crd | grep keda.sh
# Should show scaledobjects.keda.sh, scaledjobs.keda.sh,
# triggerauthentications.keda.sh

# 3. Create a minimal test ScaledObject and confirm it's recognized
cat <<EOF | kubectl apply -f -
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: test-scaler }
spec:
  scaleTargetRef: { name: test-deployment }
  minReplicaCount: 0
  maxReplicaCount: 5
  triggers:
    - type: cron
      metadata:
        timezone: UTC
        start: "0 8 * * *"
        end: "0 18 * * *"
        desiredReplicas: "1"
EOF

kubectl get scaledobject test-scaler
# STATUS should show "True" for Ready once KEDA has reconciled it
```

## Common Installation Issues

**`keda-operator` pod stuck in `CrashLoopBackOff`**
```bash
kubectl logs -n keda deploy/keda-operator
# Most common cause on a locked-down cluster: insufficient RBAC
# permissions for the operator's ServiceAccount
```

**`ScaledObject` created but HPA never appears**
```bash
kubectl get hpa
kubectl describe scaledobject <name>
# KEDA creates the underlying HPA automatically once a ScaledObject
# is valid — if no HPA appears, check the ScaledObject's own status
# conditions for a validation error first, before assuming KEDA itself
# is broken
```

**Metrics API server not responding for HPA queries**
```bash
kubectl get pods -n keda -l app=keda-metrics-apiserver
kubectl logs -n keda deploy/keda-operator-metrics-apiserver
# This is the component the standard HPA controller actually queries —
# if it's unhealthy, scaling silently stalls even though the
# ScaledObject itself looks fine
```

**Cron trigger scaling at the wrong time**
Confirm the `timezone` field in the cron trigger is set explicitly — a missing timezone defaults to UTC, which is a common source of "scaling happened at the wrong local time" confusion.

## What's Installed

After a successful installation:
- **keda-operator** — reconciles `ScaledObject`/`ScaledJob` CRDs and manages the HPA lifecycle on their behalf
- **keda-operator-metrics-apiserver** — registers as a Kubernetes External Metrics API provider, which the standard HPA controller queries
- The `ScaledObject`, `ScaledJob`, and `TriggerAuthentication` CRDs

## Next Steps

Go to the **Fundamentals** section to build your first event-driven `ScaledObject`.
