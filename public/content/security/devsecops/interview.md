# DevSecOps Interview Q&A

**Q: Shift-left security — what does it mean?**
Integrate security early in SDLC (development) rather than at the end (deployment). Security checks in IDE, pre-commit hooks, CI pipeline — not just in production monitoring.

**Q: SAST vs DAST?**
SAST (Static): analyze source code without running it. Tools: SonarQube, Semgrep, Bandit. Fast, catches code vulnerabilities. DAST (Dynamic): test running application. Tools: OWASP ZAP, Burp Suite. Finds runtime vulnerabilities.

**Q: What is supply chain security?**
Ensuring integrity of software and dependencies throughout the build/deploy pipeline. Tools: Sigstore/Cosign (image signing), SBOM (software bill of materials), Snyk (dependency scanning), Trivy (container scanning).
