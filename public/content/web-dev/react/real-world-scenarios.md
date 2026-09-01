# React — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production React usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The stale-closure bug that only showed up in production under specific timing

**The pattern:** A team ships a live-updating dashboard widget that polls an API on an interval and displays the latest value alongside the previous one for a delta calculation. It works correctly in every local test and in staging. In production, under specific real user timing (leaving the tab open for a long session, or a slower network causing responses to arrive later than expected), the delta calculation occasionally shows an obviously wrong number — comparing the latest value against a value from several polls ago instead of the immediately previous one. Investigation eventually reveals a `setInterval` set up inside a `useEffect` with an empty dependency array, closing over the `previousValue` state from the render that first mounted the component — the interval's callback never sees any state update after that, permanently comparing against that one frozen value.

**Why this is a genuinely easy trap, not an obvious mistake:** the bug is invisible in short local test sessions, because a stale closure comparing against a state value from render #1 looks identical to comparing against the "current" value for as long as the component has only rendered once. It only becomes observable once enough real polling cycles have happened for the drift between "frozen closure value" and "actual current value" to produce a visibly wrong number — which is exactly the kind of timing-dependent condition that's easy to miss in a quick manual test but common in a real, long-lived production session.

**What actually prevents this:**
- **Default to the functional update form of state setters (`setX(prev => ...)`) inside any interval, timeout, or effect callback that runs repeatedly**, specifically because it never needs to close over a snapshot of state — it always reads the truly current value at call time, sidestepping the entire class of bug.
- **Enable and actually heed `eslint-plugin-react-hooks`'s `exhaustive-deps` rule** rather than treating its warnings as noise to suppress — this exact pattern (a value read inside an effect but missing from the dependency array) is precisely what it's designed to flag.
- **Treat any interval/timeout set up inside `useEffect` with an empty dependency array as a specific point requiring extra scrutiny during review** — it's a common, recurring source of exactly this bug class, worth a deliberate second look rather than assuming `[]` is automatically safe just because "it only runs once."

---

## Scenario 2 (illustrative/composite): The missing-dependency-array bug that caused an infinite fetch loop and ran up an API bill

**The pattern:** A component fetches data inside a `useEffect` and stores the result in state, intending it to run once per relevant prop change. A dependency the effect reads is inadvertently left out of the dependency array — and separately, an object literal is constructed fresh inside the render function and passed as a fetch parameter, then included in the dependency array. Since that object gets a new reference every single render, the effect re-runs every render, which sets state, which triggers another render, which creates another new object reference, which re-runs the effect again — an unbounded loop firing real requests against a paid third-party API, discovered only when a usage-based billing alert fires.

**Why this is a common, easy-to-miss production trap:** in local development the loop is often either not triggered at all (if the object literal happens not to be part of a hot-reload cycle during testing) or fires too fast to visually notice as "wrong" rather than just "the page is loading a lot" — and unlike a crash or a visible UI error, an infinite fetch loop against a working, responsive API produces no obvious symptom in the browser itself; the first real signal is often external, arriving through billing or rate-limit monitoring rather than through the application.

**What actually prevents this:**
- **Never pass a freshly-created object or array literal as a `useEffect` dependency without memoizing it first (`useMemo`)** — a literal created inline in the render body gets a new reference every render by definition, and including it as a dependency guarantees the effect re-runs every render regardless of whether its actual contents changed.
- **Set up API-level safeguards independent of application code correctness** — rate limiting, a request budget alert, or a circuit breaker on the client for repeated identical requests — treating "the frontend will always be bug-free" as an unsafe assumption to build billing exposure on.
- **Add an explicit test (or at minimum, a manual check with the Network tab open) for "does this effect fire more than once when it shouldn't"** as a standard part of reviewing any `useEffect` that performs a network call, not just checking that the happy-path fetch works at all.

---

## Scenario 3 (illustrative/composite): The index-as-key bug that caused subtle data corruption in a reorderable list

**The pattern:** A drag-and-drop-reorderable list of form rows (each row holding its own local input state — a value, an "is this row expanded" toggle) is built using the array index as each row's `key`, since the initial list order never changed during early development and testing. Once real users start actually reordering rows, a specific, hard-to-reproduce bug appears: after a drag-and-drop reorder, one row's input value or expanded state appears to "belong" to the wrong row — not lost, but attached to a different row than the one it was originally entered on. The team initially suspects the drag-and-drop library itself before tracing it to the list's `key` prop.

**Why this is an easy, non-obvious trap:** the bug is entirely invisible during the phase of development where the list order never actually changes — index-as-key behaves identically to a correct stable key as long as items are never reordered, filtered, or removed from the middle, so nothing in early testing surfaces it. It only manifests once real usage exercises the exact operation (reordering) that the index-based key can't handle correctly, and the resulting symptom (state attached to the wrong row) looks like a data bug or a drag-and-drop library bug rather than pointing directly at the `key` prop.

**What actually prevents this:**
- **Treat any list that can be reordered, filtered, or have items inserted/removed anywhere but the end as requiring a stable, data-derived key as a hard rule from the start** — not something to retrofit once reordering is added as a feature, since the bug is invisible until that feature is actually exercised.
- **Generate and store a real unique ID at the point data is created** (`crypto.randomUUID()`, or an ID from the backend) rather than deriving a key from position or from field values that aren't guaranteed unique.
- **Specifically test reorder/delete operations on any list carrying per-item local state during code review** — this is exactly the operation category where an index-as-key bug surfaces, and it's cheap to check deliberately rather than relying on it being caught incidentally.
