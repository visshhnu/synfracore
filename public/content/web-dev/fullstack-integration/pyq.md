# Full-Stack Integration & Deployment — PYQ (Previously Asked / Practice Questions)

**Framing note:** "Full-stack integration" isn't a certified, standardized topic the way a specific technology's exam might be — there is no public past-paper archive for it, and no proctored exam this content could reference. What follows is built directly from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented behavior of CORS, environment variables, auth flows, and deployment — not invented "leaked" exam content.

---

### 1. (Domain: CORS) A frontend's `fetch` call to a deployed backend fails with a CORS error, but the backend's own logs show the request was received and processed successfully. How is this possible?

**Answer:** CORS is enforced entirely by the browser, on the response side, not by the server refusing the request. The backend can receive, process, and respond to the request completely normally — the browser is the one refusing to hand that response to the frontend's JavaScript, because the response didn't include an `Access-Control-Allow-Origin` header permitting the calling origin. This is exactly why server-side logs showing a successful request don't rule out a CORS problem — they're looking at a different half of the interaction than where the block actually happens.

---

### 2. (Domain: Environment Variables) Why is it a real security mistake, not just sloppy naming, to store a database password in a Next.js `NEXT_PUBLIC_DATABASE_URL` variable?

**Answer:** Any environment variable prefixed `NEXT_PUBLIC_` (or the equivalent convention in another frontend framework) is compiled directly into the JavaScript bundle shipped to every visitor's browser at build time — it is not hidden or obscured, just embedded in files anyone can open via browser dev tools or by viewing the deployed page's source. A database password stored this way is genuinely, trivially exposed to anyone who visits the site, not just theoretically at risk — this is a real, complete credential leak, not a best-practice violation.

---

### 3. (Domain: Auth Token Flow) A protected backend route returns 401 for every request, even ones sent immediately after a successful login. What are the two most likely places to check first?

**Answer:** First, whether the frontend is actually attaching the token on the request — a common mistake is storing the token correctly after login but forgetting to include it in the `Authorization` header on subsequent calls. Second, whether the backend's auth-verification middleware is actually applied to that specific route — a route defined without the middleware, or with a typo in how it's wired up, will behave as if no token was ever checked in the first place, or will fail verification if the middleware itself has a bug. Both produce an identical 401, which is why checking the token-attachment step on the frontend and the middleware-application step on the backend, in that order, resolves the large majority of cases.

---

### 4. (Domain: Deployment Topology) What's the concrete tradeoff between deploying a frontend and backend on the same platform (same origin) versus two separate platforms?

**Answer:** Same-origin deployment (e.g. a Next.js app whose API routes act as the backend, all deployed as one unit) eliminates CORS between frontend and backend entirely, since there's no cross-origin call happening at all, and there's only one deployment pipeline and one set of environment variables to manage. Separate deployment allows the backend to run on infrastructure genuinely suited to its needs (a persistent server, more compute) independently of the frontend's platform, at the cost of reintroducing CORS configuration and requiring two deployments' environment variables to be kept in sync with each other.

---

### 5. (Domain: Environment Parity) A feature works correctly in staging but fails specifically in production, with identical code deployed to both. What category of cause should be investigated first, and why?

**Answer:** Configuration drift between the two environments, investigated before assuming a code-level bug — since the code is identical, the difference has to live in what's genuinely different between the environments: environment variables set in one but not the other, a different database engine/version, or a different network/firewall configuration. Diffing the actual environment configuration between staging and production directly (not from memory) is the correct first step, because a code-level explanation is ruled out by the premise that the code is identical.

---

### 6. (Domain: AI-Assisted Development) Why does this course treat "the AI wrote it" as an unacceptable answer for a bug in shipped code, even when using an AI assistant is otherwise treated as legitimate professional practice?

**Answer:** Because using an assistant to generate a first draft doesn't transfer responsibility for understanding and verifying that code — the developer who reviews and ships a change is accountable for it regardless of who or what wrote the initial draft, the same way accepting a teammate's pull request without reviewing it wouldn't excuse a bug it introduced. The practice this course teaches is scoped prompting plus deliberate review before shipping, specifically so every line — AI-generated or not — can be explained and defended, which is also exactly what a technical interviewer is testing for when they ask about AI usage.

---

### 7. (Domain: Database Connectivity) A backend's PostgreSQL connection works locally without any SSL configuration, but fails in production with a connection error. What's the most likely reason, and is this a code bug?

**Answer:** Most production-managed PostgreSQL instances require SSL for connections, while a local Docker-run PostgreSQL instance typically doesn't enforce it — the connection string or client configuration that worked locally without SSL settings simply doesn't satisfy production's requirement. This isn't really a code bug in the application logic; it's a configuration gap between environments (see environment parity), and the fix is adding explicit SSL configuration to the database client, conditioned on environment, rather than debugging application code that was never the actual problem.

---

### 8. (Domain: Error Handling Contract) Why does a shared, consistent error-response shape between frontend and backend matter more in a full-stack app than it might seem?

**Answer:** The frontend can only show a genuinely useful error message if it can reliably parse what the backend sent — if different endpoints return errors in inconsistent shapes (sometimes a string, sometimes an object, sometimes just a status code with no body), the frontend either has to special-case every endpoint or fall back to a generic, unhelpful message for all of them. A single shared shape (commonly `{ error: "message" }`) returned consistently across every endpoint means one shared frontend parsing function can handle every API call's error case correctly, which is a deliberate contract both sides have to agree on and maintain — it doesn't happen automatically just because each side individually "handles errors."

---

### 9. (Domain: Deployment Verification) After a deployment, why is testing "deployed frontend against local backend" or "local frontend against deployed backend" not a sufficient verification step?

**Answer:** Because it can hide exactly the class of bugs this technology is about — CORS behavior, environment-variable resolution, and network topology are all different when both pieces are genuinely deployed versus when one piece is still running locally. A mixed test can pass (or fail) for reasons that don't reflect how the two pieces will actually behave together once both are truly deployed — the only test that actually verifies a full-stack deployment is the real, fully-deployed frontend calling the real, fully-deployed backend.

---

### 10. (Domain: Scope Boundary) A learner asks why this technology doesn't teach PostgreSQL indexing or how to build a CI/CD pipeline from scratch, given that both are used in its examples. What's the accurate answer?

**Answer:** This technology deliberately teaches only enough of each to show how it integrates into a full-stack app — connecting to a database, wiring a deployment into a pipeline — while pointing explicitly to this platform's own Databases academy (PostgreSQL technology) and DevOps academy (CI/CD Pipelines and Docker technologies) for the actual depth on each. This is a deliberate content-scoping decision, not an oversight: those academies already cover their respective topics in far more depth than would fit here, and duplicating that material at a shallower level here would serve learners worse than directing them to the dedicated material once they understand where each piece fits into the full-stack picture.
