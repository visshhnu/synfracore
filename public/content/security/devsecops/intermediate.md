pipeline, blocks everything else if it fails. semgrep SAST runs in 30-60 seconds — runs in parallel with dependency scanning. Trivy image scan runs in 60-90 seconds — runs after build. Slow tools (DAST, full dependency tree analysis) run nightly, not on every commit. Separate blocking from informational: CRITICAL vulnerabilities block the pipeline. HIGH vulnerabilities create issues but do not block (unless in a security-sensitive service). MEDIUM/LOW are reported as dashboard metrics. Caching: cache dependency vulnerability databases locally so Trivy does not re-download on every run. Use ignore-unfixed: true in Trivy — skip CVEs that have no patch available (developers cannot act on them anyway). At HPE: our full DevSecOps pipeline adds 3 minutes to a CI run. Without it: we had a dependency vulnerability in production for 8 months before a pentest found it.

DEVSECOPS · PRODUCTION
A critical CVE was discovered in a library your 20 microservices use. How do you respond?
Triage first, then fix. Step 1: assess impact. Read the CVE details — is it exploitable in your context? A remote code execution CVE in a library you only use for local file parsing is low actual risk. Step 2: identify affected services. Your CI/CD pipeline with dependency scanning (Trivy, npm audit, Dependabot) should tell you which services use the vulnerable version. Query your artifact registry if you have an SBOM (Software Bill of Materials). Step 3: patch systematically. Update the dependency version. Run the test suite. For critical CVEs with active exploitation: patch production within 24 hours if possible. For others: next scheduled deployment cycle. Step 4: verify. After patching each service, re-run Trivy to confirm the CVE is resolved. Step 5: prevent recurrence. If Dependabot or Renovate is not already configured for automated dependency updates, enable it now. Set up weekly automated PR creation for dependency updates. Enable GitHub security advisories notifications. Step 6: SBOM. Maintain a Software Bill of Materials for all services so next CVE query takes minutes not hours.

DEVSECOPS · ENGINEER
What is the difference between SAST, DAST, and SCA?
SAST (Static Application Security Testing): analyses source code without executing it. Finds: SQL injection patterns, hardcoded credentials, insecure function calls, buffer overflows. Tools: Semgrep, SonarQube, Checkmarx. Runs fast, can run on every commit. Cannot find issues that only appear at runtime. DAST (Dynamic Application Security Testing): tests a running application by sending attack payloads. Finds: XSS vulnerabilities, authentication bypasses, API security issues, runtime misconfigurations. Tools: OWASP ZAP, Burp Suite. Requires a deployed application so cannot run on every commit. Usually runs in staging environment. SCA (Software Composition Analysis): analyses your dependencies and third-party libraries for known CVEs. Finds: vulnerable npm packages, outdated Java jars with known exploits. Tools: Trivy, OWASP Dependency Check, Snyk, Dependabot. Uses CVE databases (NVD, OSV). Can run on every commit on the dependency manifest files. All three are complementary: SAST for your code, SCA for your dependencies, DAST for your running application. A mature DevSecOps pipeline uses all three at appropriate stages.

Continue Learning
[🔧 Jenkins](/devops/jenkins.html)[⚡ GitHub Actions](/devops/github-actions.html)[☸️ Kubernetes](/devops/kubernetes.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
