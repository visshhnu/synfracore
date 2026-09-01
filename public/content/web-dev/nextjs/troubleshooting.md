# Next.js Troubleshooting Guide

## Issue 1: Hydration mismatch error

**Symptom:** A warning/error in the browser console about the server-rendered HTML not matching what React rendered on the client — the page may flicker, or specific content may appear briefly wrong before correcting itself.

**Root Cause:** The server rendered one thing and the client, on first render, computed something different — commonly caused by using a value that legitimately differs between server and client (the current date/time, `Math.random()`, checking for `window`/browser-only APIs) directly in render output, rather than only after the component has mounted in the browser.

**Debug steps:**
```text
1. Read the exact mismatch the error reports -- it usually names the
   specific element/text that differed
2. Search the component for anything that could differ between
   server and client: Date.now(), Math.random(), reading
   window/localStorage/navigator directly during render
3. Confirm whether any browser extension could be injecting DOM
   content before React hydrates (a genuine, separate cause of this
   same symptom, unrelated to your own code)
```

**Fix patterns:**
```jsx
// BUG: differs between server (no real "now") and client
function Clock() {
  return <div>{new Date().toLocaleTimeString()}</div>;
}

// FIX: only compute the client-only value after mount
function Clock() {
  const [time, setTime] = useState(null);
  useEffect(() => { setTime(new Date().toLocaleTimeString()); }, []);
  return <div>{time ?? "..."}</div>;
}
```

*(needs verification — exact current recommended pattern/API for deliberately marking a section as client-only-rendered; confirm against current Next.js docs)*

---

## Issue 2: Environment variable is `undefined` where you expected it to have a value

**Symptom:** A variable read from `process.env` (or your framework's equivalent) is `undefined` in the browser, even though it's clearly set in your `.env` file.

**Root Cause:** Server-only environment variables are, by design, not included in the client-side JavaScript bundle — you were trying to read a server-only value from code that actually runs in the browser.

**Debug steps:**
```text
1. Confirm exactly where the read is happening -- a component that
   looks like it's "just JavaScript" may actually run in the
   browser, not just the server
2. Check whether the variable is named using the client-exposed
   naming convention -- if it isn't, and you need it client-side,
   that's the actual fix (with the tradeoff that it becomes visible
   to anyone inspecting the shipped bundle)
3. Restart the dev server after any .env change -- environment
   files are typically read at server start, not live-reloaded
```

**Fix patterns:**
```bash
# Server-only -- fine to use in server-only code, never in client code
DATABASE_PASSWORD=secret123

# Deliberately exposed to the client -- use this ONLY for values that
# are genuinely safe to be public
NEXT_PUBLIC_SOME_ID=abc123
```

*(needs verification — exact current client-exposed naming convention; confirm before assuming any specific prefix is current)*

---

## Issue 3: A page is showing stale data that doesn't reflect a recent change

**Symptom:** You update the underlying data (a database row, an external API's content), but the deployed page keeps showing the old value for a while.

**Root Cause:** The page is using an ahead-of-time rendering strategy with a caching/revalidation window that hasn't elapsed yet — this is often *working exactly as configured*, not a bug, but the configured freshness doesn't match what the team actually needed.

**Debug steps:**
```text
1. Confirm which rendering strategy the page is actually using --
   don't assume; check the code
2. Check whether a revalidation interval or trigger is configured,
   and what it's actually set to
3. Confirm whether the same behavior reproduces in a genuinely
   production-like environment -- local dev mode frequently
   re-renders more eagerly than production, which can mask this
   exact class of bug during local testing
```

**Fix patterns:**
```text
# (needs verification -- exact current revalidation API and its
# exact semantics; this is one of the most version-volatile areas
# of the entire framework, and getting the exact syntax from an
# outdated tutorial is a common, real cause of this bug)
```

---

## Issue 4: Build succeeds locally but fails in CI

**Symptom:** `npm run build` (or equivalent) works fine on a developer's machine but fails in the CI pipeline.

**Root Cause:** Commonly an environment difference — a missing environment variable that only existed locally, a different Node.js version between local and CI, or a case-sensitivity mismatch in an import path (many developers work on case-insensitive filesystems locally, while CI runners are typically case-sensitive).

**Debug steps:**
```bash
# Confirm Node.js version matches between local and CI
node --version

# Check for import paths that only differ by casing from the
# actual file on disk -- works locally on a case-insensitive
# filesystem, fails in CI

# Confirm every environment variable the build actually needs is
# set in the CI environment, not just locally
```

**Fix patterns:**
- Pin the Node.js version explicitly in CI config to match what's used locally/in production
- Fix import path casing to exactly match the file on disk
- Add any missing required environment variables to the CI environment's configuration

---

## Issue 5: An import works locally but breaks in production

**Symptom:** A page or component that works fine with the local dev server throws an error only after deploying to production.

**Root Cause:** Commonly, code that's only meant to run in the browser (directly referencing `window`, `document`, or a browser-only library) is being imported into a file that also gets executed on the server during rendering — the dev server may tolerate or mask this in ways a production build doesn't.

**Debug steps:**
```text
1. Read the production error message carefully -- it often names
   the exact undefined reference (commonly "window is not defined"
   or similar)
2. Trace which component/module is doing the browser-only access,
   and confirm whether it's used somewhere that also renders on
   the server
3. Confirm the failure is specifically server-vs-client, not an
   unrelated environment-variable or build-configuration issue
   (Issue 2 and Issue 4 above)
```

**Fix patterns:**
```jsx
// Move browser-only access into an effect, which only ever runs
// in the browser after mount, never during server rendering
useEffect(() => {
  // safe to reference window/document here
}, []);
```

*(needs verification — exact current mechanism for marking a whole component as client-only rather than relying solely on effect timing; confirm against current Next.js docs)*

---

## Prevention Tips

- Never reference `window`, `document`, or other browser-only globals directly during render — confine that access to an effect or an explicitly client-only-marked section
- Keep server-only secrets out of any file that could plausibly be bundled for the client — treat the client/server variable naming convention as a hard rule
- Don't assume local dev-server behavior (especially around caching/revalidation) matches production — test genuinely production-like builds before trusting a caching fix
- Pin your Node.js version explicitly in CI to avoid environment-drift build failures
- When copying a code example from a tutorial or search result, check what version/paradigm it targets before trusting it — a large share of real Next.js bugs trace back to mixing guidance from different versions
