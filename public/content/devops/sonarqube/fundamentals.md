# SonarQube Fundamentals — Issue Types, Quality Gates & Analysis

**Analogy** — SonarQube's issue classification works like a building inspector's report categories, not one flat "pass/fail." A structural defect (a Bug) gets treated differently from a code violation that's a real security risk (a Vulnerability), which gets treated differently from "this wiring is technically to code but will be a pain to maintain later" (a Code Smell) — same inspection, genuinely different follow-up actions per category.

## Issue Types

```
BUG               — code that will likely produce incorrect behavior
                     (a null pointer risk, an off-by-one, a logic error)

VULNERABILITY     — a security weakness with a known exploitation risk
                     (SQL injection pattern, hardcoded credentials,
                     insecure cryptographic usage)

CODE SMELL        — a maintainability concern, not strictly incorrect,
                     but riskier/slower to safely change over time
                     (excessive complexity, duplicated logic, unclear
                     naming that obscures intent)

SECURITY HOTSPOT  — a security-sensitive PATTERN requiring human
                     review to determine if it's actually exploitable
                     in this specific context (not auto-classified
                     as a confirmed Vulnerability)
```

The Bug/Vulnerability/Code Smell distinction directly drives how a team should prioritize — a Vulnerability generally deserves urgent attention regardless of how "clean" the surrounding code otherwise is; a Code Smell in rarely-touched, stable code may genuinely be lower priority than the same smell in code changing weekly.

## Severity Levels

```
BLOCKER   — must be fixed immediately, high risk of a real production issue
CRITICAL  — likely to cause a real bug or represent a severe risk
MAJOR     — a real quality/risk concern, standard priority
MINOR     — a minor issue, low impact
INFO      — informational, not necessarily requiring action
```

## Running an Analysis — SonarScanner

```bash
# Basic scan invocation
sonar-scanner \
  -Dsonar.projectKey=my-project \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarqube.example.com \
  -Dsonar.login=<token>

# Language-specific scanners exist for build-tool-integrated
# analysis (Maven, Gradle, .NET) rather than the generic CLI scanner
mvn sonar:sonar -Dsonar.host.url=https://sonarqube.example.com -Dsonar.login=<token>
```

The scanner reads project source, runs the applicable language analyzers, and uploads results to the SonarQube server — the server itself doesn't fetch/analyze code directly, which is why the scanner needs to run wherever the source actually is (a CI runner, a developer's machine via SonarLint for local pre-commit feedback).

## Quality Gates — pass/fail conditions

```
Default gate ("Sonar way"), scoped to New Code:
  - 0 new Bugs
  - 0 new Vulnerabilities
  - Security Hotspots reviewed
  - Coverage on New Code >= 80%
  - Duplicated lines on New Code < 3%
```

A Quality Gate is a set of conditions a project's analysis must satisfy to "pass" — commonly wired into CI/CD so a failing gate blocks a merge/deploy, the same enforcement pattern as any other CI check. Gates can be customized (different thresholds, different conditions) per project or organization, rather than being locked to the default.

## Quality Profiles — what actually gets checked

```
A Quality Profile = a named, language-specific set of active rules
  + severity per rule

Different profiles can apply to different projects -- e.g. a
stricter profile for a new greenfield service, a more lenient
one for a legacy system being gradually improved rather than
held to the same immediate bar
```

Quality Profiles determine WHICH rules run and at what severity — this is a separate configuration axis from the Quality Gate, which determines WHAT COMBINATION of results (across whatever rules did run) constitutes pass/fail. Tuning a Quality Profile (disabling a rule generating persistent false positives for a specific codebase's patterns, or adding a stricter rule for security-sensitive code) is a normal, expected part of adopting SonarQube well, not something to avoid touching.

## Try It (2 Minutes)

Using the issue types section above:

1. Static analysis flags code that constructs a database query using string concatenation with user input. Is this most likely classified as a Vulnerability directly, or a Security Hotspot?
2. A team's Quality Gate is configured to fail on any new Bug or Vulnerability, but not on new Code Smells. Why might a team deliberately choose this configuration rather than gating on Code Smells too?
3. What's the difference between a Quality Profile and a Quality Gate?

You should land on: most likely a Security Hotspot initially — this is exactly the kind of pattern requiring human review to confirm whether the input is actually unsanitized/exploitable in context, rather than an automatic Vulnerability classification; a team might choose this to keep the gate focused on genuinely blocking-worthy issues (bugs and security risks) while treating maintainability concerns as visible-but-non-blocking, avoiding gate fatigue from lower-stakes findings; a Quality Profile determines WHICH rules run and at what severity; a Quality Gate determines what COMBINATION of results from those rules constitutes an overall pass or fail.
