# Next.js — Prerequisites

## What You Need Before Starting

### 1. Solid React (required)

Components, props, state, and hooks (`useState`, `useEffect` at minimum) need to already be comfortable, not brand-new. Every Next.js page is still, fundamentally, a React component — this course does not re-explain what a component is, what props are, or how state/re-rendering works. If any of that feels shaky, finish this platform's own **React** technology first; it's a direct, hard prerequisite, not a "nice to have."

### 2. Basic Node.js / npm familiarity (recommended, not required)

You'll run a scaffolding command, start a local dev server, and install packages via npm (or a similar package manager) throughout this course. You don't need deep Node.js knowledge — just comfort running commands like `npm install` and `npm run <script>` in a terminal.

### 3. Prior experience with any other meta-framework or SSR framework (not needed)

If you've used a different meta-framework, framework-specific patterns from it may or may not map cleanly onto Next.js — set that expectation aside rather than assuming direct translation. This course assumes zero prior meta-framework experience and explains Next.js's own concepts from scratch.

### What you do *not* need yet

- **Backend/server experience** — API routes/route handlers are introduced from scratch in the Intermediate module.
- **Deployment/DevOps experience** — deployment basics are covered conceptually where relevant; you don't need prior hosting/infrastructure knowledge.
- **TypeScript** — this course's examples lean toward plain JavaScript/JSX; if you've completed this platform's TypeScript technology, its concepts transfer directly but aren't assumed here.

### Quick self-check

Can you explain, without looking anything up, why a React list needs a stable `key` prop, and what `useEffect`'s dependency array actually controls? If both feel solid, you're ready to start at Fundamentals. If either feels shaky, spend more time in this platform's React technology first — Next.js builds directly on that foundation and doesn't re-cover it.
