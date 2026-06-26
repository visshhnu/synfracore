# Helm Complete Guide

DevOps › Helm
⛵**Helm**
BeginnerEngineerProductionArchitectKubernetes package manager — charts, values, templates, multi-env
[What is Helm](#sec-what)[Commands](#sec-commands)[Chart Structure](#sec-chart)[Templates](#sec-templates)[Multi-Env](#sec-environments)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## ⛵ What is Helm?›


#### Kubernetes Package Manager

Without Helm, deploying to 3 environments means manually editing 5 YAML files, 3 times. With Helm, one chart deploys everywhere with different values. One command to upgrade. One command to rollback.


| Concept | What it is | Analogy |
|---|---|---|
| Chart | Package containing K8s templates + default values | npm package / apt package |
| Release | Installed instance of a chart with a name | Installed application |
| Repository | Collection of charts (hosted URL) | npm registry / apt repository |
| Values | Configuration that customises a chart | Config file |
| Revision | Numbered history of every upgrade/rollback | Git commit history |


Install Helm + add reposCopy

```

```


## 🖥️ Essential Commands›


All Helm commands — install, upgrade, rollback, debugCopy

```

```


## 📦 Chart Structure›


#### Anatomy of a Helm chart

Charts follow a standard directory layout. Templates use Go template syntax with `{ "{" } .Values.key { "}" }` for value substitution.


Chart.yaml + values.yaml structureCopy

```

```


## 🔧 Writing Templates›


#### Go template syntax

Helm templates use Go's text/template engine. Key constructs: `{ "{" } .Values.x { "}" }` inserts value, `{ "{" }- if .Values.enabled { "}" }` conditional, `{ "{" }- range .Values.list { "}" }` loop, `{ "{" } include "helper" . { "}" }` calls a named template.


Deployment template + helpers + conditionalsCopy

```

```


## 🌍 Multi-Environment Deployment›


Values files per environment — dev vs prodCopy

```

```


## 🔍 Troubleshooting›


Upgrade failed, debug templates, secrets, dependenciesCopy

```

```


## 🔧 Named Templates and _helpers.tpl›


#### Reusable template snippets across your chart

The `_helpers.tpl` file (note the underscore — it is not rendered as a manifest) defines named templates that can be reused across all your chart templates. This avoids repeating the same label structure, name construction, or selector logic in every template file.


```
# templates/_helpers.tpl
{{- define "myapp.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "myapp.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "myapp.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "myapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
```


#### Using named templates in manifests

```
apiVersion: apps/v1
kind: Deployment
metadata:
name: {{ include "myapp.fullname" . }}
labels:
{{- include "myapp.labels" . | nindent 4 }}
spec:
selector:
matchLabels:
{{- include "myapp.selectorLabels" . | nindent 6 }}
template:
metadata:
labels:
{{- include "myapp.selectorLabels" . | nindent 8 }}
```


#### Why this matters

Define labels once in _helpers.tpl → all your Deployment, Service, Ingress templates use the same labels via `include`. When you need to change a label, change it in one place. The `| nindent N` pipe indents the included block to match the YAML level.


## 📦 OCI Registries and Helm Chart Distribution›


#### Helm 3.8+ — Store charts in OCI registries (ACR, ECR, Docker Hub)

OCI (Open Container Initiative) support means you can push Helm charts to the same registries as Docker images. No need for a separate ChartMuseum or Helm HTTP repository.


```
# Push chart to Azure Container Registry (OCI)
helm registry login myacr.azurecr.io --username admin --password $(az acr credential show --name myacr --query passwords[0].value -o tsv)
helm push mychart-1.0.0.tgz oci://myacr.azurecr.io/helm/charts

# Pull and install from OCI registry
helm install myapp oci://myacr.azurecr.io/helm/charts/mychart --version 1.0.0

# Push to AWS ECR
aws ecr get-login-password | helm registry login --username AWS --password-stdin 123456789.dkr.ecr.us-east-1.amazonaws.com
helm push mychart-1.0.0.tgz oci://123456789.dkr.ecr.us-east-1.amazonaws.com/helm-charts
```


#### Traditional HTTP repository (Helm 2 style — still common)

```
# Add and use a Helm repo
helm repo add stable https://charts.helm.sh/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update   # Always update before installing

# Search repo
helm search repo bitnami/postgresql

# Show chart values before installing
helm show values bitnami/postgresql > postgres-values.yaml
# Edit postgres-values.yaml to customise
helm install my-postgres bitnami/postgresql -f postgres-values.yaml
```


## 🧪 Helm Chart Testing and Linting›


#### Test before you deploy — catch errors early

```
# Lint — check for common chart errors
helm lint ./mychart
helm lint ./mychart -f values-production.yaml  # lint with specific values

# Template rendering — see what manifests will be generated WITHOUT deploying
helm template myrelease ./mychart -f values-prod.yaml
helm template myrelease ./mychart -f values-prod.yaml | kubectl diff -f -  # compare with live

# Dry run — simulate install against live cluster (validates against K8s API)
helm install myapp ./mychart --dry-run --debug -f values-prod.yaml

# Helm test — run test Pods after deployment
helm test myrelease   # runs pods in templates/tests/ directory
```


#### Test hook example

```
# templates/tests/test-connection.yaml
apiVersion: v1
kind: Pod
metadata:
name: "{{ include "myapp.fullname" . }}-test-connection"
annotations:
"helm.sh/hook": test           # runs on: helm test myrelease
"helm.sh/hook-delete-policy": hook-succeeded
spec:
restartPolicy: Never
containers:
- name: wget
image: busybox
command: ['wget']
args: ['{{ include "myapp.fullname" . }}:{{ .Values.service.port }}/health']
```


#### Chart versioning strategy

| Version field | What it means | When to increment |
|---|---|---|
| version in Chart.yaml | Chart version — packaging changes | Any change to templates, values structure, or chart logic |
| appVersion in Chart.yaml | Application version — the image tag | When the application code changes |


## 🎯 Interview Questions›


All
Architect
Engineer
Production


HELM · ENGINEER
What is Helm and what problem does it solve?
Helm is the package manager for Kubernetes. Without Helm: to deploy an application you have multiple YAML files (Deployment, Service, Ingress, ConfigMap, Secret) and you manually edit each file for different environments (change image tag, change replica count, change hostname). This is error-prone and hard to version. Helm solves this with charts: a chart packages all the YAML files as templates with variables. You provide values (replicaCount: 3, image.tag: v1.2.0) and Helm renders the final YAML. The same chart deploys to dev, staging, and prod with different values files. Upgrade is one command: helm upgrade --install. Rollback is one command: helm rollback. History is tracked: helm history shows every deployment. This is why Helm is the standard way to deploy applications on Kubernetes — every major tool (Prometheus, ArgoCD, nginx ingress, cert-manager) is distributed as a Helm chart.


HELM · ENGINEER
What is the difference between helm install and helm upgrade --install?
helm install fails if the release already exists (the name is taken). helm upgrade --install (also called atomic upsert) installs the release if it does not exist, upgrades it if it does. This makes it idempotent — safe to run multiple times, perfect for CI/CD pipelines where you don't know if this is first deployment or an upgrade. Use helm upgrade --install with --atomic flag in production: if the upgrade fails (pods don't become ready within timeout), Helm automatically rolls back to the previous revision. Without --atomic, a failed upgrade leaves the release in a FAILED state and you must manually rollback. Also use --wait with --timeout 5m so the command waits until all pods are running before returning success. This ensures your CI/CD pipeline knows if the deployment actually worked.


HELM · ARCHITECT
How do you manage Helm chart values across multiple environments?
Layered values files. Base values.yaml contains defaults that work for any environment (usually dev-sized). Environment-specific files override only what differs. helm upgrade --install myapp ./chart -f values.yaml -f values-production.yaml — later files override earlier ones. Production values-production.yaml only needs to specify what is different: larger resource limits, pinned image tag instead of latest, external database instead of local PostgreSQL, correct hostname, production-specific annotations. This keeps values-production.yaml small and focused. For image tags: never put the image tag in Git-committed values files for production. Pass it at deploy time: --set image.tag=$CI_COMMIT_SHA. This way Git does not have a rapidly-changing file, and every deploy has a unique traceable tag. Secret management: never put secrets in values files committed to Git. Use helm secrets plugin for encrypted values or pass secrets via --set from CI/CD secret variables.


HELM · PRODUCTION
Helm upgrade failed and the application is down. What do you do?
First: if you used --atomic, Helm already rolled back automatically. helm history shows: revision 5 failed, rolled back to revision 4 is active. Check what the failure was: helm status myapp shows the error. Check pod events: kubectl describe pod and kubectl logs for the failed pods. Second: if you did NOT use --atomic and the release is in FAILED state: helm rollback myapp 4 to roll back to last known good revision. This takes seconds. Third: investigate the failure. helm template myapp ./chart --values values.yaml > rendered.yaml and compare with working version. kubectl apply --dry-run=client -f rendered.yaml catches most issues. Common failure causes: image does not exist in registry (wrong tag, registry authentication), resource limits too low (pod OOMKilled), health check misconfigured (readiness probe fails, Helm times out waiting for ready). Prevention: always use --atomic --wait --timeout 10m. Add staging deployment before prod. Use helm diff (plugin) to preview changes before upgrading. Add smoke tests as a post-upgrade step in CI/CD.


HELM · ENGINEER
Walk through the complete Helm chart structure and what each file does.
A Helm chart is a directory with this structure: Chart.yaml — metadata: chart name, version, appVersion (the app image tag), description, dependencies list. values.yaml — default configuration values. Any value here can be overridden at install time. templates/ directory — Kubernetes YAML files with Go template syntax. _helpers.tpl — named template functions reused across manifests (define once, include everywhere). templates/deployment.yaml, service.yaml, ingress.yaml, configmap.yaml — standard K8s resources. templates/NOTES.txt — displayed to user after helm install, typically shows how to access the app. charts/ — sub-charts (dependencies). .helmignore — files to exclude from packaging (like .git, README). When you run helm install, Helm renders all templates/ files by combining the template syntax with values (from values.yaml overridden by your -f flags or --set), producing plain Kubernetes YAML, then applies it to the cluster. The key design principle: templates should be generic, values should be environment-specific. Your templates/deployment.yaml should work for dev, staging, and production — the differences come entirely from values files.


HELM · ENGINEER
How do you handle multiple environments with Helm? What is the values file strategy?
Environment-specific values override the defaults in values.yaml. Structure: values.yaml (base defaults — used in development), values-staging.yaml (staging overrides), values-production.yaml (production overrides). Install command: helm install myapp ./mychart -f values-production.yaml. The -f flag merges production values ON TOP of the base values.yaml. Only the keys present in values-production.yaml override the defaults. Using --set for single overrides: helm upgrade myapp ./mychart --set image.tag=v2.1.0. In CI/CD: helm upgrade --install myapp ./mychart -f values-${ENVIRONMENT}.yaml --set image.tag=${IMAGE_TAG} --atomic --wait. The --atomic flag: if the upgrade fails, automatically rolls back to the previous release. The --wait flag: waits for all pods to be Running and ready before returning success. Production best practice: never use helm install (fails if already exists) — always use helm upgrade --install (upgrades or installs). Never use --set for many values in CI/CD — use -f with a committed values file so changes are tracked in Git. ArgoCD with Helm: ArgoCD can manage Helm releases — you commit values file changes to Git, ArgoCD detects the change and runs helm upgrade automatically.


HELM · PRODUCTION
A Helm upgrade failed and left the release in a broken state. How do you recover?
First: understand the state. helm status myapp shows the release status: deployed, failed, pending-upgrade, or superseded. helm history myapp shows all revisions with their status. If upgrade failed: helm rollback myapp 5 (roll back to revision 5 — the last working one). Helm rollback re-applies the previous revision manifests. Check: kubectl get pods after rollback — are pods healthy? If rollback also fails (rare but happens with CRDs or irreversible changes): helm status shows you the release is stuck. To force it: helm upgrade myapp ./mychart --force --atomic reuses the chart but force-replaces pods. Nuclear option: helm uninstall myapp then helm install — but this causes downtime. Debugging failed upgrade: helm upgrade myapp ./mychart --debug 2>&1 | tee upgrade.log shows you exactly what Kubernetes returned. Look for: invalid YAML, missing required values, resource quota exceeded, PVC not found. Prevention: always use --atomic on upgrades in CI/CD. It automatically rolls back on failure, so a failed pipeline never leaves the cluster in a broken intermediate state. Also: run helm template . -f values-prod.yaml before the upgrade to catch template rendering errors before touching the cluster.


HELM · ARCHITECT
How do you manage Helm chart dependencies in a microservices architecture?
Helm dependencies (subcharts) allow one chart to include others. Defined in Chart.yaml under dependencies. Example: your application chart depends on PostgreSQL and Redis. Chart.yaml: dependencies: - name: postgresql, version: "12.x.x", repository: https://charts.bitnami.com/bitnami. - name: redis, version: "17.x.x", repository: https://charts.bitnami.com/bitnami. Run helm dependency update to download them into charts/ directory. Values for subcharts are namespaced: postgresql.auth.password: "mypassword" in your values.yaml configures the postgresql subchart. Two strategies for microservices: Strategy 1 (Umbrella chart): one parent chart with all microservices as subcharts. One helm upgrade deploys everything. Simple but: one bad subchart can block the whole deployment. Strategy 2 (Independent charts per service): each microservice has its own chart, deployed independently by ArgoCD. More resilient — payment service chart can deploy without touching order service. This is the preferred approach for large systems. At HPE: each microservice (TeMIP, UOC, UTM, UCA) had its own Helm chart managed as an independent ArgoCD Application. The charts were stored in a dedicated Helm charts Git repo, versioned separately from application code.


id="sec-roadmap">

## 🗺️ Roadmap›





Day 1
First Chart

Install community chart: helm install nginx bitnami/nginx
Understand chart values: helm show values bitnami/nginx
Upgrade and rollback



Week 1
Create Chart

helm create myapp (scaffold structure)
Write deployment + service templates
Multi-environment values files



Week 2
Production

Chart dependencies (postgresql, redis)
helm upgrade --install --atomic in CI/CD
Helm Secrets for encrypted values


Continue Learning
[🐙 ArgoCD](/cicd/argocd.html)[☸️ Kubernetes](/devops/kubernetes.html)[🔷 Terraform](/devops/terraform.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
