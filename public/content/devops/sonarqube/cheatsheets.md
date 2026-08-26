# SonarQube Quick Reference Cheatsheet

## Basic Scan

```bash
sonar-scanner \
  -Dsonar.projectKey=my-project \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarqube.example.com \
  -Dsonar.login=<token>
```

## Build-Tool-Integrated Scans

```bash
mvn sonar:sonar -Dsonar.host.url=<url> -Dsonar.login=<token>     # Maven
./gradlew sonar --info                                            # Gradle (with plugin configured)
dotnet sonarscanner begin /k:"project-key" ... && dotnet build && dotnet sonarscanner end   # .NET
```

## Pull Request Analysis

```bash
sonar-scanner \
  -Dsonar.pullrequest.key=42 \
  -Dsonar.pullrequest.branch=feature/my-branch \
  -Dsonar.pullrequest.base=main
```

## Branch Analysis

```bash
sonar-scanner -Dsonar.branch.name=feature/my-feature
```

## Coverage Report Import

```bash
# JaCoCo (Java)
-Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
# Python (coverage.py)
-Dsonar.python.coverage.reportPaths=coverage.xml
# JavaScript/TypeScript (LCOV)
-Dsonar.javascript.lcov.reportPaths=coverage/lcov.info
```

## Issue Types

```
BUG               — likely incorrect behavior
VULNERABILITY     — security weakness, known exploitation risk
CODE SMELL        — maintainability concern
SECURITY HOTSPOT  — security-sensitive pattern, needs human review
```

## Severity Ladder

```
BLOCKER > CRITICAL > MAJOR > MINOR > INFO
```

## Default Quality Gate ("Sonar way")

```
0 new Bugs
0 new Vulnerabilities
Security Hotspots reviewed
Coverage on New Code >= 80%
Duplicated lines on New Code < 3%
```

## Security Hotspot Review States

```
TO_REVIEW  →  ACKNOWLEDGED (real risk, needs fix)
           →  SAFE (confirmed not exploitable, documented)
```

## New Code Definitions

```
Previous version | Number of days | Reference branch (clearest for PR workflows)
```
