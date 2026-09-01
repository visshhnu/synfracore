# Express.js — Advanced

## Middleware execution order and common ordering bugs

Express runs middleware and routes in exactly the order they were registered — top to bottom, no reordering, no prioritization. This makes ordering a genuine architectural decision, not a style preference.

```javascript
// BUG: this route is registered BEFORE the auth middleware
app.get('/admin/dashboard', dashboardHandler);
app.use('/admin', requireAuth);
// Every request to /admin/dashboard matches and returns BEFORE
// Express ever reaches requireAuth -- the route runs completely
// unauthenticated, with no error anywhere.

// FIX: auth middleware registered first
app.use('/admin', requireAuth);
app.get('/admin/dashboard', dashboardHandler);
```

A second common ordering bug: registering `express.json()` *after* routes that need `req.body`.

```javascript
app.post('/orders', (req, res) => {
  console.log(req.body); // undefined -- express.json() hasn't run for this route yet
});
app.use(express.json()); // registered too late to affect the route above
```

The fix in both cases is the same principle: **global, cross-cutting middleware (body parsing, logging, security headers, auth) belongs at the top, before the routes that depend on it** — not scattered in wherever felt convenient at the time.

## Async error handling — the real, well-known gotcha

Express's default error handling was built around synchronous code: a `throw` inside a regular route handler is caught automatically and routed to error-handling middleware. An `async` function that throws (or an awaited Promise that rejects) does **not** behave the same way by default in Express 4.x — the rejection can go unhandled entirely, potentially crashing the process or leaving the request hanging with no response.

```javascript
// DANGEROUS in Express 4.x: an async handler whose rejection isn't caught
app.get('/risky', async (req, res) => {
  const data = await fetchFromUnreliableService(); // if this rejects...
  res.json(data);
  // ...Express 4.x does NOT automatically forward that rejection to
  // error-handling middleware the way it would a synchronous throw
});
```

```javascript
// SAFE pattern 1: explicit try/catch, forward to next()
app.get('/risky', async (req, res, next) => {
  try {
    const data = await fetchFromUnreliableService();
    res.json(data);
  } catch (err) {
    next(err);
  }
});

// SAFE pattern 2: a small wrapper utility, applied to every async route
function asyncHandler(fn) {
  return (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
}

app.get('/risky', asyncHandler(async (req, res) => {
  const data = await fetchFromUnreliableService();
  res.json(data); // any rejection here is now caught by the wrapper and forwarded
}));
```

`(needs verification — recheck against current source: this exact behavior has genuinely evolved across Express major versions, and the specific version in use should be confirmed before asserting whether async rejections are still uncaught by default or not.)` Regardless of the exact current default, treating every `await` in a route handler as something that must be explicitly wrapped and forwarded to `next()` is the durable, safe habit — it costs nothing when the framework does handle it automatically, and prevents a real production crash when it doesn't.

## Rate limiting and security middleware (conceptual)

A bare Express app sets no security-related HTTP headers and imposes no request-rate limits — both are opt-in via middleware.

```javascript
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

app.use(helmet()); // sets a collection of security-related response headers with sensible defaults
app.use(cors({ origin: 'https://myfrontend.com' })); // controls which origins may call this API from a browser
app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 })); // caps requests per IP in a time window
```

Conceptually:
- **`helmet`** reduces exposure to a handful of well-known browser-side attack classes (clickjacking, certain content-sniffing issues) by setting headers most apps would otherwise forget to set at all.
- **`cors`** exists because browsers block cross-origin requests by default — without explicit CORS configuration, a frontend on a different origin can't call the API at all, which is the source of a very common "CORS error" support request.
- **Rate limiting** protects against both abuse and accidental self-inflicted load (a buggy frontend retry loop, for instance), and is standard on any public-facing API.

`(needs verification — recheck specific default configurations and currently-recommended middleware packages against current source, since ecosystem recommendations here shift over time.)`

## Structuring a production-grade Express app

Beyond the routes/controllers/middleware split from Intermediate, a production app typically adds:

```javascript
// app.js -- centralizes everything, exported separately from server startup
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const usersRouter = require('./routes/users');
const errorHandler = require('./middleware/errorHandler');
const notFoundHandler = require('./middleware/notFoundHandler');

const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use('/users', usersRouter);

app.use(notFoundHandler); // catches any request that matched no route above
app.use(errorHandler);    // catches any error forwarded via next(err) -- always LAST

module.exports = app;
```

```javascript
// server.js -- the only file that actually starts listening
const app = require('./app');
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Listening on ${PORT}`));
```

The `notFoundHandler` and `errorHandler` both need to be registered **last** — a 404 handler is really just a catch-all middleware that runs when nothing else matched, and it only works if nothing after it could still match the request.

## Testing Express routes

Separating `app.js` from `server.js` (from Intermediate) exists specifically to make this possible: tests can import `app` and send requests directly against it, without a real network port.

```javascript
// users.test.js
const request = require('supertest');
const app = require('../app');

describe('GET /users/:id', () => {
  it('returns 404 for a nonexistent user', async () => {
    const res = await request(app).get('/users/does-not-exist');
    expect(res.status).toBe(404);
  });

  it('returns the user for a valid id', async () => {
    const res = await request(app).get('/users/1');
    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('id', '1');
  });
});
```

`supertest` sends real HTTP-shaped requests against the Express `app` object in memory — no server actually needs to be listening on a port for these tests to run, which makes them fast and safe to run in CI without port conflicts.
