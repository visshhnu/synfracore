# DevSecOps — Intermediate

## Designing security gates that don't get bypassed out of frustration

The single biggest failure mode in real DevSecOps rollouts isn't a missing tool — it's a security gate strict enough that developers route around it (disabling the check, adding broad suppressions, or simply not running the pipeline stage locally before pushing). The fix is a deliberate two-tier gate design: **block** on findings with both high confidence and high severity (a hardcoded AWS key, a Critical CVE with a known exploit) where a false positive is rare and the cost of missing a true positive is severe; **warn** (surface in the PR, don't block merge) on everything with meaningful false-positive risk or lower severity, routed to a dashboard or ticket instead of an interrupted pipeline. A team that blocks on every Medium-severity Trivy finding trains itself to stop reading Trivy output, which is a worse outcome than a slightly noisier warn-only tier that people actually look at.

## SBOM and software supply chain — why this became a real requirement, not a nice-to-have

A Software Bill of Materials (SBOM) is a complete, machine-readable inventory of every component — direct and transitive dependencies — that went into a build. The practical driver: when a critical CVE in a widely-used library is disclosed (Log4Shell being the canonical example), the first question every security team needs answered immediately is "which of our services actually use this, and at what version" — without an SBOM, that answer requires manually auditing every service's dependency tree under time pressure, which is exactly the scenario that turned SBOM generation from optional into standard practice.

```bash
# Generate an SBOM as part of the build, not as an afterthought
trivy image --format cyclonedx myapp:latest > sbom.json

# Query it later against a newly-disclosed CVE without re-scanning everything
grep -i "log4j" sbom.json
```
The SBOM should be generated and stored at build time, alongside the image, not regenerated from scratch when a new CVE is announced — the entire point is having the inventory already on hand before the question is urgent.

## Image signing and provenance: proving a build wasn't tampered with

CVE scanning answers "does this image have known vulnerabilities." Signing answers a different question: "is this actually the image our pipeline built, unmodified, or has it been swapped for something else between build and deploy." Cosign (part of the Sigstore project) signs an image at build time and verifies that signature before deploy — an admission controller can be configured to refuse to run any image that isn't signed by the expected pipeline identity, which closes a real gap that vulnerability scanning alone doesn't address: a compromised registry or a man-in-the-middle substitution wouldn't necessarily introduce a *known* CVE, but it would break signature verification.

```bash
# Sign at the end of a trusted build pipeline
cosign sign --key cosign.key myregistry/myapp:latest

# Verify before deploy — this is the actual enforcement point
cosign verify --key cosign.pub myregistry/myapp:latest
```
The SLSA framework (Supply-chain Levels for Software Artifacts) formalizes this into a maturity model — from "some provenance exists" up through "builds are fully reproducible and verifiable end-to-end" — worth knowing as the vocabulary this space increasingly gets discussed in, even if a team isn't formally targeting a specific SLSA level.

## Threat modeling: the step most pipelines skip entirely

Automated scanning (SAST, dependency, container) finds *known* vulnerability patterns in code that already exists. Threat modeling is a design-time exercise, done before or alongside implementation, that asks a different question: given this system's actual architecture, what are the realistic ways it could be attacked, independent of any specific known CVE. **STRIDE** is the most commonly used framework for structuring this: Spoofing (can someone impersonate a legitimate user/service), Tampering (can data be modified in transit or at rest without detection), Repudiation (can an action be denied due to inadequate logging), Information Disclosure (can data leak to someone unauthorized), Denial of Service, Elevation of Privilege. A 30-minute STRIDE walkthrough on a new service's architecture diagram, before the first line of code, routinely surfaces design-level issues (a missing auth check between two internal services, an overly broad IAM role) that no amount of later automated scanning would ever catch, because scanning only checks code against known-bad patterns — it can't evaluate whether the architecture itself makes sense from a security standpoint.

## Managing false-positive fatigue, specifically

Every scanning tool in a DevSecOps pipeline (SAST, dependency scanning, container scanning) produces false positives, and an unmanaged, growing backlog of unreviewed findings is what actually causes teams to stop trusting — and eventually ignore — the tooling entirely. The practical discipline that prevents this: every suppression must be an explicit, reviewed, and commented decision (`# nosec: false positive, this input is validated upstream at line 42`), never a silent blanket exclusion of a whole rule or directory. A suppression with no comment explaining *why* is indistinguishable, a year later, from someone having disabled the check just to unblock a merge — which defeats the entire purpose of having the gate.

## Security champions: scaling a security team that can't review everything

A central security team of a handful of engineers cannot manually review every PR across an organization with dozens of services — this doesn't scale, and trying to force it creates exactly the gate-bypassing problem described above. The security champions model embeds one security-minded engineer per team (not a full-time security hire, an existing engineer with extra training and a standing relationship with the central security team) who handles first-line triage of that team's security findings and knows when to escalate. This converts security from "a team that reviews everyone else's code" into "a distributed practice with a central team providing tooling, training, and escalation support" — a structural change that matters more for actual security posture at scale than any single tool choice.
