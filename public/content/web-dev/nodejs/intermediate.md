# Node.js — Intermediate

## Streams — the most genuinely Node-distinctive concept in this course

Every Node built-in that deals with I/O — `fs`, `http`, `net` — is built on streams natively. Understanding why matters more here than almost anywhere else in this course, because streams solve a real, concrete problem: processing data *without* loading all of it into memory first.

**The problem streams solve:** imagine serving a 2GB video file from an HTTP endpoint. `fs.readFile` loads the entire file into memory before you can send any of it — meaning your server needs 2GB of free RAM per concurrent request just for that one file, and the client waits for the *entire* file to be read from disk before receiving the first byte.

```javascript
// The naive, memory-heavy approach
const fs = require("node:fs");
const http = require("node:http");

http.createServer((req, res) => {
  fs.readFile("large-video.mp4", (err, data) => {
    if (err) { res.writeHead(500); return res.end("Error"); }
    res.writeHead(200);
    res.end(data);   // the ENTIRE file is in memory before any of it is sent
  });
}).listen(3000);
```

```javascript
// The streaming approach -- constant, small memory use regardless of file size
const fs = require("node:fs");
const http = require("node:http");

http.createServer((req, res) => {
  const readStream = fs.createReadStream("large-video.mp4");
  readStream.pipe(res);   // chunks flow from disk to the response as they arrive
  readStream.on("error", (err) => {
    res.writeHead(500);
    res.end("Error reading file");
  });
}).listen(3000);
```

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Disk", "sublabel": "Read one small chunk at a time", "color": "slate" },
    { "label": "Readable Stream", "sublabel": "Emits 'data' events per chunk", "color": "blue" },
    { "label": ".pipe()", "sublabel": "Manages backpressure automatically", "color": "purple" },
    { "label": "Writable Stream", "sublabel": "e.g. the HTTP response", "color": "green" }
  ]
}
```

The client starts receiving data almost immediately (the first chunk, not the whole file), and memory use stays roughly constant whether the file is 1MB or 10GB — the server never holds more than a small buffer of it at once. This is the concrete, practical reason streams exist, and why they're one of the first things worth reaching for once "load it all into memory" stops being safe.

**Backpressure**, briefly: if the destination (a slow network connection, say) can't keep up with the source, `.pipe()` automatically pauses the readable stream until the writable side catches up — this is handled for you, but it's worth knowing it's happening, since manually writing to a stream without respecting backpressure (ignoring the return value of `.write()`) can reintroduce the same memory problem streams are meant to solve.

## The EventEmitter pattern

Node's answer to "how do different parts of a program react to something happening, without being tightly coupled to each other." `EventEmitter` is the base class behind streams, `http` requests, and most of Node's own event-driven APIs.

```javascript
const { EventEmitter } = require("node:events");

class OrderProcessor extends EventEmitter {
  process(order) {
    console.log(`Processing order ${order.id}...`);
    // ... actual processing logic ...
    this.emit("completed", order);
  }
}

const processor = new OrderProcessor();

processor.on("completed", (order) => {
  console.log(`Order ${order.id} completed -- sending confirmation email`);
});

processor.on("completed", (order) => {
  console.log(`Order ${order.id} completed -- updating analytics`);
});

processor.process({ id: 42 });
// Both listeners fire, independently, without OrderProcessor knowing
// or caring what either of them does
```

This is the same pattern as a DOM `addEventListener`, generalized beyond the browser — any object can become an event emitter and broadcast events to any number of independent listeners. It's the right tool when multiple, unrelated pieces of code need to react to the same thing happening, without wiring them together directly.

## Error handling conventions in async Node code

Node code moves through three eras of error handling, and real codebases mix all three — knowing the convention for each matters for reading and writing correct code.

```javascript
// 1. Error-first callbacks (Node's original convention)
const fs = require("node:fs");
fs.readFile("data.txt", (err, data) => {
  if (err) {
    console.error("Read failed:", err);
    return;   // MUST return/handle here -- nothing does this automatically
  }
  console.log(data);
});

// 2. Promises
const fsPromises = require("node:fs/promises");
fsPromises.readFile("data.txt")
  .then((data) => console.log(data))
  .catch((err) => console.error("Read failed:", err));

// 3. async/await -- wrap in try/catch
async function readData() {
  try {
    const data = await fsPromises.readFile("data.txt");
    console.log(data);
  } catch (err) {
    console.error("Read failed:", err);
  }
}
```

**The specific, real bug worth naming:** forgetting to `await` (or `.catch()`) an async call inside another function leaves its rejection unhandled.

```javascript
// BUG: fetchAndSave is async, but its rejection is never caught
async function fetchAndSave(id) {
  const data = await fetchFromApi(id);   // if this throws...
  await saveToDb(data);
}

function handleRequest(req, res) {
  fetchAndSave(req.body.id);   // ...this rejection has nowhere to go
  res.send("Processing started");
}
```

```javascript
// FIX: catch it explicitly, or listen globally as a safety net
function handleRequest(req, res) {
  fetchAndSave(req.body.id).catch((err) => {
    console.error("Background processing failed:", err);
  });
  res.send("Processing started");
}

// A process-level safety net for anything that still slips through --
// log it, don't rely on it as the primary handling strategy
process.on("unhandledRejection", (reason) => {
  console.error("Unhandled rejection:", reason);
});
```

## Working with npm packages and semantic versioning

```json
{
  "dependencies": {
    "express": "^4.19.2",
    "lodash": "~4.17.21",
    "some-pinned-lib": "2.3.1"
  }
}
```

- `^4.19.2` — accepts any `4.x.x` update (minor/patch), never `5.0.0`. The most common default.
- `~4.17.21` — accepts only patch updates within `4.17.x`, not minor.
- `2.3.1` (no prefix) — pinned exactly; nothing updates without explicitly changing the number.

`package-lock.json` records the *exact* resolved version of every dependency (including nested dependencies of dependencies) actually installed — committing it means every teammate and every CI run installs precisely the same dependency tree, not just "something matching the semver range." `npm ci` (rather than `npm install`) in CI/production installs strictly from the lockfile and fails if it's out of sync with `package.json`, which is the safer choice for reproducible builds.

## Environment-based configuration with `.env` files

Hardcoding different config per environment directly in code doesn't scale, and hardcoding secrets (API keys, database passwords) into source code is a real security risk. `.env` files hold local environment variables outside of version control.

```bash
# .env (never commit this file -- add it to .gitignore)
DATABASE_URL=postgres://localhost/myapp_dev
API_KEY=sk_test_abc123
PORT=3000
```

```javascript
require("dotenv").config();   // npm install dotenv

const dbUrl = process.env.DATABASE_URL;
const port = process.env.PORT || 3000;

console.log(`Connecting to ${dbUrl}, listening on ${port}`);
```

*(Node's own native `--env-file` flag (`node --env-file=.env index.js`) has made the `dotenv` package optional for basic cases in newer Node versions — needs verification against the current Node LTS for exact availability and behavior.)*

The pattern that actually matters: the same code runs unchanged across dev, staging, and production — only the `.env` file (or the platform's own environment variable configuration, in production) differs. A `.env.example` file, committed to version control with variable *names* but no real values, documents what's required without leaking secrets — the same convention this platform's own `.env.example` follows.

## Try It (2 Minutes)

```javascript
const { EventEmitter } = require("node:events");

const clock = new EventEmitter();

clock.on("tick", (count) => console.log(`Tick ${count}`));

let count = 0;
setInterval(() => {
  count++;
  clock.emit("tick", count);
}, 1000);
```

Run it with `node clock.js` and watch it emit an event every second. This is the same pattern behind every `data` event a readable stream emits — a source broadcasting to any number of independent listeners, decoupled from what those listeners actually do.
