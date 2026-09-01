# JavaScript — Advanced

## The Event Loop in Depth: Microtasks vs. Macrotasks

JavaScript is single-threaded, but it manages async work through two separate queues, and the order they drain in is a frequent source of confusion — and a very common interview question.

- **Macrotasks**: `setTimeout`, `setInterval`, I/O, UI rendering. One macrotask runs per event loop cycle.
- **Microtasks**: Promise callbacks (`.then`, `.catch`, `.finally`), `queueMicrotask`. The **entire microtask queue** is drained completely before the next macrotask runs — not just one microtask per cycle.

```javascript
console.log("1: sync start");

setTimeout(() => console.log("2: macrotask (setTimeout)"), 0);

Promise.resolve().then(() => console.log("3: microtask (Promise)"));

console.log("4: sync end");

// Actual output order:
// 1: sync start
// 4: sync end
// 3: microtask (Promise)
// 2: macrotask (setTimeout)
```

Even with a `0ms` delay, `setTimeout`'s callback runs *after* the Promise's `.then`, because all synchronous code finishes first, then the entire microtask queue drains, and only then does the next macrotask get pulled off the queue.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Run all synchronous code", "sublabel": "Top to bottom, no interruption", "color": "blue" },
    { "label": "Drain the ENTIRE microtask queue", "sublabel": "All pending Promise callbacks, in order", "color": "purple" },
    { "label": "Run ONE macrotask", "sublabel": "Next setTimeout / setInterval callback", "color": "amber" },
    { "label": "Repeat", "sublabel": "Drain microtasks again, then next macrotask", "color": "green" }
  ]
}
```

## Prototypal Inheritance & the Prototype Chain

Every JavaScript object has an internal link to another object — its **prototype**. When you access a property, JavaScript checks the object itself first, and if it's not found, walks up the prototype chain until it finds it or reaches `null`.

```javascript
const animal = {
  eats: true,
  describe() {
    return "I am an animal";
  },
};

const rabbit = Object.create(animal);   // rabbit's prototype is `animal`
rabbit.jumps = true;

console.log(rabbit.eats);        // true -- not on rabbit itself, found on its prototype (animal)
console.log(rabbit.describe());  // "I am an animal" -- same lookup mechanism for methods

console.log(Object.getPrototypeOf(rabbit) === animal); // true
```

`class` syntax is built entirely on top of this same mechanism — it's not a separate inheritance system:

```javascript
class Animal {
  constructor(name) {
    this.name = name;
  }
  describe() {
    return `${this.name} is an animal`;
  }
}

class Rabbit extends Animal {
  jump() {
    return `${this.name} jumps!`;
  }
}

const bugs = new Rabbit("Bugs");
console.log(bugs.describe()); // "Bugs is an animal" -- inherited via the prototype chain
console.log(bugs.jump());     // "Bugs jumps!"
```

`extends` sets `Rabbit.prototype`'s prototype to `Animal.prototype` — under the hood, it's exactly the `Object.create` mechanism above.

## Memory Management: Closures and Leaks

JavaScript garbage-collects memory automatically — a value is freed once nothing references it anymore. Closures are a common, easy-to-miss way to accidentally keep something alive far longer than intended.

```javascript
function attachHandler() {
  const hugeData = new Array(1_000_000).fill("x");   // large array

  document.getElementById("btn").addEventListener("click", () => {
    console.log("clicked");   // this callback doesn't even use hugeData...
  });
  // ...but if it DID reference hugeData, the closure keeps the entire
  // array alive for as long as the event listener exists -- even if
  // the rest of attachHandler's scope is otherwise long done executing.
}
```

The most common real-world leak pattern is an event listener that's never removed:

```javascript
function setupWidget() {
  const state = loadLargeState();
  const handler = () => useState(state);
  window.addEventListener("resize", handler);
  // if this widget is ever destroyed/removed from the page without
  // calling window.removeEventListener("resize", handler), `state`
  // stays alive in memory forever -- the listener still references it,
  // and the listener itself is still registered on `window`.
}
```

**Fix pattern:** always pair `addEventListener` with a matching `removeEventListener` when the thing that registered it goes away (a component unmounting, a modal closing).

## Generators & Iterators

A **generator** function can pause and resume execution, yielding one value at a time instead of computing and returning everything at once.

```javascript
function* countUpTo(max) {
  for (let i = 1; i <= max; i++) {
    yield i;             // pauses here, returns i, resumes on next call
  }
}

const counter = countUpTo(3);
console.log(counter.next()); // { value: 1, done: false }
console.log(counter.next()); // { value: 2, done: false }
console.log(counter.next()); // { value: 3, done: false }
console.log(counter.next()); // { value: undefined, done: true }

// A generator IS an iterator -- works directly with for...of:
for (const num of countUpTo(3)) {
  console.log(num); // 1, 2, 3
}
```

Generators are how you build a custom object that works with `for...of`, and they're the foundation `async`/`await` itself is conceptually built on (an `async` function is, roughly, a generator that automatically resumes when each awaited Promise resolves).

## Performance: Debounce & Throttle, Memoization

**Debounce** — wait until activity *stops* before running (classic use: search-as-you-type, where you don't want to fire a request on every single keystroke):

```javascript
function debounce(fn, delay) {
  let timeoutId;
  return function (...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => fn.apply(this, args), delay);
  };
}

const debouncedSearch = debounce((query) => {
  console.log("Searching for:", query);
}, 300);

// Called on every keystroke, but only actually fires 300ms after typing STOPS
input.addEventListener("input", (e) => debouncedSearch(e.target.value));
```

**Throttle** — run at most once per interval, no matter how often it's triggered (classic use: a scroll or resize handler):

```javascript
function throttle(fn, interval) {
  let lastRun = 0;
  return function (...args) {
    const now = Date.now();
    if (now - lastRun >= interval) {
      lastRun = now;
      fn.apply(this, args);
    }
  };
}

const throttledScroll = throttle(() => console.log("scroll position checked"), 200);
window.addEventListener("scroll", throttledScroll);
```

**Memoization** — cache a function's result for a given input, so repeated calls with the same argument skip recomputation:

```javascript
function memoize(fn) {
  const cache = new Map();
  return function (arg) {
    if (cache.has(arg)) {
      return cache.get(arg);
    }
    const result = fn(arg);
    cache.set(arg, result);
    return result;
  };
}

const slowSquare = (n) => {
  for (let i = 0; i < 1e8; i++) {} // simulate expensive work
  return n * n;
};
const fastSquare = memoize(slowSquare);

fastSquare(5); // slow -- computes and caches
fastSquare(5); // instant -- returns cached result
```

All three patterns share one root idea: control *when* and *how often* expensive work actually runs, rather than letting every triggering event run it directly.
