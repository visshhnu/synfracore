# Express.js — PYQ (Previously Asked / Practice Questions)

**Framing note:** Express has no dedicated proctored certification and therefore no public past-paper archive exists for it specifically (see the Certification tab for the full honest framing — Express skill is usually demonstrated through the broader OpenJS Node.js certifications or through portfolio projects, not an Express-specific exam). What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Express behavior rather than invented "leaked" content.

---

### 1. (Domain: Middleware Fundamentals) A request to an Express route never resolves — no response, no error logged anywhere. What's the most likely cause, and why does Express not surface an error on its own?

**Answer:** A middleware in the chain for that route neither called `next()` nor sent a response on the code path that actually executed. Express has no built-in timeout for this — a middleware function is simply expected to eventually do one of those two things, and if it does neither, the request just waits indefinitely with no error thrown anywhere, since nothing actually failed from Express's perspective; it's just still waiting.

---

### 2. (Domain: Error-Handling Middleware) Why does Express specifically require error-handling middleware to have 4 parameters instead of the usual 3?

**Answer:** Express distinguishes error-handling middleware from regular middleware purely by counting a function's declared parameters — a function with exactly 4, `(err, req, res, next)`, is registered internally as an error handler and is only invoked when something calls `next(err)`, passing a value, rather than a plain `next()`. This is a real, non-obvious mechanic: dropping the `err` parameter, even by accident, silently converts the function into ordinary middleware that never receives errors, with no warning.

---

### 3. (Domain: Async Error Handling) Why does an unhandled rejection inside an `async` Express route handler behave differently from a synchronous `throw` in a regular handler?

**Answer:** Express's default error handling was built around synchronous code — a `throw` in a regular handler is caught automatically and routed to error-handling middleware. A rejected Promise from an `async` handler historically was not caught the same automatic way in Express 4.x, meaning the rejection could go entirely unhandled — crashing the process or leaving the request hanging — unless the developer explicitly wraps the `await` in `try/catch` and calls `next(err)`, or uses a wrapper utility that does this for every async route.

---

### 4. (Domain: Middleware Ordering) Why can registering an auth-checking middleware after the route it's meant to protect be a genuine, silent security bug rather than just a logic error that throws?

**Answer:** Express matches and executes middleware and routes strictly in registration order, top to bottom. If the protected route is registered first, Express matches it and returns a response before ever reaching the auth middleware registered afterward — the route runs completely unauthenticated, with no error, warning, or crash to signal it. This makes registration order a real security review concern, not merely a stylistic one.

---

### 5. (Domain: Built-in Middleware) A client is clearly sending a JSON body with the correct `Content-Type` header, but `req.body` is `undefined` on the server. What's the most likely cause?

**Answer:** `express.json()` middleware was never registered, or was registered after the route that reads `req.body`. Express does not parse request bodies automatically by default — body parsing is entirely opt-in middleware, and without it, `req.body` is simply `undefined` for any request, silently, with no error to flag the missing step.

---

### 6. (Domain: Routing) What's the practical difference between a route parameter and a query string in Express, and when would each be the right choice in an API design?

**Answer:** A route parameter (`:id` in `/users/:id`, extracted into `req.params`) identifies which specific resource the request refers to — it's part of the resource's identity within the URL path. A query string (`?page=2&sort=asc`, extracted into `req.query`) typically modifies how that resource (or a collection of them) is viewed — filtering, sorting, pagination — without changing which resource is being addressed. `/articles/42` names a specific article; `/articles?category=tech` filters a list.

---

### 7. (Domain: Router / App Structure) What does `express.Router()` actually provide, and why is it the standard way to organize a larger Express application's routes?

**Answer:** `Router()` creates a self-contained, mountable set of routes independent of any specific URL prefix — a router doesn't know or care what prefix it will eventually be mounted under with `app.use('/prefix', router)`. This lets routes for a given resource live in their own file, be reused or tested independently, and keeps a large application's routing logic from being crammed into one growing file on the main `app` object.

---

### 8. (Domain: Response Handling) A server crashes with "Cannot set headers after they are sent to the client." What's the underlying mechanical cause, and what's the most common concrete way this happens?

**Answer:** More than one of `res.send()`/`res.json()`/`res.end()` was called for the same request — HTTP only allows one response per request, and Express throws when a second attempt is made after headers have already gone out. The most common concrete cause is a missing `return` after a conditional `res.json()` call inside a middleware, letting execution fall through to a later `next()` or a second response call on the same request.

---

### 9. (Domain: CORS) Why does an Express API that returns a correct response via `curl` still produce a CORS error when called from a browser-based frontend?

**Answer:** `curl` isn't a browser and never enforces the same-origin policy — it just sends the HTTP request and shows whatever comes back. Browsers, by contrast, block a frontend on a different origin from reading a cross-origin response unless the server explicitly opts in via CORS headers (`Access-Control-Allow-Origin` and related headers). The API "working" via `curl` is expected and unrelated to whether `cors()` middleware has been configured to allow the specific frontend origin.

---

### 10. (Domain: Testing) Why is it a deliberate, common pattern to separate the Express `app` object into its own module from the file that calls `app.listen()`?

**Answer:** Separating `app.js` (the Express app itself — routes, middleware, everything except starting the server) from `server.js` (which imports `app` and calls `.listen()`) lets a testing library like `supertest` send real HTTP-shaped requests directly against the `app` object in memory, without a server actually needing to bind a real network port. This makes tests faster and avoids port-conflict flakiness, particularly when running many tests in parallel in CI.
