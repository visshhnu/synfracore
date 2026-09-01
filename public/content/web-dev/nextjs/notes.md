# Next.js — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept

```text
Next.js = a META-FRAMEWORK built on top of React -- adds routing,
  rendering-strategy choice, and build tooling that plain React
  deliberately does NOT provide on its own.
Still built from React components/props/state/hooks underneath --
  Next.js does not replace React's component model.
Request flow: incoming request -> file-system routing match ->
  rendering-strategy decision -> response.
```

## Rendering Strategies (the core durable tradeoff)

```text
Ahead-of-time  -- fastest, cheapest per-visit, risk of staleness
Per-request    -- always fresh, real server cost every visit
Client-side    -- most interactive, weaker default SEO/first-paint
The actual skill: match each PAGE's real freshness need to the
  cheapest strategy that satisfies it -- not defaulting to "always
  fresh" everywhere out of caution (a genuinely common real mistake).
```

## Routing

```text
File-system routing: a file's location determines its URL -- durable
  as a CONCEPT, exact file-naming conventions need verification.
Two real historical paradigms exist in the wild: Pages Router
  (original) and App Router (introduced later) -- both appear in
  real codebases and real tutorials; know both exist.
Shared layouts avoid re-implementing common page chrome per route.
```

## Common Failure Modes (verified from this guide's Troubleshooting)

```text
Hydration mismatch     -> server-rendered output didn't match client's
  first render -- usually Date.now()/Math.random()/window access
  happening directly during render instead of after mount
Env var undefined client-side -> read a server-only variable from
  code that actually runs in the browser
Stale data shown       -> rendering strategy + revalidation config
  working exactly as configured, just not as the team intended
Works locally, fails CI -> Node version drift, import path casing
  (case-sensitive filesystems differ), missing CI env vars
Works locally, breaks in prod -> browser-only code (window/document)
  imported into something that also renders on the server
```

## Interview-Readiness Checklist

```text
1. Explain what a meta-framework adds over plain React
2. Explain the rendering-strategy tradeoff and pick correctly
   for a concrete example page
3. Explain the historical Pages-to-App-Router shift as real history
4. Explain WHY server/client env-var separation is a security
   mechanism, not just a naming convention to memorize
5. Walk through diagnosing a hydration-mismatch bug end to end
```

## Versioning Note — read this before trusting any API name in this guide

**This is the single most important note across this entire academy's content, and it's worth repeating explicitly:** Next.js has already changed its core routing/rendering paradigm once in its real history — the Pages Router was the original model; the App Router was introduced later as a new paradigm alongside it, built around newer React server-rendering capabilities. Both paradigms are genuinely still encountered in real, active codebases.

Because of this, treat the following as **durable, safe to rely on without re-checking**: the conceptual architecture (meta-framework value proposition), file-system routing as an idea, the three-way rendering-strategy tradeoff as a concept, and the fact that this paradigm shift really happened.

Treat the following as **`(needs verification — recheck against current Next.js docs)`**: every specific API/hook/component name, every specific config file key or CLI flag, which router paradigm is the current default/recommended approach, exact caching/revalidation semantics, and exact edge-runtime capabilities. This guide deliberately tags these throughout rather than stating them as settled fact — do the same in your own notes and code, and always confirm against the current official documentation before shipping.
