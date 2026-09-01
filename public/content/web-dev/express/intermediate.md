# Express.js — Intermediate

## The Router — organizing routes into modules

Defining every route directly on `app` doesn't scale — a real API has dozens of routes across many resources, and cramming them into one file gets unmanageable fast. `express.Router()` creates a mini, mountable Express app: a self-contained set of routes for one resource, defined in its own file, then attached to the main app.

```javascript
// routes/users.js
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => { res.json({ users: [] }); });
router.get('/:id', (req, res) => { res.json({ id: req.params.id }); });
router.post('/', (req, res) => { res.status(201).json({ created: true }); });

module.exports = router;
```

```javascript
// server.js
const express = require('express');
const usersRouter = require('./routes/users');
const app = express();

app.use(express.json());
app.use('/users', usersRouter); // everything in usersRouter is now prefixed with /users

app.listen(3000);
```

`router.get('/:id', ...)` inside `routes/users.js` actually handles `GET /users/:id` once mounted — the router doesn't know or care about the `/users` prefix; that's entirely the main app's decision at mount time. This is what lets the same router be reused under a different prefix, or tested in isolation.

## Custom middleware: logging and auth-checking

Middleware is just a function — writing your own for cross-cutting concerns is the normal pattern, not an advanced technique.

```javascript
// A simple request logger
function requestLogger(req, res, next) {
  const start = Date.now();
  res.on('finish', () => {
    console.log(`${req.method} ${req.path} -> ${res.statusCode} (${Date.now() - start}ms)`);
  });
  next();
}

// A simple auth-checking middleware
function requireAuth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1]; // "Bearer <token>"
  if (!token) {
    return res.status(401).json({ error: 'Missing authorization token' });
  }
  // In a real app: verify the token (JWT verification, session lookup, etc.)
  req.user = { id: 'user-from-token' }; // attach for downstream handlers to use
  next();
}

app.use(requestLogger);            // global -- every request
app.use('/admin', requireAuth);    // scoped -- only requests under /admin
```

Scoping middleware to a path prefix (`app.use('/admin', requireAuth)`) instead of applying it globally is a deliberate, common pattern — it means public routes never even run through the auth check, rather than relying on the auth middleware itself to decide who to let through.

## Error-handling middleware's special signature

Express distinguishes error-handling middleware from regular middleware purely by **counting its declared parameters**. A function with exactly 4 parameters — `(err, req, res, next)` — is treated as an error handler, and Express only invokes it when something calls `next(err)` (passing a value) instead of plain `next()`.

```javascript
app.get('/risky', (req, res, next) => {
  const somethingWrong = true;
  if (somethingWrong) {
    return next(new Error('Something went wrong')); // hands off to error middleware
  }
  res.send('OK');
});

// Error-handling middleware -- registered LAST, after all routes
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: err.message });
});
```

Drop the `next` parameter (even if you never use it) and Express treats the function as regular middleware instead — it silently stops receiving errors, with no warning anywhere. Error-handling middleware must also be registered *after* the routes it's meant to catch errors from — middleware and routes run in registration order, and an error middleware registered too early simply never gets reached by errors thrown later in the chain.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Route handler calls next(err)", "sublabel": "instead of throwing silently or plain next()", "color": "amber" },
    { "label": "Express skips remaining regular middleware", "sublabel": "jumps straight to the first (err, req, res, next) function", "color": "slate" },
    { "label": "Error-handling middleware runs", "sublabel": "logs, formats, and sends the error response", "color": "red" }
  ]
}
```

## Validating request bodies

Trusting `req.body` unchecked lets malformed or malicious input reach your business logic. A validation library (commonly `zod` in modern Express/TypeScript-leaning codebases, or `joi`) defines the expected shape, and a small middleware enforces it before the route handler runs:

```javascript
const { z } = require('zod');

const createUserSchema = z.object({
  email: z.string().email(),
  name: z.string().min(1),
});

function validateBody(schema) {
  return (req, res, next) => {
    const result = schema.safeParse(req.body);
    if (!result.success) {
      return res.status(400).json({ error: result.error.flatten() });
    }
    req.body = result.data; // replace with the validated, typed data
    next();
  };
}

router.post('/', validateBody(createUserSchema), (req, res) => {
  // req.body is guaranteed valid here
  res.status(201).json({ created: req.body });
});
```

## Structuring a real Express app

A small demo can live in one file; a real app splits concerns:

```
src/
  routes/        <- defines URL paths, delegates to controllers
    users.js
    orders.js
  controllers/    <- the actual handler logic (what to do for each route)
    usersController.js
    ordersController.js
  middleware/     <- reusable middleware (auth, validation, logging)
    requireAuth.js
    validateBody.js
  app.js          <- creates the app, registers global middleware and routers
  server.js       <- imports app.js, calls app.listen()
```

Separating `app.js` (the Express app itself) from `server.js` (starting it) is a small but genuinely useful pattern — it lets tests import `app` directly and send requests against it (via a library like `supertest`) without actually binding a port.

## Connecting to a database from a route handler

Conceptually, a route handler (or the controller it delegates to) calls into a database client or ORM, awaits the result, and shapes the response:

```javascript
router.get('/:id', async (req, res, next) => {
  try {
    const user = await db.query('SELECT * FROM users WHERE id = $1', [req.params.id]);
    if (!user) return res.status(404).json({ error: 'Not found' });
    res.json(user);
  } catch (err) {
    next(err); // forward to error-handling middleware, don't let it crash the process
  }
});
```

The database side of this — connection pooling, query design, choosing between an ORM and raw SQL, schema design — is its own large topic, covered in depth in this platform's **Databases** academy rather than duplicated here. Express's role is narrow and specific: route the request to the right logic, and shape whatever comes back into an HTTP response.
