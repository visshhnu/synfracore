# Full-Stack Integration & Deployment Quick Reference

## CORS configuration

```javascript
const cors = require('cors');

// Correct: explicit, environment-driven origin, credentials only if needed
app.use(cors({
  origin: process.env.FRONTEND_URL,   // e.g. https://app.example.com
  credentials: true,                  // only if the frontend sends cookies
}));

// WRONG in production -- browsers reject '*' + credentials anyway,
// and it defeats the entire purpose of CORS if it did work
app.use(cors({ origin: '*', credentials: true }));

// Multiple allowed origins (e.g. staging + production)
const allowedOrigins = [process.env.FRONTEND_URL, process.env.STAGING_FRONTEND_URL];
app.use(cors({
  origin: (origin, callback) => {
    if (!origin || allowedOrigins.includes(origin)) callback(null, true);
    else callback(new Error('Not allowed by CORS'));
  },
}));
```

## Environment variable patterns

```bash
# backend/.env -- private, never shipped to the browser
DATABASE_URL=postgresql://user:pass@host:5432/dbname
JWT_SECRET=long-random-private-secret
FRONTEND_URL=https://app.example.com

# frontend/.env.local -- NEXT_PUBLIC_ vars ARE shipped to the browser bundle
NEXT_PUBLIC_API_URL=https://api.example.com
```

| Value type | Belongs where | Visible to end users? |
|---|---|---|
| Database credentials | Backend only | No |
| JWT signing secret | Backend only | No |
| Third-party private API key | Backend only | No |
| Public API URL | Frontend (`NEXT_PUBLIC_`) | Yes |
| Publishable/public key | Frontend (`NEXT_PUBLIC_`) | Yes |

## Full-stack request-flow checklist

```text
[ ] Frontend calls the correct API URL (from an env var, never hardcoded)
[ ] Backend CORS config allows the frontend's actual current origin
[ ] Auth token is attached on every request to a protected route
    (Authorization: Bearer <token>)
[ ] Backend middleware actually verifies the token BEFORE the route
    handler runs -- confirm it's applied to the route, not just defined
[ ] Backend returns a consistent { error: "message" } shape on failure
[ ] Frontend has an explicit loading state, error state, AND success
    state for every data-fetching call -- not just the happy path
[ ] 401 vs 403 are handled differently on the frontend
    (401 -> clear token, prompt re-login; 403 -> do NOT clear token)
```

## Pre-deployment checklist

```text
[ ] Every environment variable required in production is actually SET
    on the deployment platform -- not just present in a local .env file
[ ] FRONTEND_URL / CORS origin on the backend points at the REAL
    deployed frontend URL, not localhost
[ ] NEXT_PUBLIC_API_URL on the frontend points at the REAL deployed
    backend URL, not localhost
[ ] No hardcoded localhost references anywhere in either codebase
    (grep -rn "localhost" src/ before every deploy)
[ ] Database connection string points at the production database,
    with SSL configured if the production database requires it
[ ] JWT_SECRET (or equivalent signing secret) is identical across every
    instance of the backend that issues AND verifies tokens
[ ] Tested against the ACTUAL deployed frontend + ACTUAL deployed
    backend together -- not local-against-deployed or deployed-against-local
```
