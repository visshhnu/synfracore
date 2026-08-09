# Platform Engineering vs SRE vs DevOps — Getting Your First Golden Path Running

There's no single "install Platform Engineering" step — this discipline doesn't have one binary or CRD to set up. What this section covers instead is standing up the two concrete tools this guide references throughout (Backstage as the IDP portal, Crossplane for self-service provisioning) far enough to experience a real golden-path interaction firsthand, rather than only reading about one.

## Bootstrap a Backstage Instance

This is Intermediate's own starting point for the developer-facing portal:

```bash
npx @backstage/create-app@latest

cd my-backstage-app
yarn install
yarn dev
# Backstage portal available at http://localhost:3000
```

## Register Your First Service in the Catalog

```yaml
# catalog-info.yaml — at the root of a repo you want cataloged
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: my-first-service
  description: "A test service registered in the platform catalog"
spec:
  type: service
  lifecycle: experimental
  owner: platform-team
```

```bash
# In the Backstage UI: Create > Register Existing Component,
# pointing at the catalog-info.yaml's raw URL
```

## Install Crossplane for Self-Service Infrastructure Provisioning

```bash
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system --create-namespace

kubectl get pods -n crossplane-system
```

## Define and Apply Your First Composition

Matching Intermediate's example — the platform-team-owned abstraction that hides real cloud complexity behind a simple developer-facing request:

```yaml
# The developer-facing request
apiVersion: platform.company.com/v1alpha1
kind: PostgresDatabase
metadata: { name: test-db }
spec: { size: small, environment: development }
```

```bash
kubectl apply -f postgres-database-request.yaml
kubectl get postgresdatabase test-db
# Confirms Crossplane picked up the request and is reconciling it
# against whatever Composition is defined for this resource type
```

## Verify Everything Works

```bash
# 1. Confirm Backstage is running and the test service appears in the catalog
# Open http://localhost:3000 and search for "my-first-service"

# 2. Confirm Crossplane is healthy
kubectl get pods -n crossplane-system

# 3. Confirm a self-service request actually provisions something
kubectl describe postgresdatabase test-db
# Should show a reconciliation status, not just "created" — this is
# the concrete proof that "developer fills a form, platform provisions
# everything" is a real mechanism, not just a diagram
```

## Common Setup Issues

**Backstage dev server starts but the catalog is empty**
Confirm at least one `catalog-info.yaml` has been registered — a fresh Backstage install has no services cataloged by default, this isn't a bug.

**Crossplane installed but a custom resource type (like `PostgresDatabase`) isn't recognized**
```bash
kubectl get compositeresourcedefinitions
# A Composition and its corresponding CompositeResourceDefinition (XRD)
# must both be applied before Crossplane recognizes a custom
# developer-facing resource type — installing Crossplane alone only
# gives you the underlying engine, not any specific abstraction
```

**Backstage template scaffolding fails partway through**
Check that every downstream integration the template calls (GitHub API access, Kubernetes namespace creation permissions) actually has valid credentials configured — a template failing partway through is almost always a missing credential for one specific integration step, not the template itself being broken.

## What's Set Up

After working through this section:
- **A local Backstage instance** — the developer-facing portal referenced throughout this guide
- **Crossplane** — the self-service provisioning engine, with at least one Composition/XRD defined
- A first real, observed instance of the "developer fills a form, platform provisions everything" loop this guide describes conceptually in Overview

## Next Steps

Go to the **Fundamentals** section (Overview's own Module 01/02 content) to deepen the conceptual model behind what you just set up hands-on.
