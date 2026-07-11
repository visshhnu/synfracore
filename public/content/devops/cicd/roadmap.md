# CI/CD Pipelines — Learning Roadmap

A structured path from zero to production-ready pipeline design. Each stage builds on the last — don't skip to Advanced patterns before Stage 2's fundamentals are second nature; canary deployments and GitOps are much harder to reason about if the basic build→test→deploy flow isn't already intuitive.

## Stage 1 — Manual first, automate second (1 week)

Before automating anything, manually run your project's full build → test → deploy sequence from the command line, end to end, and write down every step. This sounds like a detour but isn't — you cannot correctly automate a process you haven't done manually and understood completely. Most broken first pipelines are broken because a step that "just works" on a developer's machine (an implicit `.env` file, a globally-installed tool) was never actually understood as a dependency.

## Stage 2 — Your first real pipeline (1-2 weeks)

Set up GitHub Actions or GitLab CI (see Installation) on a real project — ideally one you already have running locally. Build a pipeline that: runs on every push, installs dependencies, runs your test suite, and fails loudly if tests fail. Get comfortable reading pipeline logs to debug a failure — this is the single most-used skill day to day, more than writing new pipeline YAML.

## Stage 3 — Add deployment (1-2 weeks)

Extend Stage 2's pipeline to actually deploy somewhere — a free-tier PaaS (Render, Railway, Vercel) is a fine target for learning, no need to provision real cloud infrastructure yet. Add a manual approval gate before deployment so you internalize the Continuous Delivery vs. Continuous Deployment distinction hands-on, not just conceptually.

## Stage 4 — Multi-environment + secrets discipline (2 weeks)

Add a staging environment distinct from production, and practice promoting the same built artifact through both (see Intermediate). Set up real secrets management — cloud credentials via your CI platform's secrets store, never hardcoded. This stage is where most of the "intermediate DevOps engineer" interview questions live.

## Stage 5 — Speed and reliability (2 weeks)

Add dependency caching and, if your test suite is large enough to matter, parallelized/sharded test execution (see Intermediate). Add a genuine rollback path — practice actually triggering it, not just designing it on paper.

## Stage 6 — Production-grade patterns (ongoing, project-driven)

Pick one advanced pattern and implement it for real rather than reading about all of them shallowly: blue-green or canary deployment on a real (even personal-scale) project, or a GitOps setup with ArgoCD/Flux against a small Kubernetes cluster. Depth on one advanced pattern, actually built and broken and fixed, teaches more than surface familiarity with all of them.

## What "done" looks like at each level

- **Junior-ready**: can explain the build→test→deploy flow, has built and debugged a real pipeline, understands why secrets don't belong in source control.
- **Mid-level-ready**: has designed multi-environment promotion, understands caching/parallelization tradeoffs, can design a rollback strategy before being asked to.
- **Senior-ready**: has actually operated (not just read about) canary or blue-green deployments in a real system, can reason about pipeline security as an attack surface, and can design multi-region rollout strategy from first principles.
