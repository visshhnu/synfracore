# React — Portfolio Projects

## Project 1

**Level:** Beginner · **Time:** 4-6 hours · **GitHub repo name suggestion:** `react-todo-persist`

**What you build:** A todo app with add/toggle-complete/delete, persisted to `localStorage` so the list survives a page reload — the smallest project that still exercises `useState`, list rendering with real keys, controlled inputs, and a custom hook.

```jsx
import { useState, useEffect } from "react";

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

function TodoApp() {
  const [todos, setTodos] = useLocalStorage("todos", []);
  const [text, setText] = useState("");

  const addTodo = (e) => {
    e.preventDefault();
    if (!text.trim()) return;
    setTodos([...todos, { id: crypto.randomUUID(), text, done: false }]);
    setText("");
  };

  const toggleTodo = (id) =>
    setTodos(todos.map((t) => (t.id === id ? { ...t, done: !t.done } : t)));

  const deleteTodo = (id) =>
    setTodos(todos.filter((t) => t.id !== id));

  return (
    <div>
      <form onSubmit={addTodo}>
        <input value={text} onChange={(e) => setText(e.target.value)} />
        <button type="submit">Add</button>
      </form>
      <ul>
        {todos.map((todo) => (
          <li key={todo.id} style={{ textDecoration: todo.done ? "line-through" : "none" }}>
            <input type="checkbox" checked={todo.done} onChange={() => toggleTodo(todo.id)} />
            {todo.text}
            <button onClick={() => deleteTodo(todo.id)}>Delete</button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TodoApp;
```

**Stretch goal:** add filtering (all/active/completed) driven by a `useState` value, and confirm the list still keys correctly when filtered items disappear and reappear.

---

## Project 2

**Level:** Intermediate · **Time:** 8-12 hours · **GitHub repo name suggestion:** `react-fetch-dashboard`

**What you build:** A data dashboard fetching from a real public API (e.g. a weather or GitHub API), with proper loading and error states, cancellation on unmount, and a search/filter input — the project most directly exercising `useEffect` cleanup and controlled forms together.

```jsx
import { useState, useEffect } from "react";

function RepoSearch() {
  const [query, setQuery] = useState("react");
  const [repos, setRepos] = useState([]);
  const [status, setStatus] = useState("idle"); // idle | loading | success | error

  useEffect(() => {
    if (!query.trim()) return;
    let cancelled = false;
    setStatus("loading");

    fetch(`https://api.github.com/search/repositories?q=${encodeURIComponent(query)}`)
      .then((res) => {
        if (!res.ok) throw new Error(`GitHub API returned ${res.status}`);
        return res.json();
      })
      .then((data) => {
        if (cancelled) return;
        setRepos(data.items ?? []);
        setStatus("success");
      })
      .catch(() => {
        if (!cancelled) setStatus("error");
      });

    return () => {
      cancelled = true; // ignore this response if query changes again before it resolves
    };
  }, [query]);

  return (
    <div>
      <input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Search repos..." />
      {status === "loading" && <p>Loading...</p>}
      {status === "error" && <p>Something went wrong. Try again.</p>}
      {status === "success" && (
        <ul>
          {repos.map((repo) => (
            <li key={repo.id}>{repo.full_name} — ⭐ {repo.stargazers_count}</li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default RepoSearch;
```

**Stretch goal:** add debouncing (a `useDebounce` custom hook) so a request only fires after the user pauses typing, instead of on every keystroke.

---

## Project 3

**Level:** Advanced · **Time:** 12-16 hours · **GitHub repo name suggestion:** `react-form-hooks-lib`

**What you build:** A small custom-hooks-based form library — reusable `useForm`/`useField` hooks handling values, validation, and submission — applied to a genuinely multi-field signup form. This exercises custom hooks, controlled inputs at scale, `useMemo`/`useCallback` used deliberately (not reflexively), and error boundaries.

```jsx
import { useState, useCallback } from "react";

function useForm(initialValues, validate) {
  const [values, setValues] = useState(initialValues);
  const [errors, setErrors] = useState({});
  const [submitting, setSubmitting] = useState(false);

  const handleChange = useCallback((name) => (e) => {
    setValues((prev) => ({ ...prev, [name]: e.target.value }));
  }, []);

  const handleSubmit = useCallback((onSubmit) => async (e) => {
    e.preventDefault();
    const validationErrors = validate(values);
    setErrors(validationErrors);
    if (Object.keys(validationErrors).length > 0) return;

    setSubmitting(true);
    try {
      await onSubmit(values);
    } finally {
      setSubmitting(false);
    }
  }, [values, validate]);

  return { values, errors, submitting, handleChange, handleSubmit };
}

function validateSignup(values) {
  const errors = {};
  if (!values.email?.includes("@")) errors.email = "Enter a valid email";
  if (!values.password || values.password.length < 8) errors.password = "8+ characters required";
  return errors;
}

function SignupForm() {
  const { values, errors, submitting, handleChange, handleSubmit } =
    useForm({ email: "", password: "" }, validateSignup);

  const onSubmit = async (formValues) => {
    console.log("submitting", formValues); // replace with a real API call
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input value={values.email} onChange={handleChange("email")} placeholder="Email" />
      {errors.email && <p>{errors.email}</p>}
      <input type="password" value={values.password} onChange={handleChange("password")} placeholder="Password" />
      {errors.password && <p>{errors.password}</p>}
      <button type="submit" disabled={submitting}>
        {submitting ? "Submitting..." : "Sign up"}
      </button>
    </form>
  );
}

export default SignupForm;
```

**Stretch goal:** wrap the form in an error boundary, add a second reusable form (login) built on the same `useForm` hook, and confirm the hook genuinely doesn't need any changes to support it — the actual test of whether the abstraction is real reuse or coincidental duplication.
