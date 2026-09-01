# Express.js — Interview Questions

**Q: What is middleware in Express, and what exactly is the `next()` contract?**

Middleware is a function with the signature `(req, res, next)` that runs somewhere in the chain before the final route handler. The contract is strict: every middleware must, on every possible code path, either call `next()` to pass control forward, or send a response (`res.send()`, `res.json()`, `res.end()`) to end the request there — never both, never neither. A middleware that does neither leaves the request hanging indefinitely, with no error and no timeout by default. This is the single idea everything else in Express is built on top of.

---

**Q: Why does error-handling middleware need exactly 4 arguments — `(err, req, res, next)` — instead of 3?**

Express distinguishes error-handling middleware from regular middleware purely by counting the function's declared parameters. A function declared with exactly 4 parameters is registered as an error handler, and it's only invoked when something upstream calls `next(err)` — passing a value — instead of a plain `next()`. Drop the `err` parameter, even accidentally, and Express treats the function as ordinary middleware; it silently stops receiving errors at all, with no warning. Error-handling middleware also has to be registered after the routes it's meant to protect, since middleware runs strictly in registration order.

---

**Q: Why do async errors in Express route handlers need explicit handling?**

Express's default error handling was designed around synchronous code — a `throw` in a regular handler is caught automatically. A rejected Promise from an `async` handler historically was not caught the same way in Express 4.x; an unhandled rejection there could crash the process or leave the request hanging rather than being routed to error-handling middleware. The fix is to wrap `await` calls in `try/catch` and call `next(err)` explicitly, or use a small wrapper utility applied to every async route handler that does this automatically. `(needs verification — recheck the exact current behavior against the specific Express major version in use, since this has genuinely evolved across versions.)`

---

**Q: What does `express.Router()` do, and why use it instead of defining every route on `app` directly?**

`Router()` creates a self-contained, mountable mini-app — a set of routes for one resource, defined in its own file, independent of any specific URL prefix. It's mounted onto the main app with `app.use('/prefix', router)`, at which point every route defined on it becomes reachable under that prefix. This keeps a large API's routes organized by resource rather than crammed into one growing file, and it lets the same router be tested or reused independent of exactly where it ends up mounted.

---

**Q: What's the actual difference between using Express and just using Node's bare `http` module?**

The bare `http` module hands you a raw request and response object and nothing else — parsing the URL, matching it to the right logic, checking the method, and parsing the body are all manual, repeated in every endpoint. Express adds a routing layer (`app.get`, `app.post`, route parameters), a middleware pipeline for reusable cross-cutting logic, and convenience methods (`res.json()`, `express.json()`) that remove that repetition. It's not a different language or a fundamentally different model — it's Node's own request/response objects, extended, with the boilerplate abstracted into a well-understood, shared pattern.

---

**Q: What's the purpose of security middleware like `helmet` and `cors`, conceptually?**

`helmet` sets a collection of security-related HTTP response headers with sensible defaults — headers most apps would otherwise simply forget to set, that reduce exposure to a handful of well-known browser-side attack classes. `cors` exists because browsers block cross-origin requests by default; it explicitly configures which origins are allowed to call the API from a browser context, which is what actually fixes the common "CORS error" a frontend team reports when calling an API hosted on a different origin. Neither is optional hardening for a public-facing API — both are close to a checklist default. `(needs verification — recheck specific recommended defaults against current source.)`

---

**Q: What actually happens if two middleware functions are registered in the wrong order — say, auth after the route it's meant to protect?**

Express matches and runs middleware and routes strictly in registration order, top to bottom. If a protected route is registered before the auth-checking middleware, Express matches and returns from that route before it ever reaches the auth middleware — the route runs completely unauthenticated, silently, with no error anywhere to flag it. This is exactly why middleware/route registration order is treated as a genuine review concern, not a style preference — it's a real, silent security bug waiting to happen.

---

**Q: How would you validate an incoming request body in Express?**

Trusting `req.body` unchecked lets malformed or malicious input reach business logic directly. The standard pattern is a validation library (commonly `zod` or `joi`) defining the expected shape, wired into a small reusable middleware that runs before the actual route handler — returning `400` with a clear error if validation fails, and otherwise calling `next()` with the request allowed to proceed. This keeps validation logic in one consistent, testable place rather than duplicated inside every route handler.

---

**Q: How do you test an Express route without actually starting a server on a real port?**

Separate the Express `app` object (routes, middleware — everything except `.listen()`) into its own module, exported independently from whatever calls `app.listen()`. A library like `supertest` can then send real HTTP-shaped requests directly against that `app` object in memory, with no port binding required — fast, safe to run in parallel in CI, and free of port-conflict flakiness.

---

**Q: What's a genuinely common cause of `req.body` being `undefined` even though the client is clearly sending JSON?**

`express.json()` was never registered — Express does not parse JSON bodies automatically by default; it's opt-in middleware. Without `app.use(express.json())` registered before the route in question, `req.body` is simply `undefined` for any request with a JSON body, with no error thrown anywhere. This is the single most common beginner Express bug, precisely because it fails silently instead of loudly.

---

**Q: What's the difference between a route parameter and a query string, and when would you use each?**

A route parameter (`/users/:id`) is a named placeholder embedded in the URL path itself, extracted into `req.params` — it identifies *which specific resource* the request refers to. A query string (`?page=2&sort=asc`) is the `?key=value` portion of the URL, extracted into `req.query` — it typically modifies *how the resource is viewed or filtered*, rather than identifying it. `/articles/42` (a specific article) versus `/articles?category=tech&page=2` (a filtered, paginated list) is the concrete distinction in practice.
