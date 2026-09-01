# Node.js — Interview Questions

**Q: Explain what makes Node.js non-blocking and single-threaded, but still able to handle many concurrent connections. Isn't that a contradiction?**

It's not a contradiction once the two things being described are separated. JavaScript execution in Node runs on exactly one thread — one call stack, executing one statement at a time, same as the browser. What's *not* single-threaded is I/O: libuv, Node's underlying C++ library, hands off file reads, network requests, and DNS lookups to the operating system's own async I/O facilities (or, for a few operations the OS can't do async, to a small internal thread pool), and only re-enters the single JS thread once a result is ready. So Node handles thousands of concurrent connections by never blocking the one thread on any of them while they wait — the concurrency is in the waiting, not in parallel JavaScript execution, which doesn't happen by default at all.

---

**Q: CommonJS vs. ES Modules — what's the practical difference, and how do you tell which one a given Node file is using?**

CommonJS (`require`/`module.exports`) is Node's original module system — synchronous, and still the default unless a project opts out. ES Modules (`import`/`export`) are the standardized JavaScript module syntax, loaded asynchronously, and the same syntax modern frontend tooling uses. A file uses ES Modules if it ends in `.mjs`, or if the nearest `package.json` has `"type": "module"` (in which case `.cjs` opts a specific file back into CommonJS). Mixing them incorrectly — trying to `require()` an ES Module directly — is a real, common early error, so checking `package.json`'s `"type"` field is usually the first useful step when debugging a module-loading error in unfamiliar code.

---

**Q: Why do streams matter specifically in Node, and when would you reach for one over just reading a whole file?**

Streams process data in small chunks as it arrives, rather than requiring the entire payload to be loaded into memory first. Node's own core I/O — `fs`, `http`, `net` — is built on streams natively, not added as an afterthought. The concrete case where this matters: serving a large file over HTTP. `fs.readFile` then `res.end(data)` loads the entire file into memory before sending a single byte, meaning memory usage scales with file size and the client waits for the full read to finish before receiving anything. `fs.createReadStream(file).pipe(res)` sends the first chunk almost immediately and keeps memory usage roughly constant regardless of whether the file is 1MB or 10GB. Reach for a stream any time data is large relative to available memory, or when time-to-first-byte matters more than having the whole payload ready at once.

---

**Q: Walk through the phases of the Node.js event loop.**

Node's event loop, via libuv, runs through ordered phases each cycle: **timers** (due `setTimeout`/`setInterval` callbacks), **pending callbacks** (certain system-level callbacks deferred from the previous cycle), **poll** (retrieve new I/O events and run their callbacks — where most real work happens, and where the loop can block waiting for new events if nothing else is scheduled), **check** (`setImmediate` callbacks), and **close callbacks** (like a socket's `close` event). Microtasks — Promise callbacks and `process.nextTick` — drain between every one of those phases, not just once at the end, with `process.nextTick` given the highest priority of anything in the loop. This granularity is genuinely Node-specific — the browser's event loop is a simpler model — and it's exactly why `setImmediate` is guaranteed to run before a `setTimeout(fn, 0)` when both are scheduled from inside an I/O callback (poll runs before check), while the ordering is less strictly defined when both are scheduled from the top-level module instead.

---

**Q: Node is single-threaded by default — how does it actually handle CPU-bound work, like image processing or heavy computation?**

It doesn't, natively, without an explicit escape hatch — a genuinely CPU-bound operation blocks the single JS thread for its entire duration, since there's no I/O involved for the event loop to hand off during pure computation, which means every other request the process is handling waits behind it. `worker_threads` runs actual parallel JavaScript within the same process, appropriate for CPU-bound work that needs to stay in-process. `cluster` (or a process manager like PM2) forks multiple Node processes, each with its own event loop, to spread request-handling capacity across CPU cores — this scales throughput, but doesn't make any single process immune to being blocked by the same CPU-heavy code running inside it. Choosing between them depends on whether the goal is parallelizing one heavy task (worker_threads) or handling more concurrent requests overall (cluster).

---

**Q: npm's semantic versioning — what do `^`, `~`, and a pinned version number each actually allow, and why does `package-lock.json` matter?**

`^4.19.2` allows any `4.x.x` update — minor and patch releases — but never `5.0.0`, since a major-version bump signals a breaking change by convention. `~4.17.21` is narrower, allowing only patch updates within `4.17.x`. A pinned version with no prefix (`2.3.1`) accepts no automatic updates at all. `package.json` only records these *ranges*, though — `package-lock.json` records the exact resolved version actually installed (including nested dependencies of dependencies), so committing it and using `npm ci` in CI/production guarantees every install is identical, rather than potentially picking up a new matching minor/patch release between two different installs of "the same" `package.json`.

---

**Q: What's the difference between error-first callbacks and handling errors in `async`/`await` code, and what's the specific bug that trips people up moving between them?**

Error-first callbacks (Node's original convention) pass an `err` as the first argument to every callback, and nothing checks it automatically — omitting `if (err) { ... }` silently drops the error. `async`/`await` code should wrap `await` calls in `try/catch`. The specific, common bug: calling an `async` function without `await`-ing or `.catch()`-ing it inside another (often synchronous, or fire-and-forget) function — its eventual rejection has nowhere defined to go. Depending on the Node version and process configuration, an unhandled rejection like this can either fail silently or crash the entire process outright, which is exactly why treating every `async` call as something that needs explicit error handling — the same way any I/O call in another language would — matters in real Node code, not just as a style preference.

---

**Q: A Node API's response times spike under load and other, unrelated endpoints slow down too. What's your diagnostic approach?**

This pattern — one endpoint's slowness bleeding into unrelated endpoints — is the specific signature of a blocked event loop, not generic overload, because Node's single thread means literally everything waits behind whatever's currently blocking it. The diagnostic path: profile with `node --prof` (or attach `--inspect` and take a live CPU profile) during a slow window, and look for one function consuming a large, continuous slice of CPU time rather than many short operations — that continuous block is the tell. Common real causes: `JSON.stringify`/`JSON.parse` on a large payload, a synchronous crypto call, a tight computational loop, or a `*Sync` `fs` call on the hot request path. The fix depends on what's found — move genuinely CPU-bound work to `worker_threads`, or replace a sync I/O call with its async equivalent — but the diagnostic signature (unrelated endpoints slowing down together) is what should point at "blocked event loop" as the first hypothesis, before assuming generic infrastructure overload.

---

**Q: How would you find and fix a memory leak in a long-running Node process?**

Graph heap usage over real time in production, not a synthetic short test — healthy Node memory looks like a sawtooth (rises, garbage collection runs, drops, repeats); a leak looks like the same sawtooth pattern but with the floor slowly rising across hours or days, since each GC cycle reclaims some memory but never gets back to where it started. To find the specific cause: take two heap snapshots under the same load in Chrome DevTools (via `node --inspect`) and compare them, looking for an object type whose *count* keeps growing across snapshots — a growing count, not just growing total size, is the real signature of a leak versus a large-but-stable cache. The single most common real-world cause is an unbounded in-memory cache or array that nothing ever evicts from — the fix is bounding it explicitly with an LRU eviction policy or a TTL, not just "using less memory" vaguely.

---

**Q: What's your production experience with Node.js — walk me through a real issue you diagnosed.**

This is a genuinely personal question, best answered with the Problem → Solution → Result structure on a real incident: a blocked event loop under load, an unbounded cache that leaked memory over days, an unhandled rejection that silently crashed a process. Interviewers are listening for whether you've actually operated a Node service under real production constraints — concrete diagnostic steps, not a memorized definition — rather than just having written a script or a tutorial project once.
