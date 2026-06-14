# Security -- Portfolio Projects

---

## Project 1: Automated Security Pipeline (DevSecOps)

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `devsecops-pipeline`

CI/CD pipeline with security gates: SAST, dependency scanning, container scanning, secret detection.

```yaml
# .github/workflows/security.yml
name: Security Pipeline
on: [push, pull_request]

jobs:
  security-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Full history for gitleaks

      - name: Secret detection (gitleaks)
        uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: SAST with Semgrep
        uses: returntocorp/semgrep-action@v1
        with:
          config: auto  # Auto-detect rules for your language

      - name: Dependency audit
        run: npm audit --audit-level=high  # Fail on high CVEs

      - name: Build container
        run: docker build -t app:${{ github.sha }} .

      - name: Container scan (Trivy)
        uses: aquasecurity/trivy-action@master
        with:
          image-ref: app:${{ github.sha }}
          severity: CRITICAL
          exit-code: 1

      - name: IaC scan (Checkov)
        uses: bridgecrewio/checkov-action@main
        with:
          directory: ./terraform
          soft_fail: false
```

**Steps:** All 4 gates (SAST, dependencies, container, secrets), baseline findings, fix critical issues, document policy

---

## Project 2: Cloud Security Audit Automation

**Level:** Advanced | **Time:** 3 days | **GitHub:** `aws-security-audit`

Automated AWS security audit with Prowler + custom checks + HTML report generation.

```python
import subprocess, json, boto3

def run_prowler_scan():
    result = subprocess.run(
        ["prowler", "aws", "--output-formats", "json", "-s", "s3", "iam", "ec2"],
        capture_output=True, text=True
    )
    return json.loads(result.stdout)

def find_public_s3_buckets():
    s3 = boto3.client("s3")
    public = []
    for bucket in s3.list_buckets()["Buckets"]:
        name = bucket["Name"]
        try:
            acl = s3.get_bucket_acl(Bucket=name)
            for grant in acl["Grants"]:
                if "AllUsers" in grant.get("Grantee", {}).get("URI", ""):
                    public.append({"bucket": name, "severity": "CRITICAL"})
        except Exception as e:
            pass
    return public

def generate_html_report(findings: list) -> str:
    critical = [f for f in findings if f.get("severity") == "CRITICAL"]
    high     = [f for f in findings if f.get("severity") == "HIGH"]
    return f"""<html><body>
<h1>Security Audit Report</h1>
<p>Critical: {len(critical)} | High: {len(high)}</p>
<h2>Critical Findings</h2>
{"".join(f"<p>{f["title"]}: {f["description"]}</p>" for f in critical)}
</body></html>"""
```

**Steps:** Prowler scan, custom checks, HTML report, email report, schedule weekly

---

## Portfolio Checklist
- [ ] Security pipeline blocks on critical findings (not just warns)
- [ ] Zero secrets in any Git commit (gitleaks clean)
- [ ] Trivy report shows 0 critical CVEs
- [ ] Document: what was found, what was fixed, what was accepted risk
