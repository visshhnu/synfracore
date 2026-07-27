# System Design — Learning Roadmap

## Estimated Time to Interview-Ready
**8-10 weeks** of consistent learning (2-3 hours/day) — system design is a skill built through repeated, structured practice on real problems more than through reading; the timeline below front-loads the core process (requirements → estimation → design → deep-dive) before moving to larger, more complex systems.

## Phase 1: Foundation (Week 1-2)

- The four-step approach to any system-design question: clarify requirements, capacity estimation, high-level design, deep dive
- Core building blocks: load balancers, application servers, databases, caches, and what each one is actually for
- Complete the Fundamentals section in this course

**Checkpoint:** given a one-line prompt like "design a URL shortener," can you produce a clarifying-questions list before attempting any design at all?

## Phase 2: Core Concepts and First Designs (Week 2-5)

- Horizontal vs. vertical scaling, database replication, and basic caching strategies
- CAP theorem and the consistency/availability trade-off in concrete terms, not just the abstract definition
- Complete Project 1 (URL shortener or rate limiter design) from this course's Projects section

**Checkpoint:** can you explain, with a specific example, a situation where you'd choose eventual consistency over strong consistency, and why the trade-off is acceptable there?

## Phase 3: Scaling and Applied Practice (Week 5-8)

- Load balancing algorithms, database sharding, and message queues for decoupling components
- Complete Project 2 (scaling case study) from this course's Projects section
- Start working through larger, well-known system-design problems (chat systems, feed systems, ride-sharing dispatch)

**Checkpoint:** given a single-server design, can you identify the first bottleneck that would appear as load increases, before being told what it is?

## Phase 4: Timed Practice and Interview Readiness (Week 8-10)

- Failure modes and graceful degradation — what a strong design explicitly accounts for beyond the happy path
- Complete Project 3 (mock system-design interview writeup) and review this course's Interview Q&A section
- Do multiple timed mock interviews, specifically tracking which step (requirements, estimation, high-level design, deep dive) consistently takes too long

## Skills You'll Build

| Skill Area | What You'll Learn |
|---|---|
| Requirements Gathering | Turning a vague prompt into concrete functional/non-functional requirements |
| Capacity Estimation | Back-of-envelope QPS/storage/bandwidth calculations |
| Architecture Design | Building and justifying a component diagram from scratch |
| Trade-off Reasoning | CAP theorem, consistency models, and scaling trade-offs in practice |
| Interview Performance | Executing the full process under real time pressure |

## Weekly Study Plan

```
Monday:    New concept — fundamentals/intermediate section + examples
Tuesday:   Study a real system's public architecture writeup (many
           companies publish these — a genuinely useful practice source)
Wednesday: Work on the relevant portfolio project
Thursday:  Practice capacity estimation problems specifically — this
           is the step most candidates are weakest at
Friday:    Review interview-style questions and trade-off scenarios
Weekend:   A full timed mock system-design interview
```

## Red Flags to Avoid

- ❌ Jumping straight to a detailed architecture diagram without clarifying requirements first — this is the single most common system-design interview mistake
- ❌ Naming technologies without justifying the choice ("I'll use Redis" without explaining why caching helps here specifically)
- ❌ Designing only the happy path and never discussing what happens when a component fails
- ❌ Treating capacity estimation as a box-ticking step instead of using it to actually inform design decisions later
- ❌ Only studying large, famous systems (design WhatsApp, design YouTube) without also practicing the smaller building-block problems (rate limiter, URL shortener) that teach the core process more directly

## Resources

- **This course**: Overview → Fundamentals → Intermediate → Advanced → Interview Q&A
- **Real published architecture writeups**: many companies (Netflix, Uber, Airbnb engineering blogs) publish genuine system-design decisions and trade-offs — reading these is higher-signal than most generic prep material
- **"Designing Data-Intensive Applications" (Kleppmann)**: the standard deeper reference for the concepts underlying most system-design interview questions
- **Mock interview partners or communities**: system design specifically benefits from a real back-and-forth, since real interviews are conversational, not a monologue

## Getting Interview-Ready

1. **Portfolio**: the 3 projects in this course's Projects section, each showing a complete requirements-to-design writeup you can walk through
2. **Practice both scales**: smaller building-block problems (rate limiter, URL shortener) teach the process; larger systems (chat, feed, ride-sharing) test whether you can apply it at scale — practice both, not just one
3. **Timed practice specifically**: system-design interviews are tightly time-boxed; practicing untimed doesn't build the pacing skill that actually gets tested
4. **Study real systems, not just abstract patterns**: being able to reference how a real company actually solved a similar problem (and why) is a genuine differentiator
5. **Always discuss failure modes**: a design that only covers the happy path reads as incomplete to an experienced interviewer — practice adding "what happens if this component goes down" to every design by default
