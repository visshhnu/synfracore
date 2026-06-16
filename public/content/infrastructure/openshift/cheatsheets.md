# OpenShift — Cheatsheet

## oc CLI Quick Reference

```bash
# ── AUTH ──────────────────────────────────────────────────
oc login https://api.<cluster>:6443 -u admin -p pass
oc login --token=<token> --server=https://api.<cluster>:6443
oc whoami                          # current user
oc whoami --show-token             # auth token
oc logout

# ── PROJECTS ──────────────────────────────────────────────
oc get projects
oc project <name>                  # switch project
oc new-project myapp --display-name='My App'
oc delete project myapp

# ── PODS ──────────────────────────────────────────────────
oc get pods -n <ns>
oc get pods -o wide -n <ns>        # with IP and node
oc get pods -A                     # all namespaces
oc get pods -w -n <ns>             # watch live
oc describe pod <pod> -n <ns>      # most useful troubleshooting
oc logs <pod> -n <ns>
oc logs <pod> -f -n <ns>           # follow
oc logs <pod> --previous -n <ns>   # from crashed container
oc logs <pod> -c <container>       # specific container
oc exec -it <pod> -n <ns> -- bash  # shell into pod
oc exec <pod> -- env               # list env vars
oc delete pod <pod> -n <ns>
oc delete pod <pod> --grace-period=0 --force  # force delete stuck pod
oc port-forward pod/<pod> 8080:8080 -n <ns>
oc rsync ./local/ <pod>:/remote -n <ns>

# ── DEPLOYMENTS ───────────────────────────────────────────
oc get deployments -n <ns>
oc scale deployment/<name> --replicas=3 -n <ns>
oc rollout status deployment/<name> -n <ns>
oc rollout history deployment/<name> -n <ns>
oc rollout undo deployment/<name> -n <ns>
oc rollout undo deployment/<name> --to-revision=2 -n <ns>
oc set image deployment/<name> <container>=<image>:<tag> -n <ns>
oc edit deployment/<name> -n <ns>

# ── APPLY / DELETE ────────────────────────────────────────
oc apply -f manifest.yaml
oc apply -f ./directory/
oc delete -f manifest.yaml
oc create -f manifest.yaml

# ── SERVICES AND ROUTES ───────────────────────────────────
oc get svc -n <ns>
oc get routes -n <ns>
oc expose svc/<name>               # create route from service
oc create route edge <name> --service=<svc> --hostname=myapp.example.com
oc create route passthrough <name> --service=<svc>
oc create route reencrypt <name> --service=<svc>
oc delete route <name> -n <ns>

# ── CONFIG AND SECRETS ────────────────────────────────────
oc get configmaps -n <ns>
oc get secrets -n <ns>
oc create configmap myconfig --from-literal=KEY=value
oc create secret generic mysecret --from-literal=password=pass
oc create secret tls mytls --cert=tls.crt --key=tls.key

# ── STORAGE ───────────────────────────────────────────────
oc get storageclass
oc get pv
oc get pvc -n <ns>
oc describe pvc <name> -n <ns>

# ── NODES ─────────────────────────────────────────────────
oc get nodes
oc describe node <node>
oc adm top nodes                   # CPU/memory usage
oc adm top pods -n <ns>
oc adm drain <node> --ignore-daemonsets --delete-emptydir-data
oc adm uncordon <node>
oc adm node-logs <node>

# ── CLUSTER HEALTH ────────────────────────────────────────
oc get co                          # cluster operators
oc get clusterversion              # OCP version + upgrade status
oc get mcp                         # machine config pools
oc get etcd -o yaml                # etcd status
oc adm must-gather                 # collect support bundle

# ── UPGRADES ──────────────────────────────────────────────
oc adm upgrade                     # check available updates
oc adm upgrade --to-latest=true    # apply latest
oc adm upgrade --to=4.14.15        # apply specific version

# ── RBAC ──────────────────────────────────────────────────
oc adm policy add-role-to-user edit <user> -n <project>
oc adm policy add-role-to-user view <user> -n <project>
oc adm policy add-cluster-role-to-user cluster-admin <user>
oc adm policy add-role-to-group edit <group> -n <project>
oc adm policy remove-role-from-user edit <user> -n <project>
oc get rolebindings -n <project>
oc adm policy who-can get pods -n <project>

# ── SCCS ──────────────────────────────────────────────────
oc get scc
oc describe scc anyuid
oc get pod <pod> -o yaml | grep scc
oc adm policy add-scc-to-user anyuid -z <serviceaccount> -n <ns>
oc adm policy add-scc-to-group anyuid system:serviceaccounts:<ns>
oc adm policy remove-scc-from-user anyuid -z <serviceaccount> -n <ns>

# ── OPERATORS ─────────────────────────────────────────────
oc get operators
oc get csv -n <ns>                 # ClusterServiceVersions
oc get subscriptions -n <ns>
oc get installplan -n <ns>
oc get catalogsource -n openshift-marketplace

# ── MACHINE CONFIG ────────────────────────────────────────
oc get mcp
oc get mc                          # machine configs
oc patch mcp worker --type merge --patch '{"spec":{"paused":true}}'
oc patch mcp worker --type merge --patch '{"spec":{"paused":false}}'

# ── EVENTS ────────────────────────────────────────────────
oc get events -n <ns> --sort-by='.lastTimestamp'

# ── MISC ──────────────────────────────────────────────────
oc api-resources | grep <keyword>
oc cluster-info
oc explain deployment.spec.template.spec.containers
```

## SCC Quick Reference

| SCC | Use Case | Can Run as Root |
|---|---|---|
| `restricted` | Default for all pods | ❌ |
| `nonroot` | Any non-root UID | ❌ |
| `anyuid` | Legacy apps needing root | ✅ |
| `privileged` | System-level workloads only | ✅ + host access |
| `hostnetwork` | Pods needing host network | ❌ |
| `hostpath` | Pods needing host filesystem | ❌ |

## Route TLS Types

| Type | TLS Terminates At | Traffic to Pod |
|---|---|---|
| `edge` | HAProxy Router | HTTP (unencrypted) |
| `passthrough` | Pod (end-to-end) | TLS (pod handles cert) |
| `reencrypt` | Router (then re-encrypted) | TLS (different cert) |

## Pod Failure States

| Status | Root Cause | Fix |
|---|---|---|
| `CrashLoopBackOff` | App crashes on start | `oc logs --previous`, check env vars, config |
| `OOMKilled` | Memory limit exceeded | Increase `resources.limits.memory` |
| `Pending` (no resources) | No node fits resource requests | `oc describe pod` → events, `oc adm top nodes` |
| `Pending` (PVC not bound) | No matching PV | Check StorageClass, PV availability |
| `ImagePullBackOff` | Can't pull image | Check image name, pull secret, registry |
| `Error` (SCC violation) | SCC blocks pod | `oc adm policy add-scc-to-user anyuid -z <sa>` |
| `Terminating` (stuck) | Force delete | `oc delete pod --grace-period=0 --force` |

## Key OCP Namespaces

```
openshift-apiserver      → API server pods
openshift-etcd           → etcd cluster
openshift-ingress        → HAProxy Router pods
openshift-image-registry → internal registry
openshift-monitoring     → Prometheus, Alertmanager, Thanos
openshift-logging        → Cluster Logging (Loki/EFK)
openshift-operators      → cluster-scoped operators
openshift-gitops         → ArgoCD
openshift-pipelines      → Tekton
openshift-cnv            → OpenShift Virtualization (KubeVirt)
openshift-storage        → OpenShift Data Foundation (ODF/Ceph)
```

## Key OCP API Resources

| Object | API Group |
|---|---|
| Project | project.openshift.io |
| Route | route.openshift.io |
| DeploymentConfig | apps.openshift.io |
| BuildConfig | build.openshift.io |
| ImageStream | image.openshift.io |
| ClusterVersion | config.openshift.io |
| ClusterOperator | config.openshift.io |
| MachineConfigPool | machineconfiguration.openshift.io |
| Subscription | operators.coreos.com |
| ClusterServiceVersion | operators.coreos.com |
| VirtualMachine | kubevirt.io |
| NetworkAttachmentDefinition | k8s.cni.cncf.io |

## Upgrade Channel Guide

```
stable-4.x    → Production. Most tested. Recommended.
fast-4.x      → Early fixes. Slightly ahead of stable.
candidate-4.x → Pre-release. Testing only. Never production.
eus-4.x       → Even versions only (4.12, 4.14, 4.16).
               → Allows 4.12 → 4.14 directly (within EUS).
               → Best for orgs needing slower upgrade cadence.

Upgrade path rules:
4.12 → 4.13 → 4.14  ✅ sequential minor versions
4.12 → 4.14          ❌ skipping minor (unless both EUS)
4.14.5 → 4.14.15     ✅ patch versions can skip
```
