# Express.js — Installation Guide

## Step 1: Create a project

```bash
mkdir my-express-app
cd my-express-app
npm init -y
```

`npm init -y` creates a `package.json` with default values, skipping the interactive prompts — fine for learning, worth answering properly (name, description, entry point) for a real project.

## Step 2: Install Express

```bash
npm install express
```

This adds `express` to `dependencies` in `package.json` and installs it into `node_modules`. Check `package.json` afterward — you should see something like `"express": "^4.19.2"` (or `^5.x` depending on what's current when you install).

## Step 3: A minimal "Hello World" server

Create `server.js`:

```javascript
const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});
```

If your `package.json` has `"type": "module"`, use ES module syntax instead:

```javascript
import express from 'express';
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});
```

## Step 4: Run it

```bash
node server.js
```

Open `http://localhost:3000` in a browser or run `curl http://localhost:3000` — you should see `Hello World!`.

## Step 5: Auto-restart during development

Restarting `node server.js` manually after every code change gets old fast. Two real options:

**Option A — Node's built-in `--watch` flag** (no extra dependency, available in modern Node versions):

```bash
node --watch server.js
```

**Option B — `nodemon`** (the long-standing, widely-used community tool, still common in existing tutorials and codebases):

```bash
npm install --save-dev nodemon
npx nodemon server.js
```

Add it as an npm script in `package.json` for convenience:

```json
{
  "scripts": {
    "dev": "node --watch server.js"
  }
}
```

Then just run `npm run dev`. `(needs verification — confirm whether `--watch` is stable/recommended over `nodemon` in the specific Node version actually in use, since this has shifted as `--watch` matured)`

## Next Steps

Express is installed and a server is running. Go to **Fundamentals** to learn routing, the request/response objects, and middleware — the concepts everything else in Express builds on.
