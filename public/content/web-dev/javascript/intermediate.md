# JavaScript — Intermediate

## Array Methods: `map`, `filter`, `reduce`

These three methods replace almost every manual `for` loop you'd otherwise write over an array, and they're the single most common thing you'll see in real JavaScript codebases.

```javascript
const prices = [10, 25, 40, 5, 60];

const withTax = prices.map((price) => price * 1.18);
// [11.8, 29.5, 47.2, 5.9, 70.8] -- transforms EVERY element, same length out

const affordable = prices.filter((price) => price < 30);
// [10, 25, 5] -- keeps only elements that pass the test, length can shrink

const total = prices.reduce((sum, price) => sum + price, 0);
// 140 -- collapses the whole array into one value

// Chaining them together is extremely common in real code:
const totalWithTaxUnder50 = prices
  .filter((p) => p < 50)
  .map((p) => p * 1.18)
  .reduce((sum, p) => sum + p, 0);
```

`map` and `filter` both return a **new array** — they never mutate the original. `reduce` is the most flexible of the three (it can build an array, an object, or a single number) and also the one people find hardest to read at first — start with `map`/`filter` and reach for `reduce` once those feel natural.

## Destructuring

Destructuring pulls values out of arrays or objects into named variables in one step, instead of accessing each one individually.

```javascript
// Array destructuring
const coordinates = [12, 34];
const [x, y] = coordinates;

// Object destructuring
const user = { name: "Kavya", age: 24, city: "Bengaluru" };
const { name, age } = user;          // pulls out just what you need
const { name: userName } = user;      // rename while destructuring

// Extremely common in function parameters:
function printUser({ name, age }) {
  console.log(`${name} is ${age} years old`);
}
printUser(user);
```

## Spread & Rest

The same `...` syntax means two different things depending on where it's used.

```javascript
// Spread -- expands an array/object into individual elements
const nums = [1, 2, 3];
const moreNums = [...nums, 4, 5];      // [1, 2, 3, 4, 5]

const original = { a: 1, b: 2 };
const copy = { ...original, c: 3 };    // { a: 1, b: 2, c: 3 } -- shallow copy + extend

// Rest -- collects remaining items INTO an array/object
function sum(...numbers) {              // gathers all arguments into an array
  return numbers.reduce((total, n) => total + n, 0);
}
sum(1, 2, 3, 4); // 10

const { a, ...rest } = { a: 1, b: 2, c: 3 };
// a = 1, rest = { b: 2, c: 3 }
```

## Modules: `import` / `export`

Modules let you split code across files and explicitly control what's shared between them — instead of every script sharing one global scope, which doesn't scale past a small page.

```javascript
// math.js
export function add(a, b) {
  return a + b;
}
export const PI = 3.14159;
export default function multiply(a, b) {   // a module can have one default export
  return a * b;
}
```

```javascript
// main.js
import multiply, { add, PI } from "./math.js";

console.log(add(2, 3));       // 5
console.log(multiply(2, 3));  // 6
console.log(PI);              // 3.14159
```

In a browser, load a module file with `<script type="module" src="main.js"></script>` — the `type="module"` attribute is required; without it, `import`/`export` throws a syntax error.

## Error Handling Patterns

```javascript
function parseUserAge(input) {
  const age = Number(input);
  if (Number.isNaN(age)) {
    throw new Error(`"${input}" is not a valid age`);
  }
  return age;
}

try {
  const age = parseUserAge("not a number");
  console.log(age);
} catch (error) {
  console.error("Failed to parse age:", error.message);
} finally {
  console.log("This always runs, error or not");
}
```

For asynchronous code, wrap `await` calls the same way:

```javascript
async function loadUser(id) {
  try {
    const res = await fetch(`/api/users/${id}`);
    if (!res.ok) {
      throw new Error(`Server responded with ${res.status}`);
    }
    return await res.json();
  } catch (error) {
    console.error("Could not load user:", error.message);
    return null;
  }
}
```

Notice the manual `if (!res.ok)` check — `fetch` does **not** treat an HTTP error status (404, 500) as a rejected Promise. Only a network failure (no connection at all) rejects automatically. This surprises almost everyone the first time.

## `fetch()` and Working with Real APIs

`fetch` is the standard built-in way to make HTTP requests from JavaScript, in the browser and in modern Node.js alike.

```javascript
async function getUsers() {
  const response = await fetch("https://api.example.com/users");
  const users = await response.json();
  return users;
}

// POST with a JSON body
async function createUser(newUser) {
  const response = await fetch("https://api.example.com/users", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(newUser),
  });
  return response.json();
}
```

The overall shape of a real fetch-driven feature, end to end:

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "User Action", "sublabel": "Click, form submit", "color": "blue" },
    { "label": "fetch() called", "sublabel": "Request sent to server", "color": "purple" },
    { "label": "await response", "sublabel": "Code pauses here, page stays responsive", "color": "amber" },
    { "label": "Update the DOM", "sublabel": "With the real data, or an error state", "color": "green" }
  ]
}
```

Always plan for three states in real UI code, not just the happy path: **loading** (request in flight), **success** (data arrived), and **error** (request failed or returned a bad status) — a fetch call with only a success path is incomplete for production use.
