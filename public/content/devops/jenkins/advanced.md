# Jenkins — High Availability, Security & Optimization

## High availability: active/standby, not active/active

Jenkins doesn't natively support true active/active clustering the way stateless web services do — its job state and configuration live on the controller's local filesystem. The standard HA pattern is active/standby: a standby controller with access to the same shared storage (job configs, build history) can take over if the primary fails, but only one controller is actually serving traffic at a time. The Jenkins Operator (for Kubernetes-hosted Jenkins) automates much of this failover, but the underlying constraint — one active controller at a time — doesn't go away, it's just managed more automatically.

## Credentials management: Vault integration over the built-in store

The built-in Jenkins Credentials Store works, but doesn't provide automatic rotation — a credential stored there stays valid until someone manually changes it, even if it should have expired. Integrating with HashiCorp Vault (or a cloud secrets manager) lets Jenkins fetch short-lived, automatically-rotating credentials at build time instead:

```groovy
withVault(configuration: vaultConfig, vaultSecrets: [
    [path: 'secret/myapp/prod', secretValues: [[envVar: 'DB_PASSWORD', vaultKey: 'password']]]
]) {
    sh './deploy.sh'
}
```
A leaked short-lived Vault-issued token expires on its own; a leaked long-lived credential in the built-in store doesn't, meaningfully changing the real risk exposure of any credential leak.

## Configuration as Code (CasC): the whole Jenkins instance, versioned

```yaml
jenkins:
  numExecutors: 0
  securityRealm:
    ldap: { server: "ldap://corp.example.com" }
  authorizationStrategy:
    roleBased:
      roles:
        global: [{ name: "admin", permissions: ["Overall/Administer"] }]
```
CasC defines the Jenkins instance's own configuration — security realm, authorization, global tool locations — as versioned YAML, not manual UI clicks. This makes disaster recovery (rebuild an identical instance from the CasC file) and replicating configuration across multiple Jenkins instances (one per team, or per environment) both genuinely tractable, instead of relying on someone remembering exactly what settings were clicked through the UI originally.

## Pipeline performance: diagnosing a genuinely slow pipeline

The Jenkins Pipeline Stage View and Blue Ocean's timeline both show per-stage timing directly — start there before guessing at causes. Common real culprits, roughly in likely-impact order: no dependency caching (reinstalling everything from scratch every build), agent provisioning overhead (a Kubernetes agent's pod startup time, uncached, adding 10-30 seconds per build), sequential stages that have no real dependency on each other and could run in parallel, and an oversized Docker build context being sent to the daemon on every image build.

## Distributed builds at scale: static pools vs. dynamic Kubernetes agents

Static agent pools (a fixed set of pre-provisioned build machines) have predictable capacity and no per-build startup overhead, but sit idle (and cost money) outside peak build periods, and need manual capacity planning as build volume grows. Dynamic Kubernetes agents (Intermediate) scale to exactly the concurrent build demand and cost nothing when idle, at the cost of real per-build pod startup latency. At meaningful scale, a hybrid is common: a small static pool for latency-sensitive, frequent builds, with Kubernetes-provisioned agents absorbing burst capacity beyond what the static pool covers.

## Security hardening checklist for a production Jenkins instance

- Controller runs zero executors (`numExecutors: 0`) — enforces the isolation principle from Fundamentals at the configuration level, not just as a convention people might forget.
- Matrix-based or role-based authorization, not the default "logged-in users can do anything" — least privilege applied to Jenkins' own permission model, the same principle as any other system.
- Script approval enabled for Groovy sandbox — unrestricted Groovy execution in pipeline scripts is a genuine code-execution risk if pipeline definitions come from less-trusted sources (e.g., contributor PRs in an open-source-adjacent setup).
- Plugins kept current, but deliberately — security patches matter, but blindly auto-updating every plugin on every release risks unexpected breaking changes; a controlled update cadence with testing balances both concerns.
- Audit logging enabled — who ran what job, who changed what configuration, retained long enough to actually investigate an incident after the fact, not just for the current session.
