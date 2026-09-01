# Full-Stack Integration & Deployment — Intermediate

## Connecting a backend to a real database

Once a backend does more than return hardcoded JSON, it needs a real database connection. This is deliberately a brief, concrete example, not a database course — this platform's own **Databases academy**, specifically its **PostgreSQL** technology, is where schema design, indexing, and query performance actually live in depth; here, the only job is wiring the connection into the backend correctly.

```javascript
// backend -- a minimal PostgreSQL connection pool (Node's `pg` package)
const { Pool } = require('pg');

const pool = new Pool({
  connectionString: process.env.DATABASE_URL, // never hardcoded, never a frontend var
});

app.get('/api/orders', async (req, res) => {
  try {
    const result = await pool.query('SELECT id, item, amount FROM orders WHERE user_id = $1', [req.user.id]);
    res.json(result.rows);
  } catch (err) {
    console.error('Database query failed:', err);
    res.status(500).json({ error: 'Failed to load orders' });
  }
});
```

Two things matter here specifically at the integration layer, distinct from the database knowledge itself: the connection string is a backend-only secret (see Fundamentals), and every query that can fail needs to fail into a proper error response, not an unhandled crash — see error handling below. For everything else — indexing this query correctly, schema design, connection pooling at scale — go to the Databases academy's PostgreSQL technology directly.

## Wiring authentication end to end, across frontend and backend

This is the single most consequential integration flow in a full-stack app, and it's worth tracing completely, once, rather than learning each half separately.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "1. Login form", "sublabel": "Frontend collects email/password", "color": "slate" },
    { "label": "2. POST /api/login", "sublabel": "Backend verifies credentials", "color": "blue" },
    { "label": "3. Token issued", "sublabel": "Backend signs and returns a token", "color": "purple" },
    { "label": "4. Token stored", "sublabel": "Frontend stores it (memory/cookie/storage)", "color": "amber" },
    { "label": "5. Sent on requests", "sublabel": "Authorization header on every subsequent call", "color": "green" },
    { "label": "6. Verified by middleware", "sublabel": "Backend checks the token before the route runs", "color": "red" }
  ]
}
```

```javascript
// frontend -- login, then store the token, then use it
async function login(email, password) {
  const res = await fetch(`${API_URL}/api/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password }),
  });
  if (!res.ok) throw new Error('Login failed');
  const { token } = await res.json();
  storeToken(token); // this academy's Authentication technology covers storage tradeoffs
  return token;
}

async function getProfile(token) {
  const res = await fetch(`${API_URL}/api/profile`, {
    headers: { Authorization: `Bearer ${token}` },
  });
  if (res.status === 401) {
    clearStoredToken();
    throw new Error('Session expired -- please log in again');
  }
  return res.json();
}
```

The backend side — issuing the token on `/api/login`, verifying it in middleware on protected routes — is exactly what this academy's own Authentication technology already covers in depth; the integration-specific piece is making sure the frontend actually treats a 401 as "the session is gone" (clearing the stale token and prompting re-login) rather than as a generic error.

## Handling loading and error states across a real data flow

A real frontend-to-backend call has at least three distinct states, and skipping any of them produces a broken-feeling UI the first time a request is slow or fails:

```javascript
// frontend -- a real (not idealized) data-fetching flow
function OrdersList() {
  const [state, setState] = useState({ status: 'loading', data: null, error: null });

  useEffect(() => {
    fetch(`${API_URL}/api/orders`, { headers: authHeaders() })
      .then(async (res) => {
        if (!res.ok) {
          const body = await res.json().catch(() => ({}));
          throw new Error(body.error || `Request failed: ${res.status}`);
        }
        return res.json();
      })
      .then((data) => setState({ status: 'success', data, error: null }))
      .catch((error) => setState({ status: 'error', data: null, error: error.message }));
  }, []);

  if (state.status === 'loading') return <Spinner />;
  if (state.status === 'error') return <ErrorMessage message={state.error} />;
  return <OrderTable orders={state.data} />;
}
```

Notice the error handling reads `body.error` — a specific, meaningful message the backend chose to send — rather than just displaying the raw status code. That only works if the backend actually returns a consistent, predictable error shape, which is exactly the next section.

## API error-handling conventions shared between frontend and backend

Frontend and backend have to agree, deliberately, on what an error response looks like — otherwise the frontend is left guessing, and different endpoints end up with inconsistent, unparseable error shapes.

```javascript
// backend -- one consistent error shape across every route
function sendError(res, status, message) {
  res.status(status).json({ error: message });
}

app.post('/api/orders', requireAuth, async (req, res) => {
  const { item, amount } = req.body;
  if (!item || typeof amount !== 'number') {
    return sendError(res, 400, 'item (string) and amount (number) are required');
  }
  try {
    const result = await pool.query(
      'INSERT INTO orders (user_id, item, amount) VALUES ($1, $2, $3) RETURNING id',
      [req.user.id, item, amount]
    );
    res.status(201).json({ id: result.rows[0].id });
  } catch (err) {
    console.error('Order creation failed:', err);
    sendError(res, 500, 'Failed to create order');
  }
});
```

```javascript
// frontend -- one consistent error-parsing function reused everywhere,
// instead of every call site re-implementing its own error handling
async function apiCall(path, options = {}) {
  const res = await fetch(`${API_URL}${path}`, options);
  if (!res.ok) {
    const body = await res.json().catch(() => ({}));
    throw new Error(body.error || `Request failed: ${res.status}`);
  }
  return res.json();
}
```

The specific status codes matter too, and both sides need to agree on their meaning: `400` for a malformed request (the frontend sent something wrong — a fixable client-side bug), `401` for missing/invalid auth (the frontend should prompt re-login), `403` for authenticated-but-not-permitted (do not prompt re-login — the user's identity is fine, their permission isn't), `404` for a resource that doesn't exist, and `500` for a genuine backend/database failure the frontend can't fix by changing its request. Treating all of these as one generic "something went wrong" on the frontend throws away information the backend already went to the trouble of providing.
