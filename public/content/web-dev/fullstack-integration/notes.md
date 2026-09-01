# Full-Stack Integration & Deployment — Revision Notes

Condensed from Overview, Intermediate, Advanced, and Troubleshooting — for quick review, not first-time learning.

## The core shape

A full-stack app = frontend (React/Next.js) → backend API (Express or Next.js API routes) → database (PostgreSQL, typically) → protected by auth → deployed somewhere real. Most real difficulty lives at the **seams** between these pieces, not inside any one piece — that's this whole technology's premise.

## CORS

- A browser security mechanism, not a server-side restriction — the backend can receive and process a request just fine and the browser can still block the *frontend JS* from reading the response
- Fix: server explicitly allows a specific origin via response headers, driven by an env var per environment — never `origin: '*'` combined with `credentials: true`
- Symptom that always means "check CORS first": worked on `localhost`, broke immediately after deploying frontend and backend to different real domains

## Environment variables

- Backend variable = private, server-only, never transmitted to the browser
- Frontend variable (`NEXT_PUBLIC_` in Next.js) = baked into the shipped JS bundle at build time, readable by anyone via dev tools
- Rule: secrets (DB credentials, signing secrets, private API keys) are backend-only, always

## Auth token flow (memorize this chain, not just the pieces)

Login form → POST credentials → backend verifies + issues token → frontend stores token → frontend attaches token (`Authorization: Bearer <token>`) on every subsequent protected request → backend middleware verifies token *before* the route handler runs → `req.user` available to the handler.

A break anywhere in this chain produces the same symptom (401) — trace the whole chain, don't guess at one link.

## Status code discipline (frontend and backend must agree)

- `400` — malformed request, frontend-fixable
- `401` — missing/invalid auth → frontend should clear token, prompt re-login
- `403` — authenticated but not permitted → do NOT clear token or prompt re-login
- `404` — resource doesn't exist
- `500` — genuine backend/DB failure, not fixable by changing the request

## AI-assisted development

Good fit: boilerplate, tests for logic you understand, unfamiliar syntax lookups. Keep human judgment: architecture decisions, anything security-sensitive (auth, DB queries touching user input). The actual professional skill: scoped prompting + reviewing output like a teammate's PR, being able to explain every shipped line.

## Deployment topology

- Together (same origin): no CORS between frontend/backend, one deployment, but backend inherits frontend platform's constraints
- Separately: independent scaling/release, but CORS is back and two deployments must stay in sync
- Real deciding factor: does the backend need something a frontend-first platform doesn't support well (persistent connections, heavy compute)?

## Environment parity / drift

Dev/staging/production should be configured as identically as practical. Drift (an env var set in staging but never set in production; a database version mismatch) is one of the most common full-stack-specific bug sources — because a full-stack app has more independently-configured pieces than a single-technology app.

## Explicit scope boundary — what this technology deliberately does NOT teach in depth

- Database schema/indexing/query depth → Databases academy, PostgreSQL technology
- CI/CD pipeline construction → DevOps academy, CI/CD Pipelines technology
- Container/Dockerfile depth → DevOps academy, Docker technology
- Deep AI tooling capabilities → AI Engineering academy

This scoping is deliberate and load-bearing, not a content gap — this technology teaches the integration points only.

## Top 5 troubleshooting patterns (see Troubleshooting tab for full detail)

1. CORS error after deploying to a different domain than local dev
2. Auth token works locally, fails after deployment (missing env var on the platform)
3. Frontend calling a hardcoded `localhost` URL instead of an env-var-driven one
4. Dev/production configuration drift causing environment-specific bugs
5. Database connection works locally, fails in production (SSL, host, or firewall difference)

## Versioning Note

The following are genuinely volatile and should be rechecked against current sources, not treated as fixed: specific deployment platforms' exact current free-tier limits, pricing, and feature sets (Vercel, Railway, Render, and any others) `(needs verification — recheck against current source)`; AI coding assistant tooling specifics — which tools exist, their exact current capabilities, and how they're best used in a real workflow — this space moves fast and genuinely changes month to month `(needs verification — recheck against current source)`. The durable parts of this technology — CORS as a browser mechanism, the frontend/backend/database/deployment architecture shape, the public/private environment-variable security distinction, and the general integration-layer skill itself — are stable and do not need this caveat.
