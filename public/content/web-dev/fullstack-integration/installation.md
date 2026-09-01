# Full-Stack Integration & Deployment — Installation Guide

This is a setup guide for a real full-stack project's plumbing — scaffolding, database connection, environment files, and choosing where to deploy. It assumes you can already scaffold a React/Next.js app and an Express app independently (covered in their own technologies); this page is specifically about wiring them together as one project.

## Step 1: Scaffold the frontend

```bash
# Next.js -- this academy's own Next.js technology covers scaffolding
# options and the App Router/Pages Router distinction in full;
# this is the minimal command to get a project started
npx create-next-app@latest frontend
cd frontend && npm run dev   # runs on http://localhost:3000 by default
```

*(needs verification — exact scaffolding command/flags change across Next.js versions; recheck against this academy's own Next.js Installation tab)*

## Step 2: Scaffold the backend

```bash
mkdir backend && cd backend
npm init -y
npm install express cors pg dotenv
```

```javascript
// backend/server.js -- the minimal starting point this course builds on
require('dotenv').config();
const express = require('express');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors({ origin: process.env.FRONTEND_URL, credentials: true }));

app.get('/api/ping', (req, res) => res.json({ ok: true }));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`Backend running on http://localhost:${PORT}`));
```

## Step 3: Set up a database connection

```bash
npm install pg   # already included above -- Node's PostgreSQL client
```

```javascript
// backend/db.js -- a minimal connection pool
const { Pool } = require('pg');
const pool = new Pool({ connectionString: process.env.DATABASE_URL });
module.exports = pool;
```

Getting PostgreSQL itself installed and running (Docker, a native install, or a hosted instance) is covered in full, with every platform's options, in this platform's own **Databases academy — PostgreSQL Installation tab**. The fastest path for local full-stack development is the same Docker one-liner used there:

```bash
docker run -d --name postgres -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=myapp -p 5432:5432 postgres:16-alpine
```

## Step 4: Environment variable files for local development

Two separate `.env` files, in two separate directories, is the correct default — never one shared file, since frontend and backend have genuinely different exposure rules (see Fundamentals).

```bash
# backend/.env -- never committed, never shipped to the browser
DATABASE_URL=postgresql://postgres:devpassword@localhost:5432/myapp
JWT_SECRET=a-long-random-local-dev-secret
FRONTEND_URL=http://localhost:3000
```

```bash
# frontend/.env.local -- never committed; NEXT_PUBLIC_ vars ARE shipped to the browser
NEXT_PUBLIC_API_URL=http://localhost:4000
```

Add both `.env` and `.env.local` to `.gitignore` in their respective directories — this is a real, common source of accidentally-committed secrets when a full-stack project's `.gitignore` was written before the backend directory existed.

## Step 5: Choosing a deployment platform

There's no single right answer — the honest, current landscape as of this writing:

- **Vercel** — built specifically for Next.js, excellent fit for a frontend (or a full Next.js app including its own API routes acting as the backend)
- **Railway** or **Render** — both genuinely good fits for a backend that needs to run as a persistent server (a standalone Express app, not just serverless functions) plus a managed PostgreSQL instance

*(needs verification — exact current free-tier limits, pricing, and feature sets for all three change frequently; confirm on each platform's own pricing/docs page before treating any specific detail as current)*

Choosing together-vs-separate deployment is covered as a real architectural tradeoff in the Advanced tab — this step is just knowing the real, current options exist before making that call.

## Next Steps

Both pieces run locally, on separate ports, with a database connection ready. Go to **Fundamentals** to make the first real cross-origin call between them and hit (deliberately, on purpose) your first CORS error.
