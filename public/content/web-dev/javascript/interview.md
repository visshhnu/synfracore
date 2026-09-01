# JavaScript — Interview Questions

**Q: Explain closures. Give a real example of where you'd use one.**

A closure is a function that retains access to variables from its outer (enclosing) scope, even after that outer function has finished executing. Think of it as the inner function carrying a "backpack" of the variables it needs. A practical use: `function makeCounter() { let count = 0; return () => ++count; }` — each call to `makeCounter()` creates a fresh, private `count` that only the returned function can touch, with no way for outside code to reach in and modify it directly. This is the standard way to create private state without a class.

---

**Q: What's the difference between `this` in a regular function versus an arrow function?**

In a regular function, `this` is determined by *how the function is called* (the call site) — `obj.method()` sets `this` to `obj`; calling the same function unattached loses that binding. An arrow function has no `this` of its own at all — it captures `this` from the surrounding scope at the moment it was *defined*, permanently, regardless of how it's later called. This is exactly why arrow functions are the standard fix for callbacks (event handlers, `setTimeout`) inside class methods, where you want `this` to keep pointing at the class instance.

---

**Q: Walk through the event loop — call stack, Web APIs, callback/microtask queue.**

JavaScript executes on a single call stack, one thing at a time. When code calls something async — `setTimeout`, `fetch`, a DOM event — that work is handed off to the browser's Web APIs, which run it outside the JavaScript thread. When that work finishes, its callback doesn't run immediately; it's placed on a queue (a microtask queue for Promises, a macrotask/callback queue for things like `setTimeout`). The event loop's job is simple: once the call stack is completely empty, pull the next task off the queue and run it — draining the *entire* microtask queue before touching the next macrotask. This is why `Promise.resolve().then(...)` always runs before a `setTimeout(fn, 0)`, even though both look "immediate."

---

**Q: What's the difference between `==` and `===`?**

`==` performs type coercion before comparing values (`"5" == 5` is `true`), which produces surprising, hard-to-predict results in edge cases (`"" == 0` is also `true`). `===` compares both value and type with no coercion at all. The practical rule: default to `===` everywhere; only use `==` in the rare, deliberate case where coercion is genuinely the intent, and even then, prefer making that coercion explicit in code (`Number(x) === 5`) instead of relying on `==`'s implicit rules.

---

**Q: What is hoisting? How does it differ across `var`, `let`, and `const`?**

All three declaration types are "hoisted" — registered at the top of their scope before code runs. But `var` is also *initialized* to `undefined` immediately, so reading it before its declaration line silently gives `undefined` rather than erroring. `let` and `const` are hoisted but left uninitialized, sitting in the "temporal dead zone" — reading them before their declaration line throws a `ReferenceError` instead of silently returning `undefined`. That's a real practical reason to prefer `let`/`const`: they fail loudly and immediately instead of masking a bug.

---

**Q: Promises vs. `async`/`await` — what's actually different, and when would you choose one?**

`async`/`await` is syntax sugar built directly on top of Promises — not a separate mechanism. It lets sequential asynchronous logic read top-to-bottom like normal synchronous code, with one `try`/`catch` handling errors across multiple `await` steps, instead of chaining several `.then()`/`.catch()` calls. Where Promises directly still matter: running several independent async operations concurrently via `Promise.all` (or `Promise.allSettled`, which doesn't short-circuit on the first rejection) — `async`/`await` is naturally sequential unless you explicitly combine it with `Promise.all`.

---

**Q: Explain prototypal inheritance.**

Every JavaScript object carries an internal link (its prototype) to another object it can borrow properties and methods from. Property lookup checks the object itself first, then walks up the prototype chain until it finds a match or reaches `null`. `class`/`extends` syntax is not a separate inheritance system — it's built directly on this same prototype-chain mechanism; `class Rabbit extends Animal` sets `Rabbit.prototype`'s prototype to `Animal.prototype` under the hood. This is why adding a method to `Array.prototype` instantly makes it available on every array — they all share that one prototype object.

---

**Q: What's the difference between `map`, `filter`, and `reduce`?**

`map` transforms every element and returns a new array of the same length. `filter` tests every element and returns a new array containing only the elements that pass, which can be shorter. `reduce` collapses the entire array into a single accumulated value — a number, an object, even a new array — using a callback that runs once per element, carrying an accumulator forward each time. All three return new values without mutating the original array, which matters for predictable, debuggable code.

---

**Q: How do you debug a race condition in async JavaScript?**

Start by confirming it actually is a race condition — add logging around each async call's start and completion to see if their finishing order is inconsistent across runs. The usual root cause: two or more async operations started close together, where a later-started one can finish first, and whichever one *resolves last* ends up overwriting state set by the others regardless of which was triggered first. The standard fix is tracking a request ID (or using `AbortController` to cancel stale requests outright) so only the response matching the most recent request is actually applied.

---

**Q: What's the difference between `null` and `undefined`?**

`undefined` means a variable has been declared but never assigned a value — it's JavaScript's own default. `null` is a value a developer assigns deliberately to represent "intentionally empty" or "no value here." A function with no explicit `return` returns `undefined`; a database query that legitimately found no matching row might deliberately return `null`. `typeof undefined` is `"undefined"`; `typeof null` is (famously, and technically a long-standing bug in the language) `"object"`.
