# Node.js — Fundamentals

## CommonJS: `require` and `module.exports`

Node's original module system. Every file is its own module — nothing is global by default, unlike a plain `<script>` tag in a browser where everything shares one global scope. Code shares functionality by explicitly exporting it, and another file explicitly requires it.

```javascript
// math.js
function add(a, b) {
  return a + b;
}
function subtract(a, b) {
  return a - b;
}

module.exports = { add, subtract };
```

```javascript
// app.js
const { add, subtract } = require("./math");

console.log(add(2, 3));       // 5
console.log(subtract(5, 2));  // 3
```

`require()` runs synchronously and caches the result — requiring the same file twice returns the exact same cached object, not a fresh re-execution of the module. This is why mutating an object exported from a shared module affects every file that requires it — they're all holding a reference to the same cached instance.

## ES Modules: `import`/`export`

Node also supports the standardized ES Module syntax — the same `import`/`export` syntax used in modern frontend code. It's opt-in: either name files `.mjs`, or set `"type": "module"` in `package.json` to make `.js` files use ES Modules by default.

```javascript
// math.mjs
export function add(a, b) {
  return a + b;
}
```

```javascript
// app.mjs
import { add } from "./math.mjs";
console.log(add(2, 3));
```

```conceptgrid
{
  "boxes": [
    { "title": "CommonJS", "description": "require()/module.exports -- Node's original system, synchronous, still the default unless opted out of", "color": "amber" },
    { "title": "ES Modules", "description": "import/export -- the standard JavaScript syntax, opt-in via \"type\": \"module\" or .mjs, loaded asynchronously", "color": "blue" }
  ]
}
```

A project picks one as its default and stays consistent — mixing them incorrectly (`require()`-ing an `.mjs` file directly, for instance) is a real, common source of confusing early errors. Check a `package.json`'s `"type"` field first when debugging a module-related error in an unfamiliar codebase.

## The `fs` module — reading and writing files

This is the first genuinely Node-specific capability: a browser cannot read an arbitrary file from disk for security reasons; Node can, because it's not sandboxed the way browser JavaScript is.

```javascript
const fs = require("node:fs");

// Synchronous -- blocks the entire event loop until the read finishes
const data = fs.readFileSync("notes.txt", "utf8");
console.log(data);

// Asynchronous, callback style -- does NOT block; other code keeps running
fs.readFile("notes.txt", "utf8", (err, data) => {
  if (err) {
    console.error("Failed to read file:", err);
    return;
  }
  console.log(data);
});

// Asynchronous, Promise style -- the modern preferred approach
const fsPromises = require("node:fs/promises");

async function readNotes() {
  try {
    const data = await fsPromises.readFile("notes.txt", "utf8");
    console.log(data);
  } catch (err) {
    console.error("Failed to read file:", err);
  }
}
readNotes();
```

The sync/async distinction here is not a style preference — it's a real architectural decision. `readFileSync` blocks the single Node thread for the entire duration of the read, meaning *every other request Node is handling* has to wait behind it. `readFile`/`fsPromises.readFile` hand the work off and let Node keep serving other requests while the disk read completes in the background. Sync methods are fine for one-off scripts and startup-time config loading; they're a real production hazard inside a request handler.

## The `path` module — building paths that work everywhere

Windows uses `\` as a path separator; Linux and macOS use `/`. Hardcoding either one breaks on the other operating system. `path` builds paths correctly regardless of platform.

```javascript
const path = require("node:path");

path.join("users", "alice", "notes.txt");
// "users/alice/notes.txt" on Linux/Mac, "users\alice\notes.txt" on Windows

path.resolve("notes.txt");
// an absolute path, resolved against the current working directory

path.extname("notes.txt");   // ".txt"
path.basename("/a/b/notes.txt"); // "notes.txt"
path.dirname("/a/b/notes.txt");  // "/a/b"

// Real, common pattern: locate a file relative to the CURRENT module,
// not the directory the process happens to be run from
const configPath = path.join(__dirname, "config.json");
```

`__dirname` (CommonJS) points to the directory of the current file — using it with `path.join` is the standard, reliable way to reference a file relative to your source code, rather than relative to whatever directory `node` happened to be invoked from.

## Building a basic HTTP server with the built-in `http` module

This is the module every backend framework (Express included) is ultimately built on top of.

```javascript
const http = require("node:http");
const url = require("node:url");

const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);

  if (parsedUrl.pathname === "/" && req.method === "GET") {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("Home page");
  } else if (parsedUrl.pathname === "/api/users" && req.method === "GET") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify([{ id: 1, name: "Alice" }]));
  } else {
    res.writeHead(404, { "Content-Type": "text/plain" });
    res.end("Not found");
  }
});

server.listen(3000, () => console.log("Listening on port 3000"));
```

Every piece of routing logic here — matching the URL, checking the method, sending the right status code — is something Express does *for* you with a much shorter syntax (`app.get("/", handler)`). Seeing it done manually first is exactly what makes Express's abstraction click later, instead of feeling like unexplained magic.

## `process` and environment variables

`process` is a global object (available in every Node file, no `require` needed) representing the currently running Node process itself.

```javascript
console.log(process.argv);       // command-line arguments passed to the script
console.log(process.env.PATH);   // environment variables from the OS
console.log(process.platform);   // "win32", "linux", "darwin", etc.
console.log(process.version);    // the Node version running this script

// A genuinely common real pattern: reading config from the environment
// instead of hardcoding it -- e.g. a database URL that differs between
// dev, staging, and production
const dbUrl = process.env.DATABASE_URL || "postgres://localhost/dev_db";

// Exiting deliberately with a non-zero code (signals failure to whatever
// invoked this process -- a CI pipeline, a process manager, a shell script)
if (!dbUrl) {
  console.error("DATABASE_URL is required");
  process.exit(1);
}
```

Reading configuration from `process.env` rather than hardcoding it is the standard way a Node application adapts to different environments without changing code — the same code runs in dev and production, with different environment variables supplying the difference. `.env` files as a convenient way to *set* those variables locally are covered in Intermediate.

## npm and `package.json` basics

```bash
npm init -y                    # create package.json
npm install express            # add a dependency, saved to package.json
npm install --save-dev nodemon # a dev-only dependency (not needed in production)
npm install                    # install everything listed in an existing package.json
npm uninstall express          # remove a dependency
npm run <script-name>          # run a script defined in package.json's "scripts"
```

```json
{
  "name": "my-app",
  "version": "1.0.0",
  "scripts": {
    "start": "node index.js",
    "dev": "nodemon index.js"
  },
  "dependencies": {
    "express": "^4.19.2"
  },
  "devDependencies": {
    "nodemon": "^3.1.0"
  }
}
```

`dependencies` are needed for the app to actually run; `devDependencies` are only needed while developing (a test runner, a dev-mode auto-restart tool like `nodemon`). This distinction matters in production — a production install can skip `devDependencies` entirely (`npm ci --omit=dev`), keeping the deployed footprint smaller.

## Try It (2 Minutes)

Create `info.js`:

```javascript
const os = require("node:os");
const path = require("node:path");

console.log("Platform:", os.platform());
console.log("Free memory:", (os.freemem() / 1024 / 1024).toFixed(0), "MB");
console.log("This script's directory:", __dirname);
console.log("Node version:", process.version);
```

Run it with `node info.js`. Every value printed came from Node's built-in modules querying the actual machine it's running on — none of this is possible from browser JavaScript, which has no access to the operating system underneath it. That's the concrete, practical difference between "JavaScript in a browser" and "JavaScript in Node."
