# Node.js Troubleshooting Guide

## Issue 1: "UnhandledPromiseRejectionWarning" / process crash

**Symptom:** a warning like `UnhandledPromiseRejectionWarning: ...` in logs, or (in newer Node versions, where this behavior became stricter by default) the process crashes outright with the rejection's stack trace.

**Root Cause:** an `async` function was called without `await` or `.catch()` somewhere in the call chain — its rejection has nowhere defined to go. This is especially common in fire-and-forget calls: an `async` function invoked inside a synchronous event handler, a callback, or a route handler without being awaited.

**Debug steps:**
```javascript
// Add a global safety net FIRST, to at least log what's slipping through
process.on("unhandledRejection", (reason, promise) => {
  console.error("Unhandled rejection at:", promise, "reason:", reason);
});
```
```bash
# Run with this flag to make Node print the exact stack trace at the
# point the Promise rejected, not just where it went unhandled
node --trace-warnings server.js
```

**Fix patterns:**
```javascript
// BUG
function handleClick() {
  doAsyncWork();   // rejection has nowhere to go
}

// FIX 1 -- explicit .catch()
function handleClick() {
  doAsyncWork().catch((err) => console.error("doAsyncWork failed:", err));
}

// FIX 2 -- await it, inside an async caller, with try/catch
async function handleClick() {
  try {
    await doAsyncWork();
  } catch (err) {
    console.error("doAsyncWork failed:", err);
  }
}
```

---

## Issue 2: Memory leak from an unbounded in-memory cache

**Symptom:** memory usage climbs steadily over hours or days of uptime, eventually leading to an out-of-memory crash or severe GC-driven slowdowns — but nothing looks obviously wrong in a short local test.

**Root Cause:** an in-memory `Map`, object, or array used as a cache (or a request log, or a session store) that nothing ever evicts entries from — every unique key ever seen stays in memory for the life of the process.

**Debug steps:**
```bash
node --inspect server.js
# chrome://inspect -> Memory tab -> take a heap snapshot under load,
# generate more load, take a second snapshot, compare them
# Look for an object type whose COUNT keeps growing across snapshots
```
```javascript
// Add basic memory logging to correlate growth with actual usage
setInterval(() => {
  const { heapUsed } = process.memoryUsage();
  console.log(`Heap used: ${(heapUsed / 1024 / 1024).toFixed(1)} MB`);
}, 60000);
```

**Fix patterns:**
```javascript
// BUG -- grows forever
const cache = new Map();
function getCached(key, compute) {
  if (!cache.has(key)) cache.set(key, compute());
  return cache.get(key);
}

// FIX -- bound it with an LRU eviction policy
const { LRUCache } = require("lru-cache");   // npm install lru-cache
const cache = new LRUCache({ max: 500, ttl: 1000 * 60 * 10 });
function getCached(key, compute) {
  if (!cache.has(key)) cache.set(key, compute());
  return cache.get(key);
}
```

---

## Issue 3: The event loop blocked by synchronous CPU-heavy code, freezing all other requests

**Symptom:** under load, response times spike dramatically across *multiple, unrelated* endpoints at once — not just the one doing heavy work.

**Root Cause:** a genuinely CPU-bound synchronous operation (a large `JSON.stringify`/`parse`, a synchronous crypto call, a tight computational loop, a `*Sync` `fs` call) running on the single JS thread — nothing else can execute until it finishes, because Node has exactly one call stack.

**Debug steps:**
```bash
node --prof server.js
# reproduce the load, stop the process, then:
node --prof-process isolate-*.log > profile.txt
# look for one function consuming a large, CONTINUOUS slice of CPU
# time -- that continuity is the signature of blocking code, distinct
# from many short operations spread across a profile
```
```javascript
const { monitorEventLoopDelay } = require("node:perf_hooks");
const histogram = monitorEventLoopDelay();
histogram.enable();
setInterval(() => {
  console.log(`Event loop delay mean: ${(histogram.mean / 1e6).toFixed(2)}ms`);
  histogram.reset();
}, 5000);
```

**Fix patterns:**
```javascript
// BUG -- synchronous, blocks everything else for its full duration
app.get("/report", (req, res) => {
  const huge = buildHugeObject();
  res.json(huge);   // JSON.stringify on a huge object, done synchronously
});

// FIX -- move genuinely CPU-bound work off the main thread
const { Worker } = require("node:worker_threads");
app.get("/report", (req, res) => {
  const worker = new Worker("./build-report-worker.js");
  worker.on("message", (result) => res.json(result));
  worker.on("error", (err) => res.status(500).json({ error: err.message }));
});
```

---

## Issue 4: "Cannot find module" errors

**Symptom:** `Error: Cannot find module './utils'` or similar, often working locally but failing after deployment, or vice versa.

**Root Cause:** several distinct causes share this symptom — a missing file extension in an ES Module import, a path that's correct on one OS's case-sensitivity rules but not another's, a dependency listed in `devDependencies` that a production install skipped, or a genuine typo in the require/import path.

**Debug steps:**
```bash
# Confirm the file actually exists at the resolved path
node -e "console.log(require.resolve('./utils'))"

# Check whether it's a CommonJS/ESM mismatch
grep '"type"' package.json

# Confirm what actually got installed in this environment
npm ls <package-name>
```

**Fix patterns:**
```javascript
// ES Modules require the file extension explicitly -- CommonJS doesn't
import { helper } from "./utils.js";   // correct for ESM
import { helper } from "./utils";      // fails under "type": "module"

// Case sensitivity: Linux production servers are case-sensitive,
// Windows/Mac dev machines often aren't -- "./Utils" vs "./utils"
// can work locally and fail only after deployment
```
```bash
# If it's a devDependency needed at runtime, move it
npm uninstall --save-dev some-package
npm install --save some-package
```

---

## Issue 5: Mixing callback-based APIs with `async`/`await` incorrectly

**Symptom:** an `async` function that uses a callback-based API appears to resolve before the callback's actual work has finished — data used downstream is `undefined` or stale.

**Root Cause:** wrapping a callback-based call in `async`/`await` without actually converting it into something `await`-able (a Promise) — `await` only pauses for a Promise; calling a callback-style function does nothing to make `async`/`await` wait for its callback to fire.

**Debug steps:**
```javascript
// BUG -- this "works" but doesn't do what it looks like it does
async function getUser(id) {
  let user;
  db.findById(id, (err, result) => {   // callback-style API
    user = result;
  });
  return user;   // <- runs BEFORE the callback ever fires
}
```

**Fix patterns:**
```javascript
// FIX 1 -- if the library offers a Promise-based version, use it
const user = await db.promises.findById(id);

// FIX 2 -- manually wrap the callback API in a Promise
function findByIdAsync(id) {
  return new Promise((resolve, reject) => {
    db.findById(id, (err, result) => {
      if (err) return reject(err);
      resolve(result);
    });
  });
}
const user = await findByIdAsync(id);

// FIX 3 -- Node's own util.promisify for simple error-first callback APIs
const { promisify } = require("node:util");
const readFileAsync = promisify(require("node:fs").readFile);
const data = await readFileAsync("file.txt", "utf8");
```

---

## Prevention Tips
- Always register `process.on("unhandledRejection", ...)` and `process.on("uncaughtException", ...)` as a logged safety net — never as the primary error-handling strategy
- Bound every in-memory cache explicitly (max size, TTL, or both) — "it'll be fine, traffic is low" is exactly how these leaks slip into production undetected for months
- Monitor event-loop lag directly (`perf_hooks.monitorEventLoopDelay`) in production, not just CPU percentage — it's a more precise, earlier signal of blocking code
- Never use `*Sync` `fs` methods inside a request handler — reserve them for startup-time config loading and one-off scripts only
- Use `util.promisify` or a library's own Promise-based API rather than manually mixing callback style with `async`/`await`
- Run `npm ci` (not `npm install`) in CI/production to catch a `package.json`/`package-lock.json` mismatch before it becomes a "cannot find module" surprise in production
