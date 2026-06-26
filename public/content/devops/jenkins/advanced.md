# Jenkins — Shared Libraries, Security & Enterprise Patterns

Jenkins | Azure/AWS**

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

kubectl get pods -n kube-system | 

## Jenkins Shared Library Structure

```groovy
// vars/deployToKubernetes.groovy
def call(String namespace, String image) {
    sh "helm upgrade --install myapp ./chart --set image.tag=${image} -n ${namespace}"
    sh "kubectl rollout status deployment/myapp -n ${namespace}"
}

// Jenkinsfile usage
@Library('my-shared-library') _
pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps { deployToKubernetes('production', env.IMAGE_TAG) }
        }
    }
}
```

## Multi-Branch Pipeline

```groovy
pipeline {
    agent { label 'docker' }
    environment {
        IMAGE = "registry.example.com/myapp"
        TAG = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
    }
    stages {
        stage('Build') {
            steps {
                sh "docker build -t ${IMAGE}:${TAG} ."
                sh "docker push ${IMAGE}:${TAG}"
            }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps {
                sh "helm upgrade --install myapp ./chart --set image.tag=${TAG}"
            }
        }
    }
    post {
        failure { slackSend channel: '#alerts', message: "Build FAILED: ${env.JOB_NAME}" }
        success { slackSend channel: '#deploys', message: "Deployed: ${TAG}" }
    }
}
```
