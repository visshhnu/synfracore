# Next.js — Installation Guide

## Scaffolding a New Project

```bash
# The standard way to start a new Next.js project is an official
# scaffolding CLI that asks a series of setup questions (TypeScript?
# a specific routing paradigm? a CSS approach? etc.) and generates a
# working project structure for you.
#
# (needs verification -- exact current command and the exact prompts
# it asks; both have changed across versions -- confirm against
# current Next.js docs before running)
npx create-next-app@latest my-app

cd my-app
npm run dev
```

Open the URL the dev server prints (typically `http://localhost:3000`) *(needs verification — default port, confirm against current docs/output)* and you should see the scaffolded starter page.

## Project Structure Overview

A freshly scaffolded project separates your route/page code from shared assets and configuration. The exact folder names and conventions are genuinely version-and-paradigm-dependent — do not treat any specific directory name below as fixed without checking:

```text
my-app/
├── (a routing directory)      <- where routes/pages live
├── public/                    <- static assets served as-is
├── package.json
├── (a Next.js config file)    <- framework-level configuration
└── ...
```

*(needs verification — the exact routing directory name/convention and the exact config file name/format are Next.js API surface that has changed across major versions; confirm against current Next.js docs before treating either as fixed)*

## Running the Dev Server

```bash
npm run dev
```

The dev server watches your files and updates the browser automatically as you save changes — you generally do not need to manually restart it during normal development. *(needs verification — exact current dev-server behavior/flags)*

## Building for Production

```bash
npm run build
npm run start
```

`build` produces an optimized production build; `start` runs that build (as opposed to `dev`, which runs an unoptimized, watch-mode server meant only for local development). *(needs verification — exact current build output format and what `start` actually serves, since deployment targets vary)*

## Why does this platform teach both a Vite-based React setup AND this Next.js setup?

They solve **overlapping but genuinely different problems**, which is exactly why both exist in this curriculum rather than one being simply "the newer version" of the other:

- **Vite** (covered in this platform's React technology) is a fast, minimal build tool for plain React — it gives you a quick local dev server and an optimized bundle, but makes no decisions about routing, rendering strategy, or server-side concerns. You assemble those yourself if you need them.
- **Next.js** is a full production framework — it makes routing, rendering-strategy, and build-tooling decisions for you as a coherent package, at the cost of more structure/convention to learn upfront.

A small app, a learning exercise, or a component library often doesn't need everything Next.js provides — Vite's simplicity is a genuine advantage there. A real production web app that needs SEO-friendly rendering, multiple pages, and integrated API endpoints is exactly the case Next.js is built for. Neither replaces the other; picking between them is a real, situational decision you'll make again in your own projects.

## Next Steps

Project is scaffolded and running. Go to **Fundamentals** to start with file-system routing and rendering concepts.
