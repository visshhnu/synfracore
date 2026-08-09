# Tekton — FAQ

## Do I need a separate CI server running somewhere to use Tekton?

No — this is Tekton's core architectural distinction from Jenkins/GitLab CI's server model. Every Tekton execution is a real Kubernetes pod, scheduled by the standard Kubernetes scheduler on whatever cluster you already have. There's no separate CI server process to install, secure, or maintain beyond the Tekton controllers themselves.

## Why did my Pipeline run successfully but produce empty or wrong output from a later Task?

Check the `Workspace` bindings first — since each Task runs as a genuinely separate pod with no shared filesystem by default, a Task that should have received another Task's output (via a shared `Workspace`) will run "successfully" against empty or unintended data if the binding is missing or points to the wrong volume. Tekton doesn't validate that Workspace content is semantically correct, only that the volume mount itself succeeds.

## What's the actual difference between a `Task` and a `ClusterTask`?

A `Task` is namespace-scoped — usable only within the namespace it's defined in. A `ClusterTask` is reusable across every namespace in the cluster, which is why the Tekton Catalog's common reusable Tasks (`git-clone`, `kaniko`) are typically installed as `ClusterTask`s. The tradeoff for that broader reuse is governance — a `ClusterTask` change affects every namespace using it, requiring more careful review than a single team's own namespace-scoped `Task`.

## Why would I use `matrix` instead of just writing three separate Task entries for three test configurations?

`matrix` avoids duplicating the same Task definition three times with only a parameter value changed — one Task definition, fanned into N parallel `TaskRuns` automatically. This matters for maintainability (fixing a bug in the Task logic only requires editing it once) but be aware it also multiplies resource consumption by the same factor — expanding a matrix is a real capacity-planning decision, not just a YAML convenience.

## Do I need to write my own Tasks for common operations like cloning a repo or building an image?

No — the Tekton Catalog provides community-maintained, reusable Tasks for common operations (`git-clone`, `kaniko` for image builds, and many others), applied to your cluster like any other Task/ClusterTask. Writing custom Tasks is for genuinely bespoke operations your specific pipeline needs that the Catalog doesn't already cover.

## What does a `finally:` task actually guarantee that a regular task at the end of the Pipeline doesn't?

A regular Task only runs if its dependencies (implicit or via `runAfter:`) succeed — if an earlier Task in the Pipeline fails, later regular Tasks are skipped. A `finally:` Task is guaranteed to run regardless of whether the Pipeline succeeded or failed overall, which is the actual requirement for reliable cleanup or failure-notification logic — a regular Task can't provide that guarantee.

## Is Tekton Chains required to use Tekton at all, or is it a separate, optional add-on?

It's a separate, optional component focused specifically on supply-chain provenance and signing — core Tekton (Tasks, Pipelines, Triggers) functions completely independently of Chains. Chains matters specifically if supply-chain security (verifiable proof of what produced a given build artifact) is a real requirement for your use case; plenty of legitimate Tekton usage never installs it at all.

## Why does Tekton need the Affinity Assistant for Workspace-sharing pods specifically?

Because a `ReadWriteOnce` volume (the common backing for a shared `Workspace`) can only be mounted by one node at a time — if Tasks sharing that Workspace get scheduled onto different nodes by the default Kubernetes scheduler, the volume mount fails for whichever pod is on the "wrong" node. The Affinity Assistant manages pod co-scheduling automatically so Workspace-sharing Tasks land on the same node, which becomes a real, tunable performance/scheduling consideration specifically in a busy, multi-tenant cluster.
