# Full-Stack Integration & Deployment — Fundamentals

## Making the first real call: frontend to backend over HTTP

Every full-stack request starts the same way — the frontend, running in the browser, makes an HTTP request to a URL the backend is listening on. Nothing about this is new mechanically (you've made `fetch` calls before, and you've written Express routes before); what's new is that the two sides are now genuinely separate programs, often on separate ports even locally, and always on separate origins once deployed.

```javascript
// frontend (React/Next.js) -- calling a backend endpoint
async function getOrders() {
  const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/orders`);
  if (!res.ok) throw new Error(`Request failed: ${res.status}`);
  return res.json();
}
```

```javascript
// backend (Express) -- the endpoint being called
app.get('/api/orders', async (req, res) => {
  const orders = await db.query('SELECT * FROM orders');
  res.json(orders.rows);
});
```

The frontend never imports the backend's code, and the backend has no idea a React component exists — the only thing connecting them is this HTTP contract: a URL, a method, a request/response shape. Get that contract wrong on either side and nothing about the other side's code quality matters.

## CORS: a real browser security mechanism, not an arbitrary error

CORS (Cross-Origin Resource Sharing) exists because browsers, by default, block JavaScript running on one origin from reading responses from a *different* origin — otherwise, any malicious website's JavaScript could quietly call your bank's API using your logged-in session cookies and read the response. An **origin** is the combination of protocol, domain, and port — `http://localhost:3000` and `http://localhost:4000` are different origins, even on the same machine, which is exactly why you can hit this locally, not just after deployment.

The critical mental model: the request frequently still reaches your backend. CORS is the browser refusing to hand the *response* back to your frontend JavaScript, unless the backend explicitly said (via response headers) that the calling origin is allowed to read it.

```javascript
// backend -- explicitly allowing a specific frontend origin
const cors = require('cors');
app.use(cors({
  origin: process.env.FRONTEND_URL,   // e.g. https://app.example.com
  credentials: true,                  // needed if the frontend sends cookies
}));
```

Never combine `origin: '*'` with `credentials: true` — browsers reject that combination outright, and for good reason: it would mean "any site on the internet can make authenticated requests on a logged-in user's behalf."

## Environment variables: frontend vs. backend is a real security boundary

This academy's Next.js technology already introduced the `NEXT_PUBLIC_` convention — full-stack integration is where that convention's actual stakes become concrete. A **backend** environment variable (a database connection string, a JWT signing secret, a third-party API key) lives only on the server and is never sent to the browser. A **frontend** environment variable, once built, is baked directly into the JavaScript bundle shipped to every visitor — genuinely readable by anyone who opens dev tools, regardless of how it's named.

```bash
# .env (backend -- Express server, never shipped to the browser)
DATABASE_URL=postgresql://user:pass@host:5432/mydb
JWT_SECRET=a-genuinely-private-signing-secret

# .env.local (frontend -- Next.js, NEXT_PUBLIC_ ones ARE shipped to the browser)
NEXT_PUBLIC_API_URL=https://api.example.com
# NOT NEXT_PUBLIC_DATABASE_URL -- this would ship your DB credentials to every visitor
```

The rule that actually matters: if a value must stay secret, it belongs on the backend, full stop — never as a `NEXT_PUBLIC_` (or equivalent) frontend variable, no matter how convenient it would be to read it directly from a component.

## Passing an auth token from frontend to backend, on every request

A backend route protected by authentication middleware needs proof, on *every single request*, that the caller is who they claim to be — and HTTP itself is stateless, so that proof has to be actively attached each time, not assumed from a previous request.

```javascript
// frontend -- attaching the token to a protected request
const token = getStoredToken(); // wherever this app stores it after login
const res = await fetch(`${API_URL}/api/profile`, {
  headers: { Authorization: `Bearer ${token}` },
});
```

```javascript
// backend -- Express middleware verifying it, using this academy's
// Authentication technology's own token-verification pattern
function requireAuth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token provided' });
  try {
    req.user = verifyToken(token); // from this academy's Authentication technology
    next();
  } catch {
    res.status(401).json({ error: 'Invalid or expired token' });
  }
}

app.get('/api/profile', requireAuth, (req, res) => {
  res.json({ user: req.user });
});
```

Forget to attach the header on the frontend, or forget to apply `requireAuth` on a route that should have it, and both mistakes produce the exact same visible symptom — a 401 — which is why understanding the *whole* chain matters more than memorizing either half alone.

## AI-assisted development in a real full-stack workflow

Using an AI coding assistant (GitHub Copilot, Claude Code, Cursor, and similar tools) is genuinely standard professional practice in full-stack development in 2026, not a shortcut to be embarrassed about — but it's a real skill with a real learning curve, not just "typing less."

**Where an AI assistant is a strong, low-risk fit:**
- Boilerplate that's tedious but low-stakes — a CRUD route skeleton, a form component's basic structure, a test file's setup/teardown scaffolding
- Unfamiliar syntax or an unfamiliar library's API — asking "how do I do X with this library" is often faster and more accurate than searching, and easy to verify against the library's own docs afterward
- Writing tests for logic you already understand and wrote yourself

**Where human judgment has to stay in the loop, deliberately:**
- Architecture decisions — how the frontend and backend should actually be structured, deployed, and scaled is a judgment call an assistant can suggest but shouldn't make unreviewed
- Anything security-sensitive — an auth flow, a database query built from user input, a CORS configuration — code an assistant generates here must be read and understood line by line before it ships, not accepted because it looks plausible and the app happened to run
- The actual debugging of a genuinely novel production issue, where the assistant has no more real signal than you do

**The concrete practice:** prompt for a specific, scoped change ("add input validation to this Express route using zod, matching the shape of this schema") rather than an open-ended one ("build me an API"), and review every line of what comes back the same way you'd review a teammate's pull request — because in a real interview, "the AI wrote it" is never an acceptable answer for a line of code you can't explain.

```conceptgrid
{
  "boxes": [
    { "title": "Good fit for AI assistance", "description": "Boilerplate, tests for logic you wrote, unfamiliar syntax lookups -- low-stakes, easy to verify", "color": "green" },
    { "title": "Keep human judgment", "description": "Architecture decisions, auth flows, anything touching user input or security -- review every line before shipping", "color": "amber" },
    { "title": "The actual skill", "description": "Prompting for a scoped, specific change and reviewing the output like a teammate's PR, not accepting it because it runs", "color": "blue" }
  ]
}
```

## Basic full-stack project structure: monorepo vs. separate repos

Briefly, since this is mostly a deployment/tooling decision rather than a deep architectural one: a **monorepo** keeps frontend and backend in one repository (often in `frontend/` and `backend/` subdirectories, or as a Next.js app with API routes as the backend entirely), which simplifies coordinated changes and often simplifies deployment when both are deployed together. **Separate repos** keep them fully independent, which fits better when frontend and backend genuinely have separate teams, release cadences, or deployment targets. Most solo and small-team projects start as a monorepo — the coordination overhead of separate repos isn't worth paying until a team's size or deployment needs actually demand it.

## Try It (2 Minutes)

Take a protected route from a backend project you've already built in this academy's Express technology. Add `console.log(req.headers.authorization)` at the very top of its route handler, then call it from the frontend once with the token attached and once without. Watch both the different console output on the backend and the different HTTP status returned to the frontend — that's the entire auth-token handshake made visible in under two minutes.
