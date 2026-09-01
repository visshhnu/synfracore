# React — Intermediate

## Lifting state up

When two sibling components need to share or coordinate on the same piece of state, the fix is not to duplicate that state in both — it's to move ("lift") the state to their nearest common parent, and pass it down as props to both.

```jsx
function App() {
  const [selectedId, setSelectedId] = useState(null); // lifted here -- shared by both children

  return (
    <>
      <ItemList selectedId={selectedId} onSelect={setSelectedId} />
      <ItemDetail selectedId={selectedId} />
    </>
  );
}
```

`ItemList` and `ItemDetail` never talk to each other directly — they both talk to `App`, which owns the single source of truth. This is React's core data-flow pattern: state lives as high as it needs to for everyone who needs it, and flows down; changes flow back up through callback props (`onSelect` here).

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "ItemList: user clicks", "sublabel": "calls onSelect(id) prop", "color": "blue" },
    { "label": "App: setSelectedId(id)", "sublabel": "state lives in the shared parent", "color": "purple" },
    { "label": "App re-renders", "sublabel": "passes new selectedId down as props", "color": "amber" },
    { "label": "ItemList AND ItemDetail update", "sublabel": "both siblings stay in sync", "color": "green" }
  ]
}
```

## Context (`useContext`) — avoiding prop drilling

Lifting state up works cleanly for two or three levels. Beyond that, passing a prop down through five intermediate components that don't themselves use it — just to reach a deeply nested child — is **prop drilling**, and it's a real maintenance cost: every intermediate component's signature is polluted with a prop it doesn't care about.

```jsx
const ThemeContext = createContext("light"); // "light" is the default value

function App() {
  const [theme, setTheme] = useState("dark");
  return (
    <ThemeContext.Provider value={theme}>
      <Toolbar /> {/* no theme prop passed here at all */}
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  return <ThemedButton />; // still doesn't touch theme
}

function ThemedButton() {
  const theme = useContext(ThemeContext); // reads it directly, however deep it is
  return <button className={theme}>Click</button>;
}
```

Context is not a general-purpose state management replacement — it's specifically for values that genuinely need to be read by many components at varying depths (theme, current authenticated user, locale). Overusing it for state that's really only shared by two nearby components just trades one problem (prop drilling) for another (harder-to-trace data flow, since any consumer anywhere can read it without an explicit prop showing the connection).

## `useRef`

`useRef` gives you a mutable container (`{ current: ... }`) that persists across renders **without triggering a re-render when it changes** — the opposite behavior of `useState`. Two common uses:

```jsx
// 1. Direct access to a DOM node
function TextInput() {
  const inputRef = useRef(null);
  useEffect(() => {
    inputRef.current.focus(); // imperatively focus on mount
  }, []);
  return <input ref={inputRef} />;
}

// 2. Storing a mutable value that shouldn't cause a re-render when it changes
function Timer() {
  const intervalRef = useRef(null);
  const start = () => {
    intervalRef.current = setInterval(() => console.log("tick"), 1000);
  };
  const stop = () => clearInterval(intervalRef.current);
  return (
    <>
      <button onClick={start}>Start</button>
      <button onClick={stop}>Stop</button>
    </>
  );
}
```

If you find yourself reading a ref's `.current` value and displaying it in JSX, that's a strong signal it should have been `useState` instead — a ref update is invisible to React's render cycle by design.

## Custom hooks

A custom hook is just a plain function whose name starts with `use` and that calls other hooks internally — it's how you extract and reuse stateful logic between components, without a wrapper component or render-prop pattern.

```jsx
function useLocalStorage(key, initialValue) {
  const [value, setValue] = useState(() => {
    const stored = localStorage.getItem(key);
    return stored ? JSON.parse(stored) : initialValue;
  });

  useEffect(() => {
    localStorage.setItem(key, JSON.stringify(value));
  }, [key, value]);

  return [value, setValue];
}

// Used exactly like useState, in any component:
function Notes() {
  const [notes, setNotes] = useLocalStorage("notes", "");
  return <textarea value={notes} onChange={(e) => setNotes(e.target.value)} />;
}
```

The Rules of Hooks (top-level calls only, same order every render) apply just as strictly inside a custom hook as inside a component — a custom hook is not a special case, it's just a function that happens to call other hooks.

## Controlled vs. uncontrolled form inputs

```jsx
// Controlled -- React state is the single source of truth for the value
function ControlledInput() {
  const [value, setValue] = useState("");
  return <input value={value} onChange={(e) => setValue(e.target.value)} />;
}

// Uncontrolled -- the DOM owns the value; you read it out on demand via a ref
function UncontrolledInput() {
  const inputRef = useRef(null);
  const handleSubmit = () => console.log(inputRef.current.value);
  return (
    <>
      <input ref={inputRef} defaultValue="" />
      <button onClick={handleSubmit}>Submit</button>
    </>
  );
}
```

Controlled is the default for anything that needs live validation, conditional UI based on the current value, or formatting-as-you-type. Uncontrolled is a reasonable, lighter choice for a simple form read only at submit time — fewer re-renders, since React isn't re-rendering on every keystroke.

## List rendering performance: keys done right vs. wrong

```jsx
// WRONG for a reorderable/mutable list -- index as key
{todos.map((todo, index) => (
  <TodoItem key={index} todo={todo} />
))}
// If todo[0] is deleted, every remaining item shifts up one index.
// React now thinks item at index 0 is a DIFFERENT todo with the SAME
// key it had before -- it reuses that DOM node/component state for
// the wrong underlying data. Any local state inside TodoItem (an
// "editing" toggle, for instance) ends up attached to the wrong row.

// RIGHT -- a stable ID from the actual data
{todos.map((todo) => (
  <TodoItem key={todo.id} todo={todo} />
))}
// Deleting todo[0] now correctly removes exactly that component;
// every other item keeps its own identity and local state intact.
```

Index-as-key is fine *only* when the list is static — never reordered, filtered, or mutated by insertion/deletion. The moment a list can change shape, it needs real stable keys.

## Fetching data with `useEffect` and cleanup

A `useEffect` that starts an async operation needs a way to cancel or ignore it if the component unmounts (or the effect re-runs) before it finishes — otherwise you risk calling a state setter on a component that's no longer there.

```jsx
function UserProfile({ userId }) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    let cancelled = false;

    fetch(`/api/users/${userId}`)
      .then((res) => res.json())
      .then((data) => {
        if (!cancelled) setUser(data); // guard against a stale response
      });

    return () => {
      cancelled = true; // cleanup: runs before the next effect, and on unmount
    };
  }, [userId]);

  if (!user) return <p>Loading...</p>;
  return <p>{user.name}</p>;
}
```

The function returned from `useEffect` is the **cleanup function** — React calls it right before the effect runs again (if a dependency changed) and one final time when the component unmounts. Without it here, switching `userId` quickly (or navigating away mid-fetch) can let an old, now-irrelevant response overwrite newer state — the exact race condition covered in the Troubleshooting tab's "Cannot update state on an unmounted component" issue.
