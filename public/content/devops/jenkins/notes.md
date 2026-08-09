# Jenkins — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Architecture

```
Controller (formerly "master") — SCHEDULES jobs, should NEVER RUN
  build jobs itself. A hung/heavy/malicious build on the controller
  degrades or takes down the ENTIRE instance, not just that job.
Agents — fleet that actually EXECUTES jobs. Agent isolation exists
  SPECIFICALLY to contain blast radius from any single build.
Plugins — extend Jenkins to almost any tool, but EVERY plugin is a
  dependency that can break on core upgrade or need its own security
  patching. Plugin sprawl = real, common source of fragile instances.
```

## Pipeline as Code — Why It Replaced UI-Configured Jobs

```
BEFORE: pipeline steps lived in a UI-configured job — changing the
  build process meant clicking through the UI, NO review, NO history,
  NO guarantee the job matched what was in the repo at any commit
AFTER (Jenkinsfile): entire pipeline defined in a file CHECKED INTO
  the same repo it builds — reviewed via normal PR process, exactly
  reproducible for any given commit
```

## The `post` Block

```
post { always{} success{} failure{} unstable{} }
Runs REGARDLESS of which stage the pipeline reached or failed at —
  this is WHY cleanup/notifications are reliable, unlike code placed
  inside a specific stage that an earlier failure would simply SKIP.
```

## Shared Libraries — DRY Across Teams

```
Problem: without them, adding one step (e.g., a security scan) to the
  standard build process means editing EVERY service's Jenkinsfile
  individually
Solution: centralize common functions in a library repo's vars/
  directory
@Library annotation — teams import, PINNED TO A TAGGED VERSION, not
  a floating branch — so a library change can't silently alter every
  consuming pipeline's behavior the moment someone pushes to default
```

## Terminology Cross-Reference

```
Jenkins term          | GitHub Actions / GitLab CI equivalent
-------------------------|--------------------------------------
Controller                 | (no direct equivalent — hosted platforms
                             abstract this away)
Agent                        | Runner
Jenkinsfile                    | .github/workflows/*.yml or .gitlab-ci.yml
Shared Library                   | Composite action / include: template
post { always }                    | if: always() step condition
```

## Common Failure Categories (from Troubleshooting)

```
Plugin version conflicts after core upgrade — a real, recurring
  operational cost of plugin sprawl, not a one-time migration risk
Shared Library version drift — a consuming team unknowingly pulling
  an unpinned or newly-tagged library version with breaking changes
Controller resource exhaustion — from jobs or plugins that shouldn't
  be running on the controller in the first place
```
