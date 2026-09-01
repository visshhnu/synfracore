# HTML — Setup Guide

There is no "installing HTML" — no runtime, no compiler, no package to download. HTML files are plain text that any browser can read directly. What actually matters is setting up a comfortable *workflow*: an editor with helpful features, and a way to preview your changes without friction. Below are the real options, honestly ranked by how most working developers actually work today.

## First Steps

### Option 1: VS Code + Live Server (Recommended)

This is the setup most professional front-end developers actually use day to day — free, cross-platform, and the "save file, see it update instantly in the browser" workflow removes the single most annoying part of learning HTML (manually re-clicking refresh).

```bash
# 1. Install VS Code
# Download from code.visualstudio.com — Windows/Mac/Linux installer

# 2. Install the "Live Server" extension
# Inside VS Code: Extensions panel (Ctrl+Shift+X) -> search "Live Server" -> Install
# (by Ritwick Dey — the standard, most-installed option)

# 3. Create a project folder and your first file
mkdir my-first-site
cd my-first-site
# Create index.html inside VS Code

# 4. Right-click index.html in the VS Code file explorer -> "Open with Live Server"
# This opens the page in your browser at http://127.0.0.1:5500 and
# auto-refreshes on every save -- no manual F5 needed
```

### Option 2: Just open the file directly (Zero setup)

Genuinely valid for the earliest stage of learning — no editor extension, no local server, nothing to configure. This is exactly what the Overview tab's "Try It" exercise assumes, deliberately, so nothing blocks a complete beginner from writing their very first page in the next two minutes.

```bash
# 1. Create a file named index.html in any text editor, save it
# 2. Double-click the file in your file explorer/Finder
#    -- OR --
# 3. In the browser: File -> Open File... -> select index.html

# The address bar will show something like:
# file:///Users/you/my-first-site/index.html
```

**Limitation worth knowing about early:** some browser features (fetching other local files, certain JavaScript APIs you'll meet later in other courses) are restricted or behave differently under a `file://` URL versus a real `http://localhost` server. This doesn't affect anything in this course's Fundamentals/Intermediate content, but it's the reason Option 1 or 3 eventually become worth setting up.

### Option 3: A minimal local dev server (no VS Code required)

If you already have Node.js or Python installed for other reasons, either can serve a folder over real `http://` in one command — useful once you outgrow `file://` limitations but don't want VS Code specifically.

```bash
# Python 3 (usually pre-installed on Mac/Linux)
cd my-first-site
python3 -m http.server 8000
# Visit http://localhost:8000

# Node.js (if installed)
npx serve .
# Visit the URL it prints, typically http://localhost:3000
```

## Browser DevTools — Not Optional Past This Point

Every major browser ships a full inspector, free, built in — no install needed. This is the single most important tool for actually learning HTML, because it lets you see the live DOM tree, not just your source file.

```
Chrome / Edge / Firefox:  F12, or right-click any element -> "Inspect"
Safari:  Enable first — Preferences -> Advanced -> "Show Develop menu",
         then Develop -> Show Web Inspector (Cmd+Option+I)
```

Once open, the **Elements** panel shows the live DOM tree (which can differ from your saved file once JavaScript has run), and lets you edit HTML directly in the browser to experiment — changes there are temporary and never touch your saved file, which makes it a safe place to try things.

## What "Not Needed" Actually Means Here

Unlike most technologies on this platform, there is no equivalent of a "server install" step for HTML itself — no daemon, no service to start, no version to pick. If you find yourself looking for one, you've likely conflated HTML with a web *framework* (which does have real installs, covered in their own courses) rather than the markup language itself.

## Next Steps

Setup is complete once you can save a `.html` file and see it rendered in a browser, with DevTools available. Go to **Fundamentals** to start writing real semantic structure.
