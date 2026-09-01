# TypeScript — Installation Guide

## A note before you install anything

Most real projects today (Next.js, Vite, Create React App and its modern successors) come with TypeScript already wired into their tooling — you'll almost never manually run `tsc` day-to-day on those. This guide is still worth doing manually once, because understanding what's actually happening underneath (`tsc`, `tsconfig.json`, the compile step) makes debugging a framework's TypeScript errors far easier than treating it as a black box.

## Option 1: Add TypeScript to an existing Node project

```bash
# In an existing project directory (with a package.json already present)
npm install -D typescript

# Generates a tsconfig.json with every option listed (mostly commented out)
npx tsc --init
```

## The `tsconfig.json` options that actually matter

A real `tsconfig.json` is long, but a small handful of options drive almost all practical behavior. A reasonable starting point for a new Node/library project:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": ["src/**/*"]
}
```

- **`strict`** — turns on the full bundle of strict type-checking flags (`strictNullChecks`, `noImplicitAny`, and others — see the Advanced tab for the full breakdown). Enable this from day one on a new project; retrofitting it onto a large existing loose codebase later is significantly more painful.
- **`target`** — which JavaScript version the compiled output uses (`ES2022` is a reasonable modern default; lower it only if you genuinely need to support older runtimes that don't understand newer syntax).
- **`module`** — which module system the compiled output uses (`NodeNext` for a Node.js project so it matches your `package.json`'s actual module resolution; frameworks like Next.js/Vite set this for you already).
- **`outDir`** — where compiled `.js` output goes, kept separate from your `.ts` source so they're never confused or accidentally committed together.

## Compiling and running

```bash
# Compile once
npx tsc

# Watch mode -- recompiles automatically on every save
npx tsc --watch

# Type-check only, emit nothing -- useful in CI to just verify correctness
npx tsc --noEmit
```

```bash
# dist/index.js now exists -- run it like any normal JS file
node dist/index.js
```

## Running TypeScript directly, without a separate compile step

For local development, recompiling on every change and then running the output is real friction. Two common approaches skip that step:

```bash
# ts-node -- runs .ts files directly, compiling on the fly
npm install -D ts-node
npx ts-node src/index.ts

# tsx -- a faster modern alternative built on esbuild, widely used
# in real projects today for exactly this reason
npm install -D tsx
npx tsx src/index.ts
npx tsx watch src/index.ts   # re-runs automatically on save
```

`esbuild`-based tools like `tsx` are dramatically faster than `ts-node`'s default mode because they only *transpile* (strip types, no type-checking) rather than run the full type checker — genuinely fine for local dev iteration speed, as long as `tsc --noEmit` (or your editor) is still catching real type errors separately, since a fast transpile-only tool will happily run code with type errors in it.

## What frameworks already do for you

```bash
# Next.js -- TypeScript support is built in; just add a tsconfig.json
# (or let `next dev` generate one automatically the first time you
# rename a file to .tsx/.ts) and it's wired into the existing build.

# Vite -- same story; create a project with the TypeScript template
npm create vite@latest my-app -- --template react-ts
```

In both cases, the framework's own dev server and build pipeline handle compiling TypeScript for you — you write `.ts`/`.tsx`, save, and the framework's own toolchain (not a manual `tsc` step you run yourself) takes care of the rest. Knowing the manual path above is still worth it for the moment a type error message doesn't make sense and you need to understand what the framework's tooling is actually doing underneath.

## Next Steps

TypeScript is compiling. Go to **Fundamentals** to start writing real typed code — basic types, interfaces, and inference.
