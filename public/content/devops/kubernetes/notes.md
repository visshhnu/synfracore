# Kubernetes — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concepts

```
Pod — smallest schedulable unit. One or more containers ALWAYS
  running together on the SAME machine, sharing network address.
  Most Pods = exactly ONE container.
Node — a machine (physical or VM) running Kubernetes, hosting Pods
Cluster — a group of Nodes running Kubernetes together

Control Plane ("the brain") — NEVER runs application containers:
  API Server    — single front door, every request goes through it
  etcd           — distributed key-value store, holds ENTIRE cluster state
  Scheduler       — decides which Node a new Pod runs on
  Controller Manager — continuously reconciles real state vs desired state
Worker Nodes ("the workhorses") — actually run Pods
```

## What Kubernetes vs. Docker Compose Actually Adds

```
Docker Compose — multi-container coordination, ONE machine, NO
  automatic recovery if that machine dies
Kubernetes — SAME multi-container coordination, MANY machines, WITH
  automatic recovery — "a node just died" becomes a non-event, not
  a 3am incident. This is the entire reason it exists.
```

## Reconciliation Loop (the core mental model)

```
You declare DESIRED STATE ("always keep 3 copies running")
Kubernetes continuously checks REAL state vs DESIRED state
Any difference -> Kubernetes fixes it automatically (restart crashed
  container, reschedule Pods from a dead Node elsewhere)
```

## Troubleshooting Quick Reference

```
CrashLoopBackOff        -> check the container's actual exit reason
  first (kubectl logs --previous), not just that it's restarting
Pod stuck Pending         -> insufficient resources OR unsatisfied
  scheduling constraints (node selector, affinity, taints/tolerations)
Service not routing         -> check Service selector labels ACTUALLY
  match Pod labels — a common, easy-to-miss mismatch
RBAC Forbidden errors         -> service account lacks the specific
  Role/ClusterRole binding for the exact verb/resource being requested
kubectl slow / API timeout      -> often etcd or API server resource
  pressure, not a kubectl client-side issue
```

## Terminology Cross-Reference

```
Kubernetes term    | Docker Compose equivalent
----------------------|--------------------------------
Pod                     | A service in docker-compose.yml (roughly)
Deployment               | (no direct equivalent — adds rollout/scaling)
Service                    | (no direct equivalent — stable network identity)
ConfigMap/Secret            | environment / .env file
Node                          | The single host machine Compose runs on
```
