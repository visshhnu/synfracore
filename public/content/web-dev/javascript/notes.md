# JavaScript — Revision Notes

Condensed from Overview, Fundamentals, Intermediate, Advanced, and Troubleshooting — use this as a fast pre-interview refresh, not a first-time learning resource.

## Variables & Scope

```
const  -> block-scoped, binding cannot be reassigned (contents CAN mutate)
let    -> block-scoped, reassignable
var    -> function-scoped, hoisted + initialized to undefined -- avoid in new code

Default: const unless reassignment is genuinely needed, then let.
```

## Functions & `this`

```
Regular function -> `this` set by CALL SITE (obj.method() -> this = obj)
Arrow function    -> `this` inherited from ENCLOSING scope at definition time, fixed forever

Rule of thumb: arrow functions for callbacks inside class/object methods,
so `this` doesn't get lost when the callback runs later, detached from the object.
```

## Closures

```
A function + references to its outer scope's variables, alive as long as
the inner function is reachable -- even after the outer function returns.
Use: private state (counters), memoization, event-handler factories.
```

## The Event Loop

```
1. Run all synchronous code to completion (the call stack).
2. Drain the ENTIRE microtask queue (Promise .then/.catch/.finally callbacks).
3. Run exactly ONE macrotask (setTimeout, setInterval, I/O callback).
4. Repeat from step 2.

Consequence: Promise.resolve().then(...) always runs before setTimeout(fn, 0),
no matter how "immediate" the setTimeout looks.
```

## Async Evolution

```
Callbacks -> Promises -> async/await
async/await is syntax sugar OVER Promises, not a separate mechanism.
fetch() does NOT reject on HTTP error status (404/500) -- only on network failure.
Always check res.ok manually.
```

## Array Methods (non-mutating vs mutating)

```
Non-mutating (return a NEW array/value): map, filter, reduce, slice,
  concat, find, findIndex, includes, some, every, join
Mutating (change the ORIGINAL array):     push, pop, shift, unshift,
  splice, sort, reverse
```

## Prototypal Inheritance

```
Every object has a [[Prototype]] link. Property lookup walks the chain
until found or null. `class`/`extends` is syntax over this same mechanism --
NOT a separate inheritance system.
```

## Equality

```
==  -> coerces types before comparing -- avoid
=== -> compares value AND type, no coercion -- default choice
??  -> nullish coalescing, fallback ONLY for null/undefined (not 0, "", false)
?.  -> optional chaining, safe nested property/method access
```

## Common Bug Patterns (from Troubleshooting)

```
"Cannot read properties of undefined" -> data not ready yet, use ?. and guard clauses
Unhandled promise rejection            -> missing try/catch or .catch()
`this` undefined in callback           -> use arrow function instead of regular function
Race condition                         -> track latest request ID, or use AbortController
Infinite loop / stack overflow          -> verify base case / loop exit is actually reachable
```

## Performance Patterns

```
Debounce -> wait until activity STOPS (search-as-you-type)
Throttle -> run at most once per interval (scroll/resize handlers)
Memoize  -> cache a pure function's result per input
```

## Versioning Note

`(needs verification — recheck against current source: proposal-stage ECMAScript features not yet finalized by TC39 change status frequently; specific bundler/tooling recommendations and exact browser support percentages also shift fast enough to need a live check rather than trusting this note as current.)` Core language fundamentals covered in this course — closures, scope, the prototype chain, the event loop model, and all ES6+ syntax used here (`let`/`const`, arrow functions, destructuring, Promises, `async`/`await`) — are stable, finalized, mainstream-adopted language features and are **not** subject to this caveat.
