# React — FAQ

## Is React a framework?

No — this is a common misconception with real practical consequences worth correcting directly. React is a UI library focused specifically on rendering components and managing state; it doesn't ship routing, a mandated project structure, or built-in data-fetching conventions the way a full framework does. In practice, that means using "plain" React means separately choosing a router (like React Router) and your own data-fetching approach — or adopting a meta-framework like Next.js (covered as its own technology later on this platform), which makes those choices for you on top of React. Knowing this distinction is exactly why a bare Vite+React app and a Next.js app can look structurally quite different despite both being "React."

## Do I need Redux to manage state in React?

No, not for most applications — and this platform frames that honestly rather than assuming Redux is a required default. `useState`, `useContext`, and `useReducer` — all built into React itself — cover a genuinely large amount of ground: local component state, values shared across many components at varying depths, and more complex state-transition logic, respectively. Redux (or similar external state libraries) earns its place specifically for large applications with complex, deeply cross-cutting state that many unrelated parts of the app need to read and update in coordinated ways — it's a real tool for a real problem at scale, not a mandatory starting point for a typical app.

## Why doesn't my component re-render when I update an array or object in state?

Because you likely mutated it in place (`.push()`, direct property assignment) and then passed the same reference back to the state setter. React's re-render decision compares the new state value to the old one by reference, not by deep value equality — an identical reference means React concludes nothing changed and skips the re-render, even though the contents are genuinely different now. The fix is always to create a new array/object reference when updating (`[...array, item]`, `{...obj, key: value}`) rather than mutating in place — see the Troubleshooting tab's Issue 5 for the full pattern.

## Why does React need a `key` prop on list items — isn't that just extra boilerplate?

It's not boilerplate — it's the actual identity signal React's reconciliation algorithm uses to match old and new elements across renders efficiently, rather than deep-comparing every element in a list. Without a stable key (or with an unstable one, like the array index on a reorderable list), React falls back to matching by position, which produces real, subtle bugs the moment a list is reordered or has items removed from the middle — component-local state or DOM state ending up attached to the wrong underlying data. It's a required part of how the diffing algorithm works correctly, not a stylistic convention.

## Should I use `useEffect` for everything that "reacts" to a state change?

No — this is a genuinely common overuse pattern worth flagging explicitly. `useEffect` is specifically for synchronizing with something *outside* React's own rendering (a network request, a subscription, manually touching the DOM, a timer). If you're computing a derived value purely from existing props/state (a filtered list, a formatted string, a total), just compute it directly during render — no `useEffect`, no extra state, no extra render cycle required. Reaching for `useEffect` to "respond" to a state change by setting *another* piece of state is a common anti-pattern that adds an unnecessary extra render and a real risk of the exact stale-closure and infinite-loop bugs covered in the Troubleshooting tab.

## Is TypeScript required to use React well?

No — React works completely fine in plain JavaScript, and that's how this course's Fundamentals through Advanced material is written throughout (see the Prerequisites tab). TypeScript adds static type-checking for props and state, which is genuinely valuable on larger codebases and is very common in real production React work, but it's an addition on top of React, not a requirement of React itself. Learn the React concepts in plain JS first; TypeScript's specific interplay with JSX (typing props, typing hook return values) is a layer you can add once the underlying React model is solid.

## Why is my `useEffect` running twice in development, even with an empty dependency array?

This is almost certainly `<StrictMode>` (see the Installation tab), not a bug in your code. In development only, `StrictMode` intentionally double-invokes some functions — including mounting a component, running its effects, then unmounting and remounting it once more — specifically to help surface effects and components that aren't properly resilient to being mounted/cleaned up/remounted (a real, common source of bugs if unnoticed). This double-invocation does **not** happen in a production build; if your effect breaks under it, the fix is making the effect's cleanup function correctly undo whatever the effect itself does, not removing `StrictMode`.

## What's the actual difference between props and state?

Props are data passed *into* a component from its parent — a component itself never modifies its own props, by contract; if a value needs to change in response to something the component itself does, that value belongs in state, not props. State is data a component owns and manages internally (via `useState` or similar), that can change over that component's lifetime and triggers a re-render when it does. A component reading its own state and a component reading props passed from a parent look similar in JSX, but the ownership and mutability rules are fundamentally different — this distinction is exactly what "lifting state up" (Intermediate tab) is built around.
