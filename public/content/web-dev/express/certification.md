# Express.js Certification Guide

## Is there an Express-specific certification?

Honestly: no. Unlike Node.js itself — which has real, proctored, vendor-recognized exams (the OpenJS Node.js Application Developer / JSNAD and Node.js Services Developer / JSNSD certifications, covered in this platform's Node.js technology) — Express has no dedicated proctored certification of its own. This isn't a gap in this course's coverage; it's an accurate reflection of the current certification landscape.

Express skill in the real world gets demonstrated in two ways instead:

1. **Through the broader Node.js certifications' scope.** The OpenJS Node.js certs test practical, hands-on ability to build and debug real Node applications — which in practice very often means Express, since it's the dominant framework, even though the exam isn't Express-branded.
2. **Through portfolio projects.** A well-built Express API — with real error handling, request validation, and a working test suite — is a stronger, more concrete signal to an employer than any multiple-choice exam could be for a framework this practically-oriented. See the **Projects** tab for three portfolio-ready builds.

`(needs verification — recheck whether any new Express-specific or Node-framework-specific certification has appeared, since the certification landscape does shift; this reflects the state as of this course's last review.)`

---

## Core Topics

```javascript
// Routing
app.get('/path', handler);
app.post('/path', handler);
app.put('/path/:id', handler);
app.delete('/path/:id', handler);
app.route('/path').get(getHandler).post(postHandler); // chained, same path

// Route parameters and query strings
app.get('/users/:id', (req, res) => req.params.id);
app.get('/search', (req, res) => req.query.q);

// Middleware
app.use(middlewareFn);                    // global
app.use('/prefix', middlewareFn);         // scoped to a path prefix
router.use(middlewareFn);                 // scoped to a router

// Built-in middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// Router
const router = express.Router();
router.get('/', handler);
app.use('/resource', router);

// Error-handling middleware (4 args -- special signature)
app.use((err, req, res, next) => {
  res.status(err.status || 500).json({ error: err.message });
});

// Forwarding an error
app.get('/x', (req, res, next) => {
  next(new Error('something failed')); // routes to error-handling middleware
});

// Async error handling
const asyncHandler = fn => (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
app.get('/x', asyncHandler(async (req, res) => {
  const data = await someAsyncCall();
  res.json(data);
}));

// Response methods
res.status(201).json({ created: true });
res.send('plain text or html');
res.sendStatus(204);
res.redirect('/other-path');
```

```bash
# Quick reference -- npm
npm install express
npm install --save-dev nodemon
node --watch server.js   # built-in dev auto-restart, alternative to nodemon
```

## Study Resources

- **Express.js Documentation** (expressjs.com) — authoritative official reference, small enough to read most of directly
- **MDN — HTTP overview** (developer.mozilla.org) — background on the HTTP methods/status codes Express routes model
- **OpenJS Node.js Certifications** (openjsf.org) — the closest widely-recognized credential that meaningfully exercises Express skill, even without being Express-branded
