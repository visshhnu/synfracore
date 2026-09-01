# Full-Stack Integration & Deployment — Prerequisites

## What You Need Before Starting

This is the **capstone** technology of the Web Development academy. That's not a soft framing — the prerequisites below are real, hard requirements, not a suggested warm-up. Nothing here is re-taught; every prior technology is used directly, by name.

### Required: Frontend track fluency

React — components, props, state, hooks (`useState`, `useEffect`) — needs to be comfortable, not brand-new. Next.js's routing, data-fetching, and environment variable conventions (`NEXT_PUBLIC_`) are used directly throughout. If you're still looking up basic React syntax, finish this academy's React and Next.js technologies first — this course starts from "you can already build a working UI" and moves straight to connecting it to a real backend.

### Required: Backend track fluency

Node.js fundamentals, Express (routing, middleware, the `next()` contract, error-handling middleware), REST API design (resource-oriented URLs, status codes, request/response shapes), and this academy's Authentication technology (issuing and verifying tokens, protecting routes with middleware) — all four are assumed at working fluency, not introductory familiarity. This course's Intermediate module, for example, wires together an auth flow using patterns your Authentication technology already taught in depth; it does not re-explain what a JWT is.

### Recommended, not hard-blocking: Databases and DevOps familiarity

Basic familiarity with this platform's own **Databases academy** (specifically PostgreSQL) and **DevOps academy** (specifically Docker and CI/CD Pipelines) genuinely helps, but isn't a hard prerequisite — this course teaches just enough of each to show how they integrate into a full-stack app, and explicitly points to those academies for real depth at every relevant section. Arriving here without having touched either academy yet is workable; arriving here without React or Express fluency is not.

### What you do *not* need yet

- **Prior professional full-stack job experience** — this course is specifically designed to be the bridge from "I know these technologies separately" to "I've built and deployed one real app that uses all of them together."
- **Deep database administration knowledge** — connecting to PostgreSQL is covered at the integration level this course needs; indexing, MVCC, and query performance are the Databases academy's job, not this one's.
- **Deep CI/CD or containerization expertise** — same pattern: enough to wire a full-stack app into a pipeline or a container, not enough to design either from scratch. The DevOps academy is where that depth lives.

### Quick self-check

Can you, right now and without looking anything up: build a React component that calls a REST API endpoint, write an Express route with auth-checking middleware that returns a proper JSON error on failure, and explain what a JWT is and where it gets verified? If all three feel solid, start at Fundamentals. If any of them feel shaky, that's a real signal to go back to the specific prior technology (React/Next.js, Express, REST API Design, or Authentication) first — this course will not slow down to re-teach it.
