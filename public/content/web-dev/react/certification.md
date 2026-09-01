# React Certification Guide

## Certifications Available

React does not have one official, proctored certification issued directly by Meta (React's maintaining organization) the way some other technologies have a single authoritative vendor cert. What exists is a mix of course-completion certificates and third-party options:

| Cert / Program | Provider | Cost | Format |
|------|----------|------|--------|
| **Meta Front-End Developer Professional Certificate** | Meta, via Coursera | Coursera subscription-based `(needs verification — confirm current pricing/format on Coursera's listing)` | Self-paced, multi-course, includes React modules and a completion certificate, not a standalone proctored exam |
| **Various third-party "React Certification" courses** (Udemy, freeCodeCamp-style, bootcamp-issued) | Various | Varies widely | Course-completion certificates, not proctored/standardized exams `(needs verification — quality and industry recognition vary significantly by provider; verify before treating any one as equivalent to a standardized credential)` |

**The honest framing:** for React specifically, a strong portfolio (see the Projects tab) and the ability to speak fluently about reconciliation, hooks, and real debugging experience in an interview typically carries more weight with hiring teams than any completion certificate — there is no single widely-recognized "you passed the React exam" credential the way there is for, say, a cloud platform's official certification track. Treat the table above as options to be aware of, not a required step.

---

## Core Topics

```jsx
// Hooks quick reference
const [state, setState] = useState(initialValue);
useEffect(() => { /* effect */ return () => { /* cleanup */ }; }, [deps]);
const value = useContext(SomeContext);
const ref = useRef(initialValue);
const memoized = useMemo(() => computeExpensive(a, b), [a, b]);
const stableFn = useCallback((x) => doSomething(x, a), [a]);
const [state, dispatch] = useReducer(reducerFn, initialState);

// Composing components
function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Layout>
        <Sidebar />
        <MainContent />
      </Layout>
    </ThemeContext.Provider>
  );
}

// Conditional rendering patterns
{isLoggedIn ? <Dashboard /> : <LoginForm />}
{items.length > 0 && <ItemList items={items} />}
{status === "loading" && <Spinner />}
{status === "error" && <ErrorMessage />}

// List rendering with a stable key
{items.map((item) => <Item key={item.id} {...item} />)}

// Error boundary (must be a class component)
class ErrorBoundary extends React.Component {
  state = { hasError: false };
  static getDerivedStateFromError() { return { hasError: true }; }
  componentDidCatch(error, info) { console.error(error, info); }
  render() {
    return this.state.hasError ? <Fallback /> : this.props.children;
  }
}

// Code splitting with Suspense
const Settings = React.lazy(() => import("./Settings"));
<Suspense fallback={<Spinner />}>
  <Settings />
</Suspense>

// Custom hook pattern
function useDebounce(value, delayMs) {
  const [debounced, setDebounced] = useState(value);
  useEffect(() => {
    const id = setTimeout(() => setDebounced(value), delayMs);
    return () => clearTimeout(id);
  }, [value, delayMs]);
  return debounced;
}
```

```bash
# Vite quickstart (see Installation for full detail)
npm create vite@latest my-app -- --template react
cd my-app && npm install && npm run dev
```

---

## Study Resources

- **react.dev** — the official documentation, genuinely comprehensive and the primary source of truth
- **React DevTools** (browser extension) — Components and Profiler tabs, essential for real debugging practice
- **This platform's Projects tab** — three graded-difficulty projects that exercise the exact concepts covered here
- **This platform's Interview tab** — dedicated Q&A covering the questions that come up most consistently in real React interviews

## Revision Notes

```
REACT CORE: Component-based | Declarative | Virtual DOM + reconciliation | One-way data flow
JSX: className not class | {} for expressions | one root element | self-closing tags

HOOKS: useState (memory) | useEffect (side effects) | useContext (avoid prop drilling)
       useRef (DOM access / non-rendering mutable value) | useMemo/useCallback (stable refs, deliberate)
RULES OF HOOKS: top-level only, same order every render -- React matches state by CALL ORDER

KEYS: stable ID from data, NEVER array index on a reorderable/mutable list
STATE: never mutate in place -- always new array/object reference, or React skips the re-render

CONTROLLED INPUT: React state is the source of truth (value + onChange)
UNCONTROLLED INPUT: DOM owns the value, read via ref on demand

ERROR BOUNDARIES: must be class components (no hook equivalent for componentDidCatch)
SUSPENSE + lazy: code splitting -- load a chunk only when needed
```
