# DevSecOps — Fundamentals

## Security as code, not a gate at the end

The traditional model — developers build, a separate security team reviews everything at the very end, findings get thrown back over the wall for fixes — creates a real bottleneck and, over time, a blame culture where security is treated as something that slows delivery down rather than something built in from the start. DevSecOps inverts this: automated security tooling runs at every pipeline stage, and a developer sees a finding in their own pull request within minutes, not in a report delivered three months after the code shipped. This is the entire meaning of "shift-left" — moving security checks earlier on the timeline, where fixing an issue costs a developer a few minutes in their editor instead of the disproportionately larger cost (incident response, customer notification, sometimes regulatory exposure) of the same issue reaching production.

## The five stages, and what runs at each one

| Stage | Tooling | What it catches |
|---|---|---|
| Pre-commit | Gitleaks, detect-secrets | Credentials before they ever reach Git history |
| Code review (PR) | SonarQube, Semgrep | Insecure code patterns, injection risks, code smells |
| Dependencies | Trivy, Snyk, Dependabot | Known CVEs in libraries your code depends on |
| Container build | Trivy, Grype | Vulnerabilities baked into the Docker image itself |
| Deploy/Runtime | Checkov/tfsec (IaC), Falco (runtime) | Cloud misconfigurations before deploy; suspicious behavior after |

No single tool in this list covers everything — this is deliberate defense in depth, where each stage catches a different category of problem, and a gap at one stage (a secret that slips past pre-commit) still has a real chance of being caught at a later one (a secret-scanning pass on the full repository history).

## Secrets detection — the highest-value place to start

Committing an API key or database password to Git is consistently one of the most common real incident causes, and it's uniquely unforgiving: once a secret is in Git history, it's compromised permanently, in every clone anyone has ever made — deleting it from the latest commit does nothing to remove it from history that's already been cloned elsewhere. This is why prevention, not cleanup, is the only real solution:

```bash
# Pre-commit: block a secret before it's ever committed
pip install detect-secrets
detect-secrets scan > .secrets.baseline
git secrets --install

# Separately: scan full git history for anything that already slipped through
gitleaks detect --source . --verbose
```
If a real secret is ever found in history, the actual fix is rotating the credential immediately — assuming it's compromised the moment it's found, not just removing it from the file — since history rewriting doesn't reliably reach every existing clone or fork.

## SAST — finding insecure patterns in code, not just known CVEs

Static Application Security Testing scans your own source code for insecure patterns — SQL built via string concatenation instead of parameterized queries, hardcoded credentials, missing input validation — the kind of issue that's specific to how *your* code is written, not a known vulnerability in a third-party library. SonarQube's **Quality Gate** is the practical mechanism: a defined pass/fail threshold (test coverage on new code, no new Critical security issues) that a pull request must clear before merge is allowed, turning "we should write secure code" into an actual enforced check rather than a guideline.

## Container security: four things that matter more than any single scanner

A vulnerability scanner alone isn't a complete container security strategy — four practices meaningfully reduce actual attack surface, independent of what any scan finds:

- **Minimal base images** (distroless or Alpine instead of a full Ubuntu image) — less installed software means fewer possible vulnerabilities by construction, not just fewer flagged ones
- **Non-root user** (`USER 1001` in the Dockerfile) — limits what an attacker can actually do if the container is compromised, since a non-root process can't modify most of the filesystem or escalate as easily
- **CVE scanning before push** (Trivy against the built image, not just the source) — catches vulnerabilities introduced by base image layers, not just your own application code
- **Image signing** (Cosign) — verifies the image actually running in production is the exact one your pipeline built, unmodified, closing a gap that vulnerability scanning alone doesn't address

## IaC scanning: catching misconfigurations before they're deployed

Checkov and tfsec scan Terraform, Kubernetes manifests, and other infrastructure-as-code definitions for known misconfiguration patterns — an S3 bucket left publicly readable, a security group open to `0.0.0.0/0`, a database with encryption disabled — before that infrastructure is ever actually created. This matters specifically because infrastructure misconfigurations are otherwise invisible until either a manual cloud-console audit catches them or, worse, an actual breach reveals them; scanning the IaC definition itself catches the mistake at the pull-request stage, the same shift-left principle applied to infrastructure rather than application code.

## Runtime security: what happens after everything else already passed

Every check above runs before deployment. Falco is the one piece of this stack that watches what's actually happening in a running container — using eBPF or a kernel module to observe real system calls — and alerts on suspicious behavior: an unexpected shell spawned inside a container, a process reading `/etc/shadow`, a container attempting a network connection outside its normal pattern. This matters as the final layer specifically because it catches things no earlier static check could: a container compromised through some exploit no scanner had a signature for yet still has to actually *do* something at runtime to be useful to an attacker, and that's the behavior Falco is watching for, independent of whether the exploit itself was previously known.
