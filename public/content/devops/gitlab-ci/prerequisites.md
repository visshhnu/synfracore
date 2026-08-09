# GitLab CI/CD — Prerequisites

## What to Know Before Starting GitLab CI/CD

GitLab CI/CD is approachable if you already understand the basic shape of a CI/CD pipeline — the learning curve is mostly `.gitlab-ci.yml` syntax and GitLab-specific concepts, not CI/CD theory from scratch.

## Required (Must Have)

### 1. Git Fundamentals
```bash
git clone, git add, git commit, git push, git branch, git merge
```
GitLab CI/CD pipelines are triggered by Git events (push, merge request) — you need to be comfortable with the basic Git workflow before pipeline triggers and rules will make sense.

### 2. YAML Syntax
```yaml
key: value
list:
  - item1
  - item2
nested:
  key: value
```
`.gitlab-ci.yml` is entirely YAML — indentation errors are a real, common source of confusing pipeline failures, so basic YAML comfort (not expertise) matters from day one.

### 3. Basic Linux Command Line
Most pipeline jobs run shell commands inside a container:
```bash
ls, cd, cat, echo, export    # Comfortable enough to read/write a job's script: section
```

## Nice to Have (Speeds Up Learning)

### Docker Basics
Module 03's Docker executor (the most common runner executor type) will make far more sense if you already understand what a container image is and how `docker run` works — this site's Docker section covers exactly that foundation.

### Prior CI/CD Tool Experience (Jenkins, GitHub Actions, CircleCI)
The concepts (pipeline, stage, job, artifact) transfer directly even if you've used a different tool — you're learning GitLab's specific syntax and features (`rules:`, `needs:` DAG pipelines, built-in security scanning), not CI/CD from first principles.

### Kubernetes Basics (Optional, for the Kubernetes Executor)
Module 03 covers the Kubernetes executor as the production-scale autoscaling option — not required to start, but useful once you reach that module.

## What You Do NOT Need

- A paid GitLab account — GitLab.com's free tier includes shared runners, sufficient for learning
- Prior DevSecOps or security-scanning tool experience — Module 04's SAST/DAST/dependency scanning uses GitLab-provided templates, not hand-built tooling
- Jenkins or Groovy knowledge, despite `include:` being conceptually similar to Jenkins Shared Libraries

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 4-6 days
- Job-ready (comfortable with DAG pipelines, runners, and built-in security scanning): 2-3 weeks

## Start Here

Go to the **Installation** section to set up a GitLab Runner, then proceed to **Fundamentals**.
