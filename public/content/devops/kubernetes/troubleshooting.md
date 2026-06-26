# Kubernetes Troubleshooting Guide

## CrashLoopBackOff — Complete Debugging Workflow

[Pod is in CrashLoopBackOff content pending]

## Node NotReady

[Node is NotReady content pending]

## Deployment Stuck

Deployment is stuck — pods not rolling out. How do you debug?**

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

"Terraform state is the source of truth mapping your config to real infrastructure. It tracks resource IDs, metadata, and dependencies. Without state, Terraform can't know what already exists.

Key state operations I use in production:

# List resources in state

terraform state list

# Show specific resource

terraform state show aws_instance.web

# Move resource (rename without destroy)

terraform state mv aws_instance.old aws_instance.new

# Remove resource from state without destroying it

terraform state rm aws_instance.web

# Import existing resource into state

terraform import aws_instance.web i-1234567890abcdef0

# Refresh state to match real infrastructure

terraform refresh

In our HPE environment I used remote state in Azure Blob Storage with state locking via Azure Table Storage to prevent concurrent runs."

**Q: What is a Terraform module and how do you structure them?**

"A module is a reusable, parameterised infrastructure component. Structure I use:

modules/

  azure-aks/

    main.tf       # Resources

    variables.tf  # Input variables

    outputs.tf    # Output values

    versions.tf   # Provider version constraints

environments/

  dev/

    main.tf       # Calls modules

    terraform.tfvars

  prod/

    main.tf

    terraform.tfvars

Example module call:

module "aks_cluster" {

  source              = "../../modules/azure-aks"

  cluster_name        = 

## Service Not Accessible

[Service not accessible content pending]

## PVC Issues

[PVC stuck content pending]
