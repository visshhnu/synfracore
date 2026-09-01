# React — Installation Guide

## Option 1: Vite (the modern standard — start here)

**Create React App (CRA) is effectively deprecated and is no longer the recommended way to start a new React project** — it hasn't kept pace with the ecosystem, its build times are noticeably slower, and the React team's own documentation no longer points to it as the default starting path. **Vite** is the current standard: a much faster dev server (using native ES modules during development instead of bundling everything up front) and faster production builds.

```bash
npm create vite@latest my-app -- --template react

cd my-app
npm install
npm run dev
```

Open the URL it prints (typically `http://localhost:5173`) — you'll see a live-reloading React app. Edit `src/App.jsx` and save; the browser updates instantly without a full page reload (Vite's Hot Module Replacement).

If you want JSX + TypeScript from the start (see the Prerequisites tab — not required, but available):

```bash
npm create vite@latest my-app -- --template react-ts
```

## Option 2: React DevTools (browser extension — install this too)

Install the **React Developer Tools** extension for Chrome, Firefox, or Edge (search your browser's extension store for "React Developer Tools," published by the React team). Once installed, open your browser's DevTools on any page running React and you'll see two new tabs:

- **Components** — inspect the live component tree, see props and state values in real time, and edit them directly to test behavior
- **Profiler** — record a session and see exactly which components re-rendered and why, which is the actual tool used in the Overview tab's Production Example to diagnose an unnecessary-re-render bug

This is not optional tooling for serious React work — debugging state and re-render issues without it means guessing from `console.log` statements sprinkled through your code.

## Project structure after `npm create vite@latest`

```
my-app/
├── index.html          # the single real HTML file — React mounts into this
├── package.json
├── vite.config.js
└── src/
    ├── main.jsx         # entry point — renders <App /> into index.html's root div
    ├── App.jsx          # your root component
    └── App.css
```

```jsx
// src/main.jsx — this is the actual mounting code Vite generates for you
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>
);
```

`StrictMode` is a development-only helper that intentionally double-invokes some functions (component bodies, some hooks) to help surface bugs — like impure rendering or missing effect cleanup — that would otherwise only show up unpredictably in production. It has no effect on the production build.

## A note on Next.js (production-grade path — later on this platform)

Bare Vite + React is genuinely the right tool for **learning React itself and prototyping** — which is exactly what this course uses it for. But most real, production React applications today are built on **Next.js**, a framework built directly on top of React that adds routing, server-side rendering, and a production deployment story that bare Vite + React deliberately doesn't provide out of the box. This platform covers Next.js as its own technology in a later phase — treat what you learn here as the React fundamentals that Next.js itself builds on, not a competing production setup.

## Verifying your install works

```bash
npm run dev
# open the printed localhost URL
# edit src/App.jsx, save, and confirm the browser updates without a manual refresh
```

## Next Steps

Vite is running and React DevTools is installed. Go to **Fundamentals** to start with JSX, components, and your first `useState`.
