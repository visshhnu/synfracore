# Express.js — Revision Notes

Consolidated from Overview, Intermediate, Advanced, and Troubleshooting — a condensed pass for reviewing right before an interview, not a first-read introduction.

## What Express is

A minimal, unopinionated web framework built on top of Node's `http` module — the standard/most widely-adopted Node.js web framework. It adds a routing layer, a middleware pipeline, and convenience helpers (`express.json()`, `res.json()`) over the raw request/response objects `http` provides.

## Routing

- `app.get/post/put/delete(path, handler)` — method-specific routes
- `req.params` — route parameters (`:id`) — identifies *which* resource
- `req.query` — query string (`?key=value`) — usually filters/modifies a view
- `app.route(path).get(...).post(...)` — chained handlers for the same path

## Middleware — the core mechanism

- Signature: `(req, res, next)`
- **The contract:** every middleware must, on every code path, either call `next()` or send a response — never both, never neither
- Missing `next()` on some path → request hangs forever, no error
- Sending a response *and* still calling `next()` (or sending twice) → `Cannot set headers after they are sent`
- Registration order = execution order, strictly top to bottom — auth middleware after the route it protects means that route runs unauthenticated
- `express.json()` must be registered before any route reading `req.body`, or `req.body` is silently `undefined`

## Error-handling middleware

- Special signature: exactly 4 parameters, `(err, req, res, next)` — Express detects this by counting arity
- Only triggered by `next(err)` (a value passed), not plain `next()`
- Must be registered last, after every route it's meant to catch errors from
- Drop the `err` parameter accidentally → silently becomes regular middleware, stops catching errors

## Async error handling — the important gotcha

- Sync `throw` in a route handler → caught automatically by Express's default error handling
- `async` handler's rejected Promise → **not** automatically caught the same way in Express 4.x; can crash the process or hang the request
- Fix: `try/catch` + `next(err)` in every async handler, or a reusable `asyncHandler` wrapper
- `(needs verification — recheck exact current-version behavior before asserting this without qualification)`

## Router

- `express.Router()` — a mountable mini-app; routes defined relative to wherever it's mounted
- `app.use('/prefix', router)` — the router itself doesn't know its own prefix

## Security middleware (conceptual)

- `helmet()` — sets security-related response headers with sensible defaults
- `cors()` — controls which origins may call the API from a browser (browsers block cross-origin by default)
- `express-rate-limit` — caps requests per client in a time window
- `(needs verification — specific default configs and recommended packages shift over time)`

## Production structure

- Separate `app.js` (the Express app) from `server.js` (calls `app.listen()`) — enables testing with `supertest` against `app` directly, no real port needed
- routes/ → controllers/ → middleware/ folder split for anything beyond a small demo

## Versioning Note

`(needs verification — recheck against current source)`:
- The exact async-error-handling default behavior across Express major versions (4.x vs. 5.x and beyond) — this has genuinely changed and should be confirmed against the version actually in use before stating it unqualified.
- Currently-recommended security middleware packages and their default configurations (`helmet`, `cors`, rate-limiting) — ecosystem best practice here shifts.
- Any newly-emerged Express-adjacent framework recommendations (Fastify, Hono) relative to Express for a new project — worth rechecking periodically, since ecosystem consensus on "default choice" can move.
