# React Troubleshooting Guide

## Issue 1: Infinite re-render loop from a `useEffect` dependency

**Symptom:** The browser tab freezes or the console floods with repeated log lines; React eventually throws "Too many re-renders."

**Root Cause:** An effect updates state that's also (directly or indirectly) one of its own dependencies, with no condition to stop it — or the dependency array contains a new object/array/function literal created fresh on every render, so the effect "sees" a changed dependency every single time even though nothing meaningful actually changed.

**Debug steps:**
```jsx
// Reproduce minimally
useEffect(() => {
  setConfig({ theme: "dark" }); // creates a NEW object reference every render
}, [config]); // config "changes" (by reference) every render -> loops forever
```
```bash
# React DevTools Profiler: record a session, watch for the same
# component committing repeatedly with no user interaction between commits
```

**Fix patterns:**
```jsx
// Fix 1: don't put the value the effect sets INTO its own dependency array
useEffect(() => {
  setConfig((prev) => ({ ...prev, theme: "dark" }));
}, []); // runs once; functional update form avoids needing `config` as a dep

// Fix 2: memoize an object/array dependency so its reference is stable
const options = useMemo(() => ({ theme: "dark" }), []);
useEffect(() => {
  doSomething(options);
}, [options]);
```

---

## Issue 2: "Cannot update state on an unmounted component" warning

**Symptom:** A console warning after navigating away from a page while a fetch was still in flight, or after a component unmounts before an async operation resolves.

**Root Cause:** An async callback (a `.then()`, a `setTimeout`) calls a state setter after the component that scheduled it has already unmounted — React can't apply a state update to a component instance that no longer exists.

**Debug steps:**
```jsx
useEffect(() => {
  fetch("/api/data")
    .then((res) => res.json())
    .then((data) => setData(data)); // fires even if component unmounted mid-fetch
}, []);
```
```bash
# Reproduce: navigate away from the page quickly, right after triggering
# the fetch, before it has time to resolve. Watch the console.
```

**Fix patterns:**
```jsx
// Fix: a cancellation flag set in the cleanup function
useEffect(() => {
  let cancelled = false;
  fetch("/api/data")
    .then((res) => res.json())
    .then((data) => {
      if (!cancelled) setData(data);
    });
  return () => { cancelled = true; };
}, []);

// Alternative: AbortController, which also actually cancels the network request
useEffect(() => {
  const controller = new AbortController();
  fetch("/api/data", { signal: controller.signal })
    .then((res) => res.json())
    .then((data) => setData(data))
    .catch((err) => { if (err.name !== "AbortError") throw err; });
  return () => controller.abort();
}, []);
```

---

## Issue 3: Stale closure capturing an old state value

**Symptom:** A `setInterval`, event handler, or `useEffect` callback keeps using an outdated value of a state variable, even though the state has since updated.

**Root Cause:** A closure captures the value of a variable *at the time the function was created* — if that function isn't recreated on the render where the state changed (a missing dependency, or a `setInterval` set up once via `[]`), it keeps referencing the old value forever.

**Debug steps:**
```jsx
function Counter() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const id = setInterval(() => {
      console.log(count); // ALWAYS logs 0 -- closed over count from the
                           // first render, since this effect never re-runs
    }, 1000);
    return () => clearInterval(id);
  }, []); // empty deps -- this closure is frozen at count === 0 forever
}
```

**Fix patterns:**
```jsx
// Fix 1: functional update form -- doesn't need count in the closure at all
useEffect(() => {
  const id = setInterval(() => {
    setCount((prev) => prev + 1); // reads the LATEST state, not a closed-over value
  }, 1000);
  return () => clearInterval(id);
}, []);

// Fix 2: if you genuinely need the current value inside the effect, add it
// as a dependency -- this recreates the interval each time count changes,
// which resets timing (a real behavioral tradeoff to be aware of)
useEffect(() => {
  const id = setInterval(() => console.log(count), 1000);
  return () => clearInterval(id);
}, [count]);
```

---

## Issue 4: List items behaving oddly because of missing/index-based keys

**Symptom:** After deleting or reordering items in a list, the wrong item's input value, checkbox state, or "editing" toggle appears attached to a different row than expected.

**Root Cause:** Using the array index as `key` on a list that can reorder or have items removed — React matches elements by key across renders, and when index is the key, a shift in position (from a deletion above it) makes React believe the item at that position is the same one it rendered before, reusing its component state for what is now different underlying data.

**Debug steps:**
```jsx
// Reproduce: render a list with local per-item state, using index as key
{items.map((item, index) => (
  <EditableRow key={index} item={item} />  // <- the actual bug
))}
// Delete the first item. Watch: the row that was previously SECOND
// now displays as first, but with the FIRST row's leftover local state.
```

**Fix patterns:**
```jsx
// Fix: a stable ID from the actual data, not position
{items.map((item) => (
  <EditableRow key={item.id} item={item} />
))}
// If the data genuinely has no ID, generate and store one when the
// item is created (crypto.randomUUID()) -- don't derive a key from
// position or from content that isn't guaranteed unique
```

---

## Issue 5: Component not re-rendering when state is mutated in place instead of replaced

**Symptom:** You call a state setter with what looks like updated data, but the UI doesn't change at all.

**Root Cause:** The setter was called with the *same object/array reference* that was mutated in place (`.push()`, direct property assignment) — React compares new state to old state by reference for its bail-out check, sees the reference is identical, and skips the re-render even though the contents technically changed.

**Debug steps:**
```jsx
function TodoList() {
  const [todos, setTodos] = useState([]);

  const addTodo = (text) => {
    todos.push({ id: crypto.randomUUID(), text }); // mutates in place
    setTodos(todos); // SAME reference -- React sees "no change", bails out
  };
}
```

**Fix patterns:**
```jsx
// Fix: always create a new array/object reference
const addTodo = (text) => {
  setTodos([...todos, { id: crypto.randomUUID(), text }]);
};

const updateTodo = (id, changes) => {
  setTodos(todos.map((t) => (t.id === id ? { ...t, ...changes } : t)));
};

const removeTodo = (id) => {
  setTodos(todos.filter((t) => t.id !== id));
};
```

---

## Prevention Tips

- Enable and actually heed `eslint-plugin-react-hooks`'s `exhaustive-deps` rule — most stale-closure and missing-dependency bugs above are caught statically before the code ever runs
- Never mutate state directly — always produce a new array/object reference (`[...arr]`, `{...obj}`, `.map`/`.filter`/`.filter`) when updating
- Never use array index as `key` for a list that can reorder, filter, or have items inserted/removed
- Add cleanup functions to any `useEffect` that starts an async operation, subscription, or timer
- Prefer the functional update form of a setter (`setCount(prev => prev + 1)`) inside effects, intervals, and callbacks — it sidesteps stale-closure bugs entirely by never needing to close over the current value
- Use React DevTools' Profiler to confirm a suspected performance or re-render issue before reaching for `useMemo`/`useCallback` speculatively
