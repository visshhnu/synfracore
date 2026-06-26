# Jenkins Interview Q&A

*Istio**, Linkerd, Consul Connect | "I understand service mesh concepts from managing microservice platforms at HPE/Vodafone scale." |
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

kubectl get pods -n kube-system | 

**Q: Declarative vs Scripted Pipeline?**
Declarative: structured syntax with `pipeline` block, stage/steps/post. Easier to read, IDE support, limited flexibility. Scripted: Groovy script, maximum flexibility, harder to read. Declarative is recommended for most pipelines — use `script` block inside Declarative when you need Groovy logic.

**Q: How do you handle credentials in Jenkins?**
Jenkins Credentials Manager: store secrets as Username/Password, Secret text, SSH key, Certificate. Access in pipeline: `withCredentials([string(credentialsId: 'api-key', variable: 'API_KEY')]) { ... }`. For Azure: use Azure Credentials plugin. For Vault: use HashiCorp Vault plugin.

**Q: What is a Jenkins agent/slave?**
Jenkins master orchestrates builds; agents execute them. Master shouldn't run builds (security + resource). Configure: permanent agents (always connected) or cloud agents (spin up on demand — K8s plugin creates pods per build, scales to zero when idle).

**Q: How do you make a Jenkins pipeline idempotent?**
Each stage should be safe to run multiple times. Use `--force` in Helm, check if resource exists before creating, use Terraform (inherently idempotent). Avoid operations that fail if resource already exists.
