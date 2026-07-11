# CI/CD Pipelines — Prerequisites

Before building CI/CD pipelines, you should be comfortable with the tools a pipeline actually orchestrates — a pipeline is glue between things you already need to know how to use manually.

## What you need first

- **Git, comfortably** — not just `add`/`commit`/`push`. You need branching strategies (trunk-based vs. GitFlow), because your pipeline's trigger logic depends entirely on which branching model your team uses. You should also understand what a merge conflict actually is, since a pipeline can't resolve one for you.
- **The command line** — pipelines are, underneath any YAML syntax, just a sequence of shell commands run in order. If you can't run your build/test/deploy steps manually from a terminal, you can't debug why they fail inside a pipeline either.
- **How your application actually builds and runs** — what command compiles it, what command runs its test suite, what artifact comes out the other end (a binary, a Docker image, a set of static files). A pipeline automates this sequence; it doesn't replace understanding it.
- **Basic containers (Docker), if your target is containerized** — most modern CI/CD pipelines build and push a container image as their core artifact. You don't need Kubernetes yet, but you need to understand what `docker build` and `docker push` actually do.
- **Environment variables and secrets, conceptually** — pipelines need credentials (registry logins, cloud provider keys, API tokens) without ever hardcoding them in a file that gets committed to Git. If you don't already have a mental model for "config that shouldn't be in source control," this is where it becomes essential, not optional.

## What you don't need yet

- Kubernetes — plenty of real CI/CD pipelines deploy to a VM, a PaaS (Heroku, Render), or a serverless target, no cluster involved.
- Infrastructure as Code (Terraform, etc.) — useful alongside CI/CD eventually, but a pipeline that deploys application code doesn't require you to also be provisioning infrastructure with code from day one.
- Any specific CI/CD tool mastery — GitHub Actions, GitLab CI, Jenkins, and CircleCI all express the same underlying concepts (triggers, stages, artifacts, secrets) in different YAML/DSL syntax. Learn the concepts once; the tool-specific syntax is a lookup problem, not a learning problem.
