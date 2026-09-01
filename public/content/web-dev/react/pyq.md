# React — PYQ (Previously Asked / Practice Questions)

**Framing note:** React has no single official, proctored certification exam administered by Meta or a standardizing body — unlike, say, a cloud platform's certification track, there is no public past-paper archive to draw from. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented React behavior rather than invented "leaked" content.

---

### 1. (Domain: Virtual DOM & Reconciliation) Why is React's diffing algorithm described as a "heuristic," and what specific assumption does it rely on regarding list siblings?

**Answer:** A fully general tree-diff algorithm is computationally expensive (prohibitively so at real-world UI sizes), so React uses a fast O(n) heuristic instead of an exact comparison. For list siblings specifically, it relies on the developer supplying a stable `key` to identify each element's identity across renders, rather than deep-comparing each one — this is what lets React match "this is the same item, possibly moved" instead of falling back to fragile positional matching.

---

### 2. (Domain: Keys) A reorderable list uses the array index as its `key`. What specifically goes wrong when an item is deleted from the middle of the list?

**Answer:** Every item after the deleted one shifts up one index position. Because the key is derived from index rather than a stable identity, React now believes the item occupying each shifted position is the *same* element it rendered there before — it reuses that position's DOM node and any associated component-local state for what is actually different underlying data, producing subtle bugs like an "editing" toggle or an input value ending up attached to the wrong row.

---

### 3. (Domain: Hooks) Why must hooks be called unconditionally at the top level of a component, in the same order every render?

**Answer:** React associates each hook call with its stored state purely by call order within the component — effectively a positional slot, not a name-based lookup. If a hook call is conditionally skipped on some renders (inside an `if`, a loop, or after an early return), every hook call after it shifts to a different slot than it occupied before, and React has no way to detect that the meaning of each slot changed — state gets silently attached to the wrong hook call, with no error thrown at the point of the mistake.

---

### 4. (Domain: useEffect) An effect fetches data and has an empty dependency array (`[]`). A prop the fetch actually depends on later changes. What happens, and why?

**Answer:** The effect does not re-run — an empty dependency array means "run once, after the first render only," so a later change to a value the effect internally reads (but didn't declare as a dependency) has no effect on whether the fetch re-executes. The fetch silently continues using whatever value that prop held at the time the effect was first set up, which is exactly the stale-closure pattern covered in Troubleshooting — the fix is including the prop in the dependency array so the effect re-runs when it actually changes.

---

### 5. (Domain: State Updates) Why does calling a `useState` setter with the exact same array reference (after mutating it in place with `.push()`) fail to trigger a re-render?

**Answer:** React's re-render bail-out logic compares the new state value to the previous one by reference (`Object.is` comparison), not by deep value equality. Mutating an array in place with `.push()` changes its contents but not its reference — passing that same reference back to the setter means React sees an identical reference to what it already has stored, concludes nothing changed, and skips scheduling a re-render, even though the array's contents are genuinely different now.

---

### 6. (Domain: useMemo/useCallback) Under what specific circumstance does wrapping a value in `useMemo` actually prevent a child component from re-rendering unnecessarily — and when does it fail to help despite being used?

**Answer:** It helps when the child is wrapped in `React.memo` (which does a shallow prop comparison) and the memoized value's *stability* is what the comparison depends on — `useMemo` gives the same reference across renders unless a listed dependency changes, so `React.memo` can correctly detect "unchanged" and skip re-rendering. It fails to help if the child isn't wrapped in `React.memo` at all (nothing is checking reference stability to skip a re-render in the first place), or if the `useMemo` call's own dependency array itself contains an unstable reference, defeating the memoization one level up.

---

### 7. (Domain: Error Boundaries) Why must an error boundary currently be written as a class component rather than a function component with hooks?

**Answer:** Error boundaries rely on two specific lifecycle methods — `static getDerivedStateFromError` (to update state and render a fallback UI) and `componentDidCatch` (to log/report the error) — that exist as class component lifecycle methods with no hook-based equivalent currently exposed by React. Until such a hook exists, catching render-phase errors in a subtree requires a class component specifically for this purpose, even in an otherwise fully hooks-based codebase.

---

### 8. (Domain: Context) A team uses `useContext` for a piece of state that's actually only shared between two adjacent sibling components. What's the tradeoff of this choice compared to simply lifting the state to their shared parent and passing it as props?

**Answer:** Context avoids the (minor, in this case) prop-drilling cost, but trades it for reduced traceability — any component anywhere in the tree can read a context value without an explicit prop connecting it to its source, making the data flow harder to follow just by reading a component's own props/signature. For state genuinely shared by only two nearby components, lifting state up and passing explicit props keeps the data flow visible and traceable; context is better reserved for values that legitimately need to reach many components at varying, unpredictable depths.

---

### 9. (Domain: Suspense) What does `<Suspense fallback={...}>` actually do when wrapped around a `React.lazy`-loaded component, mechanically?

**Answer:** `React.lazy(() => import(...))` defers loading that component's code into a separate bundle chunk, fetched only when the component is actually about to render. `Suspense` catches the fact that this lazy component isn't ready yet and renders its `fallback` in its place until the import resolves, then swaps to rendering the real component — this is the standard mechanism for code-splitting a bundle so parts of the UI not needed immediately (a modal, a rarely visited page) don't inflate the initial load.

---

### 10. (Domain: Controlled Components) Why does a controlled input re-render on every keystroke, and why is this an acceptable, standard tradeoff rather than a performance problem to avoid?

**Answer:** A controlled input's value is read from React state and updated via `onChange` on every keystroke, and updating state via its setter schedules a re-render of that component — so yes, a re-render genuinely happens per keystroke. This is standard and rarely a real performance problem because a single text input's own re-render is cheap; it only becomes worth addressing (via `React.memo` on expensive sibling/child components, or `useMemo`/`useCallback` for stable references passed to them) when profiling actually shows an expensive component re-rendering unnecessarily as a side effect of that same state update — not preemptively.
