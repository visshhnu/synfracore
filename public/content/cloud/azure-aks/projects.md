# Azure AKS -- Portfolio Projects

---

## Project 1: Production AKS with Workload Identity

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `aks-production`

Production AKS cluster with Workload Identity, KEDA autoscaling, and Azure Monitor.

```bash
# Create cluster with all modern features
az aks create \
  --resource-group prod-rg --name prod-aks \
  --node-count 3 --node-vm-size Standard_D4s_v5 \
  --enable-oidc-issuer \
  --enable-workload-identity \
  --enable-cluster-autoscaler --min-count 1 --max-count 10 \
  --enable-addons monitoring \
  --auto-upgrade-channel rapid

# Set up Workload Identity for a pod to access Azure Key Vault
OIDC=$(az aks show -g prod-rg -n prod-aks --query oidcIssuerProfile.issuerUrl -o tsv)
az identity create --name app-identity --resource-group prod-rg
az identity federated-credential create --name k8s-binding \
  --identity-name app-identity --resource-group prod-rg \
  --issuer $OIDC \
  --subject "system:serviceaccount:default:app-sa"

# Grant Key Vault access
az keyvault set-policy --name prod-vault \
  --object-id $(az identity show --name app-identity -g prod-rg --query principalId -o tsv) \
  --secret-permissions get list
```

**Steps:** Terraform for cluster, Workload Identity setup, KEDA for queue-based scaling, cost monitoring

---

## Project 2: Blue-Green Deployment on AKS

**Level:** Advanced | **Time:** 3 days | **GitHub:** `aks-blue-green`

Zero-downtime blue-green deployments with automatic health validation and instant rollback.

```yaml
# Traffic split: 90% blue, 10% green (canary phase)
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/canary: "true"
    nginx.ingress.kubernetes.io/canary-weight: "10"
spec:
  rules:
  - host: api.example.com
    http:
      paths:
      - path: /
        backend:
          service: {name: green-service, port: {number: 80}}
```

**Steps:** Deploy blue, deploy green (no traffic), canary 10%, validate metrics, full cutover or rollback

---

## Portfolio Checklist
- [ ] Workload Identity (no service account key files)
- [ ] Cluster Autoscaler tested with load
- [ ] Azure Monitor integrated
- [ ] Blue-green switch demonstrably zero-downtime
