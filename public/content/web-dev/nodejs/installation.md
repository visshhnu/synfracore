# Node.js — Installation Guide

## Option 1: nvm (Recommended)

Installing Node directly (a single installer) works, but locks you to whatever version you installed. Real projects frequently require different Node versions — nvm (Node Version Manager) lets you install and switch between multiple Node versions on the same machine, which is genuinely how most professional Node development is done, not just a nice-to-have.

```bash
# macOS / Linux — install nvm itself
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# restart your terminal, then verify:
nvm --version

# Install the current LTS (Long-Term Support) release of Node
nvm install --lts
nvm use --lts

# Or install a specific version
nvm install 20
nvm use 20

# List installed versions / switch between them
nvm list
nvm use 18
```

```bash
# Windows — use nvm-windows (a separate, Windows-specific tool)
# Download the installer from: github.com/coreybutler/nvm-windows/releases
# Then, in a terminal:
nvm install lts
nvm use lts
```

*(needs verification — exact current LTS version number changes on Node's own release schedule; check `nodejs.org` for the current LTS before treating any specific version number as current)*

## Option 2: Direct installer (simplest, least flexible)

```bash
# Download from nodejs.org — choose the LTS version
# Run the installer (macOS .pkg, Windows .msi, or use your Linux
# distro's package manager)

# Ubuntu/Debian, via NodeSource (gets a current version, not the
# often-outdated version in default distro repos)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

This works fine for a single project on a single machine, but switching Node versions later means reinstalling — nvm is worth the small extra setup step for anyone doing ongoing Node work.

## Verify the Install

```bash
node -v     # e.g. v20.11.0
npm -v      # npm ships bundled with Node -- e.g. 10.2.4
```

If both commands print a version number, Node and npm are installed correctly.

## Running JavaScript Two Ways

```bash
# Way 1: run a file
echo 'console.log("Hello from a file");' > hello.js
node hello.js

# Way 2: the REPL (Read-Eval-Print Loop) -- an interactive shell
node
> const x = 2 + 2
> console.log(x)
4
> .exit
```

The REPL is genuinely useful for quickly testing a small snippet without creating a file — the same way you might use a browser console, but with Node's APIs (`fs`, `process`) available instead of DOM APIs.

## Initializing a Project

```bash
mkdir my-node-app && cd my-node-app
npm init -y
# creates package.json with sensible defaults -- drop -y to answer
# the setup questions (name, version, entry point) interactively instead
```

```json
{
  "name": "my-node-app",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  }
}
```

`package.json` is the project's manifest — its dependencies, entry point, and scripts all live here. Every `npm install <package>` updates this file automatically.

## First "Hello World" HTTP Server

```javascript
// index.js
const http = require("node:http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello, Node.js!\n");
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});
```

```bash
node index.js
# in another terminal, or a browser:
curl http://localhost:3000/
```

No `npm install` was needed for this — `http` is a built-in Node module, part of the runtime itself, not a package.

## Next Steps

Node is installed and running a real HTTP server with zero external dependencies. Go to **Fundamentals** to learn the module system, the `fs`/`path` modules, and how `process` and environment variables work.
