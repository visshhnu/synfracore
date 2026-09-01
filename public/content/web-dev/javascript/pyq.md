# JavaScript — Practice Questions

**Framing note:** Unlike a proctored exam (GATE, a specific vendor cert), there is no single official JavaScript certification body with a public archive of "previous year questions." The questions below are practice questions grounded in documented JavaScript behavior (MDN, the ECMAScript spec) and the kind of questions that genuinely appear in real technical interviews — not sourced from any specific past exam paper.

### 1. (Domain: Scope) What is logged, and why?

```javascript
for (var i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 0);
}
```

**Answer:** `3, 3, 3`. `var` is function-scoped, not block-scoped, so there is only ONE `i` shared across all three loop iterations. By the time any `setTimeout` callback actually runs (after the loop has already finished), `i` is `3`. Replacing `var` with `let` would print `0, 1, 2`, because `let` creates a fresh binding of `i` for each loop iteration.

### 2. (Domain: Equality) Evaluate: `[] == false`

**Answer:** `true`. `==` coerces both sides: `[]` converts to `""` (empty string), `""` converts to `0`, and `false` also converts to `0` — `0 === 0` is `true`. This is exactly the kind of surprising coercion chain that's the practical argument for always using `===`.

### 3. (Domain: Closures) What does this print?

```javascript
function outer() {
  let count = 0;
  return { increment: () => ++count, get: () => count };
}
const c = outer();
c.increment();
c.increment();
console.log(c.get());
```

**Answer:** `2`. Both `increment` and `get` close over the same `count` variable from `outer`'s scope — they share one "backpack," not separate copies.

### 4. (Domain: Event Loop) Order of output?

```javascript
console.log("A");
setTimeout(() => console.log("B"), 0);
Promise.resolve().then(() => console.log("C"));
console.log("D");
```

**Answer:** `A, D, C, B`. Synchronous code (`A`, `D`) runs first; the microtask queue (the Promise's `.then`, `C`) drains completely before the next macrotask (`setTimeout`'s `B`) runs.

### 5. (Domain: `this` binding) What does this log?

```javascript
const obj = {
  value: 42,
  getValue: function () {
    return (() => this.value)();
  },
};
console.log(obj.getValue());
```

**Answer:** `42`. The outer function is called as `obj.getValue()`, so `this` inside it is `obj`. The inner arrow function has no `this` of its own — it inherits `this` from the enclosing (outer) function's scope, which is `obj`. So `this.value` resolves to `obj.value`.

### 6. (Domain: Array Methods) What does `reduce` return here?

```javascript
const result = [1, 2, 3, 4].reduce((acc, n) => {
  if (n % 2 === 0) acc.push(n);
  return acc;
}, []);
```

**Answer:** `[2, 4]`. `reduce` here is being used to build a new array (equivalent to `.filter(n => n % 2 === 0)`), accumulating into the initial value `[]` and returning the modified accumulator each iteration.

### 7. (Domain: Prototypes) What does `Object.getPrototypeOf` return?

```javascript
class Animal {}
class Dog extends Animal {}
const rex = new Dog();
console.log(Object.getPrototypeOf(rex) === Dog.prototype);
console.log(Object.getPrototypeOf(Dog.prototype) === Animal.prototype);
```

**Answer:** Both log `true`. `rex`'s prototype is `Dog.prototype`, and `Dog.prototype`'s own prototype is `Animal.prototype` — `extends` links the prototype chain exactly this way.

### 8. (Domain: Promises) What happens if you forget `return` here?

```javascript
async function getData() {
  fetch("/api/data").then((res) => res.json());
}
```

**Answer:** `getData()` resolves to `undefined` — the `async` function's own returned Promise doesn't wait for the inner `fetch(...).then(...)` chain, because it's never `return`ed or `await`ed. Anyone calling `await getData()` gets `undefined`, not the fetched data. This is a genuinely common real bug — always `return` (or `await`) a Promise you intend the caller to receive.

### 9. (Domain: Type Coercion) What does `typeof NaN` return, and is `NaN === NaN` true?

**Answer:** `typeof NaN` is `"number"` (NaN is technically a numeric value, representing "not a valid number result"). `NaN === NaN` is `false` — NaN is the one value in JavaScript that is never equal to itself, by IEEE 754 floating-point spec design. Use `Number.isNaN(x)` to actually test for it, not `x === NaN`.

### 10. (Domain: Memory) Why can this pattern leak memory?

```javascript
function setup() {
  const bigData = new Array(1_000_000).fill("x");
  window.addEventListener("resize", () => console.log(bigData.length));
}
```

**Answer:** The arrow function passed to `addEventListener` closes over `bigData`, keeping the entire million-element array alive in memory for as long as that listener stays registered on `window` — even if `setup()` itself is long finished. If `setup()` is called repeatedly (e.g., a widget re-initialized without ever removing its old listener), each call adds another retained `bigData` array with no way to free them. The fix: call `window.removeEventListener` with a reference to the same handler function when the listener is no longer needed.
