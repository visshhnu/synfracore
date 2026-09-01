# Node.js — Portfolio Projects

## Project 1: File-Organizer CLI Tool

**Level:** Beginner **Time:** 3-5 hours **GitHub repo name:** `node-file-organizer-cli`

**What you build:** a command-line tool that scans a directory and sorts files into subfolders by extension (`.jpg` → `images/`, `.pdf` → `documents/`, etc.) — a real, small, genuinely useful script that exercises `fs` and `path` directly, no framework.

```javascript
#!/usr/bin/env node
const fs = require("node:fs");
const path = require("node:path");

const targetDir = process.argv[2] || ".";

const categoryMap = {
  ".jpg": "images", ".png": "images", ".gif": "images",
  ".pdf": "documents", ".docx": "documents", ".txt": "documents",
  ".mp3": "audio", ".wav": "audio",
};

async function organize(dir) {
  const entries = await fs.promises.readdir(dir, { withFileTypes: true });

  for (const entry of entries) {
    if (entry.isDirectory()) continue;

    const ext = path.extname(entry.name).toLowerCase();
    const category = categoryMap[ext];
    if (!category) continue;   // leave unrecognized file types alone

    const categoryDir = path.join(dir, category);
    await fs.promises.mkdir(categoryDir, { recursive: true });

    const oldPath = path.join(dir, entry.name);
    const newPath = path.join(categoryDir, entry.name);
    await fs.promises.rename(oldPath, newPath);
    console.log(`Moved ${entry.name} -> ${category}/`);
  }
}

organize(targetDir).catch((err) => {
  console.error("Failed to organize:", err.message);
  process.exit(1);
});
```

Run with `node organize.js ./downloads`. Extend it: a `--dry-run` flag that logs what *would* move without moving anything, or reading the category map from a JSON config file instead of hardcoding it.

---

## Project 2: Streaming File-Upload Server

**Level:** Intermediate **Time:** 6-10 hours **GitHub repo name:** `node-stream-upload-server`

**What you build:** an HTTP server that accepts file uploads and writes them to disk using streams — deliberately without buffering the whole upload into memory first, the same principle behind why real production upload endpoints don't just `Buffer.concat` an entire request body.

```javascript
const http = require("node:http");
const fs = require("node:fs");
const path = require("node:path");
const crypto = require("node:crypto");

const UPLOAD_DIR = path.join(__dirname, "uploads");
fs.mkdirSync(UPLOAD_DIR, { recursive: true });

const server = http.createServer((req, res) => {
  if (req.method === "POST" && req.url === "/upload") {
    const filename = `${crypto.randomUUID()}.bin`;
    const filePath = path.join(UPLOAD_DIR, filename);
    const writeStream = fs.createWriteStream(filePath);

    let receivedBytes = 0;
    req.on("data", (chunk) => { receivedBytes += chunk.length; });

    // req IS a readable stream -- piping it directly to disk means
    // the server never holds the full upload in memory at once
    req.pipe(writeStream);

    writeStream.on("finish", () => {
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ filename, bytes: receivedBytes }));
    });

    writeStream.on("error", (err) => {
      res.writeHead(500);
      res.end(JSON.stringify({ error: err.message }));
    });
  } else {
    res.writeHead(404);
    res.end("Not found");
  }
});

server.listen(3000, () => console.log("Upload server on :3000"));
```

Test with `curl -X POST --data-binary @somefile.zip http://localhost:3000/upload`. Extend it: a max-size limit (destroy the request and delete the partial file if it's exceeded), or basic content-type validation before accepting the stream.

---

## Project 3: A REST API on Raw `http` (Before Express)

**Level:** Intermediate **Time:** 8-12 hours **GitHub repo name:** `node-raw-http-rest-api`

**What you build:** a small REST API (in-memory "todo" resource — `GET`/`POST`/`PUT`/`DELETE /todos`) using only the built-in `http` module — no Express. This is deliberately the hard way, and it's the point: every piece of routing, body-parsing, and status-code logic you write by hand here is exactly what Express (this platform's next Backend technology) does for you in a few lines — building it manually first is what makes that abstraction make sense later instead of feeling like unexplained magic.

```javascript
const http = require("node:http");

let todos = [{ id: 1, title: "Learn Node.js", done: false }];
let nextId = 2;

function parseBody(req) {
  return new Promise((resolve, reject) => {
    let body = "";
    req.on("data", (chunk) => { body += chunk; });
    req.on("end", () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (err) {
        reject(err);
      }
    });
  });
}

function sendJson(res, status, data) {
  res.writeHead(status, { "Content-Type": "application/json" });
  res.end(JSON.stringify(data));
}

const server = http.createServer(async (req, res) => {
  const { method, url } = req;

  if (method === "GET" && url === "/todos") {
    return sendJson(res, 200, todos);
  }

  if (method === "POST" && url === "/todos") {
    const body = await parseBody(req).catch(() => null);
    if (!body || !body.title) return sendJson(res, 400, { error: "title is required" });
    const todo = { id: nextId++, title: body.title, done: false };
    todos.push(todo);
    return sendJson(res, 201, todo);
  }

  const idMatch = url.match(/^\/todos\/(\d+)$/);
  if (idMatch) {
    const id = Number(idMatch[1]);

    if (method === "PUT") {
      const body = await parseBody(req).catch(() => null);
      const todo = todos.find((t) => t.id === id);
      if (!todo) return sendJson(res, 404, { error: "not found" });
      Object.assign(todo, body);
      return sendJson(res, 200, todo);
    }

    if (method === "DELETE") {
      const before = todos.length;
      todos = todos.filter((t) => t.id !== id);
      if (todos.length === before) return sendJson(res, 404, { error: "not found" });
      return sendJson(res, 204, null);
    }
  }

  sendJson(res, 404, { error: "route not found" });
});

server.listen(3000, () => console.log("Raw HTTP REST API on :3000"));
```

Test with `curl`, `httpie`, or Postman against each verb. Extend it: persist `todos` to a JSON file with `fs` instead of an in-memory array, or add basic input validation on `PUT`. When this feels tedious to extend further — routing with regex, manually parsing bodies on every handler — that tedium is exactly the motivation for the Express technology next.
