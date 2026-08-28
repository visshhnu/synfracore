# DevSecOps

> **Vault, Trivy, SonarQube, OPA, Kyverno, Falco — security at every stage**

**Category:** DevSecOps  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** general CI/CD pipeline familiarity (what a build stage and a deploy stage are) is assumed, along with basic container/Kubernetes concepts. [Cloud Security](/academies/security/cloud-security/overview) and [Pen Testing](/academies/security/pen-testing/overview) cover related but distinct ground — this page is specifically about embedding security checks into the delivery pipeline itself.

## What is DevSecOps?

Shift-left means catching security issues as early as possible — in the developer's editor or at commit time, not in production. The cost of fixing a vulnerability grows 10x at each stage: dev → PR → build → staging → production. A complete DevSecOps pipeline has security gates at every stage. No single tool covers everything — defense in depth.

## Why This Exists (The Hook)

A security review held once, right before a production release, finds every issue at the single most expensive point to fix them — the code is already written, reviewed, tested, and scheduled to ship, so a critical finding now means reopening work that was considered done. DevSecOps exists because most of that cost is avoidable: the same categories of issues (a hardcoded credential, a vulnerable dependency, a misconfigured container) are just as detectable at commit time or build time, when fixing them costs minutes instead of a delayed release.

**Analogy** — Think of DevSecOps like a car factory's quality checks at every station on the line, not one final inspection before the car leaves the lot. A factory that only inspects finished cars discovers a bad weld after the whole car is assembled around it — expensive to fix, sometimes requiring a full teardown. A factory that checks the weld right after it's made catches the same defect in seconds, at the one station where it's cheapest to fix. DevSecOps puts a "quality check station" (a security gate) at commit, at PR, at build, at deploy, and at runtime — instead of one inspection at the very end.

**Try it (2 minutes)** — Reason through why CRITICAL Trivy findings block the build outright while HIGH findings only create a tracked ticket, without looking anything up: if every single finding, regardless of severity, blocked every build, what would that do to how quickly and how carefully developers respond to critical findings specifically — and what usually happens to alert systems that cry wolf on low-stakes issues as often as high-stakes ones?

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "1. Code", "sublabel": "Pre-commit: detect-secrets, gitleaks, hadolint", "color": "blue" },
    { "label": "2. Repository", "sublabel": "PR: SAST, IaC scan, secret scan", "color": "purple" },
    { "label": "3. Build", "sublabel": "Dependency + container scan, image signing", "color": "amber" },
    { "label": "4. Deploy", "sublabel": "Admission policy enforcement (Kyverno/OPA)", "color": "red" },
    { "label": "5. Runtime", "sublabel": "Falco detection, Vault secrets, zero-trust networking", "color": "green" }
  ]
}
```

```conceptgrid
{
  "boxes": [
    { "title": "Secrets Management", "description": "HashiCorp Vault -- static and dynamic, short-lived credentials", "color": "blue" },
    { "title": "Dependency/Image Scanning", "description": "Trivy, Snyk -- CVEs in code and containers", "color": "purple" },
    { "title": "Static Analysis (SAST)", "description": "SonarQube -- bugs, vulnerabilities, quality gates", "color": "amber" },
    { "title": "Admission Policy", "description": "OPA Gatekeeper, Kyverno -- enforce rules on what runs", "color": "red" }
  ]
}
```

## Why DevSecOps?

Vault is the industry standard for secret management. Two types of secrets: Static (username/password stored in Vault's KV store) and Dynamic (Vault generates short-lived credentials on demand — database, AWS keys, TLS certs). Dynamic secrets are the killer feature — no shared passwords, automatic expiry, full audit trail. Vault Agent Injector automatically injects secrets into pods at startup with zero code changes.

---

## Learning Modules

### Module 01 — DevSecOps Pipeline
*Shift-left security — every stage*

Shift-left means catching security issues as early as possible — in the developer's editor or at commit time, not in production. The cost of fixing a vulnerability grows 10x at each stage: dev → PR → build → staging → production. A complete DevSecOps pipeline has security gates at every stage. No single tool covers everything — defense in depth.

**Topics covered:**

- Shift-left security philosophy — 🟢 Beginner
- Pre-commit hooks (detect-secrets, gitleaks) — 🟡 Intermediate
- PR stage: SAST + IaC scanning — 🟡 Intermediate
- Build stage: Trivy + Snyk — 🟡 Intermediate
- Runtime: Falco + Network Policies — 🔴 Advanced

```bash
# Complete DevSecOps Pipeline Gates:

Pre-commit (developer machine):
├── detect-secrets — block credential commits
│     pip install detect-secrets
│     detect-secrets scan > .secrets.baseline
│     git secrets --install
├── gitleaks — scan git history for secrets
│     gitleaks detect --source . --verbose
└── hadolint — Dockerfile linting
      hadolint Dockerfile

Pull Request (automated):
├── SonarQube SAST — code quality + security hotspots
├── Checkov — Terraform/K8s manifest misconfigs
│     checkov -d ./terraform --compact
├── tfsec — Terraform security
│     tfsec ./terraform --format lovely
└── Semgrep — custom security rules
      semgrep --config=auto .

Build Stage (CI pipeline):
├── Trivy filesystem scan — dependencies
│     trivy fs --exit-code 1 --severity CRITICAL .
├── Trivy image scan — container CVEs
│     trivy image --exit-code 1 myapp:latest
└── Snyk — library vulnerabilities + license
      snyk test --severity-threshold=high

Deploy Stage:
├── OPA Gatekeeper / Kyverno — admission policies
│     kubectl get constrainttemplate
└── Image signing (Cosign/Notary)
      cosign verify myregistry/myapp:latest

Production Runtime:
├── Falco — runtime threat detection
├── Network Policies — zero-trust pod communication
└── Vault — dynamic secrets (no static credentials)
```

### Module 02 — HashiCorp Vault
*Secret management, dynamic credentials*

Vault is the industry standard for secret management. Two types of secrets: Static (username/password stored in Vault's KV store) and Dynamic (Vault generates short-lived credentials on demand — database, AWS keys, TLS certs). Dynamic secrets are the killer feature — no shared passwords, automatic expiry, full audit trail. Vault Agent Injector automatically injects secrets into pods at startup with zero code changes.

**Topics covered:**

- Vault architecture and auth methods — 🟡 Intermediate
- Static secrets (KV store) — 🟢 Beginner
- Dynamic secrets (database, AWS, PKI) — 🔴 Advanced
- Vault Agent Injector for Kubernetes — 🔴 Advanced
- Secret rotation and lease renewal — 🔴 Advanced

```bash
# Vault on Kubernetes — Agent Injector pattern

# 1. Install Vault with Helm
helm install vault hashicorp/vault \\\\
  --namespace vault \\\\
  --set "server.ha.enabled=true" \\\\
  --set "server.ha.replicas=3"

# 2. Enable Kubernetes auth method
vault auth enable kubernetes
vault write auth/kubernetes/config \\\\
  kubernetes_host="https://\\$KUBERNETES_PORT_443_TCP_ADDR:443"

# 3. Create policy (least privilege)
vault policy write payment-policy - <<EOF
path "secret/data/production/payment/*" {
  capabilities = ["read"]
}
path "database/creds/payment-role" {
  capabilities = ["read"]
}
EOF

# 4. Bind Kubernetes ServiceAccount to policy
vault write auth/kubernetes/role/payment \\\\
  bound_service_account_names=payment-sa \\\\
  bound_service_account_namespaces=production \\\\
  policies=payment-policy \\\\
  ttl=1h

# 5. Annotate pod — Vault Agent injects secrets automatically
spec:
  serviceAccountName: payment-sa
  annotations:
    vault.hashicorp.com/agent-inject: "true"
    vault.hashicorp.com/role: "payment"
    vault.hashicorp.com/agent-inject-secret-db: \\\\
      "secret/data/production/payment/db"
    vault.hashicorp.com/agent-inject-template-db: |
      {{- with secret "secret/data/production/payment/db" -}}
      export DB_PASSWORD="{{ .Data.data.password }}"
      export DB_HOST="{{ .Data.data.host }}"
      {{- end }}
  # Secret file appears at /vault/secrets/db inside container
```

### Module 03 — Trivy & Container Security
*CVE scanning, image hardening*

Trivy is the most popular open-source vulnerability scanner — scans OS packages, language dependencies, Dockerfile misconfigs, and IaC. Critical CVEs block the build. High CVEs create Jira tickets but allow the build. The best way to reduce vulnerabilities: use minimal base images (distroless, alpine, scratch), run as non-root, set read-only root filesystem. Fewer packages = fewer vulnerabilities.

**Topics covered:**

- Trivy filesystem and image scanning — 🟢 Beginner
- Critical vs High severity handling — 🟡 Intermediate
- Base image selection (distroless, alpine) — 🟡 Intermediate
- Non-root containers — 🟡 Intermediate
- Read-only root filesystem — 🔴 Advanced

```bash
# Trivy scanning in CI/CD
# Filesystem scan (source code + dependencies)
trivy fs \\\\
  --exit-code 1 \\\\
  --severity CRITICAL \\\\
  --ignore-unfixed \\\\
  .

# Image scan
trivy image \\\\
  --exit-code 1 \\\\
  --severity CRITICAL,HIGH \\\\
  --format table \\\\
  myapp:latest

# Kubernetes cluster scan
trivy k8s \\\\
  --report summary \\\\
  cluster

# SBOM (Software Bill of Materials) — list all components
trivy image --format cyclonedx myapp:latest > sbom.json

# Dockerfile best practices for minimal vulnerabilities
# BAD: large base image, runs as root
FROM ubuntu:22.04
RUN apt-get install -y python3
USER root

# GOOD: minimal image, non-root, read-only FS
FROM python:3.11-alpine AS builder
WORKDIR /build
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM gcr.io/distroless/python3     # Google distroless — no shell, no package manager
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY src/ .
USER nonroot                       # distroless has nonroot user built-in
EXPOSE 8080
CMD ["app.py"]

# Pod spec — enforce security at K8s level
securityContext:
  runAsNonRoot: true
  runAsUser: 65534
  readOnlyRootFilesystem: true   # Prevents writing to container FS
  allowPrivilegeEscalation: false
  seccompProfile:
    type: RuntimeDefault
```

### Module 04 — SonarQube
*SAST, quality gates, code coverage*

SonarQube is the leading SAST (Static Application Security Testing) platform. Finds bugs, security vulnerabilities, and code smells before runtime. Quality Gate is the pass/fail threshold — build fails if coverage drops below 80% or critical security issues are introduced. In CI/CD: code pushes → SonarQube analysis → Quality Gate result → pass or block PR merge.

**Topics covered:**

- SonarQube vs SonarCloud — 🟢 Beginner
- Quality Gate configuration — 🟡 Intermediate
- SAST security rules — 🟡 Intermediate
- Integration with Jenkins/GitLab/GitHub — 🟡 Intermediate
- Technical debt and code smells — 🟡 Intermediate

```bash
# SonarQube in Jenkins pipeline
stage('SonarQube') {
  steps {
    withSonarQubeEnv('sonarqube') {
      sh '''
        sonar-scanner \\\\
          -Dsonar.projectKey=myapp \\\\
          -Dsonar.sources=src \\\\
          -Dsonar.tests=tests \\\\
          -Dsonar.python.coverage.reportPaths=coverage.xml \\\\
          -Dsonar.qualitygate.wait=true
      '''
    }
  }
}

stage('Quality Gate') {
  steps {
    timeout(time: 5, unit: 'MINUTES') {
      waitForQualityGate abortPipeline: true
      # Pipeline fails if Quality Gate fails
    }
  }
}

# Quality Gate conditions (set in SonarQube UI):
# ✗ Coverage on New Code < 80%
# ✗ Duplicated Lines on New Code > 3%
# ✗ Maintainability Rating on New Code < A
# ✗ Reliability Rating on New Code < A
# ✗ Security Rating on New Code < A
# ✗ Security Hotspots Reviewed on New Code < 100%

# SonarQube in GitLab CI
sonarqube-check:
  image: sonarsource/sonar-scanner-cli:latest
  variables:
    SONAR_HOST_URL: "https://sonarqube.company.com"
    SONAR_TOKEN: \\$SONAR_TOKEN
  script:
    - sonar-scanner -Dsonar.qualitygate.wait=true
  only: [merge_requests, main]
```

### Module 05 — OPA Gatekeeper & Kyverno
*Policy as Code for Kubernetes*

Admission controllers intercept every API request to Kubernetes and can allow, deny, or mutate it. OPA Gatekeeper uses Rego policy language (powerful but complex). Kyverno uses YAML-native policies (simpler, easier to read). Common production policies: require resource limits, block containers running as root, block latest image tag, restrict to approved registries, require labels for all workloads.

**Topics covered:**

- Admission controllers explained — 🟡 Intermediate
- OPA Gatekeeper — Rego policies — 🔴 Advanced
- Kyverno — YAML-native policies — 🟡 Intermediate
- Common policies: no-root, resource limits, image registry — 🟡 Intermediate
- OPA vs Kyverno decision — 🟡 Intermediate

```bash
# Kyverno — simpler YAML-native policies (recommended for most teams)

# Policy 1: Require resource limits (prevent noisy neighbours)
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: require-resource-limits
spec:
  validationFailureAction: enforce
  rules:
  - name: check-limits
    match:
      any:
      - resources:
          kinds: [Pod]
    validate:
      message: "Resource limits are required for all containers"
      pattern:
        spec:
          containers:
          - resources:
              limits:
                memory: "?*"
                cpu: "?*"

# Policy 2: Block latest image tag
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: no-latest-tag
spec:
  validationFailureAction: enforce
  rules:
  - name: check-image-tag
    match:
      any:
      - resources:
          kinds: [Pod]
          namespaces: [production, staging]
    validate:
      message: "latest tag is not allowed in production"
      pattern:
        spec:
          containers:
          - image: "!*:latest"

# Policy 3: Restrict to approved registries
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: approved-registries
spec:
  validationFailureAction: enforce
  rules:
  - name: check-registry
    match:
      any:
      - resources:
          kinds: [Pod]
    validate:
      message: "Images must come from approved registries"
      pattern:
        spec:
          containers:
          - image: "myacr.azurecr.io/* | harbor.company.com/*"
```

### Module 06 — Falco — Runtime Security
*Real-time threat detection in containers*

Falco is a runtime security tool — it watches what actually happens inside containers and alerts on suspicious behaviour. Uses eBPF probes or kernel module to observe system calls. Built-in rules detect: shell spawned in container, file write to /etc, privilege escalation, crypto miners, network scanners. Cannot be evaded by modifying the container image — it watches kernel-level calls.

**Topics covered:**

- How Falco works (eBPF/kernel module) — 🟡 Intermediate
- Built-in ruleset — 🟢 Beginner
- Custom rules — 🔴 Advanced
- Falco output to Slack/SIEM — 🟡 Intermediate

```bash
# Custom Falco rules
# /etc/falco/custom_rules.yaml

# Alert when shell is spawned in any container
- rule: Shell Spawned in Container
  desc: A shell was spawned inside a running container
  condition: >
    spawned_process and container
    and proc.name in (bash, sh, zsh, dash)
    and container.image.repository != "debug-tools"
  output: >
    Shell spawned (user=%user.name
    container=%container.name
    image=%container.image.repository
    command=%proc.cmdline)
  priority: WARNING
  tags: [container, shell, MITRE_TA0002]

# Alert on sensitive file reads
- rule: Read Sensitive Files
  condition: >
    open_read and
    fd.name in (/etc/shadow, /etc/passwd, /etc/sudoers)
    and container
  output: "Sensitive file read in container (file=%fd.name container=%container.name)"
  priority: CRITICAL

# Falco outputs — send to Slack
# /etc/falco/falco.yaml
program_output:
  enabled: true
  keep_alive: false
  program: |
    jq --raw-output '
      .output as \\$msg |
      {text: "🚨 Security Alert: \\(\\$msg)"}
    ' | curl -d @- -X POST \\$SLACK_WEBHOOK
```

---

## Production Example

```bash
# DevSecOps — Complete Security Architecture

# DEFENSE IN DEPTH — 5 layers:
#
# Layer 1: CODE (developer machine)
# ├── Pre-commit: detect-secrets, gitleaks, hadolint
# └── IDE plugins: SonarLint, Snyk plugin
#
# Layer 2: REPOSITORY (PR/MR)
# ├── SAST: SonarQube, Semgrep, CodeQL
# ├── IaC scan: Checkov, tfsec
# └── Secret scan: GitLeaks, git-secrets
#
# Layer 3: BUILD (CI pipeline)
# ├── Dependency scan: Trivy fs, Snyk
# ├── Container scan: Trivy image
# └── Image signing: Cosign
#
# Layer 4: DEPLOY (Kubernetes admission)
# ├── Policy engine: Kyverno or OPA Gatekeeper
# │   - No root containers
# │   - Resource limits required
# │   - Approved registries only
# │   - No latest tag
# └── Image verification: Cosign verify
#
# Layer 5: RUNTIME (production)
# ├── Runtime security: Falco
# ├── Secret management: HashiCorp Vault
# ├── Zero-trust networking: Network Policies
# └── Service mesh mTLS: Istio/Linkerd

# INTERVIEW ANSWER TEMPLATE:
# "Our DevSecOps pipeline has security gates at every stage.
# At commit time: detect-secrets blocks credential leaks.
# At PR: SonarQube SAST and Checkov IaC scanning.
# At build: Trivy scans both source dependencies and the
# final container image — CRITICAL CVEs block the build.
# At deploy: Kyverno admission policies enforce that no
# container runs as root and all have resource limits.
# At runtime: Falco monitors for suspicious activity
# and Vault provides dynamic secrets with automatic rotation.
# This shift-left approach means security issues cost us
# minutes to fix, not weeks."
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is DevSecOps and why would you use it in production?**

**A:** **Problem:** treating security as a final gate right before production means vulnerabilities get caught after most of the cost (design, implementation, review) has already been sunk — the cost of fixing an issue grows roughly 10x at each stage from dev through production. **Solution:** DevSecOps shifts security checks left, embedding gates at every stage — pre-commit secret scanning, PR-time SAST/IaC scanning, build-time image scanning, deploy-time admission policies, and runtime threat detection — rather than one late-stage security review. **Result:** issues get caught when they're cheapest to fix, and no single tool needs to catch everything, since defense-in-depth means a gap at one stage is likely caught at another.

---

**Q2. How does a DevSecOps pipeline work internally? Explain the architecture.**

**A:** **Problem:** understanding how the different tools at each stage actually fit together (rather than being a random collection) matters for reasoning about coverage gaps. **Solution:** each stage's tools address a genuinely different risk window — pre-commit tools (detect-secrets, gitleaks) prevent secrets from ever entering history; PR-stage tools (SonarQube, Checkov, tfsec) catch code and IaC issues before merge; build-stage tools (Trivy, Snyk) catch dependency/image vulnerabilities; deploy-stage admission controllers (OPA Gatekeeper, Kyverno) enforce policy on what's actually allowed to run; runtime tools (Falco) catch what static analysis structurally can't — actual anomalous behavior once something is already running. **Result:** this is why "no single tool covers everything" isn't a limitation to work around, it's the actual design — each stage catches a different class of risk the others structurally can't.

---

**Q3. What are the main components of a complete DevSecOps toolchain?**

**A:** **Problem:** "DevSecOps" names a genuinely large set of distinct tool categories worth separating. **Solution:** secrets management (Vault — static and dynamic secrets), vulnerability/dependency scanning (Trivy, Snyk), static code analysis (SonarQube), IaC misconfiguration scanning (Checkov, tfsec), Kubernetes admission policy enforcement (OPA Gatekeeper, Kyverno), and runtime threat detection (Falco). **Result:** knowing which category addresses which risk is what lets a team build genuine defense-in-depth rather than redundantly covering one risk category five times while leaving another (like runtime behavior) completely unaddressed.

---

**Q4. How do you handle failures/findings across a multi-stage DevSecOps pipeline?**

**A:** **Problem:** treating every finding at every stage as an identical hard block produces both alert fatigue and inconsistent enforcement across stages. **Solution:** per this guide's own pattern, CRITICAL CVEs block the build outright while HIGH severity creates a tracked ticket without blocking — a deliberate severity-based triage rather than all-or-nothing gating; admission-time policy violations (Kyverno/OPA) block deployment outright since they represent a defined, non-negotiable policy; runtime alerts (Falco) go to incident response rather than blocking anything retroactively, since the workload is already running. **Result:** each stage's appropriate failure response differs — a build-time gate can block; a runtime detection can only alert and trigger response, since there's nothing left to "block" once something is already deployed and running.

---

**Q5. What is your production experience with DevSecOps?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a Trivy/SonarQube finding caught before a bad deploy, tuning an admission policy that was initially too strict or too permissive, or a Falco alert that surfaced genuinely suspicious runtime behavior. Interviewers are listening for whether you've actually operated a multi-stage security pipeline under real delivery pressure, not just read about each tool individually.

---

**Q6. How do you monitor and keep a DevSecOps pipeline effective over time?**

**A:** **Problem:** a pipeline with security gates configured once at adoption can drift out of calibration as the codebase and threat landscape both evolve. **Solution:** track Quality Gate/scan pass rates over time (consistently failing suggests miscalibration; never failing suggests the gate isn't adding real value), periodically re-audit `.trivyignore`/accepted-risk lists for findings that now have available fixes, and treat Falco/runtime alert volume as its own signal — a sudden spike deserves investigation regardless of whether any single alert looks routine. **Result:** DevSecOps tooling, like any security control, needs periodic recalibration — a "configure once" mindset lets both false-positive fatigue and genuine coverage gaps grow unnoticed over time.

---

**Q7. What are the security considerations for the DevSecOps tooling itself, not just what it's scanning?**

**A:** **Problem:** the security tools themselves (Vault, SonarQube, the admission controller) become high-value targets, since compromising them can undermine every downstream security check they're meant to provide. **Solution:** Vault's own root token should be locked away post-setup with day-to-day access via scoped policies; SonarQube/Trivy findings (which describe exploitable weaknesses) deserve the same access control as any other sensitive security data; and admission controller policies themselves need change control, since a modified/disabled policy silently removes a deploy-time safety net without anyone necessarily noticing immediately. **Result:** the tools enforcing security need to be treated with at least the same rigor as the systems they protect — a compromised or misconfigured security tool is a single point of failure for the whole defense-in-depth model.

---

**Q8. How does a shift-left DevSecOps approach compare to a traditional, late-stage security review model?**

**A:** A traditional model concentrates security review at one late gate (often right before production), meaning issues found there are the most expensive to fix (already implemented, already reviewed, already tested) and create a real bottleneck right when a team is trying to ship. Shift-left distributes checks across every stage, catching the same classes of issues far earlier and cheaper, at the cost of needing more tools integrated across more stages of the pipeline rather than one centralized review process — a real tooling/process investment tradeoff, not a free improvement.

---

**Q9. Why are dynamic secrets described as Vault's "killer feature," beyond just being more convenient than static ones?**

**A:** A static secret (a shared username/password stored in Vault's KV store) still carries the same fundamental risk as any long-lived credential — indefinite validity until someone manually rotates it. Dynamic secrets are generated on-demand, short-lived, and automatically expire/revoke — meaning a leaked dynamic credential has a bounded, generally short useful lifetime by design, with a full audit trail of exactly when and to what it was issued. This is a genuinely different security posture, not just a convenience feature — it removes the "did someone remember to rotate this" dependency entirely for the secrets it covers.

---

**Q10. Walk through the complete security gate flow for a code change from commit to production, per this guide's own defense-in-depth model.**

**A:** At commit time, pre-commit hooks (detect-secrets, gitleaks) block credential leaks before they ever enter Git history. At PR time, SonarQube SAST and Checkov/tfsec IaC scanning run automatically, surfacing code-quality/security and infrastructure-misconfiguration issues directly on the PR. At build time, Trivy scans both source dependencies (filesystem scan) and the built container image, with CRITICAL CVEs blocking the build outright. At deploy time, Kyverno or OPA Gatekeeper admission policies enforce non-negotiable rules (no root containers, required resource limits, approved registries only) before anything is admitted to the cluster. At runtime, Falco monitors for genuinely suspicious behavior the earlier static stages couldn't have caught, while Vault provides the dynamic secrets those running workloads need without any long-lived static credential ever existing in the first place.

---

## Official Resources

- [HashiCorp Vault Documentation](https://developer.hashicorp.com/vault/docs)
- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
- [SonarQube Documentation](https://docs.sonarsource.com/sonarqube/)
- [Kyverno Documentation](https://kyverno.io/docs/)
- [Falco Documentation](https://falco.org/docs/)

