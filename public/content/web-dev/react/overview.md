# React

> **Describe the UI you want. Let React figure out how to get there.**

**Category:** Frontend / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need solid JavaScript — specifically functions, arrays/objects (and their common methods like `.map`/`.filter`), destructuring, and `async`/`await`. React is a JavaScript library, not a new language, and its examples assume you're already comfortable writing plain JS — this course does not re-teach the event loop or Promises. If any of that still feels shaky, this platform's own JavaScript technology is the right stop first. See the **Prerequisites** tab for the full detail.

---

## What is React?

Think of a React component as a recipe card, not a finished dish. Each card knows how to render itself given some ingredients (**props** — data passed in from outside) and can remember things between uses (**state** — data it manages internally, like a running total). You don't hand-decorate the dish yourself, step by step, every time an ingredient changes — you write the recipe once, and whenever the ingredients change, React re-runs the recipe and re-plates the dish for you.

Technically: React is a **UI library**, not a full framework — it renders components and manages state, but routing, data fetching conventions, and build tooling are separate choices you (or a meta-framework like Next.js, covered later on this platform) make on top of it. React is **component-based** (a UI is built from small, composable, independently-reusable pieces) and **declarative** (you describe *what* the UI should look like for a given state, not the step-by-step DOM mutations to get there — that's React's job).

The mechanism that makes this practical is the **Virtual DOM** — a lightweight in-memory representation of the UI. Rather than touching the real, expensive-to-update browser DOM directly every time something changes, React builds a new Virtual DOM tree, **diffs** it against the previous one (this comparison step is called **reconciliation**), and applies only the minimal set of real DOM changes needed. It's the same idea as a document editor's track-changes: it doesn't retype the whole page for one corrected word, it patches exactly what changed.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "State changes", "sublabel": "setState / a hook update", "color": "blue" },
    { "label": "Component re-renders", "sublabel": "Function runs again, returns new JSX", "color": "purple" },
    { "label": "Virtual DOM diff", "sublabel": "Reconciliation: compare new tree vs old tree", "color": "amber" },
    { "label": "Real DOM patch", "sublabel": "Only the minimal actual changes are applied", "color": "green" }
  ]
}
```

## Why React?

Before React (and libraries like it), keeping the DOM in sync with changing application state was done by hand — find the element, check what changed, mutate it, remember to undo that mutation somewhere else. That gets unmanageable fast: a shopping cart badge, a form's validation message, and a live search result list all changing independently means dozens of manual DOM-mutation call sites, each a place a bug can hide. React's declarative model sidesteps this entirely — you write `count is {count}` in your JSX, and every place `count` is used stays correct automatically whenever it changes, because React re-renders and reconciles for you. You describe the end state; React handles the diffing.

React is still dominant despite real alternatives (Vue, Svelte, Angular) for reasons beyond technical merit: the largest job market and hiring demand of any frontend library, the largest ecosystem of libraries and community solutions to common problems, and — significantly for this platform's own curriculum — **Next.js**, one of the most widely used production frameworks for building real web apps, is built directly on top of React rather than being a separate ecosystem.

---

## Learning Modules

### Module 01 — Components, Props & JSX
*The building blocks: what a component actually is, and how to pass data into one*

**Topics covered:**

- JSX syntax and rules (one root element, `className` not `class`, `{}` for expressions) — 🟢 Beginner
- Function components — 🟢 Beginner
- Props — passing data down, read-only by contract — 🟢 Beginner
- Composing components together — 🟡 Intermediate

### Module 02 — State & the Hooks Model
*Giving a component memory, and the rules that make hooks work at all*

Hooks (`useState`, `useEffect`, and friends) are how a function component gets memory and lifecycle behavior without ever needing to be rewritten as a class. They only work correctly under one hard constraint: **always call hooks in the same order, every render** — never inside a conditional, loop, or early return. React tracks hook state by call *order*, not by name, so a hook call that's conditionally skipped on some renders desynchronizes every hook after it.

```conceptgrid
{
  "boxes": [
    { "title": "useState", "description": "Local component memory that persists across re-renders and triggers one when updated", "color": "blue" },
    { "title": "Call order matters", "description": "React matches hook calls to their state by position, render to render -- never call a hook conditionally", "color": "amber" },
    { "title": "Top level only", "description": "Hooks must be called at the top of a component or custom hook -- never inside if/for/nested functions", "color": "purple" },
    { "title": "One render = one pass", "description": "A state update schedules a NEW render; it does not mutate the current one in place", "color": "green" }
  ]
}
```

**Topics covered:**

- `useState` — reading and updating local state — 🟢 Beginner
- State updates are asynchronous/batched, not immediate — 🟡 Intermediate
- The Rules of Hooks (why call order matters) — 🟡 Intermediate
- Lifting state up to a shared parent — 🟡 Intermediate

### Module 03 — Effects, Data Fetching & Component Lifecycle
*Running code in response to a render, and cleaning up after yourself*

**Topics covered:**

- `useEffect` — what it's for and when it runs — 🟡 Intermediate
- Dependency arrays — the difference between `[]`, `[dep]`, and omitted entirely — 🟡 Intermediate
- Cleanup functions — canceling subscriptions/fetches on unmount — 🔴 Advanced
- Fetching data with `useEffect` (and its real limitations) — 🟡 Intermediate

---

## Production Example

```jsx
// Production Runbook — "this component re-renders on every keystroke
// anywhere on the page, not just when its own props change"

// Step 1: Confirm the symptom with React DevTools' Profiler — record
// a keystroke in an unrelated input, and check the flame graph for
// components that re-rendered despite unchanged props.
// If a component you didn't expect lights up, the parent above it
// is very likely re-rendering and creating brand-new prop values
// (new object/array/function references) on every render.

// Step 2: Reproduce minimally
function Parent() {
  const [text, setText] = useState("");
  // BUG: this object literal is a NEW reference every single render
  const config = { theme: "dark" };

  return (
    <div>
      <input value={text} onChange={(e) => setText(e.target.value)} />
      <ExpensiveChart config={config} />
    </div>
  );
}

// Step 3: Diagnose -- React.memo on ExpensiveChart does a shallow
// prop comparison. { theme: "dark" } !== { theme: "dark" } by
// reference, even though the values are identical -- so memo never
// blocks the re-render, defeating the whole point of memoizing it.

// Step 4: Fix -- stabilize the reference with useMemo, and wrap the
// child in React.memo so a stable reference actually has an effect
function Parent() {
  const [text, setText] = useState("");
  const config = useMemo(() => ({ theme: "dark" }), []); // stable ref

  return (
    <div>
      <input value={text} onChange={(e) => setText(e.target.value)} />
      <ExpensiveChart config={config} />
    </div>
  );
}
const ExpensiveChart = React.memo(function ExpensiveChart({ config }) {
  // now only re-renders when `config` actually changes
  return <div>{/* expensive render work */}</div>;
});

// Step 5: Verify -- re-profile. ExpensiveChart should no longer
// light up on unrelated keystrokes in the sibling input.

// Step 6: Prevention -- useMemo/useCallback are NOT a default habit
// for every value (see Advanced tab) -- reach for them specifically
// when a stable reference is what unblocks a memoized child, not
// as a blanket "wrap everything" rule.
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is React, and is it a framework?**

**A:** **Problem:** interviewers use this to check whether you actually understand React's scope, not just that you can use it. **Solution:** React is a UI library focused specifically on rendering components and managing state via a Virtual DOM — it does not ship routing, a fixed project structure, or opinionated data-fetching conventions the way a full framework (Angular, or a meta-framework like Next.js built on top of React) does. **Result:** using "plain" React means you separately choose a router (React Router) and a data-fetching approach yourself, or you adopt a framework like Next.js that makes those choices for you — knowing this distinction is exactly what lets you explain why a React app and a Next.js app can look structurally quite different.

---

**Q2. Explain the Virtual DOM and reconciliation. Why does this make React fast?**

**A:** **Problem:** directly mutating the real browser DOM is comparatively expensive — layout recalculation and repainting cost real time. **Solution:** React keeps a lightweight in-memory Virtual DOM tree. On a state change, it builds a new tree, diffs it against the previous one (reconciliation), and computes the minimal set of real DOM operations needed to reflect the difference — then applies only those. **Result:** this is why React avoids rewriting the entire visible page for a small change — a single character typed into one input patches exactly that text node, not the surrounding UI.

---

**Q3. Why do list items need a stable `key` prop, specifically?**

**A:** **Problem:** without a stable identity per item, React's diffing algorithm has no reliable way to tell "this is the same item, moved" apart from "this item was removed and a different one was added" — it falls back to comparing by position. **Solution:** a stable, unique `key` (typically an ID from your data, never the array index for a reorderable/mutable list) lets React's reconciliation match old and new elements by identity across renders, reusing DOM nodes and component state correctly instead of tearing them down and recreating them. **Result:** get this wrong (index-as-key on a reorderable list) and you get subtle, hard-to-spot bugs — component-local state or form input values that end up attached to the wrong row after a reorder or deletion.

---

**Q4. Controlled vs. uncontrolled form components — what's the actual difference?**

**A:** **Problem:** form inputs need to hold their own value somewhere, and React gives you two genuinely different places to keep it. **Solution:** a **controlled** input's value is driven entirely by React state (`value={state}` + `onChange` updates that state) — React is the single source of truth. An **uncontrolled** input manages its own value internally in the DOM, and you read it out on demand via a `ref` instead of tracking every keystroke in state. **Result:** controlled is the default choice when you need the value live (validation as you type, conditionally disabling a submit button); uncontrolled is a reasonable, lighter-weight choice for a simple form you only read on submit.

---

**Q5. What's the point of the `useEffect` dependency array, and what happens if you get it wrong?**

**A:** **Problem:** an effect needs to know when to actually re-run — every render would be wasteful and often wrong, never would leave it stale. **Solution:** the dependency array tells React "only re-run this effect when one of these values has changed since the last render"; `[]` means run once on mount only, omitting the array entirely means run after every render. **Result:** a missing dependency is a genuinely common, real bug class — an effect that reads a piece of state but doesn't list it as a dependency captures a stale value from whichever render defined the closure (see the Troubleshooting tab), and an effect that fetches data with a missing dependency can loop or fetch stale data silently.

---

**Q6. When would you actually reach for `useMemo` or `useCallback` — and when are they not worth it?**

**A:** **Problem:** these hooks are commonly over-used as a default habit, adding real complexity (and a small memoization cost of their own) for no measurable benefit. **Solution:** they're worth it specifically when a value/function is expensive to recompute, or when a *stable reference* is what unblocks a `React.memo`-wrapped child from skipping unnecessary re-renders (see the Production Example above). **Result:** for a cheap computation or a component with no memoized children depending on referential stability, wrapping everything in `useMemo`/`useCallback` by default adds cognitive overhead without a measurable win — profile first, memoize deliberately, not reflexively.

---

**Q7. What are the Rules of Hooks, and why do they exist?**

**A:** **Problem:** hooks need some way to reliably associate a piece of state with the *same* `useState` call across many re-renders, without you giving each one an explicit name. **Solution:** React does this by call *order* — the Nth hook call in a component is always matched to the Nth slot in that component's internal state list, render after render. This is exactly why hooks must be called unconditionally, at the top level, in the same order every time — never inside an `if`, a loop, or after an early `return`. **Result:** break this rule (a conditional `useState`) and hook slots desync between renders — state gets silently attached to the wrong hook call, producing genuinely confusing bugs that look unrelated to the actual cause.

---

**Q8. Class components vs. function components with hooks — why did the ecosystem move?**

**A:** **Problem:** class components required scattering related logic across multiple lifecycle methods (`componentDidMount`, `componentDidUpdate`, `componentWillUnmount` might all touch the same subscription) and made sharing stateful logic between components awkward (render props, higher-order components — both added real nesting/complexity). **Solution:** hooks let you colocate related logic in one function (a `useEffect` handles mount, update, *and* cleanup for the same concern together) and extract reusable stateful logic into a plain custom hook function, no special pattern required. **Result:** function components with hooks are the standard in current React code — worth knowing the historical class syntax exists (you'll still see it in older codebases), but new code is written with hooks.

---

**Q9. How does a component actually know to re-render?**

**A:** **Problem:** it's a common misconception that React "watches" your variables. **Solution:** it doesn't — a re-render is triggered specifically by calling a state setter (`useState`'s setter, `useReducer`'s `dispatch`) or by a parent re-rendering and passing new props down; mutating a plain variable or an object in place does nothing, because React has no way to observe that. **Result:** this is exactly why `array.push(item)` followed by `setArray(array)` (same reference) famously fails to re-render — React compares the *reference*, sees no change, and skips the update; the fix is always to create a new array/object (`setArray([...array, item])`).

---

**Q10. What is your experience actually building something with React?**

**A:** This is a genuinely personal question — answer with a real project using the Problem → Solution → Result structure: what you built, a specific technical decision you made (state management approach, why you lifted state to a particular level, a performance issue you actually diagnosed), and the outcome. Interviewers are listening for whether you've built something real, not recited definitions.

---

## Official Resources

- [react.dev — Official React Documentation](https://react.dev/)
- [react.dev — Learn React](https://react.dev/learn)
- [react.dev — API Reference](https://react.dev/reference/react)

## Try It (2 Minutes)

Open [react.dev/learn](https://react.dev/learn) or any local Vite+React project (see the **Installation** tab), and drop this into a component file:

```jsx
import { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <button onClick={() => setCount(count + 1)}>
      Clicked {count} time{count !== 1 ? "s" : ""}
    </button>
  );
}

export default Counter;
```

Render it and click the button a few times. Notice you never wrote a single line of DOM manipulation — no `document.querySelector`, no manual text update. You described *what* the button should say for a given `count`, and React handled turning that description into real DOM changes every time `count` changed. That's the entire declarative model in one component.
