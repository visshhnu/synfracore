# Cloud Architecture Patterns — Learning Roadmap

## Stage 1 — Cloud fundamentals, if not already solid (2-3 weeks)

Don't start pattern-learning without genuine comfort in core services first (see Prerequisites) — patterns are combinations, and combining things you don't individually understand just produces confusion dressed up as architecture knowledge.

## Stage 2 — Learn each pattern's problem, not just its name (1-2 weeks)

Work through Fundamentals pattern by pattern, and for each one, be able to state the specific problem it solves *before* moving to the next — "Saga solves distributed transactions across microservices" is the kind of one-sentence problem statement you should be able to give for all six core patterns by the end of this stage. Pattern names without the underlying problem are trivia, not usable knowledge.

## Stage 3 — Build a toy version of each pattern (2-3 weeks)

Using the practice environment from Installation, actually build a small, working version of at least three patterns — Serverless Event-Driven (S3→Lambda→DynamoDB) and Strangler Fig (API Gateway routing between two toy services) are the fastest to stand up and see working end-to-end; Multi-AZ is the fastest to see actually fail over if you deliberately break one AZ's resources.

## Stage 4 — Intermediate depth: tradeoffs, not just mechanics (2-3 weeks)

Work through Intermediate's material — choreography vs. orchestration, CQRS with event sourcing, multi-region vs. multi-AZ. This is where "I know what the pattern is" becomes "I know when to actually use it and what it costs," which is the level most real architecture interviews and decisions operate at.

## Stage 5 — Cost and tradeoff articulation (1 week, but revisit often)

Deliberately practice explaining the cost tradeoff of each pattern out loud or in writing — Intermediate's cost-implications section is the reference, but the actual skill is being able to generate this reasoning yourself for a pattern combination you haven't specifically memorized a cost analysis for.

## Stage 6 — Advanced production concerns (ongoing, project-driven)

Pick one advanced concept — circuit breakers/bulkheads, multi-region active-active conflict resolution, or Saga idempotency at scale — and implement it for real rather than reading about all of them shallowly. Depth on one genuinely hard problem, actually solved, teaches more than shallow familiarity with the full advanced list.

## What "done" looks like at each level

- **Junior-ready**: can name each pattern and the specific problem it solves, has built a toy version of at least one.
- **Mid-level-ready**: can articulate the cost/tradeoff of each pattern, has practiced multiple patterns hands-on, understands choreography vs. orchestration and CQRS's consistency tradeoff specifically.
- **Senior-ready**: has designed for partial failure explicitly (not just total-outage thinking), can reason through multi-region conflict resolution and split-brain scenarios from first principles, and can write an ADR-style justification for a real architectural decision.
