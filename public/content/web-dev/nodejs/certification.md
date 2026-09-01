# Node.js Certification Guide

## Certifications Available

Unlike most web-dev technologies covered so far on this platform, Node.js does have real, actual proctored certifications — administered by the **OpenJS Foundation**, the nonprofit that stewards Node.js itself.

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **JSNAD** — OpenJS Node.js Application Developer | OpenJS Foundation | ~$300 | Proctored, hands-on/practical |
| **JSNSD** — OpenJS Node.js Services Developer | OpenJS Foundation | ~$300 | Proctored, hands-on/practical |

*(needs verification — exact current pricing and exam format details change on the OpenJS Foundation's side; confirm current values on the OpenJS Foundation's certification page before treating the above as current.)*

**JSNAD** focuses on core Node.js competency broadly — modules, error handling, streams, debugging, child processes, npm. **JSNSD** focuses more narrowly on building and securing web services/APIs with Node — closer to the practical backend-service skillset this technology and the upcoming Express/REST API Design technologies build toward.

**A real, honest caveat:** even with legitimate proctored certifications available (genuinely rarer than it sounds among web-dev technologies), a certification alone rarely substitutes for demonstrable portfolio work in hiring for Node roles. The three projects in this course's Projects tab — a CLI tool, a streaming upload server, and a raw-`http` REST API — demonstrate the exact skills these certifications test, in a form an interviewer can actually inspect. Treat a certification as a credential that complements a portfolio, not a replacement for one.

---

## Core Topics

```javascript
// Module system
const { readFile } = require("node:fs/promises");   // CommonJS
import { readFile } from "node:fs/promises";          // ES Modules

// Streams -- reading, writing, piping
const fs = require("node:fs");
fs.createReadStream("in.txt").pipe(fs.createWriteStream("out.txt"));

// EventEmitter
const { EventEmitter } = require("node:events");
class MyEmitter extends EventEmitter {}
const emitter = new MyEmitter();
emitter.on("event", (data) => console.log(data));
emitter.emit("event", { hello: "world" });

// Error-first callbacks vs Promises vs async/await
fs.readFile("f.txt", (err, data) => { if (err) throw err; });   // callback
fs.promises.readFile("f.txt").then(console.log).catch(console.error); // Promise
async function read() {
  try { console.log(await fs.promises.readFile("f.txt")); }
  catch (err) { console.error(err); }
}

// process and environment
process.env.NODE_ENV;
process.argv;
process.exit(1);
process.on("unhandledRejection", (reason) => console.error(reason));

// child_process -- running other programs from Node
const { exec, spawn } = require("node:child_process");
exec("ls -la", (err, stdout) => console.log(stdout));
const child = spawn("node", ["-v"]);
child.stdout.on("data", (data) => console.log(data.toString()));

// worker_threads -- CPU-bound work off the main thread
const { Worker } = require("node:worker_threads");
new Worker("./worker.js", { workerData: 42 });

// cluster -- multi-process scaling
const cluster = require("node:cluster");
if (cluster.isPrimary) { cluster.fork(); }
```

```bash
# npm quick reference
npm init -y
npm install <pkg>              # add a dependency
npm install --save-dev <pkg>   # add a dev-only dependency
npm ci                         # reproducible install from package-lock.json
npm run <script>               # run a package.json script
npm outdated                   # see what has newer versions available
npm audit                      # check for known vulnerabilities in dependencies

# Node runtime flags worth knowing
node --inspect server.js       # attach Chrome DevTools debugger
node --prof server.js          # CPU profiling
node --trace-warnings app.js   # full stack traces on warnings
node --env-file=.env app.js    # native env file loading (newer Node versions)
```

## Study Resources

- **Node.js Documentation** (nodejs.org/docs) — authoritative official reference
- **OpenJS Foundation Certification pages** (openjsf.org) — official JSNAD/JSNSD exam details
- **Node.js Design Patterns** (book) — commonly recommended for going beyond tutorial-level Node
- This platform's own Fundamentals through Advanced tabs, plus the three Projects, cover the practical skillset both certifications test
