# Helm + Kustomize — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concepts

```
Helm = package manager for Kubernetes (apt/yum for K8s analogy)
Chart   — a PACKAGE of K8s YAML templates
Release  — a RUNNING INSTANCE of a Chart (one Chart can have many
           Releases, e.g., staging + prod, each independently versioned)
values.yaml — configuration input; --set OVERRIDES on the command line
Helm TRACKS releases in the cluster — enables upgrade/ROLLBACK with
  full version history (this is the key differentiator over raw
  kubectl apply of templated YAML)
```

## Template Syntax (Go Templating)

```
.Values          — references values.yaml
.Release.Name     — the Helm release name (injected automatically)
_helpers.tpl       — named templates REUSED across the chart (avoid
                     duplicating the same label block in every template)
if/else             — conditional blocks for optional features
range                — iterate over a list (e.g., multiple ingress hosts)
NOTES.txt              — post-install message shown to the user —
                         put ACTIONABLE next steps here, not just a
                         generic "installed successfully"
ALWAYS run helm lint before pushing a chart — catches templating
  errors before they surface as a failed install
```

## Helm vs Kustomize — the Core Distinction

```
Helm      — templating + packaging + RELEASE MANAGEMENT (versioned,
            rollback-capable)
Kustomize — patch-based OVERLAYS on plain YAML, NO templating
            language, NO release tracking — built into kubectl
            (kubectl apply -k)
Choose Helm when you need reusable, versioned, parameterized
  packages distributed to others.
Choose Kustomize when you have YOUR OWN base manifests and just need
  environment-specific overlay patches (dev/staging/prod).
```

## Production Patterns

```
helm diff — preview what upgrade/install would ACTUALLY change,
  before committing (the "terraform plan" equivalent for Helm)
Secrets in values.yaml — NEVER hardcode plaintext, use
  Sealed Secrets / SOPS / external-secrets integration
CI/CD integration — helm upgrade --install (idempotent — works for
  both first install AND subsequent upgrades in one command)
```

## Troubleshooting Quick Reference

```
helm install fails mid-way -> partially-applied resources may remain
  — helm rollback or helm uninstall to clean up, don't just retry blind
values not taking effect -> check --set vs -f precedence order (later
  flags/files override earlier ones; --set has HIGHEST precedence)
Chart renders but resources invalid -> helm template (renders without
  installing) to inspect actual generated YAML before applying
```
