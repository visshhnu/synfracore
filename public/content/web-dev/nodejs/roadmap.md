# Node.js — Learning Roadmap

## Estimated Time to Job-Ready
**4-6 weeks** of consistent learning (2-3 hours/day), assuming solid JavaScript fluency already — Node-specific material (the module system, `fs`/`http`, streams, the event loop's phases) builds directly on JavaScript rather than re-teaching the language itself.

## Phase 1: The Runtime & Core Modules (Week 1)

- Understand what Node actually is: a JS runtime on V8, not a framework — same event-loop model as the browser, different underlying APIs
- CommonJS (`require`/`module.exports`) — Node's default module system, and ES Modules as the opt-in alternative
- `fs`, `path`, `process`, and `os` — Node's core built-in modules
- Build a basic HTTP server using only `http.createServer`, no framework
- `npm init`, `package.json`, installing and using a first dependency

**Checkpoint:** can you explain, concretely, what a browser *cannot* do that Node can, and why? (No DOM/`window` access on the server side; conversely, no file-system or arbitrary network access from browser JS, for security reasons — different APIs for a different environment, same language and same event-loop model underneath.)

## Phase 2: Async I/O, Streams, and Real Patterns (Week 2-3)

- Sync vs. async `fs` methods, and why sync methods are a real hazard inside a request handler specifically (they block every other request)
- Streams — build a file-serving endpoint using `createReadStream().pipe(res)` and understand why it beats loading the whole file into memory
- The EventEmitter pattern — build a small event-driven component from scratch
- Error handling conventions across callbacks, Promises, and `async`/`await` — and the specific unhandled-rejection bug
- `.env` files and environment-based configuration

**Checkpoint:** given a slow file-serving endpoint under load, can you explain the specific difference `fs.createReadStream().pipe(res)` makes over `fs.readFile()` in terms of memory and time-to-first-byte, not just "streams are more efficient"?

## Phase 3: The Node Event Loop & Concurrency Model (Week 3-4)

- **This is the single most distinctive Node topic and the most common deep interview question.** Learn the actual phases (timers, pending callbacks, poll, check, close) — not just "there's an event loop"
- `process.nextTick` and Promise microtasks vs. macrotask phases — the precise ordering rules
- Understand exactly why a synchronous, CPU-bound operation blocks *every* concurrent request Node is handling — reproduce it yourself with a deliberately blocking loop
- `worker_threads` for CPU-bound work that must stay in-process; `cluster` for scaling request throughput across CPU cores

**Checkpoint:** can you explain, in your own words, why Node is described as good for I/O-bound work but not CPU-bound work — specifically, what mechanism makes that true, not just that it's a known rule of thumb? If this is unclear, spend more time here — it's a real production issue and a near-guaranteed interview topic specifically because it's Node-distinctive.

## Phase 4: Production Readiness & Interview Prep (Week 4-6)

- Memory leaks: recognize the sawtooth-vs-rising-floor memory pattern, and know the standard fix for the most common real cause (an unbounded in-memory cache)
- `perf_hooks.monitorEventLoopDelay` and what rising event-loop lag actually signals
- npm semantic versioning, `package-lock.json`, and evaluating whether a dependency is safe to add
- Build the three portfolio projects (see the Projects tab) — a CLI tool, a streaming file-upload server, and a REST API built on raw `http`, deliberately without a framework yet
- Review this course's Interview Q&A and practice explaining the event loop's phases and the worker_threads/cluster distinction out loud, not just recognizing them when reading

## Common Pitfalls Specific to Node.js (Not Generic Study Advice)

- **Treating `async`/`await` as a fix for CPU-bound work** — it only helps with I/O waiting; a genuinely CPU-heavy synchronous loop blocks the thread regardless of how it's called
- **Using `fs.readFileSync` inside a request handler out of habit from script-writing** — fine in a one-off script, a real hazard in a server handling concurrent requests
- **Forgetting to `.catch()` or `await` a Promise inside a fire-and-forget call** — the single most common source of a silently swallowed error or an unexpected process crash
- **Assuming `cluster` fixes a blocking-code problem** — it multiplies capacity across processes, but each individual process is still just as blockable by the same CPU-heavy code

## Getting Your First Node.js-Heavy Role

1. **Portfolio:** projects that specifically demonstrate Node-distinctive skills (a streaming upload handler, a CLI tool using `fs`, a raw-`http` API) — not just "I used Express," which shows framework familiarity but not runtime understanding
2. **Resume:** be specific — "diagnosed event-loop blocking caused by synchronous JSON serialization on the hot path, reducing p99 latency by measuring and fixing the root cause" is far stronger than "experience with Node.js"
3. **Know what's next, deliberately:** this technology is the runtime foundation — Express (routing/middleware on top of Node) and REST API Design are the natural next technologies in this platform's Backend path
4. **Interview prep:** the event loop's phases and the single-threaded-but-concurrent nuance come up constantly in Node-specific interviews precisely because they distinguish real runtime understanding from framework-only familiarity
