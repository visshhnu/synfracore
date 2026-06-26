# OpenShift Quick Reference Cheatsheet

## Section 9: OCP Command Reference

**9.1  Essential oc CLI Commands**

| **Task** | **Command** |
| --- | --- |
| Login | oc login https://api.<cluster>:6443 -u <user> -p <pass> |
| List projects | oc get projects  │  oc projects |
| Switch project | oc project <name> |
| Get all resources | oc get all -n <ns> |
| Get pods + node | oc get pods -o wide -n <ns> |
| Scale deployment | oc scale deployment/<name> --replicas=3 -n <ns> |
| Rollout status | oc rollout status deployment/<name> -n <ns> |
| Rollout history | oc rollout history deployment/<name> -n <ns> |
| Rollback | oc rollout undo deployment/<name> -n <ns> |
| Edit live resource | oc edit deployment/<name> -n <ns> |
| Apply manifests | oc apply -f <file.yaml>  │  oc apply -f <directory>/ |
| Delete resource | oc delete pod <pod> -n <ns>  │  oc delete -f <file.yaml> |
| Port forward | oc port-forward pod/<pod> 8080:8080 -n <ns> |
| Copy files | oc rsync <local>/ <pod>:/remote -n <ns> |
| Who am I | oc whoami  │  oc whoami --show-token |
| Cluster info | oc cluster-info |
| API resources | oc api-resources │ grep <keyword> |

**9.2  Key OCP Objects Reference**

| **Object** | **API Group / Kind** |
| --- | --- |
| Project | project.openshift.io/Project |
| Route | route.openshift.io/Route |
| DeploymentConfig | apps.openshift.io/DeploymentConfig |
| BuildConfig | build.openshift.io/BuildConfig |
| ImageStream | image.openshift.io/ImageStream |
| ClusterVersion | config.openshift.io/ClusterVersion |
| ClusterOperator | config.openshift.io/ClusterOperator |
| MachineConfigPool | machineconfiguration.openshift.io/MachineConfigPool |
| Subscription (OLM) | operators.coreos.com/Subscription |
| ClusterServiceVersion | operators.coreos.com/ClusterServiceVersion |

**9.3  Key Namespaces to Know**

- openshift-apiserver — API server components

- openshift-etcd — etcd cluster

- openshift-ingress — Router / HAProxy pods

- openshift-image-registry — internal image registry

- openshift-monitoring — Prometheus, Alertmanager, Grafana

- openshift-logging — EFK/Loki logging stack (if installed)

- openshift-operators — cluster-scoped operators

- openshift-gitops — ArgoCD (if installed via OpenShift GitOps operator)

- openshift-pipelines — Tekton pipelines (if installed)

---

## Additional oc Commands

```bash
# Project management
oc new-project <name>
oc project <name>
oc get projects

# Pod operations
oc get pods -n <namespace>
oc describe pod <name>
oc logs <pod> --previous
oc exec -it <pod> -- /bin/bash

# Deployment
oc get deployments
oc rollout status deployment/<name>
oc rollout history deployment/<name>
oc rollout undo deployment/<name>

# Routes
oc get routes
oc create route edge --service=<svc> --hostname=<host>

# Operators
oc get operators
oc get csv -n <namespace>

# Machine Config
oc get mcp
oc get mc

# Cluster info
oc get clusterversion
oc get nodes -o wide
oc adm top nodes
oc adm top pods -n <namespace>

# SCCs
oc get scc
oc adm policy who-can use scc anyuid
oc adm policy add-scc-to-user anyuid -z <serviceaccount> -n <namespace>
```
