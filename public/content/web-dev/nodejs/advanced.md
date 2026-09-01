# Node.js — Advanced

## The Node.js event loop, phase by phase

JavaScript's event loop concept (from this platform's JavaScript course) is a simplified, browser-oriented model. Node's actual event loop, implemented by libuv, runs through distinct, ordered **phases** each cycle — genuinely more granular detail than the browser model, and worth knowing precisely for both interviews and real debugging.

```flow
{
  "layout": "stack",
  "steps": [
    { "label": "timers", "sublabel": "Due setTimeout/setInterval callbacks", "color": "blue" },
    { "label": "pending callbacks", "sublabel": "Certain system-level callbacks deferred from last cycle", "color": "slate" },
    { "label": "poll", "sublabel": "Retrieve new I/O events, execute I/O callbacks -- most work happens here, loop can block here waiting for events", "color": "purple" },
    { "label": "check", "sublabel": "setImmediate callbacks", "color": "amber" },
    { "label": "close callbacks", "sublabel": "e.g. socket.on('close')", "color": "green" }
  ]
}
```

Microtasks — resolved Promise callbacks (`.then`) and `process.nextTick` — drain **between every phase**, not just once at the very end of a full cycle. `process.nextTick` callbacks run even before other microtasks (Promise callbacks), giving it the highest priority of anything in the loop — genuinely easy to overuse, since a recursive `process.nextTick` call can starve the event loop of ever reaching I/O.

```javascript
console.log("start");

setTimeout(() => console.log("timeout"), 0);
setImmediate(() => console.log("immediate"));
process.nextTick(() => console.log("nextTick"));
Promise.resolve().then(() => console.log("promise"));

console.log("end");

// Output order: start, end, nextTick, promise, then EITHER
// timeout/immediate order (genuinely not fully deterministic when
// called from the main module -- it depends on process startup timing).
// Inside an I/O callback specifically, setImmediate is GUARANTEED to
// run before a 0ms setTimeout, because the poll phase runs before check.
```

This ordering — `nextTick` and Promise microtasks before *any* macrotask phase, `setImmediate` deterministically before `setTimeout(fn, 0)` specifically when called from inside an I/O callback — is a genuinely common, precise interview question, and it only makes sense once the phase model (not just "the event loop") is understood.

## Clustering and worker threads: escaping the single-thread limit for CPU-bound work

Node's single JavaScript thread means a genuinely CPU-bound operation — image resizing, a large synchronous computation, heavy JSON parsing on a huge payload — blocks *every* request the process is handling for as long as it runs. There is no way around this with async/await alone; `async`/`await` only helps with I/O-bound waiting, not with actual computation.

**`worker_threads`** — run genuine parallel JavaScript in the same process, for CPU-bound work:

```javascript
// worker.js
const { parentPort, workerData } = require("node:worker_threads");

function heavyComputation(n) {
  let result = 0;
  for (let i = 0; i < n; i++) result += Math.sqrt(i);
  return result;
}

parentPort.postMessage(heavyComputation(workerData));
```

```javascript
// main.js
const { Worker } = require("node:worker_threads");

function runWorker(n) {
  return new Promise((resolve, reject) => {
    const worker = new Worker("./worker.js", { workerData: n });
    worker.on("message", resolve);
    worker.on("error", reject);
  });
}

// Main thread's event loop stays free to handle other requests
// WHILE the heavy computation runs on a separate thread
runWorker(1e9).then((result) => console.log("Result:", result));
```

**`cluster`** — fork multiple Node *processes*, each with its own event loop and its own memory, to use multiple CPU cores for handling more concurrent requests (not for sharing state between them):

```javascript
const cluster = require("node:cluster");
const os = require("node:os");
const http = require("node:http");

if (cluster.isPrimary) {
  const cpuCount = os.cpus().length;
  for (let i = 0; i < cpuCount; i++) cluster.fork();

  cluster.on("exit", (worker) => {
    console.log(`Worker ${worker.process.pid} died -- forking a replacement`);
    cluster.fork();   // real production pattern: auto-restart on crash
  });
} else {
  http.createServer((req, res) => res.end("Handled by a worker process")).listen(3000);
}
```

**The distinction that matters:** `worker_threads` is for CPU-bound work you want parallelized within one logical process; `cluster` (or a process manager like PM2) is for scaling *request throughput* across CPU cores by running multiple independent copies of your whole server. Reaching for `cluster` to solve a single slow synchronous function is the wrong tool — it multiplies capacity, but every individual worker process is still just as blockable by the same CPU-heavy code.

## Memory leaks and profiling a Node process

Node's V8 heap is garbage-collected, but a leak still happens whenever references to objects are kept alive longer than intended — GC can't reclaim memory something still (even accidentally) references.

```javascript
// A genuinely common, realistic leak: an unbounded in-memory cache
const cache = new Map();

function handleRequest(req, res) {
  const key = req.url;
  if (!cache.has(key)) {
    cache.set(key, expensiveComputation(req));   // grows forever --
    // nothing ever removes an entry, so memory climbs with every
    // unique URL ever seen, for the life of the process
  }
  res.end(cache.get(key));
}
```

```javascript
// Fix: bound the cache -- an LRU (least-recently-used) eviction
// policy, or a TTL (time-to-live) on entries, or both
const { LRUCache } = require("lru-cache");   // npm install lru-cache
const cache = new LRUCache({ max: 500 });    // caps at 500 entries
```

**Diagnosing a suspected leak in practice:**

```bash
# Take heap snapshots at two points in time under the same load,
# compare them in Chrome DevTools' Memory tab
node --inspect server.js
# chrome://inspect -> take a heap snapshot, generate load, take another
# -> compare -- look for an object type whose COUNT keeps growing
# across snapshots, not just total size (a growing count is the real
# signature of a leak; a large-but-stable count is likely fine)

# Track heap usage over the process's actual lifetime
node --max-old-space-size=512 server.js
# a slow, steady upward climb in memory across HOURS or DAYS (not a
# single spike) is the classic memory-leak signature -- distinguish
# this from normal, healthy sawtooth GC behavior, where memory rises
# and then drops back down repeatedly as GC runs
```

The specific signal worth internalizing: healthy Node memory usage looks like a sawtooth (rises, GC runs, drops, repeats) when graphed over time. A leak looks like a sawtooth that never fully drops back down — each GC cycle reclaims *some* memory, but the floor keeps rising.

## Performance under real concurrent load

```javascript
const { monitorEventLoopDelay } = require("node:perf_hooks");

const histogram = monitorEventLoopDelay({ resolution: 20 });
histogram.enable();

setInterval(() => {
  console.log(`Event loop delay -- mean: ${(histogram.mean / 1e6).toFixed(2)}ms, ` +
              `max: ${(histogram.max / 1e6).toFixed(2)}ms`);
  histogram.reset();
}, 5000);
```

Rising event-loop lag is the single most direct, Node-specific health signal available — it means something is either taking too long synchronously, or the process is genuinely saturated with more work than it can process. This is a more precise signal than CPU percentage alone: a process can show moderate CPU usage while still having real event-loop lag spikes from occasional blocking calls, which a coarse CPU-percentage graph averages away.

**Load-testing consideration specific to Node:** because a single Node process runs on one thread, load-testing a single instance measures the ceiling of one core, not the application's real production ceiling if it's deployed with `cluster` or multiple container replicas across cores. Test the actual deployed topology, not a bare `node server.js` on a laptop, when the goal is a realistic production-capacity number.

## Try It (2 Minutes)

```javascript
// Prove to yourself that CPU-bound work blocks the event loop --
// then prove worker_threads fixes it. Run this first:
const start = Date.now();
setTimeout(() => console.log(`Timer fired after ${Date.now() - start}ms`), 100);

// Synchronous, CPU-bound "work" -- nothing async about this at all
let sum = 0;
for (let i = 0; i < 5e9; i++) sum += i;
console.log(`Loop finished after ${Date.now() - start}ms`);
```

Run it with `node blocking.js`. The `setTimeout` was scheduled for 100ms, but notice it fires *after* the loop finishes, however long that actually took — the single event-loop thread was busy running the synchronous loop and literally could not check on the timer until that loop released the thread. This is the exact, concrete mechanism behind every "the API froze under load" incident this course's Production Example and Troubleshooting material describe.
