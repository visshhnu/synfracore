# Express.js — Learning Roadmap

## Estimated Time to Job-Ready
**3-5 weeks** of consistent learning (1-2 hours/day), assuming basic Node.js fluency already — Express itself is a relatively small, focused API surface compared to the runtime it sits on, so most of the time investment is in building real muscle memory around middleware and error handling, not learning a large amount of new syntax.

## Phase 1: Routing & Requests (Week 1)

- Create an app, define routes for all four common HTTP methods, and understand `req.params` vs. `req.query`
- Get comfortable with `req`/`res` — reading headers/body, setting status codes, sending JSON
- Build a tiny in-memory API (no database yet) — a few hardcoded resources, full CRUD routes

**Checkpoint:** can you explain the difference between a route parameter and a query string, and give a real example of when you'd use each?

## Phase 2: Middleware — the Core Concept (Week 2)

- Understand middleware as `(req, res, next)`, and the strict contract: call `next()` or send a response, on every code path
- Use built-in middleware (`express.json()`, `express.static()`) and write your own (a logger, a simple auth check)
- Deliberately break a middleware (skip `next()`) and observe the hang — this is worth doing on purpose, not just reading about

**Checkpoint:** can you explain, from memory, exactly what happens if a middleware neither calls `next()` nor sends a response? (The request hangs indefinitely — Express has no timeout for this by default.)

## Phase 3: Error Handling & Real API Structure (Week 3)

- Error-handling middleware's 4-argument signature, and why dropping the `err` parameter silently breaks it
- Async error handling — the `try/catch` + `next(err)` pattern, or a wrapper utility, for every async route handler
- Split routes into an `express.Router()`-based structure (routes/controllers/middleware folders)
- Add request body validation with a schema library

**Checkpoint:** given a route handler that's `async` and doesn't wrap its `await` in try/catch, what specifically goes wrong if the awaited call rejects? Can you name the fix in one sentence?

## Phase 4: Production Readiness & Interview Prep (Week 4-5)

- Add `helmet`, `cors`, and rate limiting at a conceptual level — know what each actually protects against
- Separate `app.js` from `server.js` and write a handful of tests with `supertest`
- Connect at least one route to a real database (pairing with this platform's Databases academy for the database-side depth)
- Review this course's Interview Q&A and practice explaining the `next()` contract and the async-error gotcha out loud, not just recognizing them when reading

## Common Pitfalls Specific to Express (Not Generic Study Advice)

- **Forgetting `express.json()`** — the single most common beginner bug; `req.body` is silently `undefined`, no error
- **Registering error-handling middleware anywhere but last** — it will simply never be reached by errors from routes registered after it
- **Assuming async errors are caught the same way as sync errors** — a real, version-dependent gotcha, not a beginner misunderstanding to grow out of; verify current behavior rather than assuming
- **Putting auth middleware after the routes it's meant to protect** — a real, silent security bug, not just a bug that throws an error somewhere

## Getting Your First Express-Heavy Role

1. **Portfolio:** at least one project showing proper error handling (not just happy-path routes), request validation, and a real database connection — not just a CRUD demo with no error handling at all
2. **Resume:** be specific — "built a REST API with Express, JWT-based auth middleware, and centralized error handling" is far stronger than "experience with Express"
3. **Know the surrounding ecosystem, not just Express core:** at least one validation library, `helmet`/`cors`, and a testing approach (`supertest` or similar)
4. **Interview prep:** the `next()` contract, the 4-argument error middleware signature, and the async-error-handling gotcha come up constantly precisely because they distinguish real hands-on experience from having only followed a tutorial
