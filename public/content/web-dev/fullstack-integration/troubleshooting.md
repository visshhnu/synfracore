# Full-Stack Integration & Deployment Troubleshooting Guide

## Issue 1: CORS error appears only after deploying to a different domain than local dev

**Symptom:** Every API call from the frontend fails in the browser console with something like `has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present` — but the same code worked fine in local development.

**Root Cause:** Locally, frontend and backend often share `localhost` (or a dev proxy hides the cross-origin call entirely); once deployed, they're on two genuinely different real origins (e.g. `app.example.com` and `api.example.com`), which is exactly the condition CORS is designed to gate. The backend's CORS configuration usually still only allows the old local-dev origin, or none at all.

**Debug steps:**
```bash
# Confirm the request actually reaches the backend (check server logs/access logs)
# Check the backend's CORS configuration directly
grep -r "cors(" backend/
# Test what origin the backend currently allows
curl -I -H "Origin: https://app.example.com" https://api.example.com/api/ping
```

**Fix patterns:**
```javascript
// Explicitly allow the real deployed frontend origin, via an env var
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true,
}));
// Set FRONTEND_URL on the backend's deployment platform to the ACTUAL
// deployed frontend URL -- not localhost, not a guess
```

---

## Issue 2: Auth token works locally but requests fail after deployment

**Symptom:** Login succeeds and protected routes work fine in local development; after deployment, either login itself fails or every subsequent authenticated request returns `401`/`500`.

**Root Cause:** A required environment variable (most often the JWT signing secret, or the database connection string used to verify user credentials) was never actually set on the deployment platform — it existed only in a local `.env` file that was never copied into the platform's environment configuration.

**Debug steps:**
```bash
# Check the deployment platform's actual environment variable list
# (via its dashboard or CLI) -- do NOT assume local .env values carried over
# Add temporary logging on the backend to confirm which required vars are undefined
console.log('JWT_SECRET set:', !!process.env.JWT_SECRET);
console.log('DATABASE_URL set:', !!process.env.DATABASE_URL);
```

**Fix patterns:**
- Set every required environment variable explicitly on the deployment platform for every environment (staging and production separately, not just once)
- Never assume a variable "must already be set" because it worked in another environment — verify it directly after every deploy that touches environment configuration
- If using a signing secret, confirm it's the *same* value used to both issue and verify tokens — a mismatched secret across separate deploys of the same backend produces exactly this symptom too

---

## Issue 3: Frontend calls the wrong API URL — a hardcoded localhost reference

**Symptom:** After deployment, the frontend's network requests in browser dev tools show calls going to `http://localhost:4000/...` — which obviously doesn't exist from a real visitor's browser.

**Root Cause:** An API URL was hardcoded directly in frontend code during early development (`fetch('http://localhost:4000/api/orders')`) instead of read from an environment variable, and it was never replaced before deployment.

**Debug steps:**
```bash
# Search the frontend codebase for hardcoded localhost references
grep -rn "localhost:4000" frontend/src/
grep -rn "http://localhost" frontend/src/
```

**Fix patterns:**
```javascript
// Never hardcode -- always read from an environment variable
const API_URL = process.env.NEXT_PUBLIC_API_URL;
fetch(`${API_URL}/api/orders`);

// And confirm NEXT_PUBLIC_API_URL is actually set to the real deployed
// backend URL on the deployment platform, not left at a local default
```

---

## Issue 4: App fails after deployment due to dev/production configuration drift

**Symptom:** A feature that works correctly in staging (or local dev) behaves differently or crashes specifically in production, with no code difference between the two.

**Root Cause:** Configuration — not code — has drifted between environments: a different database version/extension available, a required environment variable present in staging but never set in production, or a feature flag/config value that differs without anyone deliberately setting it that way.

**Debug steps:**
```bash
# Diff environment variables between environments directly, don't rely on memory
# (via the deployment platform's dashboard/CLI for each environment)
# Confirm database engine/version parity
psql -h <staging-host> -c "SELECT version();"
psql -h <production-host> -c "SELECT version();"
```

**Fix patterns:**
- Treat every environment variable as required-and-verified in every environment it's needed, not assumed to carry over
- Keep database engine/version as close to identical as practical across environments
- When something works in staging but not production, diff the *configuration* first, before assuming it's a code bug

---

## Issue 5: Database connection works locally but fails in production

**Symptom:** The backend connects to PostgreSQL fine on a local machine (or in staging), but production requests to any database-touching route fail with a connection error or timeout.

**Root Cause:** Usually one of: a connection string pointing at a local/staging database host that was never updated for production, a production database requiring SSL that the connection string doesn't specify, or a network/firewall rule on the production database that doesn't allow connections from the backend's actual deployed IP range.

**Debug steps:**
```bash
# Confirm the connection string actually points at the production database
echo $DATABASE_URL   # on the production backend instance itself, not locally
# Test connectivity directly from the backend's deployed environment,
# not from your local machine (which may have different network access)
psql "$DATABASE_URL" -c "SELECT 1;"
```

**Fix patterns:**
```javascript
// Production PostgreSQL connections frequently require SSL explicitly
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false,
});
```
- Confirm the production database's firewall/network rules explicitly allow the backend's deployment platform's outbound IP range or networking mode
- Never assume a connection string that works locally will work unchanged in production — host, SSL requirements, and network access all commonly differ

---

## Prevention Tips

- Never hardcode a URL, host, or origin anywhere in frontend or backend code — always read it from an environment variable, even during early local-only development
- After every deploy, explicitly verify every required environment variable is actually set on the deployment platform — don't assume it carried over from a previous deploy or another environment
- Set CORS `origin` from an environment variable per environment, never a single hardcoded value and never `'*'` alongside `credentials: true`
- Test the actual deployed frontend against the actual deployed backend after every deployment — testing deployed-frontend-against-local-backend (or vice versa) can hide exactly the bugs that only show up when both sides are genuinely deployed
- Keep a short, explicit checklist of every environment variable required per environment, and run through it deliberately on every deploy rather than relying on memory
