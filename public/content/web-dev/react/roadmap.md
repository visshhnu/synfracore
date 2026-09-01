# React — Learning Roadmap

## Estimated Time to Job-Ready

**5-8 weeks** of consistent learning (2-3 hours/day), assuming solid JavaScript fundamentals already in place (see Prerequisites) — React-specific material (components, hooks, reconciliation) builds directly on that rather than re-teaching JavaScript itself.

## Phase 1: Components, Props & JSX (Week 1)

- Set up a Vite React project and React DevTools (see Installation)
- JSX rules — one root element, `className`, `{}` expressions, self-closing tags
- Function components, props, and composing components together
- Rendering a list with `.map()` and understanding *why* `key` is required

**Checkpoint:** can you explain, without looking it up, why `<button onClick={handleClick()}>` is a bug while `<button onClick={handleClick}>` is correct?

## Phase 2: State, Hooks & Effects (Week 2-3)

- `useState` — reading, updating, and understanding that updates are not immediate within the same render
- Event handling and conditional rendering patterns
- `useEffect` basics — dependency arrays, and what `[]` vs. omitted actually means
- Build a small interactive project (a todo list with add/delete/toggle) using only what's covered so far

**Checkpoint:** given a `useEffect` with a fetch call inside it and an empty dependency array, can you explain exactly when it runs and why it won't re-run if a prop it uses later changes?

## Phase 3: Intermediate Patterns (Week 4-5)

- Lifting state up between sibling components
- `useContext` for values genuinely needed across many depths (theme, current user) — and recognizing when it's the wrong tool for state shared by just two nearby components
- `useRef` for DOM access and non-rendering mutable values
- Custom hooks — extracting and reusing stateful logic
- Controlled vs. uncontrolled form inputs
- Data fetching with proper `useEffect` cleanup (the cancellation-flag pattern)

**Checkpoint:** can you explain the specific bug that occurs when a reorderable list uses the array index as its `key`, and why using a stable ID from the data fixes it?

## Phase 4: Advanced & Interview Readiness (Week 6-8)

- Reconciliation in depth — why keys are the literal identity signal the diffing algorithm uses, not just an API requirement
- `useMemo`/`useCallback` — profiling first, memoizing deliberately rather than reflexively
- Error boundaries and Suspense/lazy loading for code splitting
- The Rules of Hooks — the call-order mechanism behind them, not just "don't call hooks conditionally" as a rule to memorize
- Review this course's Interview Q&A material and rehearse explaining reconciliation, keys, and the dependency array out loud

## Common Pitfalls Specific to React (Not Generic Study Advice)

- **Using array index as `key` on any list that can reorder or have items removed** — this silently misattributes component identity across renders; see Intermediate/Advanced for the exact mechanism
- **Missing or wrong `useEffect` dependencies** — a genuinely common real bug class covered in depth in Troubleshooting (stale closures, infinite fetch loops)
- **Mutating state directly** (`array.push(item)` then calling the setter with the same reference) instead of creating a new array/object — React compares by reference and won't detect the change
- **Reaching for `useMemo`/`useCallback` as a default habit** rather than after actually profiling — adds real complexity for often-negligible gains

## Getting Your First React-Heavy Role

1. **Portfolio:** 2-3 projects that show real React patterns — proper state lifting, custom hooks, controlled forms, and at least one project consuming a real API with loading/error states (see Projects tab) — not just static UI clones
2. **Resume:** be specific — "built a custom `useDebounce` hook to cut API calls on a live search by 80%" is far stronger than "experience with React"
3. **Know what's beyond bare React:** at minimum, be aware that Next.js is where most production React apps actually get built (routing, SSR) — this platform covers it as its own technology next
4. **Interview prep:** reconciliation, keys, and the `useEffect` dependency array come up constantly precisely because they separate real hands-on experience from copy-pasted tutorial familiarity
