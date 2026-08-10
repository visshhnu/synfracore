# Security Fundamentals — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from security postmortems and public breach retrospectives industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The public S3 bucket that "shouldn't have mattered"

**The pattern:** A developer creates an S3 bucket for storing what they consider low-sensitivity data — application log exports, meant to feed an internal dashboard. To make the dashboard's job easier, they set the bucket to allow public read access rather than configuring the specific IAM role the dashboard needs, planning to "fix it properly later." The logs, as it turns out, include full request payloads for a debug endpoint — which include session tokens and, for a subset of requests, plaintext form submissions containing customer email addresses and partial payment details that a downstream validation step was supposed to redact but didn't always catch.

**Why this is a genuinely common failure mode, not just carelessness:** this course's own material already lists "S3 buckets publicly accessible" as one of the most common cloud misconfigurations behind real breaches — precisely because "just make it public for now" is the path of least resistance when the correct alternative (a scoped IAM role or bucket policy) takes more setup time under deadline pressure. The mistake isn't usually "I don't know public buckets are risky" — it's "this specific bucket felt low-stakes enough to skip the correct setup, just this once."

**What actually prevents this, beyond "don't make buckets public":**
- **Default-deny at the account/organization level**, not per-bucket vigilance: AWS's S3 Block Public Access setting can be enforced at the account or organization level so that making a bucket public requires an explicit, auditable exception rather than being the easy default path.
- **Assume any data that reaches a bucket eventually gets exposed to whatever reads that bucket**, and classify data at the point of writing it rather than trusting a later step to redact it — the debug endpoint should never have logged full request payloads including tokens and payment fields in the first place, regardless of where those logs ended up. The bucket permission was the visible failure; the payload-logging decision upstream was the deeper one.
- **Automated scanning for public buckets/misconfigurations** (this course's own material references Trivy and similar tools for config scanning) catches this class of mistake quickly if it runs continuously, rather than relying on someone noticing during a manual review.

---

## Scenario 2 (illustrative/composite): The SSRF that reached the cloud metadata endpoint

**The pattern:** A web application has a "fetch preview image from URL" feature — a user submits a URL, and the server fetches it server-side to generate a thumbnail. An attacker submits `http://169.254.169.254/latest/meta-data/iam/security-credentials/[role-name]` instead of an image URL. Because the server has no allowlist restricting which URLs it will fetch, it dutifully retrieves the cloud instance's metadata service response — which, if the instance's IAM role has meaningful permissions attached, hands the attacker temporary AWS credentials scoped to whatever that role can do.

**Why this specific pattern is so consistently dangerous:** the cloud metadata endpoint (`169.254.169.254` on AWS, with equivalents on Azure/GCP) is *designed* to be reachable without authentication from inside the instance — that's the whole mechanism by which an EC2 instance gets its IAM role's temporary credentials without a human typing in a secret. An SSRF vulnerability turns that convenience feature into a credential-harvesting tool, and the blast radius is exactly as large as whatever permissions the instance's role happens to have — which is why "least privilege for instance roles" and "block SSRF" are really two independent layers of the same defense, not substitutes for each other.

**Why this stays relevant even as OWASP's own categorization shifts:** worth noting explicitly, since this course's existing certification material still lists SSRF as its own standalone Top 10 category (A10:2021) — the current **OWASP Top 10:2025** folded SSRF into Broken Access Control rather than keeping it separate. That's a change in how OWASP *categorizes* the risk for awareness/training purposes, not a signal that the underlying attack itself has become less relevant or less dangerous — this exact pattern is still a live, common finding in real application security assessments.

**What actually prevents this:**
- **Allowlist destination hosts/schemes for any server-side fetch feature**, rather than trying to blocklist "bad" destinations — a blocklist of private IP ranges is easy to bypass via DNS rebinding or redirect chains that only resolve to a private IP after the initial validation check passes.
- **IMDSv2 (AWS's session-oriented metadata service version) specifically defends against basic SSRF-to-metadata attacks** by requiring a PUT request to obtain a session token before any GET request succeeds — a detail worth knowing specifically because a simple SSRF that can only make GET requests (the common case for a "fetch this URL" feature) often can't complete the multi-step handshake IMDSv2 requires, even if it can still reach the endpoint's IP. This isn't a complete fix on its own, but it's a meaningfully different risk profile from IMDSv1, and enforcing IMDSv2-only at the instance level is a genuinely valuable independent layer.
- **Least-privilege IAM roles on the instance itself** — even a successful SSRF-to-metadata attack is far less damaging if the role it exposes can only do a narrow, specific task rather than broad account access.

---

## Scenario 3 (illustrative/composite): The secret that lived in git history long after it was "removed"

**The pattern:** A developer accidentally commits a database password directly in a config file, realizes the mistake an hour later, and fixes it by editing the file in a new commit to remove the password and pushing that fix. The repository now looks clean in its current state — but the original commit containing the plaintext password is still fully present in the repository's git history, which anyone with clone access (including, eventually, a departing contractor, a misconfigured CI system, or a compromised developer laptop) can retrieve with a single `git log -p` or by checking out that specific historical commit.

**Why "I fixed it in a later commit" doesn't actually fix it:** git history is additive by design — a later commit that removes a secret from the current file state doesn't remove it from the repository's history at all, and anyone who clones the repo gets every historical commit along with the current state. The secret is exactly as exposed as it was the moment it was first committed, for as long as that git history exists anywhere (including in any fork, local clone, or CI cache made before the "fix").

**What actually addresses this, in order of how commonly each step is actually taken:**
- **Rotate the exposed credential immediately** — this is the only step that actually neutralizes the specific exposure; everything else is prevention or cleanup, not remediation of the leak itself. A secret that's been rotated is safe even if the old value remains visible in history forever.
- **Prevent it before it happens**: this course's own material already covers `gitleaks protect --staged` as a pre-commit hook specifically to catch this class of mistake before it's ever committed at all — the cheapest point in the whole process to catch it.
- **Continuous scanning of the full repo history** (not just new commits) — `gitleaks detect --source . --log-opts="--all"`, also already in this course's material — catches secrets that were committed before scanning was set up, which matters for any repo with history older than its current security tooling.
- **History rewriting (`git filter-repo`, BFG Repo-Cleaner) to actually purge the secret from history** is possible but disruptive (rewrites every commit hash downstream of the change, breaking any existing clones/forks/PRs) — worth knowing this exists, but rotation is the step that actually matters; history-rewriting is closer to hygiene than to remediation, since the credential must be treated as compromised regardless of whether the history gets scrubbed.
