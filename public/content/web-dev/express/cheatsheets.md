# Express.js Quick Reference

## App setup

```javascript
const express = require('express');
const app = express();

app.listen(3000, () => console.log('Listening on 3000'));
```

## Routing

```javascript
app.get('/path', handler);
app.post('/path', handler);
app.put('/path/:id', handler);
app.patch('/path/:id', handler);
app.delete('/path/:id', handler);

app.get('/users/:id', (req, res) => {
  res.json({ id: req.params.id });
});

app.get('/search', (req, res) => {
  res.json({ q: req.query.q, page: req.query.page });
});

// Chained routes for the same path
app.route('/articles/:id')
  .get(getArticle)
  .put(updateArticle)
  .delete(deleteArticle);
```

## Router (modular routes)

```javascript
// routes/users.js
const router = require('express').Router();
router.get('/', listUsers);
router.get('/:id', getUser);
module.exports = router;

// app.js
app.use('/users', require('./routes/users'));
```

## Middleware patterns

```javascript
// Global
app.use((req, res, next) => { /* ... */ next(); });

// Scoped to a path prefix
app.use('/admin', requireAuth);

// Scoped to one route
app.get('/orders', validateQuery, listOrders);

// Multiple middleware on one route
app.post('/orders', requireAuth, validateBody, createOrder);
```

## Built-in middleware

```javascript
app.use(express.json());                          // parse JSON bodies -> req.body
app.use(express.urlencoded({ extended: true }));   // parse form bodies -> req.body
app.use(express.static('public'));                 // serve files from public/
```

## Request object

```javascript
req.params    // route parameters (:id)
req.query     // query string (?key=value)
req.body      // parsed body (requires express.json() first)
req.headers   // all request headers
req.method    // "GET", "POST", etc.
req.path      // URL path, no query string
```

## Response object

```javascript
res.send('text or html');
res.json({ key: 'value' });
res.status(201).json({ created: true });
res.sendStatus(204);
res.redirect('/other-path');
res.set('X-Custom-Header', 'value');
```

## Error handling

```javascript
// Forward an error from a route
app.get('/x', (req, res, next) => {
  next(new Error('failed'));
});

// Error-handling middleware -- 4 args, registered LAST
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({ error: err.message });
});

// Async-safe wrapper
const asyncHandler = fn => (req, res, next) =>
  Promise.resolve(fn(req, res, next)).catch(next);

app.get('/x', asyncHandler(async (req, res) => {
  const data = await riskyCall();
  res.json(data);
}));
```

## Security middleware (conceptual — verify current config against source)

```javascript
const helmet = require('helmet');
const cors = require('cors');
const rateLimit = require('express-rate-limit');

app.use(helmet());
app.use(cors({ origin: 'https://myfrontend.com' }));
app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 }));
```

## Testing

```javascript
const request = require('supertest');
const app = require('../app');

const res = await request(app).get('/users/1');
expect(res.status).toBe(200);
```
