# DevSecOps

> **Vault, Trivy, SonarQube, OPA, Kyverno, Falco — security at every stage**

**Category:** DevSecOps  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is DevSecOps?

Shift-left means catching security issues as early as possible — in the developer's editor or at commit time, not in production. The cost of fixing a vulnerability grows 10x at each stage: dev → PR → build → staging → production. A complete DevSecOps pipeline has security gates at every stage. No single tool covers everything — defense in depth.

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

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is DevSecOps and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does DevSecOps work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of DevSecOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in DevSecOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with DevSecOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe DevSecOps in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for DevSecOps?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does DevSecOps compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain DevSecOps Pipeline in DevSecOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain HashiCorp Vault in DevSecOps."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [HashiCorp Vault Documentation](https://developer.hashicorp.com/vault/docs)
- [Trivy Documentation](https://aquasecurity.github.io/trivy/)
- [SonarQube Documentation](https://docs.sonarsource.com/sonarqube/)
- [Kyverno Documentation](https://kyverno.io/docs/)
- [Falco Documentation](https://falco.org/docs/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*