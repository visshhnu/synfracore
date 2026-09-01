# Node.js Quick Reference

## Module System

```javascript
// CommonJS
const fs = require("node:fs");
module.exports = { foo };
module.exports.foo = foo;
exports.foo = foo;   // same as above, don't reassign `exports` itself

// ES Modules (requires "type": "module" in package.json, or .mjs)
import fs from "node:fs";
export function foo() {}
export default foo;
```

## `fs` — File System

```javascript
const fs = require("node:fs");
const fsp = require("node:fs/promises");

// Reading
fs.readFileSync(path, "utf8");                 // sync -- blocks
fs.readFile(path, "utf8", (err, data) => {});  // callback
await fsp.readFile(path, "utf8");              // Promise/async

// Writing
fs.writeFileSync(path, data);
await fsp.writeFile(path, data);
await fsp.appendFile(path, moreData);

// Directories
await fsp.mkdir(dir, { recursive: true });
await fsp.readdir(dir, { withFileTypes: true });
await fsp.rm(dir, { recursive: true, force: true });

// Streams
fs.createReadStream(path);
fs.createWriteStream(path);
readStream.pipe(writeStream);

// Watching
fs.watch(path, (eventType, filename) => {});
```

## `path`

```javascript
const path = require("node:path");
path.join("a", "b", "c.txt");     // platform-correct join
path.resolve("c.txt");            // absolute path from cwd
path.extname("f.txt");            // ".txt"
path.basename("/a/f.txt");        // "f.txt"
path.dirname("/a/f.txt");         // "/a"
path.join(__dirname, "config.json");   // relative to THIS file
```

## `http`

```javascript
const http = require("node:http");

const server = http.createServer((req, res) => {
  req.method;   // "GET", "POST", ...
  req.url;      // "/path?query=1"
  req.headers;  // { ... }

  res.writeHead(200, { "Content-Type": "application/json" });
  res.end(JSON.stringify({ ok: true }));
});

server.listen(3000, () => console.log("listening"));

// Reading a request body (http doesn't parse it for you)
let body = "";
req.on("data", (chunk) => { body += chunk; });
req.on("end", () => { JSON.parse(body); });
```

## `process`

```javascript
process.env.SOME_VAR;
process.argv;              // [node, script, ...args]
process.platform;          // "win32" | "linux" | "darwin"
process.version;           // "v20.11.0"
process.exit(code);        // 0 = success, non-zero = failure
process.cwd();
process.on("exit", (code) => {});
process.on("uncaughtException", (err) => {});
process.on("unhandledRejection", (reason) => {});
```

## EventEmitter

```javascript
const { EventEmitter } = require("node:events");
class MyClass extends EventEmitter {}
const obj = new MyClass();
obj.on("event", (data) => {});
obj.once("event", (data) => {});     // fires only once
obj.emit("event", payload);
obj.off("event", listenerFn);        // remove a specific listener
obj.removeAllListeners("event");
```

## Streams

```javascript
const { Readable, Writable, Transform } = require("node:stream");

readStream.pipe(writeStream);
readStream.on("data", (chunk) => {});
readStream.on("end", () => {});
readStream.on("error", (err) => {});

// Custom transform stream
const upper = new Transform({
  transform(chunk, encoding, callback) {
    callback(null, chunk.toString().toUpperCase());
  },
});
readStream.pipe(upper).pipe(writeStream);
```

## Worker Threads & Cluster

```javascript
// worker_threads -- parallel JS for CPU-bound work
const { Worker, parentPort, workerData, isMainThread } = require("node:worker_threads");
if (isMainThread) {
  const w = new Worker(__filename, { workerData: 10 });
  w.on("message", (msg) => console.log(msg));
} else {
  parentPort.postMessage(workerData * 2);
}

// cluster -- multi-process scaling
const cluster = require("node:cluster");
const os = require("node:os");
if (cluster.isPrimary) {
  os.cpus().forEach(() => cluster.fork());
} else {
  http.createServer(handler).listen(3000);
}
```

## npm Commands

```bash
npm init -y
npm install <pkg>                # add dependency
npm install -D <pkg>              # add dev dependency (--save-dev)
npm install <pkg>@<version>       # specific version
npm uninstall <pkg>
npm update
npm outdated
npm audit
npm audit fix
npm ci                            # clean install from lockfile (CI/production)
npm run <script>
npx <cli-tool>                    # run a package without installing it globally
```

## Semantic Versioning

```
^4.19.2   -> 4.x.x (minor + patch updates allowed, never 5.0.0)
~4.17.21  -> 4.17.x (patch updates only)
4.17.21   -> exact, no automatic updates
*         -> any version (avoid in real projects)
```

## Debugging & Profiling

```bash
node --inspect server.js         # attach Chrome DevTools debugger
node --inspect-brk server.js     # ...and pause on the first line
node --prof server.js            # CPU profiling -> isolate-*.log
node --prof-process isolate-*.log > out.txt
node --trace-warnings app.js
node --max-old-space-size=512 app.js   # cap heap size
```

## Error Handling Patterns

```javascript
// Error-first callback
fn((err, result) => { if (err) return handleErr(err); });

// Promise
fn().then(handleOk).catch(handleErr);

// async/await
try { const result = await fn(); } catch (err) { handleErr(err); }

// Global safety nets (log, don't rely on as primary handling)
process.on("unhandledRejection", (reason) => console.error(reason));
process.on("uncaughtException", (err) => { console.error(err); process.exit(1); });
```
