# Express.js Troubleshooting Guide

## Issue 1: A request hangs forever — no response, no error

**Symptom:** A client request to a specific route never resolves — no response, no error in the server console, and eventually a client-side timeout (if one is set at all).

**Root Cause:** A middleware in the chain for that route neither called `next()` nor sent a response on the code path that actually executed. Express has no default timeout for this — it just waits.

**Debug steps:**
```javascript
// Add a log line to the very top of every middleware in the suspected chain
app.use((req, res, next) => {
  console.log('checkpoint A hit');
  next();
});
```
Watch which log lines print and which don't. The last one that prints, but whose middleware never logs anything after it (and never sends a response), is the culprit.

**Fix patterns:**
```javascript
// BROKEN -- no next(), no response, on the early-return path
function checkSomething(req, res, next) {
  if (someCondition) {
    return; // request just stops here, forever
  }
  next();
}

// FIXED -- every code path calls next() or sends a response
function checkSomethingFixed(req, res, next) {
  if (someCondition) {
    return res.status(400).json({ error: 'condition not met' });
  }
  next();
}
```

---

## Issue 2: "Cannot set headers after they are sent to the client"

**Symptom:** A crash with the error `Error: Cannot set headers after they are sent to the client`, usually on a route that otherwise seems to work.

**Root Cause:** `res.send()`/`res.json()`/`res.end()` was called more than once for the same request — commonly because a middleware calls `next()` *and* also sends a response, or an async handler sends a response but then a later `.catch()`/error path tries to send another.

**Debug steps:**
```javascript
// Look for a code path where BOTH of these can run for the same request
function suspectMiddleware(req, res, next) {
  if (someCondition) {
    res.status(400).json({ error: 'bad' });
    // MISSING return -- execution falls through to next() below
  }
  next(); // runs even after the response above was already sent
}
```

**Fix patterns:**
```javascript
function fixedMiddleware(req, res, next) {
  if (someCondition) {
    return res.status(400).json({ error: 'bad' }); // return stops execution here
  }
  next();
}
```
Always `return` immediately after any `res.send()`/`res.json()` call inside a conditional — a missing `return` is the actual root cause almost every time this error appears.

---

## Issue 3: An async route handler's thrown/rejected error crashes the process instead of being caught

**Symptom:** An error thrown (or a Promise rejected) inside an `async` route handler either crashes the entire Node process, or leaves the request hanging — instead of returning a clean error response.

**Root Cause:** Express's default synchronous error handling does not automatically catch a rejected Promise from an `async` handler the same way it catches a synchronous `throw` in Express 4.x. The rejection goes unhandled unless explicitly forwarded.

**Debug steps:**
```bash
# An unhandled rejection often shows up in the process's own logs, separate
# from any Express-level error logging, since Express never saw it
node server.js
# UnhandledPromiseRejectionWarning: Error: ...
```

**Fix patterns:**
```javascript
// Explicit try/catch, forwarded to next()
app.get('/risky', async (req, res, next) => {
  try {
    const data = await riskyCall();
    res.json(data);
  } catch (err) {
    next(err);
  }
});

// Or a reusable wrapper applied to every async route
const asyncHandler = fn => (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
app.get('/risky', asyncHandler(async (req, res) => {
  const data = await riskyCall();
  res.json(data);
}));
```
`(needs verification — recheck the exact current default behavior against the Express major version actually in use, since this specific mechanic has evolved across versions.)`

---

## Issue 4: CORS errors when calling the API from a frontend

**Symptom:** The browser console shows an error like `has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present`, even though the API itself returns a valid response when hit directly (via `curl` or Postman).

**Root Cause:** Browsers enforce the same-origin policy by default — a frontend on a different origin (different domain, port, or protocol) can't read the response unless the server explicitly opts in via CORS headers. `curl`/Postman aren't browsers, so they never hit this restriction, which is why the API can look "fine" while a browser client is blocked.

**Debug steps:**
```bash
curl -i -X OPTIONS http://localhost:3000/api/data \
  -H "Origin: http://localhost:5173" \
  -H "Access-Control-Request-Method: GET"
# Check whether Access-Control-Allow-Origin appears in the response headers at all
```

**Fix patterns:**
```javascript
const cors = require('cors');
app.use(cors({ origin: 'http://localhost:5173' })); // or a list of allowed origins
```
Register `cors()` before the routes it needs to apply to, same as any other global middleware.

---

## Issue 5: Request body is `undefined`

**Symptom:** `req.body` is `undefined` on a `POST`/`PUT` route, even though the client is clearly sending a JSON body with the correct `Content-Type` header.

**Root Cause:** `express.json()` middleware was never registered, or was registered *after* the route that needs it. Express does not parse request bodies automatically — it's entirely opt-in.

**Debug steps:**
```javascript
// Confirm the client is actually sending the right Content-Type
app.use((req, res, next) => {
  console.log('Content-Type:', req.headers['content-type']);
  next();
});
```

**Fix patterns:**
```javascript
const app = express();
app.use(express.json());        // MUST come before any route that reads req.body
app.use('/api', apiRouter);
```

---

## Prevention Tips
- Always `return` immediately after any `res.send()`/`res.json()`/`res.end()` call inside a conditional
- Register global middleware (`express.json()`, `helmet`, `cors`, logging) at the very top of `app.js`, before any routes
- Wrap every `async` route handler in `try/catch` + `next(err)`, or use a wrapper utility — treat it as mandatory, not optional
- Register error-handling middleware (4-argument signature) last, after every route
- When a request hangs with no error, suspect a missing `next()` before anything else
