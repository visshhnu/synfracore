# Express.js — Fundamentals

## Creating an app and a basic route

Every Express app starts the same way: call `express()` to get an `app` object, define routes on it, then call `app.listen()` to start accepting requests.

```javascript
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Welcome!');
});

app.listen(3000, () => console.log('Listening on port 3000'));
```

`app.get(path, handler)` registers a handler that runs only for `GET` requests to that exact path. The handler receives `req` (the incoming request) and `res` (the tool you use to build a response) — nothing runs automatically; you decide what to send back.

## Route parameters and query strings

A **route parameter** is a named placeholder in the URL path itself, prefixed with `:`. Express extracts it into `req.params`:

```javascript
app.get('/users/:id', (req, res) => {
  res.send(`User ID: ${req.params.id}`);
});
// GET /users/42  ->  req.params.id === "42"  (always a string, even if it looks numeric)
```

A **query string** is the `?key=value` part of a URL, unrelated to the path structure — Express parses it automatically into `req.query`:

```javascript
app.get('/search', (req, res) => {
  res.send(`Searching for: ${req.query.q}`);
});
// GET /search?q=express  ->  req.query.q === "express"
```

The distinction matters: route parameters identify *which resource* (`/users/42` — user 42, specifically), while query strings usually modify *how you look at it* (`/search?q=express&page=2` — filters, pagination, sorting).

## The request and response objects

`req` and `res` are both extensions of Node's own `http.IncomingMessage` and `http.ServerResponse` — Express adds convenience methods and properties on top, it doesn't replace them.

```javascript
app.post('/orders', (req, res) => {
  console.log(req.method);       // "POST"
  console.log(req.path);         // "/orders"
  console.log(req.headers);      // all request headers
  console.log(req.body);         // parsed body -- requires express.json() first, see below

  res.status(201);               // set the status code
  res.json({ received: true });  // send JSON, sets Content-Type automatically, ends the response
});
```

`res.send()`, `res.json()`, and `res.end()` all end the response — once one of them is called, nothing more can be sent for that request. Calling more than one on the same response is exactly what causes the classic `Cannot set headers after they are sent` error (covered in Troubleshooting).

## Middleware — what it actually is, and the `next()` contract

A middleware function has the signature `(req, res, next)`. It runs *before* the final route handler, and it can do one of two things: modify `req`/`res` and hand off with `next()`, or end the request itself.

```javascript
function logger(req, res, next) {
  console.log(`${req.method} ${req.path} at ${new Date().toISOString()}`);
  next(); // MUST be called, or this request goes nowhere
}

app.use(logger); // runs on every request, before any route handler
```

Think of middleware as a checkpoint line — each function is a checkpoint the request passes through. A checkpoint either waves the request forward (`next()`) or stops it there and sends a response back immediately. **If a checkpoint does neither — no `next()`, no response — the request just stands there forever.** This is the single most common source of a "hanging" Express request, and it's worth internalizing early: every middleware function must do exactly one of those two things, on every code path, including inside `if` statements and `try/catch` blocks.

```conceptgrid
{
  "boxes": [
    { "title": "app.use(fn)", "description": "Runs on every request (or every request under a path prefix, if given one)", "color": "blue" },
    { "title": "next()", "description": "Passes control to the next function in the chain -- required if this middleware isn't ending the response itself", "color": "amber" },
    { "title": "res.send() / res.json()", "description": "Ends the response -- no next() needed or expected after this", "color": "green" },
    { "title": "Registration order = execution order", "description": "Middleware and routes run top-to-bottom, in the exact order app.use()/app.get() etc. were called", "color": "purple" }
  ]
}
```

## Built-in middleware: `express.json()` and friends

Express ships a handful of middleware functions built in — they don't run unless you explicitly register them with `app.use()`.

```javascript
app.use(express.json());              // parses JSON request bodies into req.body
app.use(express.urlencoded({ extended: true })); // parses form-submitted bodies
app.use(express.static('public'));    // serves files from the "public" folder directly
```

`express.json()` is the one that trips up beginners most: without it, `req.body` is `undefined` for any JSON request, no error, no warning — it just silently doesn't work. This is common enough to have its own dedicated entry in Troubleshooting.

## Serving static files

`express.static()` turns a folder into directly servable files — no route needed per file:

```javascript
app.use(express.static('public'));
// public/logo.png is now reachable at GET /logo.png
// public/index.html is now reachable at GET / (and GET /index.html)
```

## Basic routing patterns for different HTTP methods

```javascript
app.get('/articles', (req, res) => { /* list articles */ });
app.get('/articles/:id', (req, res) => { /* one article */ });
app.post('/articles', (req, res) => { /* create an article */ });
app.put('/articles/:id', (req, res) => { /* replace an article */ });
app.delete('/articles/:id', (req, res) => { /* delete an article */ });
```

This pattern — same path, different method, different meaning — is the foundation of a REST-style API: the URL identifies *what* (a specific article), the HTTP method identifies *what to do* to it. This platform's REST API Design technology covers the conventions around this in depth; Express just gives you the routing mechanism to implement it.

## Try It (2 Minutes)

Extend the server from Installation with a route parameter and `express.json()`:

```javascript
const express = require('express');
const app = express();
app.use(express.json());

app.post('/echo/:label', (req, res) => {
  res.json({ label: req.params.label, youSent: req.body });
});

app.listen(3000, () => console.log('Listening on 3000'));
```

Run it, then send a request with `curl`:

```bash
curl -X POST http://localhost:3000/echo/test \
  -H "Content-Type: application/json" \
  -d '{"hello":"world"}'
```

You should get back `{"label":"test","youSent":{"hello":"world"}}`. Now comment out `app.use(express.json())` and run the same `curl` command again — `req.body` becomes `undefined`, and you've just reproduced the single most common Express beginner bug on purpose.
