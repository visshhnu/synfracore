# Express.js — Portfolio Projects

## Project 1

**Level:** Beginner
**Time:** 4-6 hours
**GitHub repo name:** `express-inmemory-crud-api`

**What you build:** A CRUD API for a single resource (e.g. "tasks") backed by an in-memory array — no database yet, so the focus stays entirely on routing, request/response handling, and basic structure.

```javascript
const express = require('express');
const app = express();
app.use(express.json());

let tasks = [];
let nextId = 1;

app.get('/tasks', (req, res) => res.json(tasks));

app.get('/tasks/:id', (req, res) => {
  const task = tasks.find(t => t.id === Number(req.params.id));
  if (!task) return res.status(404).json({ error: 'Task not found' });
  res.json(task);
});

app.post('/tasks', (req, res) => {
  const { title } = req.body;
  if (!title) return res.status(400).json({ error: 'title is required' });
  const task = { id: nextId++, title, done: false };
  tasks.push(task);
  res.status(201).json(task);
});

app.put('/tasks/:id', (req, res) => {
  const task = tasks.find(t => t.id === Number(req.params.id));
  if (!task) return res.status(404).json({ error: 'Task not found' });
  Object.assign(task, req.body);
  res.json(task);
});

app.delete('/tasks/:id', (req, res) => {
  const index = tasks.findIndex(t => t.id === Number(req.params.id));
  if (index === -1) return res.status(404).json({ error: 'Task not found' });
  tasks.splice(index, 1);
  res.status(204).send();
});

app.listen(3000);
```

---

## Project 2

**Level:** Intermediate
**Time:** 10-15 hours
**GitHub repo name:** `express-rest-api-validated`

**What you build:** A proper REST API for a multi-resource domain (e.g. a small blog: posts + comments), with `express.Router()`-based structure, request body validation, centralized error-handling middleware, and async-safe route handlers.

```javascript
// middleware/errorHandler.js
function errorHandler(err, req, res, next) {
  console.error(err.stack);
  const status = err.status || 500;
  res.status(status).json({ error: err.message || 'Internal server error' });
}
module.exports = errorHandler;

// routes/posts.js
const express = require('express');
const router = express.Router();
const { z } = require('zod');

const postSchema = z.object({
  title: z.string().min(1),
  body: z.string().min(1),
});

function asyncHandler(fn) {
  return (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
}

router.post('/', asyncHandler(async (req, res) => {
  const result = postSchema.safeParse(req.body);
  if (!result.success) {
    const err = new Error('Invalid post data');
    err.status = 400;
    throw err;
  }
  const post = await createPostInDb(result.data); // your database layer
  res.status(201).json(post);
}));

router.get('/:id', asyncHandler(async (req, res) => {
  const post = await findPostById(req.params.id);
  if (!post) {
    const err = new Error('Post not found');
    err.status = 404;
    throw err;
  }
  res.json(post);
}));

module.exports = router;
```

**What this project specifically demonstrates:** every error path returns a real, correctly-shaped JSON error with the right status code, and no unhandled rejection in an async route can crash the process — both genuinely production-relevant, not just "it works on the happy path."

---

## Project 3

**Level:** Advanced
**Time:** 15-20 hours
**GitHub repo name:** `express-jwt-auth-api`

**What you build:** An API with JWT-based authentication middleware protecting a subset of routes — a natural forward-pointer to this platform's later Authentication technology, which covers the JWT/session-design depth this project only needs at an applied level.

```javascript
// middleware/requireAuth.js
const jwt = require('jsonwebtoken');

function requireAuth(req, res, next) {
  const authHeader = req.headers.authorization;
  if (!authHeader?.startsWith('Bearer ')) {
    return res.status(401).json({ error: 'Missing or malformed authorization header' });
  }
  const token = authHeader.split(' ')[1];
  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET);
    req.user = payload; // attach for downstream route handlers
    next();
  } catch (err) {
    return res.status(401).json({ error: 'Invalid or expired token' });
  }
}
module.exports = requireAuth;

// server.js
const express = require('express');
const jwt = require('jsonwebtoken');
const requireAuth = require('./middleware/requireAuth');
const app = express();
app.use(express.json());

app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await verifyCredentials(email, password); // your own check
  if (!user) return res.status(401).json({ error: 'Invalid credentials' });
  const token = jwt.sign({ sub: user.id, email: user.email }, process.env.JWT_SECRET, { expiresIn: '1h' });
  res.json({ token });
});

app.get('/profile', requireAuth, (req, res) => {
  res.json({ userId: req.user.sub, email: req.user.email });
});

app.listen(3000);
```

**What this project specifically demonstrates:** auth as reusable middleware rather than repeated per-route checks, correct 401 responses for missing/invalid/expired tokens, and secrets (`JWT_SECRET`) kept out of source code via environment variables — the same pattern this platform's Deploying-to-production guidance treats as non-negotiable for any real secret.
