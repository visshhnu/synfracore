# Full-Stack Integration & Deployment — Advanced

## Deployment topology: together vs. separately

There is no universally correct deployment topology for a full-stack app — the right choice depends on what the backend actually needs.

**Deployed together** (e.g. a Next.js app whose own API routes serve as the backend, deployed as a single unit to a platform like Vercel): frontend and backend share an origin, which eliminates CORS entirely for calls between them, and there's only one deployment to configure and monitor. The tradeoff: the backend is coupled to the frontend's deployment platform and release cycle, which becomes a real constraint if the backend later needs something the frontend's platform doesn't support well (a long-running process, a persistent WebSocket connection, heavier compute).

**Deployed separately** (a static/edge-hosted frontend on one platform, an Express backend on a platform built for persistent servers, like Railway or Render): each piece scales and releases independently, and the backend can run on infrastructure suited to its actual needs. The tradeoff: CORS is back in play (see Fundamentals), and now there are two deployments, two sets of environment variables, and two places configuration can drift out of sync (see environment parity, below).

```conceptgrid
{
  "boxes": [
    { "title": "Together", "description": "Same origin, no CORS, one deployment -- but backend is coupled to the frontend platform's constraints", "color": "green" },
    { "title": "Separately", "description": "Independent scaling and release cycles -- but CORS returns, and two deployments must stay in sync", "color": "amber" },
    { "title": "The real deciding factor", "description": "Does the backend need something a frontend-first platform doesn't support well (persistent connections, heavy compute, long-running jobs)?", "color": "blue" }
  ]
}
```

*(needs verification — specific platforms' exact current capabilities and limits for persistent servers vs. edge/serverless functions change; recheck against current docs before treating a specific platform's constraints as fixed)*

## CI/CD for a full-stack app: what changes, what doesn't

A full-stack app's CI/CD pipeline has to handle two things a single-technology pipeline doesn't: coordinating deploys of two pieces that depend on each other's contract (an API shape, an environment variable), and making sure a deploy of one piece doesn't silently break against the currently-deployed version of the other. **This platform's own DevOps academy — specifically its CI/CD Pipelines technology — covers building the actual pipeline in real depth (stages, triggers, artifact promotion, rollback strategy); this section only covers what's specific to a full-stack app's pipeline, not pipeline-building itself.**

The full-stack-specific concerns worth naming here:
- **Backward-compatible API changes as a deploy discipline** — if frontend and backend deploy independently, a backend change that removes a field the currently-deployed frontend still expects breaks production during the gap between the two deploys, even if both deploys individually succeed.
- **Environment variables set per-environment in the pipeline itself**, not just locally — a pipeline that builds correctly but deploys with a missing or stale environment variable produces a build that looks successful and behaves wrong (see Troubleshooting).
- **Running both frontend and backend's tests in the same pipeline run before either deploys**, so a change that breaks the other side's expectations is caught before it ships, not after.

For the actual pipeline configuration — YAML syntax, build caching, deployment triggers, rollback mechanics — go directly to the DevOps academy's CI/CD Pipelines technology.

## Containerizing a full-stack app for deployment

Similarly, **this platform's own DevOps academy — specifically its Docker technology — covers building and optimizing containers in real depth** (multi-stage builds, layer caching, non-root users, image scanning). What's specific to a full-stack app, not covered there: a full-stack app frequently needs *two* containers, not one — a frontend container and a backend container, coordinated via Docker Compose in local development (or separate deployment targets in production), each with its own environment variables, and often a shared network so the backend container is reachable from the frontend container by name during local development.

```yaml
# docker-compose.yml -- local development only, illustrative
services:
  frontend:
    build: ./frontend
    ports: ["3000:3000"]
    environment:
      - NEXT_PUBLIC_API_URL=http://localhost:4000
  backend:
    build: ./backend
    ports: ["4000:4000"]
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/myapp
    depends_on: [db]
  db:
    image: postgres:16-alpine
    environment:
      - POSTGRES_PASSWORD=devpassword
```

For the Dockerfile itself — layer ordering, multi-stage builds, security posture — see the DevOps academy's Docker technology; that content applies directly and unchanged to either container here.

## Environment parity: why dev/staging/production drift causes real bugs

**Environment parity** means dev, staging, and production are configured as similarly to each other as practically possible — same database engine and version, same required environment variables (with different values), the same general topology. **Drift** — a difference between environments that wasn't deliberate — is one of the most common sources of "it worked in every environment except the one that actually matters" bugs in full-stack apps specifically, because a full-stack app has more moving pieces (frontend config, backend config, database, auth secrets) that all have to independently stay in sync across every environment.

Concrete, common drift patterns:
- A new backend environment variable added locally and in staging, but never actually set on the production deployment platform — the app runs, but a specific feature silently fails or crashes only in production
- Different database versions or extensions available in dev vs. production — a query that works locally fails against production's older engine
- A frontend pointed at a staging API URL that accidentally ships in a production build, because the environment variable wasn't correctly scoped per environment during the build

The discipline that actually prevents this: treat every environment variable as something that must be explicitly set in *every* environment it's needed in, verified as part of the deploy process — not assumed to carry over because it worked somewhere else once.

## Monitoring and logging a deployed full-stack app, conceptually

At a conceptual level (not a specific tool's setup, which changes fast and is genuinely covered better elsewhere): a deployed full-stack app needs visibility into both halves independently, because a failure in one can look identical to a failure in the other from the outside. Frontend-side error tracking (catching and reporting JavaScript errors and failed API calls actually experienced by real users, not just what you happen to notice while testing) and backend-side logging (structured logs of requests, errors, and database query failures, ideally centralized rather than scattered across individual server instances) together are what let you tell, quickly, which side of a production incident actually failed — a CORS error, an auth token issue, and a database outage can all present to a user as "the page is broken," and only proper logging on both sides distinguishes them without guesswork.

*(needs verification — specific monitoring/logging tooling and its current feature set changes frequently; the concept of needing visibility into both halves independently is durable, the specific tool choice is not)*
