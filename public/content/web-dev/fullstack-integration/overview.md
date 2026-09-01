# Full-Stack Integration & Deployment

> **Where every piece of this academy actually becomes one working, deployed application**

**Category:** Full-Stack / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** this is the **capstone** technology of the Web Development academy, and it deliberately assumes genuine fluency, not familiarity — in this academy's Frontend track (React, and ideally Next.js) and its Backend track (Node.js, Express, REST API Design, and Authentication). None of those are re-taught here; they're referenced by name and used directly. If any of them still feel shaky, this is the wrong place to start. See the **Prerequisites** tab for the full detail and a self-check.

---

## What is Full-Stack Integration?

Every prior technology in this academy taught one instrument in isolation — React taught you to build a UI, Express taught you to build an API, Authentication taught you to verify who's making a request. Full-stack integration is learning to play them together as an orchestra. Each instrument can be technically correct on its own and the result can still be unlistenable if they're not wired together correctly — and that's exactly the point of this technology: most of the real difficulty in professional full-stack work lives at the **seams** between pieces, not inside any single piece. A React developer who's never had to worry about CORS, and a backend developer who's never had to worry about an environment-specific API URL, are both about to hit exactly the same wall for the first time here.

Technically: a full-stack application is a **frontend** (React, typically via Next.js) that talks over HTTP to a **backend API** (an Express server, or Next.js's own API routes acting as the backend), which reads and writes a **database**, with requests to protected resources verified by an **authentication** layer — and the whole thing has to actually be **deployed** somewhere real, not just running on a laptop.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Browser", "sublabel": "User interacts with the UI", "color": "slate" },
    { "label": "Frontend", "sublabel": "React / Next.js — renders UI, calls the API", "color": "blue" },
    { "label": "Backend API", "sublabel": "Express or Next.js API routes — auth check, business logic", "color": "purple" },
    { "label": "Database", "sublabel": "Reads/writes persisted data", "color": "green" },
    { "label": "Response", "sublabel": "Data flows back up the same chain to the browser", "color": "amber" }
  ]
}
```

Every arrow in that diagram is a place where two independently-correct pieces have to agree on a contract — a URL, a header, a token format, a JSON shape — and where "it works on my machine" quietly stops being true the moment a real deployment boundary shows up.

## Why Full-Stack Integration?

Knowing React and knowing Express separately does not automatically mean you know how to wire them together correctly. **CORS**, environment-specific API URLs, the exact flow of an auth token from a login form on the frontend to a verified request on the backend, and the topology of where each piece actually runs once deployed — these are genuinely separate skills, learned specifically at the integration layer, and none of them show up if you only ever practiced React or Express in isolation, disconnected from a real backend or a real deployment.

This is also, deliberately, the **portfolio-defining skill** of the entire academy. A hiring manager evaluating a junior or mid-level full-stack candidate is almost never looking at isolated React components or isolated API endpoints in a vacuum — they're looking at a deployed, working link they can actually click and use. A project that runs perfectly in `localhost` and has never survived a real deployment is not yet evidence of full-stack skill; a project that's live, that a stranger can sign up for and use, is.

**A scoping note that applies to every section below:** this technology deliberately does not re-teach the database layer, CI/CD pipelines, containerization, or AI-assisted-dev-tooling in depth — this platform's own **Databases**, **DevOps**, and **AI Engineering** academies already cover those in far more depth than a section here ever could. This technology's job is narrower and more specific: show exactly how those pieces plug into a full-stack app, then point directly at where the real depth lives.

---

## Learning Modules

### Module 01 — Connecting Frontend to Backend
*CORS, environment variables, and the auth-token handshake — the seams themselves*

**Topics covered:**

- HTTP requests from a React/Next.js frontend to an Express (or Next.js API route) backend — 🟢 Beginner
- CORS as a real browser security mechanism, not an arbitrary error — 🟡 Intermediate
- Environment variables across frontend vs. backend, and the public/private security distinction — 🟡 Intermediate
- AI-assisted development in a real full-stack workflow — 🟡 Intermediate

### Module 02 — Adding a Real Database & Auth
*Wiring a persistence layer and an identity layer through the whole stack, end to end*

**Topics covered:**

- Connecting a backend to PostgreSQL (pointer to this platform's Databases academy for depth) — 🟢 Beginner
- End-to-end auth flow: login form → API call → token issued → stored → sent → verified — 🟡 Intermediate
- Loading/error states across a real frontend-to-backend data flow — 🟡 Intermediate
- Shared API error-handling conventions — 🟡 Intermediate

```conceptgrid
{
  "boxes": [
    { "title": "Frontend's job", "description": "Collect input, call the API, show loading/error/success states honestly", "color": "blue" },
    { "title": "Backend's job", "description": "Validate the request, check auth, talk to the database, return a consistent shape", "color": "purple" },
    { "title": "The seam", "description": "A token, a URL, and a JSON contract both sides have to independently agree on", "color": "amber" }
  ]
}
```

### Module 03 — Deployment & the AI-Assisted Dev Workflow
*Getting the app off your laptop and onto the internet, correctly*

**Topics covered:**

- Deployment topology: frontend and backend together vs. separately — 🟡 Intermediate
- CI/CD for a full-stack app (pointer to this platform's DevOps academy) — 🔴 Advanced
- Containerizing a full-stack app (pointer to this platform's Docker technology) — 🔴 Advanced
- Environment parity and configuration drift — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook -- "the frontend deployed fine, but every API call
# fails with a CORS error, even though it worked locally the whole time"

# Step 1: Read the actual browser console error, not just "it's broken"
# Something like:
#   Access to fetch at 'https://api.example.com/orders' from origin
#   'https://app.example.com' has been blocked by CORS policy: No
#   'Access-Control-Allow-Origin' header is present on the requested resource.
# This is the browser refusing to expose the response to your frontend
# JS -- the request likely reached the backend fine; the response just
# wasn't allowed to be read.

# Step 2: Confirm this is new, not pre-existing -- locally, frontend and
# backend both ran on localhost (often even the same origin via a dev
# proxy), so CORS never triggered. Deployment put them on two DIFFERENT
# real origins (app.example.com vs api.example.com) -- exactly the
# condition CORS exists to gate.

# Step 3: Check the backend's CORS configuration for what it actually
# allows right now
grep -r "cors(" server/
# If it's cors() with no options, or an origin left over from local dev
# (http://localhost:3000), that's the gap -- it never included the real
# deployed frontend origin.

# Step 4: Fix -- explicitly allow the deployed frontend's real origin
# app.use(cors({ origin: process.env.FRONTEND_URL, credentials: true }))
# and set FRONTEND_URL on the backend's deployment platform to the
# actual deployed frontend URL, not localhost.

# Step 5: Redeploy the backend, then verify from the ACTUAL deployed
# frontend (not localhost hitting the deployed backend, and not the
# deployed frontend hitting a local backend -- both would hide the bug)
curl -I -H "Origin: https://app.example.com" https://api.example.com/orders
# Confirm Access-Control-Allow-Origin now reflects the real frontend origin

# Step 6: Prevention -- derive allowed origins from an environment
# variable set per-environment (dev/staging/prod), never hardcode a
# single origin and never use origin: '*' alongside credentials: true
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What does "full-stack" actually mean as a skill, beyond knowing multiple technologies?**

**A:** **Problem:** knowing React and knowing Express independently doesn't mean you know how to make them work together — the integration layer (CORS, env vars, auth-token flow, deployment topology) is a genuinely separate skill set that neither technology teaches on its own. **Solution:** full-stack skill is specifically the ability to reason about the seams — what crosses a network boundary, what crosses a public/private boundary, what has to stay consistent across two independently deployed pieces. **Result:** this is exactly why a deployed, working project is stronger portfolio evidence than isolated frontend or backend code — it's the only thing that actually proves the integration skill, not just the component skills.

---

**Q2. What is CORS, and why does it exist?**

**A:** **Problem:** without a restriction, any website's JavaScript could silently make authenticated requests to any other site on a user's behalf (using the user's cookies/session) and read the response — a real cross-site attack surface. **Solution:** CORS (Cross-Origin Resource Sharing) is a browser-enforced mechanism where a server explicitly declares, via response headers, which origins are allowed to read its responses from browser JavaScript; the browser blocks the response from being read by your frontend code if the origin isn't allowed. **Result:** it's the browser protecting the *user*, not the server — the request itself frequently still reaches the backend; the browser just refuses to hand the response to your JavaScript, which is why CORS errors are so often mistaken for the request never having happened at all.

---

**Q3. Walk through how an auth token actually flows from frontend to backend, end to end.**

**A:** **Problem:** "the frontend and backend both handle auth" isn't specific enough to actually implement or debug. **Solution:** a login form submits credentials to a backend endpoint; the backend verifies them and issues a token; the frontend stores that token (memory, a cookie, or storage, depending on the app's security requirements); every subsequent API request attaches that token (commonly an `Authorization: Bearer <token>` header); backend middleware verifies the token on each protected route before the route handler runs, using this academy's own Authentication technology's patterns. **Result:** a break anywhere in that chain — the token never being attached, or backend middleware never actually being applied to a route — produces the exact same symptom (a 401), which is why tracing the full chain, not guessing, is the real debugging skill.

---

**Q4. What's the real security distinction between a frontend and a backend environment variable?**

**A:** **Problem:** treating all environment variables as equally private is a real, common security mistake. **Solution:** a frontend environment variable (in this academy's Next.js technology, anything prefixed `NEXT_PUBLIC_`) gets baked directly into the JavaScript bundle shipped to every visitor's browser — anyone can read it via dev tools. A backend environment variable never leaves the server and is genuinely private. **Result:** a database password or a private API key must never be a frontend/public env var — only values that are already meant to be public (a publishable API key, a public analytics ID) belong there.

---

**Q5. What are the tradeoffs between deploying frontend and backend together vs. separately?**

**A:** **Problem:** there's no universally correct deployment topology — the right choice depends on the app. **Solution:** deploying together (e.g. a Next.js app with API routes as its own backend, deployed as one unit) minimizes CORS concerns entirely (same origin) and simplifies deployment, but couples frontend and backend scaling and release cycles. Deploying separately (a static/edge-hosted frontend, a separately-hosted Express backend) allows independent scaling and release cycles but reintroduces CORS and requires coordinating two deployments and two sets of environment configuration. **Result:** most small-to-mid projects start together for simplicity; separating becomes worth the added complexity once the backend has scaling or infrastructure needs genuinely distinct from the frontend's.

---

**Q6. How would you talk about using AI coding assistants honestly in an interview?**

**A:** **Problem:** this is a genuinely current, increasingly common interview question in 2026, and both "I don't use them" and an evasive non-answer read poorly. **Solution:** answer honestly and specifically — what you use them for (boilerplate, tests, unfamiliar syntax, a first draft to react to) and what you deliberately don't hand off (architecture decisions, anything security-sensitive like an auth flow) without reviewing every line yourself. **Result:** interviewers aren't listening for "do you use AI" — they're listening for whether you can explain and defend every line in your own project, including AI-generated ones; that's the actual skill being evaluated.

---

**Q7. A frontend works locally against a local backend but fails entirely after deployment. What's your diagnostic approach?**

**A:** **Problem:** "it worked locally" eliminates almost nothing — local and deployed environments differ in origin, environment variables, and network topology, all at once. **Solution:** check, in order: is the frontend calling the correct deployed API URL (not a hardcoded `localhost`)? Is CORS configured to allow the deployed frontend's real origin? Are all required environment variables actually set on the deployment platform, not just present in a local `.env` file? **Result:** the vast majority of "worked locally, broke in production" full-stack bugs collapse into one of these three categories — treating them as a checklist, rather than starting from scratch, resolves most of them quickly.

---

**Q8. Why does this course explicitly not re-teach databases, CI/CD, or containerization in depth?**

**A:** **Problem:** duplicating material that already exists elsewhere on the platform, at lower depth, would waste a learner's time and produce a worse result than the dedicated material. **Solution:** this course teaches exactly what's needed to *integrate* a database, a deployment pipeline, and a container into a full-stack app, then explicitly points to this platform's Databases, DevOps, and AI Engineering academies for the actual depth on each. **Result:** the scoping is deliberate, not a gap — a learner who wants deep PostgreSQL indexing knowledge or a deep CI/CD pipeline build should go to those academies directly, having already understood, from here, exactly where each piece fits into the full-stack picture.

---

**Q9. How do you handle loading and error states across a real frontend-to-backend data flow?**

**A:** **Problem:** a frontend that assumes every API call succeeds instantly produces a broken-feeling app the moment a request is slow, fails, or returns an error the backend didn't anticipate. **Solution:** every API call from the frontend needs an explicit loading state (shown while the request is in flight), a success state, and a distinct error state — driven by consistent error shapes returned by the backend (a status code plus a predictable JSON error body), not by parsing arbitrary error text. **Result:** this consistency is what lets a frontend show a real, useful error message instead of a generic "something went wrong," and it's a shared contract both sides of the stack have to agree on deliberately, not something either side gets for free.

---

**Q10. What's your experience actually deploying a full-stack project?**

**A:** This is a genuinely personal question — answer with a real project using the Problem → Solution → Result structure: what broke on first deployment (a CORS error, a missing environment variable, a hardcoded localhost URL), how you diagnosed it, and what the actual fix was. Interviewers are listening for whether you've personally hit and resolved a real integration/deployment failure, not just described the theory of one.

---

## Official Resources

- [MDN — Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
- [Vercel Documentation](https://vercel.com/docs) — a real, current frontend/Next.js deployment platform
- [Railway Documentation](https://docs.railway.com/) and [Render Documentation](https://render.com/docs) — real, current platforms for deploying a persistent backend server

*(needs verification — deployment platforms change their exact feature sets, free tiers, and pricing frequently; recheck against each platform's current docs before treating any specific offering as current)*

## Try It (2 Minutes)

Open any two projects you've already built separately in this academy — a React/Next.js frontend and an Express (or Next.js API route) backend. In the frontend, make one `fetch` call to one endpoint on the backend, running both locally on different ports.

```javascript
// frontend, running on http://localhost:3000
fetch('http://localhost:4000/api/ping')
  .then(res => res.json())
  .then(data => console.log(data))
  .catch(err => console.error('Request failed:', err));
```

If the backend doesn't already have `cors()` configured, this fails with a CORS error in the browser console even though both servers are running fine — which is exactly the seam this technology is about. Add `app.use(cors())` on the backend, restart it, and watch the same request succeed. You just reproduced, and fixed, the single most common first full-stack integration bug.
