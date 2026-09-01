# Node.js — Revision Notes

Condensed from Overview, Fundamentals, Intermediate, Advanced, and Troubleshooting — use this for a fast pre-interview or pre-project review, not as a first-time learning source.

## What Node Is

- A JavaScript **runtime** built on V8 (Chrome's engine), not a framework — lets JS run outside the browser
- Same event-loop *model* as the browser (single call stack, non-blocking hand-off); different underlying APIs (`fs`, `http`, `net` via libuv instead of DOM/Web APIs)
- Still fundamentally single-threaded for JS execution — I/O concurrency comes from never blocking that one thread on I/O, not from parallel JS

## Module System

- **CommonJS** (`require`/`module.exports`) — Node's original, synchronous, still the default
- **ES Modules** (`import`/`export`) — opt-in via `"type": "module"` or `.mjs`
- `require()` caches — requiring the same file twice returns the same object reference, not a fresh execution
- Mixing the two systems incorrectly is a common, real source of "Cannot find module" / loader errors

## Core Built-in Modules

- `fs` — file I/O; `*Sync` methods block the whole thread, avoid inside request handlers
- `path` — cross-platform path building; use with `__dirname` for file-relative paths
- `http` — the module every framework (Express) is built on top of; routing/body-parsing are manual here
- `process` — env vars (`process.env`), args (`process.argv`), exit codes, global process events

## Streams (the most Node-distinctive topic)

- Process data in chunks, not all at once — constant memory use regardless of file size
- `readStream.pipe(writeStream)` handles backpressure automatically
- Every core I/O API (`fs`, `http`, `net`) is stream-based natively

## EventEmitter

- Base class behind streams, `http`, and most of Node's own event-driven APIs
- `.on()` (repeatable), `.once()` (fires once), `.emit()`, multiple independent listeners per event

## The Node Event Loop (more granular than the browser model)

- Phases, in order: **timers → pending callbacks → poll → check → close callbacks**
- Microtasks (Promise callbacks, `process.nextTick`) drain between every phase, not just at the end
- `process.nextTick` has the highest priority of anything in the loop
- `setImmediate` runs before `setTimeout(fn, 0)` **when both are scheduled inside an I/O callback** (poll before check) — ordering is less strictly defined from the top-level module

## Concurrency for CPU-bound Work

- `async`/`await` only helps with I/O waiting — it does nothing for genuine CPU-bound computation
- `worker_threads` — real parallel JS within one process, for CPU-bound work that must stay in-process
- `cluster` — multiple Node *processes*, each with its own event loop, for scaling request throughput across cores; does NOT make any individual process immune to being blocked

## Error Handling

- Error-first callbacks: `(err, data) => {}` — nothing checks `err` automatically, must be explicit every time
- `async`/`await`: wrap in `try/catch`
- The classic bug: calling an `async` function without `await`/`.catch()` — unhandled rejection, can crash the process
- Global safety nets: `process.on("unhandledRejection", ...)`, `process.on("uncaughtException", ...)` — log, don't rely on as primary handling

## npm / Versioning

- `^4.19.2` = minor+patch updates OK, never major; `~4.17.21` = patch only; no prefix = pinned exactly
- `package-lock.json` pins the *exact resolved* tree — commit it, use `npm ci` in CI/production
- `dependencies` vs `devDependencies` — production installs can skip dev-only tooling

## Memory Leaks

- Classic real cause: an unbounded in-memory cache/array nothing ever evicts from
- Healthy memory graph: sawtooth (rise, GC, drop, repeat). Leak signature: sawtooth with a rising floor over hours/days
- Fix: bound caches with LRU eviction and/or a TTL
- Diagnose with `node --inspect` heap snapshots, compared across time under load — watch object *count*, not just size

## Production Health Signals

- `perf_hooks.monitorEventLoopDelay()` — rising event-loop lag is the earliest, most Node-specific health signal
- A process can look "up" (accepting connections) while effectively unresponsive if the event loop is blocked

## Versioning Note

The following are genuinely volatile and should be re-verified against current sources, not treated as fixed facts from this page: `(needs verification — recheck against current source)`

- The current Node.js LTS version number and its exact release/EOL dates
- Whether `node --env-file` has fully superseded the `dotenv` package for a given project's minimum supported Node version
- npm's exact current default behavior around `npm install` vs `npm ci` in edge cases, and current `npm audit` output format
- Current JSNAD/JSNSD certification pricing and exam format (see the Certification tab)
