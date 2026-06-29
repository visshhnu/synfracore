# SRE Automation Overview

## What Does Automation Mean for SREs?

SRE automation means eliminating toil — repetitive, manual, automatable work that scales linearly with service growth. If toil exceeds 50% of your time, the team drowns.

## Types of SRE Automation

### 1. Runbook Automation
Convert incident runbooks into executable scripts that trigger automatically from alerts.

### 2. Auto-Remediation
```yaml
# Kubernetes restarts OOMKilled pods automatically
spec:
  containers:
  - name: myapp
    resources:
      limits:
        memory: "512Mi"
  restartPolicy: Always
```

### 3. Capacity Auto-Scaling
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 2
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
```

### 4. GitOps Deployment Automation
Developer pushes code → CI builds image → updates Helm values → ArgoCD detects and deploys. Zero manual kubectl apply in production.

### 5. Alert Correlation
Group 50 symptom alerts into 1 root-cause incident. Reduces alert fatigue and improves MTTR.

## Measuring Automation Success

| Metric | Target |
|--------|--------|
| Toil percentage | Less than 50% of working hours |
| MTTR (auto-remediated incidents) | Under 5 minutes |
| Runbook automation coverage | Over 80% of P2+ runbooks |
| Manual intervention rate | Decrease 20% per quarter |

## Tools

- **Ansible**: System configuration and deployment automation
- **Python + Kubernetes API**: Custom auto-remediation scripts
- **KEDA**: Event-driven autoscaling beyond CPU/memory
- **PagerDuty + Webhooks**: Trigger automation from alerts
- **AWS FIS / LitmusChaos**: Validate automation under failure conditions
