# Azure AKS — Cheatsheet

```bash
# ── CLUSTER ───────────────────────────────────────────────
az aks create --resource-group rg --name prod-aks \
  --node-count 3 --node-vm-size Standard_D4s_v5 \
  --enable-oidc-issuer --enable-workload-identity \
  --enable-cluster-autoscaler --min-count 1 --max-count 10

az aks get-credentials --resource-group rg --name prod-aks
az aks list --output table
az aks show --resource-group rg --name prod-aks --query '{version:kubernetesVersion,state:powerState}'
az aks upgrade --resource-group rg --name prod-aks --kubernetes-version 1.31

# ── NODE POOLS ────────────────────────────────────────────
az aks nodepool list --resource-group rg --cluster-name prod-aks --output table
az aks nodepool add --resource-group rg --cluster-name prod-aks \
  --name spot --priority Spot --node-count 0 \
  --enable-cluster-autoscaler --min-count 0 --max-count 20
az aks nodepool scale --resource-group rg --cluster-name prod-aks --name workers --node-count 5
az aks nodepool delete --resource-group rg --cluster-name prod-aks --name oldpool

# ── CREDENTIALS & ACCESS ──────────────────────────────────
az aks get-credentials --resource-group rg --name prod-aks --admin  # Admin kubeconfig
az aks get-credentials --resource-group rg --name prod-aks          # User kubeconfig

# ── ADDONS ────────────────────────────────────────────────
az aks enable-addons --addons monitoring --resource-group rg --name prod-aks \
  --workspace-resource-id $LOG_ANALYTICS_WS
az aks enable-addons --addons azure-policy --resource-group rg --name prod-aks
az aks enable-addons --addons ingress-appgw --resource-group rg --name prod-aks \
  --appgw-name prod-appgw --appgw-subnet-cidr 10.2.0.0/16

# ── WORKLOAD IDENTITY ─────────────────────────────────────
OIDC_ISSUER=$(az aks show -g rg -n prod-aks --query oidcIssuerProfile.issuerUrl -o tsv)
az identity create --name workload-identity --resource-group rg
az identity federated-credential create --name k8s-binding \
  --identity-name workload-identity --resource-group rg \
  --issuer $OIDC_ISSUER \
  --subject "system:serviceaccount:default:my-service-account" \
  --audiences "api://AzureADTokenExchange"

# ── MONITORING ────────────────────────────────────────────
az aks show --resource-group rg --name prod-aks --query addonProfiles.omsagent
kubectl top nodes
kubectl top pods --all-namespaces --sort-by=memory
az monitor log-analytics query --workspace $WS_ID \
  --analytics-query "KubePodInventory | where PodStatus == 'Failed' | take 10"
```
