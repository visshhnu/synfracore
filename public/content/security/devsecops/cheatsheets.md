OWASP Top 10 memory aid: Injection, Broken Auth, Sensitive Data Exposure, XXE, Broken Access Control, Security Misconfiguration, XSS, Insecure Deserialization, Using Components with Known Vulnerabilities, Insufficient Logging.


# DevSecOps Quick Reference

## Shift-Left Security Checklist

```
PRE-COMMIT
  [ ] Secret scanning: git-secrets, detect-secrets, Gitleaks
  [ ] SAST: Semgrep rules in IDE plugin

PULL REQUEST / CI
  [ ] SAST: SonarQube, Semgrep, CodeQL
  [ ] Dependency scanning: Snyk, Dependabot, OWASP Dependency-Check
  [ ] IaC scanning: Checkov, tfsec, Terrascan
  [ ] Container scanning: Trivy, Grype, Snyk Container
  [ ] Secret detection: prevent secrets reaching remote

BUILD / REGISTRY
  [ ] Image signing: Cosign + Sigstore
  [ ] SBOM generation: Syft (CycloneDX/SPDX format)
  [ ] Base image: use minimal, official, pinned digests

DEPLOY / RUNTIME
  [ ] Admission control: Kyverno/OPA Gatekeeper policy
  [ ] Runtime security: Falco for anomaly detection
  [ ] RBAC: principle of least privilege
  [ ] Network policy: default-deny, explicit allow
  [ ] Secrets management: Vault or External Secrets Operator
```

## Key Tools by Category

| Category | Tool | What it Does |
|----------|------|-------------|
| SAST | Semgrep | Pattern-based code scanning |
| SAST | SonarQube | Code quality + security analysis |
| DAST | OWASP ZAP | Dynamic testing of running app |
| Dependency | Snyk | SCA - finds CVEs in dependencies |
| Container | Trivy | Image + filesystem + IaC scanning |
| IaC | Checkov | Terraform/CloudFormation policy |
| IaC | tfsec | Terraform security rules |
| Secrets | detect-secrets | Prevents secrets in commits |
| Runtime | Falco | Kubernetes runtime threat detection |
| Signing | Cosign | OCI artifact signing |
| Policy | Kyverno | Kubernetes admission policies |
