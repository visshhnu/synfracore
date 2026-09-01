# React — Fundamentals

## JSX syntax and rules

JSX looks like HTML embedded in JavaScript, but it's actually syntax sugar — each JSX element compiles down to a plain `React.createElement(...)` function call. That's why its rules differ from real HTML in a few specific, deliberate ways:

```jsx
function Profile() {
  return (
    <div className="profile">   {/* className, not class -- "class" is a reserved JS word */}
      <h2>Alice</h2>
      <p>Age: {25 + 5}</p>       {/* {} embeds any JS expression directly */}
    </div>
  );
}
```

- **One root element per return** — wrap multiple top-level elements in a single parent, or use a fragment (`<>...</>`) if you don't want an extra DOM node.
- **`className` instead of `class`**, `htmlFor` instead of `for`** — both are reserved words in JavaScript.
- **`{}` embeds a JavaScript expression** — a variable, a function call, a ternary — but not a statement (no `if`, no `for` directly inside `{}`).
- **Every tag must close** — `<img />`, `<br />`, not the bare HTML versions.

## Components and props

A component is just a JavaScript function that returns JSX. Data flows into it through **props** — a single object argument, conventionally destructured:

```jsx
function Greeting({ name, isVip }) {
  return (
    <p>
      Hello, {name}{isVip ? " — welcome back!" : "."}
    </p>
  );
}

// Used like this -- props are passed the same way HTML attributes are written
<Greeting name="Alice" isVip={true} />
```

Props are **read-only by contract** — a component must never reassign or mutate the props object it receives. If a component needs to change something in response to user interaction, that value needs to live in **state** instead (next section), owned by whichever component is responsible for it.

## `useState` — giving a component memory

A plain JavaScript variable inside a function component resets every time the component re-renders — it has no memory. `useState` is what gives a component a value that persists across renders *and* triggers a re-render whenever it's updated:

```jsx
import { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0); // 0 is the initial value

  return (
    <button onClick={() => setCount(count + 1)}>
      Count: {count}
    </button>
  );
}
```

`useState` returns a pair: the current value, and a setter function. Calling the setter does two things — it updates the stored value, *and* it schedules a re-render of that component so the new value actually shows up on screen. Calling `setCount` does **not** update `count` immediately in the currently-running function — the new value is only visible on the *next* render.

```conceptgrid
{
  "boxes": [
    { "title": "Plain variable", "description": "Resets to its initial value on every render -- has no memory across renders", "color": "slate" },
    { "title": "useState value", "description": "Persists across renders. Updating it via the setter schedules a NEW render", "color": "blue" },
    { "title": "Setter call", "description": "Does not change the current render's value in place -- the update is visible starting next render", "color": "amber" },
    { "title": "Re-render", "description": "Component function runs again top to bottom, returning fresh JSX with the new value", "color": "green" }
  ]
}
```

## Rendering lists with keys

Rendering a list of components from an array uses `.map()` — plain JavaScript, no special React list syntax:

```jsx
function TodoList({ todos }) {
  return (
    <ul>
      {todos.map((todo) => (
        <li key={todo.id}>{todo.text}</li>
      ))}
    </ul>
  );
}
```

The `key` prop is required and must be a **stable, unique identifier** — an ID from your actual data, not the array index (for any list that can be reordered, filtered, or have items inserted/removed — see Intermediate for exactly why index-as-key breaks). React uses `key` to match list items across renders during reconciliation, so it can tell "this is the same item" from "this is a different item that happens to be in the same position."

## Event handling

Event handlers are passed as functions, not strings — this is a real, common beginner mistake worth calling out directly:

```jsx
// WRONG -- this calls handleClick immediately during render, not on click
<button onClick={handleClick()}>Click me</button>

// RIGHT -- pass the function itself; React calls it when the event fires
<button onClick={handleClick}>Click me</button>

// RIGHT -- an inline arrow function if you need to pass arguments
<button onClick={() => handleClick(todo.id)}>Delete</button>
```

React wraps native browser events in a **SyntheticEvent** — a cross-browser-consistent wrapper — but you use it the same way you'd use a native event (`e.target.value`, `e.preventDefault()`).

## Conditional rendering

No special syntax — JSX is just JavaScript, so ordinary JavaScript conditionals work directly inside `{}`:

```jsx
function StatusBadge({ isOnline }) {
  return (
    <span>
      {isOnline ? "🟢 Online" : "⚪ Offline"}
    </span>
  );
}

function Notification({ count }) {
  return (
    <div>
      {count > 0 && <span className="badge">{count} new</span>}
      {/* if count is 0, `count > 0 && ...` evaluates to false, renders nothing */}
    </div>
  );
}
```

One real gotcha: `{count && <span>...</span>}` renders the literal number `0` (not nothing) if `count` is `0`, because `0` is a valid, renderable value in JSX — use `count > 0 && ...` or a ternary to avoid it.

## `useEffect` basics

`useEffect` runs code in response to a render — the standard place for anything that reaches outside React itself: fetching data, setting up a subscription, manually touching the DOM.

```jsx
import { useState, useEffect } from "react";

function UserProfile({ userId }) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch(`/api/users/${userId}`)
      .then((res) => res.json())
      .then((data) => setUser(data));
  }, [userId]); // re-run only when userId changes

  if (!user) return <p>Loading...</p>;
  return <p>{user.name}</p>;
}
```

The second argument — the **dependency array** — controls when the effect re-runs: `[]` means "once, after the first render only"; `[userId]` means "whenever `userId` changes"; omitting it entirely means "after every single render" (rarely what you want). This gets substantially more nuanced in Intermediate (cleanup functions) and is a common source of real bugs covered in depth in Troubleshooting.

## Try it (2 minutes)

In a Vite React project (see Installation), replace `App.jsx`'s content with a small list renderer using everything above:

```jsx
import { useState } from "react";

function App() {
  const [items, setItems] = useState(["Learn JSX", "Learn useState"]);

  return (
    <ul>
      {items.map((item, i) => (
        <li key={i}>{item}</li>
      ))}
    </ul>
  );
}

export default App;
```

Then add a button that appends a new item to `items` using the setter — and notice the list updates on screen the instant you call it, with no manual DOM code anywhere.
