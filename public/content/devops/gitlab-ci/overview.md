# GitLab CI/CD

> **All-in-one DevSecOps platform — SCM + CI/CD + Registry + Security scanning**

**Category:** CI/CD  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is GitLab CI/CD?

.gitlab-ci.yml defines your entire CI/CD pipeline and lives in the root of your repo. Stages run sequentially; jobs within a stage run in parallel. Artifacts persist files between stages (e.g., build output → test stage). Cache persists dependencies between pipeline runs (speeds up builds). GitLab Runners execute jobs — shared runners are free on GitLab.com; specific runners are your own VMs or Kubernetes pods.

## Why GitLab CI/CD?

Modern .gitlab-ci.yml uses rules: (not only:/except: which are deprecated). needs: enables Directed Acyclic Graph (DAG) — jobs can depend on specific other jobs, not stages, removing stage bottlenecks. include: pulls in shared pipeline templates from another repo (equivalent to Jenkins Shared Libraries). extends: provides job template inheritance.

---

## Learning Modules

### Module 01 — GitLab CI Fundamentals
*.gitlab-ci.yml structure, stages, jobs*

.gitlab-ci.yml defines your entire CI/CD pipeline and lives in the root of your repo. Stages run sequentially; jobs within a stage run in parallel. Artifacts persist files between stages (e.g., build output → test stage). Cache persists dependencies between pipeline runs (speeds up builds). GitLab Runners execute jobs — shared runners are free on GitLab.com; specific runners are your own VMs or Kubernetes pods.

**Topics covered:**

- Stages and jobs structure — 🟢 Beginner
- Variables and environment injection — 🟢 Beginner
- Artifacts and cache — 🟡 Intermediate
- GitLab Runners (shared vs specific) — 🟡 Intermediate
- Predefined CI/CD variables — 🟡 Intermediate

### Module 02 — Pipeline Design Patterns
*needs, rules, include, extends*

Modern .gitlab-ci.yml uses rules: (not only:/except: which are deprecated). needs: enables Directed Acyclic Graph (DAG) — jobs can depend on specific other jobs, not stages, removing stage bottlenecks. include: pulls in shared pipeline templates from another repo (equivalent to Jenkins Shared Libraries). extends: provides job template inheritance.

**Topics covered:**

- needs: — DAG pipelines (skip stages) — 🟡 Intermediate
- rules: replacing only/except — 🟡 Intermediate
- include: for shared templates — 🟡 Intermediate
- extends: for job inheritance — 🟡 Intermediate
- trigger: for child pipelines — 🔴 Advanced

### Module 03 — GitLab Runners
*Shell, Docker, Kubernetes executors*

Runners have three main executors: Shell (runs directly on runner VM — fast, but environment pollutes between jobs), Docker (each job in a fresh container — clean, most common), Kubernetes (each job is a K8s pod — autoscales to zero, best for production). Tag runners and use tags: in jobs to route specific jobs to specific runners.

**Topics covered:**

- Runner executor types — 🟡 Intermediate
- Kubernetes executor for autoscaling — 🔴 Advanced
- Runner tags for job routing — 🟡 Intermediate
- Runner registration — 🟡 Intermediate

### Module 04 — Security Scanning (DevSecOps)
*SAST, DAST, container scanning built-in*

GitLab has built-in security scanning — one of its biggest advantages over Jenkins. Include GitLab-provided templates to add SAST, container scanning, dependency scanning, and secret detection in minutes. Results appear in the Merge Request security widget and the Security Dashboard. Fails pipeline if critical vulnerabilities found.

**Topics covered:**

- SAST — Static Application Security Testing — 🟡 Intermediate
- Container Scanning with Trivy — 🟡 Intermediate
- Dependency Scanning — 🟡 Intermediate
- Secret Detection — 🟢 Beginner
- Security Dashboard — 🟡 Intermediate

### Module 05 — Complete Production Pipeline
*Full .gitlab-ci.yml example*

A production .gitlab-ci.yml integrates test coverage reporting (visible in MR), security scanning, Docker build with GitLab container registry, and gated production deployments. GitLab environments track what version is deployed where — visible in Operations > Environments.

**Topics covered:**

- Coverage reporting — 🟡 Intermediate
- Environments and deployment tracking — 🟡 Intermediate
- Pipeline efficiency — 🔴 Advanced
- Merge request pipelines — 🟡 Intermediate

---

## Production Example

```yaml
# .gitlab-ci.yml — gated production deploy with built-in security scanning
stages: [build, test, scan, deploy]

variables:
  IMAGE: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA

build:
  stage: build
  script:
    - docker build -t $IMAGE .
    - docker push $IMAGE
  # Docker executor — fresh container per job, image cached in GitLab's
  # own registry ($CI_REGISTRY_IMAGE), no external registry needed

test:
  stage: test
  script: [npm test -- --coverage]
  coverage: '/Lines\s*:\s*(\d+\.?\d*)%/'
  # Coverage regex feeds the MR widget — visible on every merge request,
  # not just in job logs

# Built-in security scanning — GitLab's biggest advantage over Jenkins,
# no third-party integration needed
include:
  - template: Security/SAST.gitlab-ci.yml
  - template: Security/Container-Scanning.gitlab-ci.yml
  - template: Security/Secret-Detection.gitlab-ci.yml

deploy_production:
  stage: deploy
  script:
    - kubectl set image deployment/app app=$IMAGE -n production
  environment:
    name: production
    url: https://app.company.com
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
      when: manual   # gated — a human clicks "deploy" in the UI
  # Operations > Environments then shows exactly which SHA is live in
  # production, with a one-click rollback to the previous deployment
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is GitLab CI/CD and why would you use it in production?"
    **Problem:** stitching together a separate SCM, CI server, artifact registry, and security-scanning tool means managing auth, webhooks, and version drift across four different systems, and a pipeline failure can originate in any of the seams between them. **Solution:** GitLab CI/CD is one platform where source control, pipeline execution, the container/artifact registry, and SAST/DAST/dependency scanning all live together — a `.gitlab-ci.yml` in the repo root defines the whole pipeline, triggered natively on the same push/merge events GitLab already sees. **Result:** fewer integration points to break, security scan results show up directly on the merge request instead of a separate dashboard nobody checks, and a new engineer only has to learn one tool's permission model instead of four.

??? question "How does GitLab CI/CD work internally? Explain the architecture."
    **Problem:** without knowing which piece runs what, a stuck pipeline ("job pending forever" vs. "job failed") is guesswork. **Solution:** GitLab (the server) parses `.gitlab-ci.yml`, resolves stages/`needs:` into a dependency graph, and creates job records; GitLab Runners (separate processes — shared, group, or project-scoped) poll for and execute those jobs using one of three executors (Shell, Docker, Kubernetes), reporting logs and exit status back to GitLab. **Result:** "my job is stuck in pending" is a runner-availability problem (no runner picked it up — check tags/registration), while "my job ran and failed" is a script/application problem — the two failure classes point at completely different places to look.

??? question "What are the main components of GitLab CI/CD?"
    **Problem:** "GitLab CI/CD" sounds like one thing but is actually several cooperating pieces, and not knowing which is which makes error messages harder to map to what's actually broken. **Solution:** `.gitlab-ci.yml` (the pipeline definition — stages, jobs, rules), GitLab Runners (the executors — Shell/Docker/Kubernetes, shared or dedicated), the GitLab Container Registry (built-in, no external registry needed), and the Security scanning templates (SAST/Container Scanning/Secret Detection, added via `include:`) are the four pieces that combine into a working pipeline. **Result:** a registry-push failure, a runner-capacity failure, and a YAML syntax failure are three different components failing — this is exactly why the "internal architecture" answer above treats runner problems and script problems as unrelated failure classes.

??? question "How do you handle failures in GitLab CI/CD?"
    **Problem:** a red pipeline can fail for reasons ranging from a flaky test to a missing runner to invalid YAML, and treating all of them the same wastes time. **Solution:** start with the job's own log (most application/script failures show directly there); for jobs stuck in "pending," check runner availability and tags (`gitlab-runner verify`, or Admin > Runners for shared runners); for whole-pipeline failures before any job even starts, the Pipeline Editor's built-in linter catches YAML syntax errors before a push. `retry:` with a bounded count handles known-flaky steps (a slow external API call) without masking a genuinely broken one. **Result:** most real incidents resolve to one of these three buckets (script error, runner unavailability, YAML syntax) within the first log check, rather than an open-ended debugging session.

??? question "What is your production experience with GitLab CI/CD?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a stuck deployment, a runner capacity limit hit during a release, a security scan blocking a legitimate deploy), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

??? question "How do you monitor and observe GitLab CI/CD in production?"
    **Problem:** a pipeline can be "green" while still deploying something broken, or "red" for a reason that has nothing to do with application health. **Solution:** GitLab's CI/CD Analytics (pipeline duration/success-rate trends) catches pipeline-health regressions early; the Operations > Environments view shows exactly which commit SHA is live in each environment and when it was deployed, which is the actual production-observability signal — not the pipeline's pass/fail status; application-level monitoring (Prometheus/Grafana, or whatever the deployed app uses) is what actually confirms the deploy is healthy, separate from the pipeline that shipped it. **Result:** "did the deploy succeed" and "is the application healthy" are answered by two different systems — conflating them is what leads to "the pipeline was green but the site was down" incidents.

??? question "What are the security considerations for GitLab CI/CD?"
    **Problem:** a CI pipeline routinely handles cloud credentials, deploy keys, and registry push access — a compromised or misconfigured pipeline is a direct path to production. **Solution:** scope secrets narrowly (environment-specific protected variables, not project-wide ones available to every branch), enable the built-in SAST/Container Scanning/Secret Detection templates (already covered in Module 04 and this guide's Production Example above), pin `include:`d external templates to a specific ref rather than a moving branch, and restrict `when: manual` production deploys to protected branches only. **Result:** this is the same defense-in-depth logic used at the application layer, applied to the pipeline itself — the biggest practical risk in most real GitLab CI setups isn't the scanning templates being absent, it's an overly-broad CI/CD variable being readable from an unprotected feature branch.

??? question "How does GitLab CI/CD compare to alternatives?"
    **Problem:** "which CI/CD tool" is really several different questions depending on what's already in the stack. **Solution:** vs. Jenkins — GitLab CI/CD needs no plugin ecosystem to manage and no separate server to patch, at the cost of being less customizable for exotic pipeline shapes; vs. GitHub Actions — comparable capability, but GitLab bundles SCM + registry + security scanning natively rather than relying on marketplace actions, which matters most for self-hosted/regulated environments; vs. Tekton/ArgoCD — those are Kubernetes-native building blocks for teams building their own platform, not a turnkey CI/CD product. **Result:** the right choice tracks the org's actual constraint (already on GitLab vs. GitHub, need for self-hosted, appetite for building vs. buying) more than any feature-by-feature difference — naming the specific tradeoff being asked about beats reciting a generic list.

??? question "Walk through what actually happens when a `.gitlab-ci.yml` pipeline runs."
    **Problem:** without knowing what `.gitlab-ci.yml`'s basic building blocks actually do, every more advanced feature (`rules:`, `needs:`, `include:`) is unexplainable. **Solution:** stages define execution order (jobs in the same stage run in parallel); jobs are the actual units of work, each running in a fresh runner-provided environment; artifacts pass files between stages (e.g. a build output consumed by a later test stage); cache persists dependencies (like `node_modules`) between separate pipeline runs to speed up builds — a different mechanism from artifacts despite looking similar. **Result:** this is the vocabulary the rest of the pipeline is built from — "why is my test stage missing the build output" is almost always an artifacts-not-declared problem, and "why is every build slow" is almost always a caching-not-configured problem.

??? question "How would you redesign a slow, purely sequential pipeline to run faster?"
    **Problem:** a pipeline that runs every job sequentially, stage by stage, wastes time once a project has more than a handful of jobs — most jobs don't actually depend on every job in the previous stage. **Solution:** `needs:` lets a job declare dependencies on specific other jobs instead of an entire stage, turning a linear pipeline into a Directed Acyclic Graph (DAG) so independent jobs run in parallel regardless of stage order; `rules:` (replacing the deprecated `only:`/`except:`) evaluates conditions top-to-bottom for fine-grained control over when a job runs; `include:` pulls in shared templates from another repo, GitLab's equivalent of Jenkins Shared Libraries; `extends:` gives one job template inheritance from another, cutting duplication across similar jobs. **Result:** a pipeline using `needs:` for a DAG and `extends:`/`include:` for reuse typically runs faster and carries far less duplicated YAML than one relying purely on sequential stages — that's the actual difference between a pipeline that "works" and one that scales with the codebase.

---

## Official Resources

- [GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)
- [.gitlab-ci.yml Reference](https://docs.gitlab.com/ee/ci/yaml/)
- [GitLab Security Scanning](https://docs.gitlab.com/ee/user/application_security/)

---

