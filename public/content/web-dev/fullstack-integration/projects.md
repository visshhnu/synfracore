# Full-Stack Integration & Deployment — Portfolio Projects

These are deliberately the most substantial, portfolio-defining projects in the entire Web Development academy — everything before this technology built one piece at a time; these three prove you can ship the whole thing, deployed and working.

## Project 1: Full CRUD App — Deployed, Not Just Built

**Level:** Intermediate
**Time:** 2-3 weeks
**GitHub repo name:** `fullstack-crud-deployed`

**What you build:** A complete CRUD application with a Next.js frontend, an Express (or Next.js API routes) backend, a PostgreSQL database, and JWT authentication protecting create/update/delete operations — deployed live, not just running on `localhost`. Pick a real domain (a task tracker, a personal expense log, a simple inventory system) with at least two related resources (e.g. users and their items) so the auth-scoping actually matters (a user can only see/edit their own data). Ship loading and error states honestly on every data-fetching interaction, not just the happy path. The deployment itself — choosing a topology, setting every environment variable on the real platform, and confirming CORS works from the real deployed origin — is graded as part of the project, not an afterthought after the code is "done."

## Project 2: AI-Assisted Full-Stack Build — Documented Honestly

**Level:** Intermediate
**Time:** 2 weeks
**GitHub repo name:** `fullstack-ai-assisted-build`

**What you build:** A second full-stack app (different domain from Project 1), built with meaningful, real AI coding assistant collaboration throughout — and documented honestly in the repo's README about exactly what the assistant helped with (boilerplate, a test suite, an unfamiliar API's syntax) versus what required your own judgment and review (the auth flow's security, the overall architecture, any database query touching user input). Include at least one real example in the README of an AI suggestion you reviewed and rejected or corrected, and why. This project is explicitly meant to be talked about honestly in an interview — see the Interview Prep tab's question on exactly this.

## Project 3: CI/CD-Deployed Full-Stack App

**Level:** Advanced
**Time:** 2-3 weeks
**GitHub repo name:** `fullstack-cicd-pipeline`

**What you build:** A full-stack app (can reuse Project 1's or 2's domain, or a new one) with a real CI/CD pipeline that automatically runs tests and deploys on every push to `main` — applying this platform's own DevOps academy's CI/CD Pipelines technology directly, not improvising pipeline concepts from scratch. Include environment-specific configuration (at minimum, a staging and production distinction) and demonstrate the pipeline actually catching something — a failing test blocking a bad deploy, or a deliberate broken commit that the pipeline correctly refuses to ship. If you containerize either piece, apply the DevOps academy's Docker technology directly for the Dockerfile itself. Document the pipeline's stages in the README so a reviewer can understand the deploy flow without reading the YAML line by line.

---

All three projects share one non-negotiable bar: **a stranger with the GitHub link should be able to click through to a live, working URL and actually use the app** — sign up, use the core feature, see it behave correctly. A project that only runs locally, or that was deployed once and has since broken, does not meet this bar — and this bar is specifically what separates a full-stack portfolio project from a frontend or backend portfolio project alone.
