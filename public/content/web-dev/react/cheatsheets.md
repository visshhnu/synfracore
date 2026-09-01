# React Quick Reference

## Hooks syntax

```jsx
// useState
const [value, setValue] = useState(initialValue);
setValue(newValue);
setValue((prev) => prev + 1); // functional update -- always current, avoids stale closures

// useEffect
useEffect(() => {
  // runs after render
  return () => {
    // cleanup: runs before next effect run, and on unmount
  };
}, [dep1, dep2]); // [] = once on mount | omitted = every render | [deps] = when deps change

// useContext
const MyContext = createContext(defaultValue);
<MyContext.Provider value={someValue}>{children}</MyContext.Provider>
const value = useContext(MyContext);

// useRef
const ref = useRef(initialValue);
ref.current // read/write without triggering a re-render
<input ref={ref} />

// useMemo / useCallback
const computed = useMemo(() => expensiveCalc(a, b), [a, b]);
const stableFn = useCallback((x) => doThing(x), [dep]);

// useReducer
const [state, dispatch] = useReducer(reducer, initialState);
dispatch({ type: "increment" });
function reducer(state, action) {
  switch (action.type) {
    case "increment": return { ...state, count: state.count + 1 };
    default: return state;
  }
}
```

## Conditional rendering patterns

```jsx
// Ternary -- both branches render something
{isOnline ? <span>🟢</span> : <span>⚪</span>}

// && short-circuit -- renders nothing if falsy (careful with 0 -- see gotcha below)
{count > 0 && <Badge count={count} />}

// GOTCHA: {count && <Badge />} renders the literal "0" if count is 0
// Always compare explicitly: {count > 0 && ...}

// Early return for a whole component
function Profile({ user }) {
  if (!user) return <p>Loading...</p>;
  return <p>{user.name}</p>;
}

// Switch-like pattern via object lookup
const statusViews = { loading: <Spinner />, error: <ErrorMsg />, success: <Content /> };
{statusViews[status]}
```

## List rendering patterns

```jsx
// Correct -- stable key from data
{items.map((item) => <Item key={item.id} {...item} />)}

// WRONG for mutable/reorderable lists -- index as key
{items.map((item, index) => <Item key={index} {...item} />)}

// Adding/removing/updating immutably
setItems([...items, newItem]);                          // add
setItems(items.filter((i) => i.id !== targetId));       // remove
setItems(items.map((i) => (i.id === targetId ? { ...i, ...changes } : i))); // update
```

## Form handling patterns

```jsx
// Controlled single input
const [value, setValue] = useState("");
<input value={value} onChange={(e) => setValue(e.target.value)} />

// Controlled multi-field form via one object
const [form, setForm] = useState({ email: "", password: "" });
const handleChange = (field) => (e) =>
  setForm((prev) => ({ ...prev, [field]: e.target.value }));
<input value={form.email} onChange={handleChange("email")} />
<input value={form.password} onChange={handleChange("password")} type="password" />

// Uncontrolled -- read on submit via ref
const inputRef = useRef(null);
const handleSubmit = (e) => {
  e.preventDefault();
  console.log(inputRef.current.value);
};
<form onSubmit={handleSubmit}><input ref={inputRef} /></form>

// Submit handling
<form onSubmit={(e) => { e.preventDefault(); /* submit logic */ }}>
```

## Data fetching with cleanup

```jsx
useEffect(() => {
  const controller = new AbortController();
  fetch(url, { signal: controller.signal })
    .then((res) => res.json())
    .then(setData)
    .catch((err) => { if (err.name !== "AbortError") console.error(err); });
  return () => controller.abort();
}, [url]);
```

## Component composition

```jsx
// children prop -- pass JSX into a component
function Card({ children }) { return <div className="card">{children}</div>; }
<Card><p>Content goes here</p></Card>

// Fragments -- group without an extra DOM node
<>
  <Header />
  <Main />
</>
```
