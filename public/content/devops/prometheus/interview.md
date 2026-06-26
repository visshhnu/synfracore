# Prometheus & Monitoring Interview Q&A

Prometheus + Grafana | **Datadog**, **New Relic**, AppDynamics, Dynatrace | "I run Prometheus/Grafana at scale. Datadog is essentially managed Prometheus with better UI — I can onboard quickly." |
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

kubectl ge

Datadog | Splunk)

## 1. Your Interview Strategy

### Your Strength Areas

Based on your current experience and the JD, your strongest areas are:

- Kubernetes / OCP operations

- Monitoring using Grafana

- Incident handling

- Held order troubleshooting

- Health checks and operational monitoring

- CI/CD exposure

- Azure + AKS basics

- Terraform fundamentals

- Production support mindset

### Main Gap Areas to Focus Tonight

You should focus heavily on: 1. Ansible troubleshooting 2. Datadog concepts 3. Splunk basics 4. CI/CD architecture discussion 5. Troubleshooting scenarios 6. Azure architecture understanding 7. End-to-end production incident flow

# 2. How to Position Yourself in the Interview

You should present yourself as:

“A DevOps Engineer with strong production operations and Kubernetes support experience, actively involved in monitoring, troubleshooting, deployments, health checks, incident management, CI/CD support, and infrastructure automation.”

DO NOT say:

- “I only know Grafana.”

- “I don’t know Datadog.”

- “I didn’t work on Ansible.”

Instead say:

“Currently we use Grafana extensively for monitoring and alert visualization, but I understand Datadog concepts because the monitoring principles are similar — metrics collection, dashboards, alerting, logs, traces, and incident correlation.”

That answer is strong and professional.

# 3. Grafana vs Datadog (MOST IMPORTANT FOR YOU)

This question is VERY likely.

## How to Answer

### Best Answer

“Currently in my project we mainly use Grafana for dashboard visualization and operational monitoring. We monitor application health, resource utilization, pod metrics, order flow, and infrastructure metrics.

Datadog provides similar capabilities but with a more integrated SaaS observability approach. Apart from dashboards and metrics, Datadog also provides APM, distributed tracing, log management, anomaly detection, synthetic monitoring, and infrastructure correlation in a single platform.

Conceptually both tools focus on observability and proactive monitoring. Since I already work extensively with Grafana dashboards, alerts, troubleshooting, and production monitoring, adapting to Datadog is straightforward.”

## Technical Difference Table

| Feature | Grafana | Datadog |
| --- | --- | --- |
| Dashboarding | Strong | Strong |
| SaaS Monitoring | Limited | Excellent |
| APM | External integrations | Native |
| Log Management | Loki/Elastic | Native |
| Tracing | Tempo/Jaeger | Native |
| Infrastructure Monitoring | Good | Excellent |
| Cost | Open-source friendly | Expensive |
| Ease of Setup | More manual | Easier |
| Alert Correlation | Moderate | Strong |
| Cloud-native Integration | Good | Excellent |

# 4. Datadog Deep Understanding

## What is Datadog?

Datadog is a cloud-based observability and monitoring platform used for:

- Infrastructure monitoring

- Application monitoring

- Log management

- Distributed tracing

- Alerting

- Security monitoring

- Incident managemen

**Q: PromQL — key functions?**
- `rate()`: per-second rate of increase (for counters, over time range)
- `irate()`: instantaneous rate (last 2 data points — more responsive)
- `increase()`: total increase over time range
- `avg_over_time()`: average of a gauge over time
- `histogram_quantile(0.99, rate(http_duration_seconds_bucket[5m]))` — P99 latency

**Q: What is the difference between Counter, Gauge, Histogram, Summary?**
- Counter: monotonically increasing (requests, errors) — use rate()
- Gauge: can go up/down (current memory, CPU) — use directly
- Histogram: samples + buckets (latency distribution) — use histogram_quantile()
- Summary: pre-calculated quantiles (less flexible than histogram)
