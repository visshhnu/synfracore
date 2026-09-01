# JavaScript Troubleshooting Guide

## Issue 1: "Cannot read properties of undefined (reading 'x')"

**Symptom:** The console throws `TypeError: Cannot read properties of undefined (reading 'name')` (or similar), and the page stops responding at that point.

**Root Cause:** Code tried to access a property on something that turned out to be `undefined` (or `null`) — most commonly, data that hasn't arrived yet from an async call, an array index that doesn't exist, or an object property that's genuinely optional and sometimes absent.

**Debug steps:**

```javascript
// Add a log right before the failing line to see the actual value
console.log("user object at this point:", user);
console.log(user.profile.name); // the line that's throwing

// Common culprit: reading nested data before an async fetch resolves
async function loadProfile() {
  const user = await fetchUser();   // if this hasn't resolved yet elsewhere...
  render(user.profile.name);         // ...this line fires on stale/empty data
}
```

**Fix patterns:**

```javascript
// Optional chaining -- returns undefined instead of throwing, if any link is missing
console.log(user?.profile?.name);

// Nullish coalescing -- provide a fallback for null/undefined specifically
const displayName = user?.profile?.name ?? "Guest";

// Guard clause -- don't proceed until data is actually ready
if (!user) return; // or show a loading state
```

## Issue 2: Unhandled Promise Rejection

**Symptom:** The console shows `Uncaught (in promise) Error: ...`, but nothing in your visible code appears to have crashed — the app just silently behaves wrong.

**Root Cause:** A Promise rejected (an `await`ed call threw, or a `.then()` chain hit an error) and nothing caught it — no `.catch()`, no surrounding `try`/`catch`.

**Debug steps:**

```javascript
// Reproduce and confirm which call is rejecting
async function loadData() {
  const res = await fetch("/api/data"); // <- if this rejects (network failure),
  return res.json();                     //    and nothing catches it, this is it
}
loadData(); // called with no .catch() and no surrounding try/catch
```

**Fix patterns:**

```javascript
// try/catch around the await
async function loadDataSafe() {
  try {
    const res = await fetch("/api/data");
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return await res.json();
  } catch (error) {
    console.error("loadData failed:", error);
    return null;
  }
}

// Global safety net in Node.js (belt-and-suspenders, not a substitute for real handling)
process.on("unhandledRejection", (reason) => {
  console.error("Unhandled rejection:", reason);
});
```

## Issue 3: `this` is `undefined` Inside a Callback

**Symptom:** `Cannot read properties of undefined (reading 'someProperty')` specifically inside a callback passed to `setTimeout`, an event listener, or an array method — even though `this` worked fine one line earlier.

**Root Cause:** A regular `function` used as a callback loses its connection to the object it was originally called on — `this` inside it is determined by how *that inner function* is invoked, not by the outer method's `this`.

**Debug steps:**

```javascript
class Timer {
  constructor() {
    this.seconds = 0;
  }
  start() {
    setTimeout(function () {
      console.log(this.seconds); // `this` here is undefined -- NOT the Timer instance
    }, 1000);
  }
}
```

**Fix patterns:**

```javascript
class TimerFixed {
  constructor() {
    this.seconds = 0;
  }
  start() {
    // Fix 1: arrow function -- inherits `this` from `start()`'s scope
    setTimeout(() => {
      console.log(this.seconds); // works -- `this` is the Timer instance
    }, 1000);
  }
  startAlt() {
    // Fix 2: explicit .bind()
    setTimeout(function () {
      console.log(this.seconds);
    }.bind(this), 1000);
  }
}
```

## Issue 4: Infinite Loop / "Maximum call stack size exceeded"

**Symptom:** The browser tab freezes entirely, or the console throws `RangeError: Maximum call stack size exceeded`.

**Root Cause:** Either a loop whose exit condition never becomes true (an `i++` missing, or a condition that can never flip), or a recursive function with no base case (or a base case that's never actually reached).

**Debug steps:**

```javascript
// Add a safety counter while debugging to see how far it actually gets
let iterations = 0;
function suspiciousRecursion(n) {
  iterations++;
  if (iterations > 10000) {
    console.error("Bailing out -- likely infinite, n is:", n);
    return;
  }
  return suspiciousRecursion(n - 1); // if n never reaches the real base case...
}
```

**Fix patterns:**

```javascript
// Always verify the base case is actually reachable from every input
function countdown(n) {
  if (n <= 0) return; // base case -- confirm this condition CAN be hit
  console.log(n);
  countdown(n - 1);    // must move strictly toward the base case every call
}

// For loops, double check the condition actually changes each iteration
for (let i = 0; i < 10; i++) {   // i++ is what makes this terminate -- don't forget it
  console.log(i);
}
```

## Issue 5: Race Condition in Async Code

**Symptom:** The UI intermittently shows stale or wrong data — a search result, a price, a form state — that doesn't match the most recent user action, only under fast repeated interaction.

**Root Cause:** Multiple async calls in flight at once, with no guarantee they resolve in the same order they were started — a later request can finish before an earlier one, and whichever resolves *last* wins, even if it's the stale one.

**Debug steps:**

```javascript
// Log start and completion order to confirm this is really the issue
async function search(query) {
  console.log("started:", query);
  const res = await fetch(`/api/search?q=${query}`);
  console.log("finished:", query);   // compare this order across rapid calls
  return res.json();
}
```

**Fix patterns:**

```javascript
// Pattern A: track the latest request, ignore stale responses
let latestId = 0;
async function searchFixed(query) {
  const id = ++latestId;
  const res = await fetch(`/api/search?q=${query}`);
  const data = await res.json();
  if (id !== latestId) return; // a newer search started; discard this stale result
  render(data);
}

// Pattern B: cancel the stale request outright with AbortController
let controller;
async function searchAbort(query) {
  controller?.abort();               // cancel any in-flight previous request
  controller = new AbortController();
  const res = await fetch(`/api/search?q=${query}`, { signal: controller.signal });
  render(await res.json());
}
```

## Prevention Tips

- Treat every `await` as something that can throw — wrap it, or wrap the calling function, the same way you'd treat any I/O call.
- Use optional chaining (`?.`) and nullish coalescing (`??`) defensively around any data that arrives from a network call, not just data you're unsure about.
- Prefer arrow functions for callbacks inside class methods and object methods, specifically to avoid `this`-binding surprises.
- When firing an async call per user action that can happen repeatedly and fast (typing, clicking), assume responses can arrive out of order and design for it from the start — don't wait for it to become a bug report.
- Run ESLint with sensible defaults — many of these issues (a missing `await`, an unreachable branch, an unused variable that reveals a typo) are catchable before the code ever runs.
