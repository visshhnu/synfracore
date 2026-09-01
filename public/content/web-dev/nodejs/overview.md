# Node.js

> **JavaScript, given a server to run on**

**Category:** Backend / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** solid JavaScript is a hard prerequisite, not a nice-to-have — functions, closures, `async`/`await`, and a working understanding of the event loop concept from this platform's JavaScript course. Node.js does not re-teach any of that here; it teaches what changes when the same language runs on a server instead of in a browser. See the **Prerequisites** tab for the full detail.

---

## What is Node.js?

If the browser is JavaScript's original home — with a `window` object, a DOM to manipulate, and a set of Web APIs (`fetch`, `setTimeout`, click events) built in — Node.js is the same language given a *new* home: a server environment, with no DOM and no `window`, but with file-system access, network sockets, and OS-level operations instead. It runs on the same V8 engine Chrome uses to execute JavaScript; Node just wraps that engine with a different set of built-in APIs suited to a server rather than a page.

Node.js is **not a framework** — a genuinely common misconception worth correcting up front. A framework (Express, which you'll meet next) sits *on top of* Node and adds structure (routing, middleware) for building applications faster. Node itself is the runtime underneath — it's what makes `require('fs')` or `require('http')` possible at all. You could build a full web server in raw Node with zero framework, and people did, for years, before Express existed.

Critically, Node is still **single-threaded**, running one call stack at a time, with the exact same event-loop model you already learned in JavaScript — the mechanism doesn't change. What changes is which APIs hand off the slow work. In the browser, `fetch` and DOM events are handled by the browser's Web APIs. In Node, file reads, network requests, and DNS lookups are handed off to **libuv**, Node's own C++ library, which uses OS-level async I/O (and a small internal thread pool for things the OS can't do async natively, like some file-system calls) — then hands the result back to the same single JavaScript call stack once it's free, just like a resolved Promise does in the browser.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Browser JS", "sublabel": "Call Stack + Web APIs (fetch, DOM, setTimeout)", "color": "blue" },
    { "label": "Same Event Loop Model", "sublabel": "Single call stack, non-blocking hand-off", "color": "purple" },
    { "label": "Node.js", "sublabel": "Call Stack + libuv (fs, net, dns, timers)", "color": "green" }
  ]
}
```

## Why Node.js?

The first real problem Node solves: **one language for both ends of an application.** Before Node, a full-stack team needed JavaScript for the frontend and something else entirely (Java, PHP, Ruby, Python) for the backend — two skillsets, two hiring pipelines, two mental contexts to switch between. Node made it possible to write both sides in JavaScript, which is exactly why full-stack JavaScript (React/Vue + Node) became one of the dominant stacks in the industry.

The second, more technical reason: Node's non-blocking I/O model is genuinely well-suited to I/O-heavy workloads — APIs, chat servers, anything that spends most of its time *waiting* on a database, a file, or another service rather than doing heavy computation. Because Node never blocks the single thread waiting on I/O, it can handle a large number of concurrent connections without spawning a new OS thread per connection (the traditional model in many other server languages, where each thread carries real memory overhead). This is not "Node is fast at everything" — it's specifically fast at *not wasting the thread while waiting*, which is a different and narrower claim, and one worth being precise about in an interview.

Third: **npm**, Node's package manager, is the largest software package registry in existence *(needs verification — recheck current package-count figures against npmjs.com)*. Almost any common problem — parsing dates, hashing passwords, talking to a database — already has a well-maintained package, which is a genuine productivity multiplier once you also know how to evaluate whether a given package is actually trustworthy to depend on (covered in Intermediate).

---

## Learning Modules

### Module 01 — The Node.js Runtime & Module System
*What Node actually is under the hood, and how files share code with each other*

**Topics covered:**

- Node vs. browser: what's the same, what's different — 🟢 Beginner
- CommonJS (`require`/`module.exports`) — 🟢 Beginner
- ES Modules in Node (`import`/`export`, `"type": "module"`) — 🟡 Intermediate
- The `process` object and environment variables — 🟢 Beginner
- npm and `package.json` basics — 🟢 Beginner

### Module 02 — The File System & Built-in Modules
*Doing the things a browser genuinely cannot do — reading files, working with paths, starting a server*

Node ships a standard library of built-in modules — no install required — that map directly onto what a server actually needs to do: `fs` for reading/writing files, `path` for building file paths safely across operating systems, `http` for accepting network requests, `os` for querying the machine Node is running on. This is the concrete, practical answer to "what can Node do that the browser can't."

```conceptgrid
{
  "boxes": [
    { "title": "fs", "description": "Read, write, watch files and directories on disk", "color": "blue" },
    { "title": "path", "description": "Build and normalize file paths correctly across Windows/Linux/Mac", "color": "green" },
    { "title": "http", "description": "Accept incoming network requests and send responses -- no framework needed", "color": "purple" },
    { "title": "process", "description": "Environment variables, command-line args, exit codes, signals", "color": "amber" }
  ]
}
```

**Topics covered:**

- `fs` module: reading and writing files (sync vs. async) — 🟢 Beginner
- `path` module: cross-platform path handling — 🟢 Beginner
- Building a raw HTTP server with `http.createServer` — 🟡 Intermediate
- `os` and other lesser-used built-ins — 🟢 Beginner

### Module 03 — Asynchronous I/O & the Event Loop in Node
*The same event-loop model from JavaScript, now doing file and network I/O instead of DOM/fetch*

**Topics covered:**

- Non-blocking I/O: why Node doesn't wait for a file read to finish before moving on — 🟡 Intermediate
- Callbacks, Promises, and `async`/`await` in a Node context (`fs.promises`, `fs/promises`) — 🟡 Intermediate
- Why a single slow synchronous operation blocks *every* request Node is handling — 🔴 Advanced
- libuv and the thread pool, at a conceptual level — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook — "API response times spike to 3-5s under load,
# CPU pegged at 100% on a single core, other requests time out"

# Step 1: Confirm it's actually one blocked event loop, not real overload
node --prof server.js
# reproduce the load, then stop the process and process the profile:
node --prof-process isolate-*.log > profile.txt
# look for one function consuming a disproportionate, continuous
# slice of CPU time -- that's the signature of a blocking call, not
# genuine distributed load across many short operations

# Step 2: Narrow it down live, without restarting production
node --inspect server.js
# attach Chrome DevTools (chrome://inspect) and take a CPU profile
# during a live slow window -- look for JSON.parse on a huge payload,
# a synchronous crypto call, a tight loop, or a *Sync fs call
# (readFileSync, writeFileSync) on the hot request path

# Step 3: Confirm the actual root cause
# Found: JSON.stringify() on a 50MB in-memory object, on every request,
# to build a response -- a genuinely CPU-bound synchronous operation
# that blocks the single event-loop thread for its entire duration.
# Every OTHER request queues behind it, even ones with nothing to do
# with the large object -- that's why unrelated endpoints also slowed down.

# Step 4: Fix -- move the CPU-bound work off the main thread
# worker_threads for CPU-bound work that must stay in-process, or
# restructure to avoid re-serializing the same large object per request
# (cache the serialized result; only rebuild it when the source changes)

# Step 5: Verify under the same load profile
node --prof server.js   # re-profile after the fix
# confirm CPU time is now distributed across many short operations,
# not concentrated in one long synchronous call

# Step 6: Add ongoing signal so this doesn't silently recur
# monitor event-loop lag directly (e.g. perf_hooks.monitorEventLoopDelay)
# -- rising event-loop lag is the earliest, most direct signal that
# something is blocking the thread, well before response times visibly spike
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Node.js, and why would a team choose it for a backend?**

**A:** **Problem:** building a product with separate frontend and backend languages means maintaining two skillsets, and I/O-heavy workloads (APIs waiting on databases/other services) waste resources with a thread-per-connection model. **Solution:** Node.js is a JavaScript runtime built on Chrome's V8 engine, letting the same language run outside the browser — on a server, with file-system and network access instead of a DOM — using a non-blocking, single-threaded event loop that handles many concurrent I/O-bound connections without a thread per connection. **Result:** teams get one language across the stack, and genuinely efficient handling of I/O-heavy workloads like REST APIs, though it's the wrong tool for CPU-heavy work (covered in Q5).

---

**Q2. Is Node.js multi-threaded? Walk through what actually happens when a request comes in.**

**A:** **Problem:** "Node handles thousands of concurrent connections" sounds like it must be multi-threaded, and that's a common, reasonable-sounding but incorrect inference. **Solution:** JavaScript execution in Node is single-threaded — one call stack, same as the browser. What's *not* single-threaded is I/O: libuv (Node's underlying C++ library) hands off file/network/DNS operations to the OS's async I/O facilities, or to a small internal thread pool for operations the OS can't do async, and only re-enters the single JS thread once the result is ready. **Result:** the concurrency Node is known for is I/O concurrency, achieved by never blocking the one JS thread on I/O — not parallel JavaScript execution, which genuinely doesn't happen by default.

---

**Q3. CommonJS vs. ES Modules in Node — what's the actual difference, and why does it matter in practice?**

**A:** **Problem:** Node supports two different module systems, and mixing them incorrectly is a real, common source of confusing errors. **Solution:** CommonJS (`require`/`module.exports`) is Node's original, synchronous module system — still the default unless a project opts into ES Modules via `"type": "module"` in `package.json` or a `.mjs` extension. ES Modules (`import`/`export`) are the standardized JavaScript module syntax, loaded asynchronously, and the same syntax used in modern frontend bundlers. **Result:** a project has to pick one as its default and be consistent — `require()`-ing an ES Module or `import`-ing a CommonJS module incorrectly is one of the most common early Node errors, and knowing which system a given `package.json` has opted into is the first thing to check when debugging it.

---

**Q4. Explain streams. Why do they matter specifically in Node, more than in most languages?**

**A:** **Problem:** reading an entire large file (or a large HTTP request body) into memory before processing it is genuinely wasteful — memory use scales with file size, and nothing can start processing until the whole thing has loaded. **Solution:** a stream processes data in small chunks as they arrive, rather than waiting for the entire payload — Node's core I/O primitives (`fs`, `http`, `net`) are all built on streams natively, not bolted on. **Result:** this is why piping a large file directly from a read stream to an HTTP response (`readStream.pipe(res)`) uses a small, constant amount of memory regardless of whether the file is 1MB or 10GB — the alternative (`fs.readFileSync` then send) loads the entire file into memory first, which doesn't scale the same way.

---

**Q5. Node is single-threaded — how does it actually handle CPU-heavy work, like image processing or a large computation?**

**A:** **Problem:** a genuinely CPU-bound operation (not I/O — actual computation) blocks the single JS thread for its entire duration, freezing every other request Node is handling, since there's no I/O for the event loop to hand off during a pure computation. **Solution:** `worker_threads` runs JavaScript on a genuinely separate thread for CPU-bound work that must stay in-process; the `cluster` module (or a process manager like PM2) forks multiple Node *processes*, each with its own event loop, to use multiple CPU cores for handling more concurrent requests. **Result:** Node was never designed to make single-threaded JavaScript execution disappear — it was designed so I/O doesn't block that one thread; CPU-bound work still needs an explicit escape hatch (worker threads or additional processes), and reaching for Node for a primarily CPU-bound workload without that escape hatch is a real, common design mistake.

---

**Q6. Walk through the phases of the Node.js event loop.**

**A:** **Problem:** "the event loop" is often taught as one vague concept, but Node's event loop actually runs through distinct, ordered phases each cycle, and where a given callback lands changes its execution order relative to others. **Solution:** at a high level: **timers** (due `setTimeout`/`setInterval` callbacks), **pending callbacks** (some system-level callbacks deferred from the previous cycle), **poll** (retrieve new I/O events, execute I/O callbacks — this is where most work actually happens and where the loop can block waiting for new events), **check** (`setImmediate` callbacks), and **close callbacks** (e.g. a socket's `'close'` event) — with microtasks (Promise callbacks, `process.nextTick`) draining between every phase, not just at the very end. **Result:** this granularity is Node-specific — the browser's event loop is a simpler mental model — and it directly explains real, otherwise-confusing behavior like `setImmediate` vs. `setTimeout(fn, 0)` ordering differing depending on whether they're called from the main module or from inside an I/O callback.

---

**Q7. How should error handling differ between callback-based and `async`/`await`-based Node code?**

**A:** **Problem:** Node's older APIs use the "error-first callback" convention (`(err, data) => {}`), while modern code uses `async`/`await` with Promises — mixing the two incorrectly is a common source of both silently swallowed errors and crashed processes. **Solution:** callback-style code must explicitly check `if (err)` on every callback, every time — nothing does it automatically; `async`/`await` code should wrap `await` calls in `try/catch`, and an unhandled Promise rejection should be treated as seriously as an uncaught synchronous exception, since it can crash the process outright depending on Node's configuration. **Result:** the specific bug worth being able to name in an interview is forgetting to `await` (or `.catch()`) an async call inside a callback-based function — the rejection has nowhere defined to go, and depending on Node version/config, this can silently vanish or crash the entire process.

---

**Q8. What's your understanding of npm and semantic versioning — how do you evaluate whether to add a new dependency?**

**A:** **Problem:** npm's registry is enormous, and blindly adding dependencies accumulates real risk — abandoned packages, security vulnerabilities, version conflicts. **Solution:** semantic versioning (`MAJOR.MINOR.PATCH`) signals intent — a patch bump should be a safe bugfix, a minor bump adds backward-compatible functionality, a major bump can break existing usage; `package-lock.json` pins exact resolved versions so a fresh `npm install` is reproducible rather than silently picking up new minor/patch releases. Before adding a dependency: check its maintenance activity, its download count as a rough trust signal, and whether it actually needs to be a dependency at all versus something reasonable to write directly. **Result:** treating `npm install` as a low-cost action is a common early-career habit — every dependency is an ongoing maintenance and security surface, not a one-time convenience.

---

**Q9. What is your production experience with Node.js?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a blocked event loop under load, a memory leak that only surfaced after days of uptime, an unhandled rejection that crashed a process in production. Interviewers are listening for whether you've actually operated a Node service under real constraints, not just written a script once.

---

**Q10. How do you monitor a Node.js process in production, and what's genuinely Node-specific to watch for?**

**A:** **Problem:** a Node process can appear "up" (accepting connections, not crashed) while still being effectively unresponsive — a blocked event loop doesn't necessarily kill the process, it just stalls every request behind it. **Solution:** monitor event-loop lag directly (`perf_hooks.monitorEventLoopDelay`), not just process-alive/CPU/memory — rising event-loop lag is the earliest, most Node-specific signal that something synchronous is blocking the thread; also track heap usage over time (a slow, steady climb across days is the classic memory-leak signature, not a sudden spike) and set up `process.on('unhandledRejection')`/`process.on('uncaughtException')` handlers as a logged safety net, not a silent crash. **Result:** the gap between "process is running" and "event loop is actually free to handle the next request" is a genuinely Node-specific health question that generic uptime monitoring won't catch on its own.

---

## Official Resources

- [Node.js Documentation](https://nodejs.org/en/docs)
- [Node.js API Reference](https://nodejs.org/api/)
- [npm Documentation](https://docs.npmjs.com/)

## Try It (2 Minutes)

Create a file called `server.js`:

```javascript
const http = require("node:http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end(`Hello from Node.js — you hit ${req.url}\n`);
});

server.listen(3000, () => {
  console.log("Server running at http://localhost:3000/");
});
```

Run it with `node server.js`, then open `http://localhost:3000/` in a browser (or `curl http://localhost:3000/some-path`). No framework, no `npm install` — just Node's built-in `http` module handling a real network request. That's the entire point of this technology in one file: the same language you already know, now with access to the network and the file system instead of the DOM.
