# Tekton — Portfolio Projects

Build these 3 projects to prove Tekton mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Build-and-Push Pipeline With Workspaces

**Level:** Beginner | **Time:** 1 day | **GitHub:** `tekton-build-push-pipeline`

**What you build:** A `Pipeline` chaining `git-clone` and `kaniko` (image build) Tasks, sharing source code between them via a `Workspace`.

### Pipeline definition
```yaml
apiVersion: tekton.dev/v1
kind: Pipeline
metadata: { name: build-push-pipeline }
spec:
  workspaces: [{ name: shared-workspace }]
  params: [{ name: repo-url, type: string }, { name: image-ref, type: string }]
  tasks:
    - name: fetch-source
      taskRef: { name: git-clone }
      workspaces: [{ name: output, workspace: shared-workspace }]
      params: [{ name: url, value: "$(params.repo-url)" }]
    - name: build-image
      taskRef: { name: kaniko }
      runAfter: [fetch-source]
      workspaces: [{ name: source, workspace: shared-workspace }]
      params: [{ name: IMAGE, value: "$(params.image-ref)" }]
```

### Interview points
- `Workspace` is what makes `git-clone`'s output actually usable by `kaniko` — without a shared `Workspace`, each Task's pod has no visibility into another Task's filesystem, since they're genuinely separate pods
- `runAfter` is the explicit sequencing mechanism when Tasks don't have a data dependency Tekton can infer automatically
- Explaining why Tekton needs no central server here — `fetch-source` and `build-image` are each literally scheduled as pods by the Kubernetes scheduler, using the same resource model as any other workload

### Steps
1. Apply the Catalog's `git-clone` and `kaniko` Tasks
2. Write the Pipeline above referencing both, connected via a shared `Workspace`
3. Create a `PipelineRun` with a real repo URL and image reference, backed by a `PersistentVolumeClaim` for the workspace
4. Confirm the built image actually lands in the target registry
5. Document the Workspace binding and why it's required, in the README

---

## Project 2: Webhook-Triggered Pipeline With Matrix Testing

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `tekton-webhook-matrix-pipeline`

**What you build:** A `Trigger`-based setup where a GitHub webhook automatically starts a `PipelineRun`, which fans out into parallel test executions across a matrix of parameters.

### Trigger setup
```yaml
apiVersion: triggers.tekton.dev/v1beta1
kind: EventListener
metadata: { name: github-listener }
spec:
  triggers:
    - name: github-push
      bindings: [{ ref: github-push-binding }]
      template: { ref: build-pipeline-template }
```

### Matrix testing
```yaml
tasks:
  - name: run-tests
    taskRef: { name: test-task }
    matrix:
      params:
        - name: python-version
          value: ["3.10", "3.11", "3.12"]
```

### Interview points
- Matrix execution fans a single Task definition into N parallel `TaskRuns`, one per matrix combination — a common real use case being testing across multiple language/runtime versions without duplicating Task YAML
- The webhook → `EventListener` → `TriggerBinding`/`TriggerTemplate` → `PipelineRun` chain is worth being able to draw from memory — it's the specific mechanism that makes Tekton event-driven rather than manually invoked
- `finally` tasks (covered alongside matrix in this guide's Intermediate content) are the right place for cleanup/notification that must run regardless of matrix outcome — explaining why a regular Task in the main list wouldn't guarantee that

### Steps
1. Install Tekton Triggers and set up an `EventListener` with a real, reachable Service endpoint
2. Configure a GitHub webhook pointing at that endpoint
3. Build a test Pipeline using `matrix` to fan out across at least 3 parameter combinations
4. Push a commit and confirm the webhook triggers a real `PipelineRun` automatically
5. Document the matrix fan-out — how many `TaskRuns` were actually created — in the README

---

## Project 3: Signed Supply-Chain Pipeline With Tekton Chains

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `tekton-chains-supply-chain`

**What you build:** A production-shaped pipeline where Tekton Chains automatically generates and signs provenance attestations for every built image.

### Tekton Chains configuration
```bash
kubectl apply -f https://storage.googleapis.com/tekton-releases/chains/latest/release.yaml

kubectl patch configmap chains-config -n tekton-chains \
  -p='{"data":{"artifacts.taskrun.format":"in-toto","artifacts.oci.storage":"oci"}}'
```

### Verifying provenance
```bash
cosign verify-attestation --key cosign.pub myregistry/my-app:latest
# Confirms the image's build provenance was signed by the expected key
# and matches the in-toto attestation format Chains generated
```

### Interview points
- Explaining supply-chain provenance concretely: Tekton Chains observes completed `TaskRuns`, generates an in-toto attestation describing exactly what inputs produced the image, and signs it — giving a verifiable answer to "was this image actually built by our pipeline, from this exact source"
- This directly addresses a real, current security concern (supply-chain attacks via compromised build systems) rather than being abstract compliance checkbox work
- Multi-tenant RBAC design (a separate but related Advanced topic) matters here specifically because Chains' signing keys need to be inaccessible to anything but the legitimate pipeline — a compromised low-privilege tenant shouldn't be able to sign attestations for images it didn't actually build

### Steps
1. Install and configure Tekton Chains on top of the pipeline from Project 1
2. Configure a signing key (cosign-compatible) and confirm Chains generates attestations on real `TaskRun` completion
3. Verify a built image's attestation with `cosign verify-attestation`
4. Deliberately test that an unsigned or tampered image fails verification
5. Document the full chain of trust — from Git commit to signed, verifiable image — in the README

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the full Pipeline/Trigger YAML and how to reproduce the setup
- [ ] Can explain why every Tekton execution is a real Kubernetes pod, with no central CI server, without notes in an interview
- [ ] Project 2 includes a real webhook delivery log or screenshot, not just the Trigger configuration
- [ ] Project 3 demonstrates both a successful verification and a deliberately-failed one, showing the security boundary actually works
