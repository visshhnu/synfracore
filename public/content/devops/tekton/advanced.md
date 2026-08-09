# Tekton — Advanced

## Tekton Chains — Supply Chain Security and Provenance

A build pipeline that produces an image without any cryptographic record of *how* that image was built (which source commit, which Task versions, which base image) leaves no verifiable trail — Tekton Chains observes completed `TaskRun`s and automatically generates and signs **provenance attestations**, cryptographically linking a built artifact back to the exact pipeline execution that produced it:

```yaml
# Tekton Chains is installed and configured cluster-wide (not per-pipeline) —
# once active, it automatically observes TaskRuns that produce OCI images
# and generates signed attestations without pipeline authors needing to
# add anything to their own Task/Pipeline definitions

# Example: verifying an image's provenance before deploying it
cosign verify-attestation \
  --type slsaprovenance \
  --key chains.pub \
  registry.company.com/myapp:v1.2.3
```

This is the mechanism behind SLSA (Supply-chain Levels for Software Artifacts) compliance for a Tekton-based pipeline — an admission controller (Kyverno, OPA Gatekeeper) can then require verified provenance before allowing an image to be deployed at all, closing the same class of supply-chain risk that image-signing addresses at the registry layer, but specifically proving *build process* integrity rather than just *image* integrity.

## Multi-Tenant Tekton — RBAC and ServiceAccount Isolation

In a cluster running Tekton pipelines for multiple teams, every `Task` runs as a pod with whatever `ServiceAccount` its `PipelineRun` specifies — without deliberate scoping, an over-privileged default `ServiceAccount` means any team's pipeline (including one pulling in a third-party Catalog Task) can reach far more of the cluster than it should:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata: { name: team-a-pipeline-sa, namespace: team-a }
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata: { name: team-a-pipeline-binding, namespace: team-a }
roleRef: { kind: Role, name: team-a-deployer, apiGroup: rbac.authorization.k8s.io }
subjects:
- kind: ServiceAccount
  name: team-a-pipeline-sa
  namespace: team-a
---
apiVersion: tekton.dev/v1
kind: PipelineRun
metadata: { name: team-a-build, namespace: team-a }
spec:
  taskRunTemplate:
    serviceAccountName: team-a-pipeline-sa   # scoped, not the namespace default
  pipelineRef: { name: build-deploy }
```

This is the same principle as FluxCD's per-tenant `ServiceAccount` scoping — the isolation is only as real as the RBAC actually attached to the `ServiceAccount` each `PipelineRun` uses, not something Tekton enforces automatically by default.

## Performance Tuning — Affinity Assistant and Pod Templates

At real pipeline volume, two specific tuning levers matter beyond basic resource requests/limits. The **Affinity Assistant** controls whether Tasks sharing a `Workspace` (backed by a PVC with `ReadWriteOnce` access) get scheduled onto the same node — required for `ReadWriteOnce` volumes, but a real scheduling constraint that can cause pod-pending delays if the cluster's node pool is tightly packed:

```yaml
# Disable the Affinity Assistant when using a storage class that
# supports ReadWriteMany, removing the same-node scheduling constraint
# entirely — a meaningful unlock for parallel Task scheduling at scale
apiVersion: v1
kind: ConfigMap
metadata: { name: feature-flags, namespace: tekton-pipelines }
data:
  disable-affinity-assistant: "true"
```

**Pod templates** let a `PipelineRun` set node selectors, tolerations, or resource defaults for every Task pod it creates, rather than repeating that configuration on every individual Task:

```yaml
apiVersion: tekton.dev/v1
kind: PipelineRun
metadata: { name: build-deploy-run }
spec:
  taskRunTemplate:
    podTemplate:
      nodeSelector: { workload-type: "ci" }   # same dedicated-node-pool pattern as Runner tuning elsewhere
      tolerations:
      - { key: "ci-only", operator: "Exists", effect: "NoSchedule" }
```

## Tekton Operator — Lifecycle Management at Scale

Manually managing Tekton's own installation (Pipelines, Triggers, Chains, Dashboard as separate Helm/YAML installs) across many clusters is real, repeated operational overhead — the Tekton Operator manages the full component lifecycle (install, upgrade, configuration) as a single custom resource, the same pattern as the Prometheus Operator managing Prometheus/Alertmanager instances:

```yaml
apiVersion: operator.tekton.dev/v1alpha1
kind: TektonConfig
metadata: { name: config }
spec:
  profile: all              # installs Pipelines, Triggers, Chains, Dashboard together
  targetNamespace: tekton-pipelines
```

For a platform team running Tekton across many clusters (as part of a golden path, in Platform Engineering terms), the Operator is what makes "every cluster runs the same, current Tekton version" a declarative, GitOps-managed fact rather than a manually-tracked checklist per cluster.
