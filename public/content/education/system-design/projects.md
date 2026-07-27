# System Design — Portfolio Projects

Build these to practice the actual skill system-design interviews test — breaking a vague, large problem into concrete, defensible architecture decisions, then explaining and defending them.

## Project 1: Design a URL Shortener or Rate Limiter (Beginner)

**Time:** 3-4 days

Pick one of the two most commonly used "starter" system-design problems and produce a full design document — this is the problem that teaches the requirements-to-architecture process end to end without excessive scope.

### Steps

1. Write functional and non-functional requirements first (for a URL shortener: how many URLs created/day, read-vs-write ratio, custom alias support? for a rate limiter: what's being limited, per-user or global, what's the acceptable burst behavior?)
2. Do capacity estimation: QPS, storage needed, bandwidth — with your assumptions written down explicitly, not just a final number
3. Produce a high-level design diagram (boxes and arrows: client, load balancer, application servers, database, cache)
4. Go deep on one specific component — for the URL shortener, the encoding scheme (base62 counter vs. hash-based) and its collision handling; for the rate limiter, the actual algorithm (token bucket, sliding window log, sliding window counter) and why you chose it over the alternatives
5. Write a short "trade-offs" section: what did you deliberately not build, and why is that an acceptable simplification at this scale?

### Skills Demonstrated
- The full requirements → estimation → high-level design → deep-dive flow
- Justifying a specific technical choice (encoding scheme, rate-limiting algorithm) against real alternatives
- Explicitly scoping what's out of bounds, not just what's in

### Repository Name
`system-design-url-shortener` or `system-design-rate-limiter`

---

## Project 2: Scaling Case Study — Vertical to Horizontal (Intermediate)

**Time:** 4-5 days

Take a single-server design for a concrete system (a simple social media feed, a chat application, or a similar read/write-heavy service) and walk through scaling it step by step as load increases — documenting exactly what breaks first and what you change to fix it.

### Steps

1. Start with the simplest possible design: one server, one database, no caching
2. Identify the first bottleneck as load increases (usually: database read load) and address it — read replicas, caching layer, or both — explaining why you chose that specific fix
3. Continue: what breaks next (write load? single point of failure? single-region latency?) and address it in turn — don't jump straight to a fully distributed design
4. At each stage, state the specific metric that told you it was time to scale (e.g., "database CPU consistently above 80%," not just "it might get slow")
5. End with a final architecture diagram showing the full evolution, and a summary table: stage, bottleneck, fix, new capacity

### Skills Demonstrated
- Incremental scaling reasoning, not jumping straight to a maximally complex design
- Connecting specific bottlenecks to specific, justified fixes
- Communicating an architecture's evolution, not just its final state

---

## Project 3: Mock System-Design Interview Writeup (Advanced)

**Time:** 1-2 weeks

Simulate a real 45-60 minute system-design interview on a larger, well-known problem (design WhatsApp, design YouTube, design Uber's dispatch system, or similar) — timed, following the interview structure this course's Overview lays out, then write up a full self-critique.

### Steps

1. Pick a large, well-known system-design problem and set a strict 45-60 minute timer
2. Work through it live, following the interview structure: clarify requirements (5 min) → capacity estimation (3 min) → high-level design (10 min) → deep dive on 2-3 components (15 min) → discuss trade-offs and failure modes (remaining time)
3. Record yourself (audio is enough) or have someone else observe and take notes on where you got stuck or rushed
4. Afterward, write a self-critique: which step took longer than it should have, which requirement clarification you missed asking, which component you should have gone deeper on
5. Redo the same problem a week later, without your notes, and compare — did the specific weak points actually improve?

### Skills Demonstrated
- Performing system design under real interview time pressure, not just untimed study
- Honest self-assessment against a structured process
- Measurable improvement through deliberate, repeated practice

### Repository Name
`system-design-mock-interview-log`

---

## Tips for Great Projects

**Always state your assumptions explicitly.** "Assuming 10M daily active users, 20% of whom post once/day" is a far stronger start than jumping straight to a database schema — interviewers (and this exercise) are testing whether you can reason from requirements, not whether you know a specific architecture pattern by name.

**Justify every component, don't just name-drop technology.** "I'd use a cache" is weak. "I'd add a read-through cache in front of the database because reads outnumber writes roughly 100:1 in this system, and cache invalidation is manageable because posts are rarely edited after creation" is what's actually being tested.

**Practice the deep-dive, not just the high-level box diagram.** Most candidates can draw load-balancer-to-database boxes; what separates strong answers is going genuinely deep on one or two components (a specific algorithm, a specific consistency trade-off) rather than staying at a surface level throughout.

**For interviews specifically:** be ready to discuss what happens when a component fails — a strong answer always includes failure modes and how the system degrades gracefully, not just the happy-path design.

## Project Checklist
- [ ] At least one full design document with explicit requirements and capacity estimation
- [ ] At least one project showing incremental scaling reasoning, not a single final "complete" design
- [ ] At least one timed mock system-design interview with a written self-critique
- [ ] Comfortable justifying every major component choice against a real alternative
- [ ] Every design includes a discussion of failure modes, not just the happy path
