# Node.js — PYQ (Previously Asked / Practice Questions)

**Framing note:** unlike most web-dev technologies covered so far on this platform, Node.js does have real, proctored certifications — the OpenJS Foundation's JSNAD (Application Developer) and JSNSD (Services Developer). But their actual exam content is confidential, and no public past-paper archive exists for either. What follows is built from this course's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Node.js behavior — not leaked or reconstructed exam content.

---

### 1. (Domain: Runtime Fundamentals) Why is Node.js described as "single-threaded but non-blocking" — how can both be true at once?

**Answer:** JavaScript execution itself runs on exactly one thread in Node, the same as in a browser — one call stack, one statement at a time. Non-blocking refers specifically to I/O: libuv hands file, network, and DNS operations off to the operating system's async facilities (or a small internal thread pool for what the OS can't do natively async), and only re-enters the single JS thread once a result is ready. The concurrency Node is known for is concurrency in *waiting on I/O*, not parallel JavaScript execution — a genuinely CPU-bound operation still blocks the one thread completely.

---

### 2. (Domain: Module System) A project's `package.json` has no `"type"` field. Which module system does Node use by default, and what changes if `"type": "module"` is added?

**Answer:** With no `"type"` field, Node defaults to CommonJS (`require`/`module.exports`) for `.js` files. Adding `"type": "module"` switches `.js` files to ES Modules (`import`/`export`) by default instead — at which point a file that still needs CommonJS specifically must use the `.cjs` extension. This is exactly the kind of detail worth checking first when debugging an unfamiliar codebase's module-loading errors.

---

### 3. (Domain: Streams) Why does `fs.createReadStream(file).pipe(res)` scale better than `fs.readFile(file, callback)` followed by `res.end(data)` when serving a large file over HTTP?

**Answer:** `readFile` loads the entire file into memory before any of it can be sent, meaning memory usage scales directly with file size and the client waits for the complete read before receiving a single byte. The streaming version sends the first chunk almost immediately and holds only a small buffer in memory at any given time, regardless of whether the file is 1MB or 10GB — this is the concrete, practical reason Node's core I/O modules are built on streams natively rather than simple whole-buffer reads.

---

### 4. (Domain: Event Loop) Two callbacks are scheduled with `setImmediate` and `setTimeout(fn, 0)` from inside the same I/O callback. Which one is guaranteed to run first, and why?

**Answer:** `setImmediate` is guaranteed to run first in this specific case. The event loop's poll phase (where I/O callbacks execute) runs before the check phase (where `setImmediate` callbacks execute) in each cycle — so a `setImmediate` scheduled from inside an I/O callback runs in that same cycle's check phase, ahead of a `setTimeout(fn, 0)`, which has to wait for the next cycle's timers phase. This ordering guarantee specifically does not hold the same way when both are scheduled from the top-level module instead of from inside an I/O callback.

---

### 5. (Domain: Concurrency) Node is single-threaded, but a production service needs to resize thousands of large images per hour without freezing its API. What's the correct architectural approach?

**Answer:** Offload the actual image-processing work to `worker_threads` (or a separate process/service entirely) rather than doing it synchronously on the main thread — image resizing is genuinely CPU-bound, and no amount of `async`/`await` prevents it from blocking the single JS thread for its full duration if run inline. `cluster` alone doesn't solve this specific problem, since it scales request-handling capacity across processes but doesn't prevent any individual process from being blocked by the same CPU-heavy work running inside it.

---

### 6. (Domain: Error Handling) A function calls an `async` helper without `await`-ing it, inside a synchronous callback. The helper later rejects. What happens, and why?

**Answer:** The rejection becomes an unhandled Promise rejection — it has nowhere defined to go, since nothing is awaiting or `.catch()`-ing that Promise. Depending on the Node version and configuration, this either logs an `UnhandledPromiseRejectionWarning` or crashes the process outright, since Node's stricter versions terminate the process on unhandled rejections by default rather than only warning. The fix is to explicitly `.catch()` the fire-and-forget call, or convert the calling context to also be `async` and `await` it properly.

---

### 7. (Domain: npm / Semver) A `package.json` lists a dependency as `^4.19.2`. A teammate runs `npm install` on a machine where `4.20.0` has since been published. What version do they get, and would `4.19.2` pinned exactly (no `^`) behave differently?

**Answer:** With `^4.19.2` and no `package-lock.json` constraining it further, `npm install` would resolve to `4.20.0` (or whatever the latest matching `4.x.x` release is), since `^` allows any minor or patch update within the same major version. A pinned `4.19.2` (no prefix) would install exactly that version regardless of what's newer. In practice, a committed `package-lock.json` overrides this ambiguity for both cases by recording the exact version actually resolved — which is exactly why the lockfile, not just the semver range in `package.json`, is what guarantees reproducible installs across a team.

---

### 8. (Domain: Memory Management) A Node service's memory usage graph shows a sawtooth pattern where the floor rises slightly with each cycle over several days of uptime. What does this indicate, and what's the most common real cause?

**Answer:** This is the classic memory-leak signature — a healthy sawtooth (memory rises, garbage collection reclaims it, drops, repeats) would return to roughly the same floor each cycle; a rising floor means something is retaining references that GC can never reclaim. The most common real-world cause is an unbounded in-memory cache, array, or map that nothing ever evicts entries from — every unique key or entry ever seen accumulates for the life of the process. The fix is bounding it explicitly with an LRU eviction policy and/or a TTL, not simply "reducing memory usage" elsewhere in the code.

---

### 9. (Domain: Diagnostics) An API's response times spike under load, and — notably — endpoints with no code relationship to whatever's slow also degrade at the same time. What does this pattern specifically suggest, and how would you confirm it?

**Answer:** This is the specific signature of a blocked Node event loop, not generic infrastructure overload — because Node has exactly one JS thread, anything blocking it (a large synchronous JSON operation, a tight CPU-bound loop, a sync `fs` call) stalls *every* request currently queued behind it, regardless of which endpoint they belong to. Confirming it: profile with `node --prof` during a slow window and look for one function consuming a large, continuous slice of CPU time, or monitor event-loop lag directly with `perf_hooks.monitorEventLoopDelay` — a spike in lag correlating with the slowdown confirms the blocked-loop hypothesis directly.

---

### 10. (Domain: File System / I/O) Why is calling `fs.readFileSync` inside an HTTP request handler considered a real production hazard, even though the exact same call is perfectly fine inside a one-off script?

**Answer:** The difference is concurrency context, not the call itself. In a one-off script, there's nothing else competing for the single thread, so blocking it briefly costs nothing observable. Inside a request handler on a running server, that same synchronous call blocks the entire event loop for its duration — meaning every other concurrent request being handled by that process, regardless of which endpoint they hit, waits behind it. The async equivalent (`fs.readFile` or `fs.promises.readFile`) hands the work off instead, letting the event loop keep serving other requests while the disk read completes in the background.
