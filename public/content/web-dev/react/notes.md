# React — Revision Notes

Condensed summary consolidating Overview, Intermediate, Advanced, and Troubleshooting — use this as a fast pre-interview or pre-project refresher, not as a first read.

## Core model (Overview)

- React is a **UI library**, not a framework — component rendering and state, not routing/build tooling by default
- **Component-based** + **declarative**: describe the UI for a given state, React figures out the DOM changes
- **Virtual DOM**: in-memory tree, diffed against the previous one on state change (**reconciliation**), only the minimal real DOM patch applied
- Render cycle: state change → component re-renders → Virtual DOM diff → real DOM patch

## Hooks fundamentals

- `useState`: local memory across renders; setter call schedules a re-render, doesn't update the current render's value in place
- `useEffect`: side effects after render; dependency array controls re-run timing (`[]` once, `[deps]` on change, omitted every render); return a cleanup function for anything that needs cancellation
- **Rules of Hooks**: unconditional, top-level, same order every render — React matches hook state to slot by **call order**, not name. Breaking this desyncs state silently, no error thrown.

## Intermediate patterns

- **Lift state up** to the nearest common parent when siblings need to share it
- **Context (`useContext`)**: for values genuinely needed at many depths (theme, current user) — not a default replacement for prop passing between nearby components
- **`useRef`**: mutable value across renders that does NOT trigger a re-render when changed; DOM access, or storage for things like interval IDs
- **Custom hooks**: plain functions starting with `use`, calling other hooks — the mechanism for reusing stateful logic
- **Controlled vs. uncontrolled inputs**: React state as source of truth (live validation, more re-renders) vs. DOM owns value, read via ref on submit (lighter, less live feedback)
- **Keys**: stable ID from data, never index on a reorderable/mutable list — this is the literal identity signal reconciliation uses to match old/new elements

## Advanced

- Reconciliation is a fast **heuristic**, not general tree-diff: different element types at same position = full subtree replace; siblings matched by `key`
- `useMemo`/`useCallback`: memoize a computed value / a function reference respectively — worth it for genuinely expensive computation or to stabilize a reference for a memoized child; not a default habit, profile first
- **Error boundaries**: must be class components (`getDerivedStateFromError` + `componentDidCatch`) — no hook equivalent exists
- **Suspense + `React.lazy`**: code-splitting, load a chunk only when needed; fallback shown while loading

## Troubleshooting — recurring bug patterns

- **Infinite re-render loop**: effect updates state that's (directly/indirectly) its own dependency, or a fresh object/array literal in the dependency array every render
- **State update on unmounted component**: async callback fires after unmount — fix with a cancellation flag or `AbortController` in the cleanup function
- **Stale closure**: a function created on an earlier render keeps referencing an old state value — fix with the functional setter form (`setX(prev => ...)`) or add the correct dependency
- **Index-as-key on mutable lists**: misattributes component/DOM state to the wrong data after a reorder or deletion
- **Mutating state in place**: `array.push()` then setting with the same reference — React compares by reference, sees no change, skips the re-render; always create a new reference

## Versioning Note

Durable, stable-since-hooks-were-introduced concepts: the component model, props/state, the Virtual DOM/reconciliation idea, and the core hooks (`useState`, `useEffect`, `useContext`, `useRef`) plus the Rules of Hooks — safe to treat as durable fact.

`(needs verification — recheck against current source)` for anything version-specific or actively evolving: the newer `use` hook, the React Compiler (automatic memoization, reducing the need for manual `useMemo`/`useCallback` in some cases), and React Server Components specifics — Server Components in particular are more of a Next.js-era/meta-framework concern in practice, and are covered lightly here on purpose; this platform's future Next.js technology is where they're covered in depth.
