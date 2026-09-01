# Full-Stack Integration & Deployment — Learning Roadmap

## Estimated Time to Job-Ready

**3-5 weeks** of consistent learning (2-3 hours/day), assuming genuine fluency already exists across this academy's Frontend track (React/Next.js) and Backend track (Node.js/Express/REST API Design/Authentication) — this is the shortest roadmap in the academy specifically because it isn't teaching new technologies, it's teaching how the technologies you already know actually fit together and ship. As the academy's capstone, this roadmap assumes every prior phase (Foundations → Modern Frontend Core → Backend) is already behind you.

## Phase 1: The First Real Connection (Week 1)

- Scaffold a frontend and backend as two separate local projects, wire a single `fetch` call between them, and deliberately hit and fix your first CORS error rather than avoiding it
- Set up separate `.env`/`.env.local` files for backend and frontend, and internalize the public/private security distinction before writing anything that touches a real secret
- Work through the AI-assisted development subsection honestly — start using an AI coding assistant for this project's boilerplate immediately, with the review discipline from Fundamentals, rather than treating it as a separate skill to pick up later

**Checkpoint:** can you explain, out loud, why a CORS error can appear even when the backend successfully processed the request? (Because CORS is the *browser* blocking your frontend JavaScript from reading the response — not necessarily the backend failing to receive or handle the request at all.)

## Phase 2: Real Data, Real Auth (Week 2)

- Connect the backend to a real PostgreSQL database (pointing to the Databases academy for any schema/query depth beyond a basic connection) and replace hardcoded responses with real queries
- Wire the full authentication flow end to end — login form → token issued → stored → sent → verified by middleware — using this academy's Authentication technology's patterns, not a simplified version
- Build out consistent loading/error states on the frontend and a consistent error-response shape on the backend, and confirm they actually work together, not just independently

**Checkpoint:** if your backend returns a `403` instead of a `401`, does your frontend correctly *not* prompt the user to log in again? (If it does, your frontend is treating every auth-adjacent error identically, which is exactly the kind of integration bug this phase exists to catch.)

## Phase 3: Deployment (Week 3)

- Deploy the frontend and backend for real — pick a topology (together or separately) deliberately, based on the tradeoffs in the Advanced tab, not by default
- Set every required environment variable on the actual deployment platform(s), not just locally, and verify the deployed app actually works end to end — not just that the build succeeded
- Deliberately break something in a controlled way (a missing env var, a stale CORS origin) on a throwaway deploy, diagnose it using the Troubleshooting tab's patterns, and fix it — this rehearsal is worth more than reading about the failure mode

**Checkpoint:** is there anything in your deployed app's environment configuration that only exists locally and was never actually set on the deployment platform? (If you haven't explicitly checked this, assume the answer is yes — this is the single most common full-stack deployment bug.)

## Phase 4: Portfolio & Interview Readiness (Week 4-5)

- Build at least one of the three Portfolio Projects from the Projects tab to completion and keep it genuinely deployed and live, not just built once and abandoned
- If a CI/CD pipeline or container is part of your project, apply the DevOps academy's CI/CD Pipelines and Docker technologies directly rather than improvising — this is exactly the point where those academies' depth becomes directly useful
- Review the Interview Prep material and practice explaining, out loud, the full auth-token flow and a real CORS bug you diagnosed and fixed yourself — not a memorized definition

**Checkpoint:** can you give a stranger a live URL to your deployed project, right now, and have it actually work — sign-up, a real feature, no "it's down at the moment" caveat? That single question is the actual bar this entire roadmap is built around.

## Getting Your First Full-Stack Role

1. **Portfolio:** a deployed, working link matters more here than anywhere else in the academy — this is the technology whose entire premise is "prove the integration, not just the pieces"
2. **Resume:** be specific about the integration work, not just the technologies — "diagnosed and fixed a CORS misconfiguration blocking production API calls after a deployment topology change" is far stronger than "experience with React and Express"
3. **Know where the boundaries are:** be ready to say, honestly, "the database depth is in [the Databases academy]" or "the pipeline itself uses [the DevOps academy's] CI/CD patterns" — knowing exactly what you integrated vs. what you built from scratch is itself a sign of real understanding, not a weakness to hide
4. **Interview prep:** the CORS mechanism, the full auth-token flow, and the public/private environment-variable distinction come up constantly in full-stack interviews specifically because they're the parts that separate someone who's only used one technology at a time from someone who's actually shipped something whole
