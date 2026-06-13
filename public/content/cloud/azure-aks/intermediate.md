# Azure AKS — Intermediate

## KEDA (Kubernetes Event-Driven Autoscaling)

```bash
# KEDA scales pods based on any event source (queue length, HTTP requests, metrics)
# Much more powerful than HPA which only uses CPU/memory

helm repo add kedacore https://kedacore.github.io/charts
helm install keda kedacore/keda --namespace keda --create-namespace

# Scale based on Azure Service Bus queue
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: order-processor
spec:
  scaleTargetRef:
    name: order-processor-deployment
  minReplicaCount: 0             # Scale to zero when idle!
  maxReplicaCount: 50
  triggers:
  - type: azure-servicebus
    metadata:
      queueName: orders
      namespace: prod-servicebus
      messageCount: "5"           # 1 replica per 5 messages
    authenticationRef:
      name: servicebus-trigger-auth
```

## Azure Monitor + Container Insights

```bash
# Enable Container Insights
az aks enable-addons \
    --addons monitoring \
    --name prod-aks \
    --resource-group prod-rg \
    --workspace-resource-id /subscriptions/.../workspaces/prod-logs

# Kusto (KQL) queries for AKS monitoring
# In Log Analytics workspace:

// CPU usage by node
Perf
| where ObjectName == "K8SNode" and CounterName == "cpuUsageNanoCores"
| summarize avg(CounterValue) by Computer, bin(TimeGenerated, 5m)
| render timechart

// Failed pods
KubePodInventory
| where PodStatus == "Failed"
| project TimeGenerated, Namespace, Name, PodStatus, ContainerLastStatus
| order by TimeGenerated desc
```
