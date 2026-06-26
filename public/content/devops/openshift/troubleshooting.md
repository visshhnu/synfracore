# OpenShift — Troubleshooting Guide

## Production Troubleshooting Patterns

**DevOps — 30**

**Timeline: 30 days aggressive, 60 days max** **Profile: 11 years | Kubernetes/OpenShift | Terraform | ****ArgoCD**** | Jenkins | Azure/AWS**

**SECTION 1 — TOOL COMPARISON **

This is critical. You need to know both your current tool AND the market equivalent so you can speak to in interviews.

| **Category** | **Your Current Tool** | **Market Standard Alternatives** | **What to Say in Interviews** |
| --- | --- | --- | --- |
| Log Monitoring | ELK (Elasticsearch, Logstash, Kibana) + Graylog | **Splunk**, **Datadog Logs**, Loki+Grafana, New Relic | "I use ELK/Graylog in production. I understand Splunk's SPL query model and Datadog's log pipelines — same principles, different syntax." |
| Metrics/Monitoring | Prometheus + Grafana | **Datadog**, **New Relic**, AppDynamics, Dynatrace | "I run Prometheus/Grafana at scale. Datadog is essentially managed Prometheus with better UI — I can onboard quickly." |
| CI/CD | Jenkins + Azure DevOps | **GitHub Actions**, **GitLab CI**, CircleCI, TeamCity | "I've built Jenkins pipelines as code and Azure DevOps. GitHub Actions uses same YAML-based pipeline concepts." |
| GitOps | ArgoCD | **FluxCD**, Spinnaker | "ArgoCD and FluxCD are both CNCF GitOps tools. ArgoCD gives better UI visibility; FluxCD is more Kubernetes-native." |
| IaC | Terraform | **OpenTofu** (Terraform fork), Pulumi, AWS CDK, ARM | "I use Terraform. OpenTofu is the open-source fork — same HCL syntax, drop-in replacement." |
| Container Platform | Kubernetes + OpenShift OCP 4.16 | **EKS**, **AKS**, GKE, Rancher | "OpenShift is enterprise Kubernetes with RBAC, SCC, and Operator Framework on top. EKS/AKS are simpler — easier, not harder." |
| Config Management | Ansible | **Chef**, **Puppet**, SaltStack | "Ansible is agentless, YAML-based. Chef/Puppet are more complex — Ansible is actually the industry default now." |
| Secret Management | (not on resume — ADD THIS) | **HashiCorp**** Vault**, AWS Secrets Manager, Azure Key Vault | "I work with Azure Key Vault in production. HashiCorp Vault is the open-source standard — same concept." |
| Service Mesh | (not on resume — ADD THIS) | **Istio**, Linkerd, Consul Connect | "I understand service mesh concepts from managing microservice platforms at HPE/Vodafone scale." |
| Container Registry | (add to resume) | ECR, ACR, Harbor, JFrog Artifactory | "I use ACR (Azure Container Registry) for image management in our Azure pipelines." |

**SECTION 2 — DEEP DIVE: TOOL-BY-TOOL INTERVIEW Q****&****A**

**2.1 KUBERNETES — Deep Troubleshooting**

**Q: Pod is in ****CrashLoopBackOff****. How do you troubleshoot?**

# Step 1: Check pod status and events

kubectl get pod <pod-name> -n <namespace>

kubectl describe pod <pod-name> -n <namespace>

# Step 2: Check logs — current and previous crash

kubectl logs <pod-name> -n <namespace>

kubectl logs <pod-name> -n <namespace> --previous

# Step 3: Check resource limits (OOMKilled is common cause)

kubectl get pod <pod-name> -o jsonpath='{.spec.containers[*].resources}'

# Step 4: Exec into pod if it starts briefly

kubectl exec -it <pod-name> -- /bin/sh

# Step 5: Check ConfigMaps/Secrets mounted correctly

kubectl get configmap <name> -o yaml

kubectl get secret <name> -o yaml | base64 --decode

**Your answer:** "In our HPE/Vodafone environment running 50+ pods, I dealt with this regularly. Most common causes were OOMKilled (fix: adjust memory limits), missing environment variables from misconfigured secrets, or application startup failures. I always check --previous logs first as the current logs may be empty after restart."

**Q: Node is ****NotReady****. What do you do?**

# Step 1: Check node status

kubectl get nodes

kubectl describe node <node-name>

# Step 2: Check node conditions

kubectl get node <node-name> -o jsonpath='{.status.conditions}'

# Step 3: SSH to node and check kubelet

systemctl status kubelet

journalctl -u kubelet -n 100

# Step 4: Check disk/memory pressure

df -h

free -m

top

# Step 5: Check container runtime

systemctl status containerd   # or docker

crictl ps

# Step 6: Check network plugin (CNI)

kubectl get pods -n kube-system | grep -i cni

**Your answer:** "Common causes are kubelet crash, disk pressure, memory pressure, or CNI plugin failure. I check kubelet logs first — in our production environment this was usually disk pressure on /var/lib/docker or a network plugin issue."

**Q: Deployment is stuck — pods not rolling out. How do you debug?**

# Check rollout status

kubectl rollout status deployment/<name> -n <namespace>

# Check deployment events

kubectl describe deployment <name> -n <namespace>

# Check if new ReplicaSet is created

kubectl get rs -n <namespace>

# Check if image pull is failing

kubectl get events -n <namespace> --sort-by='.lastTimestamp'

# Rollback if needed

kubectl rollout undo deployment/<name> -n <namespace>

# Check rollout history

kubectl rollout history deployment/<name> -n <namespace>

**Q: How do you debug a service that is not reachable inside the cluster?**

# Step 1: Check service exists and has endpoints

kubectl get svc <service-name> -n <namespace>

kubectl get endpoints <service-name> -n <namespace>

# Step 2: Check pod labels match service selector

kubectl get pods --show-labels -n <namespace>

kubectl describe svc <service-name> -n <namespace>

# Step 3: Test connectivity from another pod

kubectl run test-pod --image=busybox --rm -it -- wget -qO- http://<service-name>:<port>

# Step 4: Check NetworkPolicy blocking traffic

kubectl get networkpolicy -n <namespace>

# Step 5: Check kube-proxy

kubectl get pods -n kube-system | grep kube-proxy

kubectl logs -n kube-system <kube-proxy-pod>

**Q: How do you handle ****PersistentVolume**** issues — pod stuck in Pending?**

# Check PVC status

kubectl get pvc -n <namespace>

kubectl describe pvc <pvc-name> -n <namespace>

# Check StorageClass

kubectl get storageclass

kubectl describe storageclass <name>

# Check PV availability

kubectl get pv

# Common issues:

# 1. StorageClass not found → check spelling in PVC spec

# 2. No available PV matching request → check capacity/access mode

# 3. PV in Released state → manually delete and recreate

**2.2 OPENSHIFT — Corporate Interview Q****&****A**

**Q: How is OpenShift different from vanilla Kubernetes?**

"OpenShift adds enterprise security, developer workflow, and operational tooling on top of Kubernetes:

- **Security Context Constraints (SCC)**: OpenShift's RBAC extension. Pods cannot run as root by default — stricter than vanilla K8s PodSecurityPolicy.

- **Routes vs Ingress**: OpenShift uses Routes natively (HAProxy-based). Ingress works too but Routes are idiomatic OCP.

- **Operators**: Red Hat Operator Framework is built-in. Lifecycle management of complex apps via CRDs.

- **Built-in Registry**: OpenShift has an internal container registry out of the box.

- **oc**** CLI**: Extended kubectl with OCP-specific commands.

- **Image Streams**: OCP-native image versioning that auto-triggers deployments on image updates."

**Q: How do you create a project and deploy an app in OpenShift?**

# Create new project (namespace in OCP)

oc new-project my-project

# Deploy from image

oc new-app --image=nginx:latest --name=my-app

# Expose as route

oc expose svc/my-app

# Check route

oc get route

# Check deployment

oc get pods

oc logs -f <pod-name>

# Scale

oc scale deployment/my-app --replicas=3

**Q: SCC — a pod fails with "unable to validate against any security context constraint". How do you fix?**

# Check what SCCs are available

oc get scc

# Check what SCC a pod needs

oc adm policy who-can use scc anyuid

# Add SCC to service account (example: allow anyuid for legacy app)

oc adm policy add-scc-to-user anyuid -z <service-account-name> -n <namespace>

# Check which SCC a running pod is using

oc get pod <pod-name> -o jsonpath='{.metadata.annotations.openshift\.io/scc}'

**2.3 TERRAFORM — Deep Q****&****A**

**Q: Explain Terraform state and why it matters.**

"Ter

---

## OCP-Specific Troubleshooting

```bash
# Cluster health
oc get clusteroperators
oc get clusterversion
oc describe clusterversion version

# Node issues
oc debug node/<node-name>
oc adm node-logs <node-name> -u kubelet

# etcd health
oc rsh -n openshift-etcd etcd-<master-node>
etcdctl endpoint health --cluster

# Operator issues
oc get co   # clusteroperators — check DEGRADED column
oc describe co <operator-name>

# Registry issues
oc get pods -n openshift-image-registry
oc logs -n openshift-image-registry deployment/image-registry

# Ingress/Router
oc get pods -n openshift-ingress
oc logs -n openshift-ingress <router-pod>
```

## Common Error Patterns

| Error | Likely Cause | Fix |
|-------|-------------|-----|
| CrashLoopBackOff | App crash, OOMKilled, bad config | Check --previous logs, resource limits |
| ImagePullBackOff | Wrong image name, registry auth | Check imagePullSecret, image tag |
| Pending pod | Resource shortage, node selector mismatch | Check node resources, affinity rules |
| SCC violation | Pod needs higher privilege | Add appropriate SCC to ServiceAccount |
| Route not working | Router not running, service mismatch | Check router pods, service selectors |
| Upgrade stuck | Cluster operator degraded | Check co status, resolve degraded operators |
