# React — Advanced

## Reconciliation, in more depth — and why keys matter to the algorithm itself

React's diffing is **not** a general tree-diff algorithm (which would be prohibitively expensive — O(n³) for arbitrary trees at real-world sizes). It's a heuristic, O(n) algorithm that relies on two assumptions that hold true for almost all real UIs:

1. **Two elements of different types produce entirely different trees** — if a `<div>` becomes a `<span>` at the same position, React doesn't try to diff their children at all; it tears down the whole old subtree and builds the new one fresh, unmounting every component underneath (losing their state).
2. **A developer can hint at stable identity across renders using `key`** — for a list of siblings, React doesn't guess which old element corresponds to which new one by deep comparison; it matches them **by key**, directly.

This is exactly why key choice isn't just a React API requirement to silence a console warning — it's the literal identity signal the reconciliation algorithm uses. A stable key means React can recognize "this specific element just moved" and reuse its DOM node and component state; a missing or unstable key (array index on a reorderable list) means React's positional-matching fallback can misattribute an old element's identity to a different piece of data after a reorder, exactly the bug shown in the Intermediate tab.

```jsx
// Different key -> React unmounts the old component entirely and
// mounts a brand new one, even though the JSX "looks" similar
<UserCard key={user.id} user={user} />
// If user.id changes (different key), any local state inside
// UserCard (e.g. an "editing" toggle) is thrown away, not preserved --
// this is sometimes done DELIBERATELY to force a full remount
```

## `useMemo` / `useCallback` — when they actually help vs. add needless complexity

```jsx
// useMemo -- memoizes a COMPUTED VALUE, recomputed only when a dependency changes
const sortedItems = useMemo(
  () => items.slice().sort((a, b) => a.price - b.price),
  [items]
);

// useCallback -- memoizes a FUNCTION REFERENCE itself
const handleClick = useCallback(
  (id) => setSelectedId(id),
  [] // no dependencies -- this function reference never changes
);
```

Both exist to solve exactly one of two problems: (1) avoiding an expensive recomputation on every render, or (2) providing a **stable reference** so a `React.memo`-wrapped child (or another hook's dependency array) doesn't see a "changed" value on every render just because a new object/function was created. Neither is a general performance switch to flip on by default:

- `useMemo`/`useCallback` themselves have a real (small) cost — comparing dependencies every render.
- Wrapping a cheap computation or a component with no memoized children gains nothing measurable and adds a dependency array that itself needs to stay correct (an easy source of stale-closure bugs — see Troubleshooting).
- **Profile first.** React DevTools' Profiler (see Installation) shows exactly which components re-render and how long they take — reach for `useMemo`/`useCallback` when the Profiler shows a real, measurable cost, not preemptively on every value.

## Performance profiling with React DevTools

The **Profiler** tab (part of React DevTools) records a session and shows, per commit, which components rendered, how long each took, and — critically — *why* each one rendered (props changed, state changed, a parent re-rendered, or a context value changed). This "why did this render" information is the actual diagnostic tool used in the Overview tab's Production Example, and it's the correct first step for any suspected performance issue — before reaching for `useMemo`/`useCallback` speculatively.

```jsx
import { Profiler } from "react";

function onRenderCallback(id, phase, actualDuration) {
  console.log(`${id} (${phase}) took ${actualDuration}ms`);
}

<Profiler id="ItemList" onRender={onRenderCallback}>
  <ItemList items={items} />
</Profiler>
```

The programmatic `<Profiler>` component is useful for automated performance regression checks; for interactive debugging, the DevTools Profiler panel's flame graph and "ranked" view are typically faster to work with directly in the browser.

## Error boundaries

A JavaScript error thrown during rendering, in a lifecycle method, or in a constructor anywhere in a component tree will — by default — unmount the *entire* tree, leaving a blank page. An **error boundary** catches errors in its child tree and renders a fallback UI instead of crashing the whole app. Error boundaries must currently be class components — there is no hook equivalent, because the underlying lifecycle methods (`static getDerivedStateFromError`, `componentDidCatch`) aren't exposed as hooks:

```jsx
class ErrorBoundary extends React.Component {
  state = { hasError: false };

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, info) {
    console.error("Caught by boundary:", error, info);
    // report to an error-tracking service here
  }

  render() {
    if (this.state.hasError) return <h2>Something went wrong.</h2>;
    return this.props.children;
  }
}

// Usage: wrap a section of the tree that's reasonable to fail independently
<ErrorBoundary>
  <UntrustedThirdPartyWidget />
</ErrorBoundary>
```

Place boundaries around genuinely independent sections of a UI (a widget, a route) rather than one single boundary around the entire app — a single global boundary means any error anywhere blanks the whole page, defeating the purpose of isolating failure.

## Suspense and lazy loading

`React.lazy` + `<Suspense>` split a component's code into a separate bundle chunk, loaded only when it's actually needed — the standard way to keep an initial bundle small when parts of the UI aren't needed immediately (a modal, a rarely-visited settings page).

```jsx
import { lazy, Suspense } from "react";

const SettingsPanel = lazy(() => import("./SettingsPanel"));

function App() {
  return (
    <Suspense fallback={<p>Loading settings...</p>}>
      <SettingsPanel />
    </Suspense>
  );
}
```

`Suspense` shows its `fallback` while any lazy-loaded descendant is still being fetched, then swaps to the real content once it resolves. `(needs verification — recheck against current source)`: newer Suspense-integrated data-fetching patterns (fetching data itself via Suspense, not just code-splitting) and Server Components are more actively evolving areas, and are more of a Next.js-era/meta-framework concern in practice — this platform's future Next.js technology is where that's covered in depth; treat the code-splitting use shown here as the stable, durable part of Suspense.

## The Rules of Hooks — why they exist, mechanically

Covered at an introductory level in Overview; the mechanical reason is worth being explicit about here. React does not track hook state by variable name or by an explicit key you provide — it tracks it purely by **call order** within a component, using an internal linked list (or array, depending on the internal implementation detail) walked in sequence on every render.

```jsx
// What React effectively does internally, conceptually, per render:
// render 1: useState() call #1 -> slot 0, useState() call #2 -> slot 1
// render 2: useState() call #1 -> slot 0, useState() call #2 -> slot 1  (matches!)

function Broken({ condition }) {
  if (condition) {
    const [a, setA] = useState(0); // conditionally called -- BREAKS call order
  }
  const [b, setB] = useState(0);
  // On a render where `condition` is true: b is hook slot #2
  // On a render where `condition` is false: b is hook slot #1
  // React has no idea the meaning of each slot shifted -- state gets
  // silently attached to the wrong hook call between these two renders
}
```

This is exactly why hooks must be called unconditionally, at the top level of a component or custom hook, every single render — any conditional, loop, or early return that could skip a hook call on some renders but not others desynchronizes this position-based matching, with no error thrown at the point of the mistake. ESLint's `eslint-plugin-react-hooks` (the `rules-of-hooks` rule) is the standard, strongly recommended safeguard — it statically catches this class of bug before it ever runs.
