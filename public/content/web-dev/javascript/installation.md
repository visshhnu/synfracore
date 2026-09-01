# JavaScript — Installation & Setup

JavaScript is unusual among languages covered on this platform: you can start writing and running it with **zero install**, because every browser already has a JavaScript engine built in. Real development work, though, needs a bit more — Node.js for running scripts outside the browser and for the tooling (npm) the rest of the JavaScript ecosystem is built on.

## Option 1: Browser Console (zero install, fastest way to start)

Every browser ships a JavaScript console for free.

1. Open any web page.
2. Press **F12** (Windows/Linux) or **Cmd+Option+I** (Mac) to open DevTools.
3. Click the **Console** tab.
4. Type `console.log("hello")` and press Enter.

This is genuinely how most people write their first JavaScript, and it's still how experienced developers quickly test a snippet or inspect a live page's state. It's the right tool for the Overview and Fundamentals "Try it" exercises. Its limit: nothing you write here is saved, and it can't read/write files or talk to most external services the way a real script can.

## Option 2: Node.js (for real scripts, npm, and tooling)

Node.js runs JavaScript outside the browser — on your machine, in a terminal, or on a server. It's required for anything beyond quick console experiments: running a `.js` file directly, installing packages with npm, and using any real-world JavaScript build tooling.

**Recommended: install via nvm (Node Version Manager)**, not a direct installer — JavaScript projects frequently pin specific Node versions, and nvm lets you switch between them per-project instead of fighting a single system-wide install.

```bash
# macOS / Linux
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# restart your terminal, then:
nvm install --lts
nvm use --lts

# Windows: use nvm-windows instead (a separate project, different installer)
# https://github.com/coreybutler/nvm-windows
```

Verify it worked:

```bash
node --version   # should print something like v22.x.x
npm --version    # npm ships bundled with Node
```

`(needs verification — recheck against current source: exact current LTS version number changes regularly — nvm install --lts always grabs whatever is current)`

## Option 3: Code Editor with JS Tooling

**VS Code** (free, most widely used for JavaScript specifically) is the practical default. On install, add:

- The built-in JavaScript/TypeScript language support (already bundled — no extension needed for basic syntax highlighting and autocomplete).
- **ESLint** extension — catches real bugs before you run the code (an unused variable, a missing `await`, an unreachable `case`), not just style nits.
- **Prettier** extension (optional but common) — auto-formats code consistently, so code review isn't spent on spacing debates.

## Running a Script Both Ways

Create a file called `hello.js`:

```javascript
console.log("Hello from JavaScript!");

const sum = (a, b) => a + b;
console.log("2 + 3 =", sum(2, 3));
```

**Run it with Node.js** (from a terminal, in the same folder):

```bash
node hello.js
```

**Run the same logic in a browser** — save this as `hello.html` in the same folder and open it in a browser:

```html
<!DOCTYPE html>
<html>
<body>
  <script src="hello.js"></script>
</body>
</html>
```

Open DevTools' Console tab on that page — the same output appears there. This is the core thing to internalize early: the *language* is identical in both places; what differs is the environment around it — Node.js gives you access to the filesystem and OS, a browser gives you the DOM and `window`, and each has APIs the other doesn't.

## Verify Everything Works

```bash
node --version      # Node installed and on PATH
npm --version        # npm installed (bundled with Node)
node hello.js         # runs your script, prints to the terminal
```

If `node hello.js` prints the two lines above, you have a complete working JavaScript setup — browser console for quick experiments, Node.js + a real editor for everything else.
