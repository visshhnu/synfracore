# GitHub Actions — FAQ

## Is it actually necessary to pin every action to a SHA, or is a version tag good enough?

A version tag (`@v4`) is a meaningful improvement over `@master`/`@main`, since it's far less likely to change unexpectedly — but it's technically not immutable; a maintainer (or a compromised maintainer account) could theoretically repoint a tag. A full commit SHA is the maximally secure option, since it can never be silently repointed. For most workflows, a version tag is a reasonable practical baseline; for anything security-sensitive, pin to a full SHA.

## Why does my OIDC-based deployment fail even though the workflow YAML looks correct?

The most common cause, by far, is a mismatch between the cloud IAM trust policy's `sub` claim condition and the workflow's actual `sub` claim value — this is a cloud-side configuration issue, not a workflow YAML problem. Check the trust policy's condition against the specific repo/branch/environment the failing workflow is actually running from, rather than re-reading the workflow YAML repeatedly looking for a syntax issue that likely isn't there.

## Do matrix jobs run one after another, or genuinely in parallel?

Genuinely in parallel — each matrix combination creates a separate job with its own runner, and GitHub Actions schedules them to run simultaneously (subject to your account's concurrent-job limits). This is architecturally different from a loop inside a single job's steps, which would execute sequentially on one runner.

## Is a self-hosted runner always cheaper than GitHub-hosted runners at scale?

Generally yes for sustained, high-volume usage, since you're not paying GitHub's per-minute billing — but the real cost comparison needs to include the infrastructure and maintenance overhead of running the self-hosted fleet yourself (via ARC or standalone), plus the security considerations covered in this guide's Advanced material, specifically for public repositories. It's not a purely financial decision once operational and security overhead are counted honestly.

## What's the difference between a repository secret and an environment secret?

A repository (or organization) secret is available to any workflow run in that repo/org, subject to normal secret-masking. An environment secret is scoped specifically to jobs targeting that named environment (e.g., `production`) — a job not explicitly targeting that environment can't access its secrets, even within the same workflow file. Environment secrets are the right choice when different deployment targets (staging vs. production) genuinely need different credential values kept separate.

## Why would I need `concurrency:` control if my workflow already runs correctly every time it's triggered?

Because "runs correctly in isolation" and "runs correctly when triggered twice in rapid succession" are different guarantees — without `concurrency:` control, two rapid pushes to the same branch/ref can trigger overlapping workflow runs that race each other, particularly dangerous for deploy workflows where two concurrent deploys to the same target can conflict or apply in the wrong order. `cancel-in-progress: true` specifically ensures only the latest, most relevant run actually completes.

## Does GitHub Actions require Kubernetes to use self-hosted runners at scale?

No — a standalone self-hosted runner (a single VM running `run.sh`) works fine for smaller-scale needs. Actions Runner Controller (ARC) specifically brings Kubernetes-native autoscaling to self-hosted runners, useful once manually managing a fixed pool of standalone runner VMs becomes a real operational burden — it's the production-scale option, not a requirement for any self-hosted usage at all.

## Is build provenance attestation only relevant for large, security-mature organizations?

Not necessarily — while it's most commonly discussed in the context of larger organizations with formal supply-chain security requirements, the underlying capability (`actions/attest-build-provenance`) is available to any GitHub Actions workflow and genuinely useful anywhere verifiable build provenance matters, including smaller open-source projects wanting to prove a release artifact was actually built by their public CI pipeline rather than uploaded manually or by an unauthorized party.
