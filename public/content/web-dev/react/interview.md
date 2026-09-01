# React — Interview Q&A

## Q: What is the Virtual DOM, and how does reconciliation actually work?

The Virtual DOM is a lightweight in-memory tree representation of your UI. When state changes, React builds a new Virtual DOM tree and compares it against the previous one — this comparison is reconciliation. Rather than doing a full, expensive general tree-diff, React uses a fast heuristic: elements of different types at the same position are treated as entirely different subtrees (old one torn down, new one built fresh), and siblings within a list are matched by their `key`, not by deep comparison. The result is the minimal set of real DOM operations needed, which is what makes updates fast compared to re-rendering everything from scratch on every change.

## Q: Why do list items need a `key`, specifically — what breaks without one?

Without a `key`, React falls back to matching old and new elements in a list by position. If the list is ever reordered or an item is removed from the middle, elements shift position without their underlying data actually changing identity — React's positional fallback then misattributes an old element (and any local component state or DOM state, like an "editing" toggle or scroll position) to different underlying data. A stable, unique `key` — usually an ID from the data, never the array index for a mutable list — gives React the real identity signal it needs to match correctly regardless of position changes.

## Q: Controlled vs. uncontrolled components — what's the real tradeoff?

A controlled input's value is driven entirely by React state — every keystroke updates state via `onChange`, and the input's `value` is set from that state, making React the single source of truth. An uncontrolled input manages its own value internally in the DOM, read out on demand through a `ref`. Controlled gives you live validation and the ability to conditionally react to every change, at the cost of a re-render per keystroke. Uncontrolled is lighter-weight and reasonable for simple forms read only at submit time. Neither is universally "correct" — it's a real tradeoff based on what the form actually needs to do.

## Q: What does the `useEffect` dependency array control, and what are the common mistakes?

It controls when the effect re-runs relative to renders: `[]` runs the effect once after the first render only; a list of values re-runs the effect whenever any of those values changes since the last render; omitting the array entirely re-runs it after every render. The most common real mistakes: forgetting to include a value the effect actually reads (causing it to use a stale value from whichever render created that closure — a stale closure bug), and including an object or array literal created fresh every render as a dependency (causing the effect to re-run every single render, since a new object never equals the old one by reference, even with identical contents).

## Q: When should you actually use `useMemo`/`useCallback` — and when are they not worth it?

They're worth using specifically when a computation is genuinely expensive to redo on every render, or when a stable reference is what's required for a `React.memo`-wrapped child (or another hook's dependency array) to correctly skip unnecessary work — a new object/function reference on every render defeats a shallow prop comparison even when the actual values are unchanged. They're not worth it as a default habit: both hooks have their own small cost (comparing dependencies every render), and wrapping a cheap computation with no memoized consumers gains nothing measurable while adding a dependency array that itself needs to stay correct. Profile with React DevTools first; memoize deliberately based on what the profiler actually shows, not reflexively.

## Q: What are the Rules of Hooks, and why do they exist as a hard requirement rather than a style guideline?

Hooks must be called unconditionally, at the top level of a component or custom hook, in the same order on every single render — never inside a conditional, loop, or after an early return. This isn't stylistic: React associates each `useState`/`useEffect`/etc. call with its stored state purely by call *order*, not by name. If a hook call is conditionally skipped on some renders, every hook call after it shifts to a different internal slot than it had before, silently attaching state to the wrong hook with no error at the point of the mistake. `eslint-plugin-react-hooks` statically enforces this rule and should be treated as a non-optional part of any real React project's linting setup.

## Q: Class components vs. function components with hooks — what changed, and why does it matter historically?

Class components spread related logic across separate lifecycle methods (`componentDidMount`, `componentDidUpdate`, `componentWillUnmount`), so a single concern (like a subscription) often needed code duplicated across two or three of them. Sharing stateful logic between class components required patterns like higher-order components or render props, both of which added real nesting and indirection. Hooks let you colocate a whole concern's mount/update/cleanup logic in a single `useEffect`, and extract reusable stateful logic into a plain function (a custom hook) with no wrapper pattern required. Current React code is written with function components and hooks; class components and their lifecycle methods still matter to recognize since older, real production codebases use them — and error boundaries specifically still require a class component today, since there's no hook equivalent for `componentDidCatch`.

## Q: How does React actually decide to re-render a component?

A re-render happens specifically when a state setter is called (`useState`'s setter, `useReducer`'s `dispatch`) on that component, or its parent re-renders and this component isn't skipped by memoization. React does not "watch" plain variables or detect in-place mutation — that's exactly why mutating an array with `.push()` and then passing the same array reference to a state setter fails to trigger a re-render: React compares the new value to the old by reference, sees no change, and skips the update. The fix is always to create a new reference (`[...array, newItem]`) rather than mutating in place.

## Q: What's the actual difference between `useMemo` and `useCallback`?

`useCallback(fn, deps)` is functionally equivalent to `useMemo(() => fn, deps)` — `useCallback` memoizes a function reference itself, while `useMemo` memoizes the *return value* of a computation. Use `useCallback` when you need a stable function reference (passing a callback to a memoized child, or as another hook's dependency); use `useMemo` when you need a stable computed value (a sorted/filtered array, a derived object) without recomputing it every render.

## Q: Why is directly mutating state considered a real bug, not just a style preference?

React's `useState` setter and its re-render decisions rely on reference comparison — mutating an object or array in place doesn't produce a new reference, so calling the setter with the same (now-mutated) reference means React sees "no change" and may skip the re-render entirely, even though the underlying data did change. Beyond that immediate bug, mutating state directly breaks assumptions other parts of React rely on, like comparing previous and next props/state during reconciliation and (in development) `StrictMode`'s double-invocation checks designed specifically to help surface exactly this kind of impurity.
