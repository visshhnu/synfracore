# JavaScript Quick Reference

## Variables

```javascript
const x = 10;      // cannot be reassigned
let y = 20;         // reassignable, block-scoped
var z = 30;          // function-scoped -- avoid in new code
```

## Data Types

```javascript
typeof "hello";      // "string"
typeof 42;            // "number"
typeof true;           // "boolean"
typeof undefined;       // "undefined"
typeof null;             // "object" (a long-standing language quirk)
typeof {};                // "object"
typeof [];                  // "object" (use Array.isArray() to check for arrays specifically)
typeof function () {};        // "function"
```

## Array Methods

```javascript
arr.map((x) => x * 2);          // transform every element -> new array
arr.filter((x) => x > 5);       // keep matching elements -> new array
arr.reduce((acc, x) => acc + x, 0); // collapse to one value
arr.find((x) => x === 5);       // first matching element, or undefined
arr.findIndex((x) => x === 5);  // index of first match, or -1
arr.includes(5);                // true/false
arr.some((x) => x > 5);         // true if ANY element matches
arr.every((x) => x > 5);        // true if ALL elements match
arr.sort((a, b) => a - b);      // sorts IN PLACE, mutates original
arr.slice(1, 3);                // copy of a range, does NOT mutate
arr.splice(1, 2);               // removes/inserts, MUTATES original
arr.join(", ");                 // array -> string
arr.flat();                     // flattens one level of nested arrays
[...arr1, ...arr2];             // concatenate via spread
```

## Object Methods

```javascript
Object.keys(obj);         // ["a", "b"]
Object.values(obj);       // [1, 2]
Object.entries(obj);      // [["a", 1], ["b", 2]]
Object.assign({}, obj1, obj2); // shallow merge (prefer spread below)
{ ...obj1, ...obj2 };       // shallow merge, preferred modern syntax
Object.freeze(obj);          // makes obj immutable (shallow)
```

## String Methods

```javascript
str.trim();                   // remove whitespace from both ends
str.toUpperCase() / toLowerCase();
str.includes("sub");          // true/false
str.split(",");                // string -> array
str.replace("a", "b");          // first match only
str.replaceAll("a", "b");        // all matches
`Hello, ${name}!`;                 // template literal
str.padStart(5, "0");               // "00042" style padding
```

## Destructuring & Spread/Rest

```javascript
const [a, b] = [1, 2];
const { x, y } = { x: 1, y: 2 };
const { x: renamed } = { x: 1 };
function sum(...nums) { return nums.reduce((s, n) => s + n, 0); }
const merged = { ...obj1, ...obj2 };
```

## Async Patterns

```javascript
// Promise
fetch(url).then((res) => res.json()).catch((err) => console.error(err));

// async/await
async function load() {
  try {
    const res = await fetch(url);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return await res.json();
  } catch (err) {
    console.error(err);
  }
}

// Run several in parallel
const [a, b] = await Promise.all([fetch(url1), fetch(url2)]);

// Run several, don't fail all if one rejects
const results = await Promise.allSettled([fetch(url1), fetch(url2)]);
```

## Equality & Truthiness

```javascript
"" == 0;        // true  -- avoid ==
"" === 0;       // false -- prefer ===

// Falsy values (everything else is truthy):
// false, 0, "", null, undefined, NaN

value ?? "default";     // nullish coalescing -- only null/undefined trigger fallback
value?.property;         // optional chaining -- safe nested access
```

## DOM & Events

```javascript
document.querySelector(".class");        // first match
document.querySelectorAll(".class");     // NodeList of all matches
el.textContent = "text";                  // safe text update
el.innerHTML = "<b>html</b>";              // renders HTML -- sanitize untrusted input first
el.classList.add("active") / .remove() / .toggle();
el.addEventListener("click", handler);
el.removeEventListener("click", handler);
```

## Common Interview-Grade Snippets

```javascript
// Closure counter
function makeCounter() {
  let count = 0;
  return () => ++count;
}

// Debounce
function debounce(fn, ms) {
  let id;
  return (...args) => {
    clearTimeout(id);
    id = setTimeout(() => fn(...args), ms);
  };
}

// Deep-ish clone (structured data, no functions/Dates edge cases handled)
const clone = JSON.parse(JSON.stringify(obj));

// Simple memoize
function memoize(fn) {
  const cache = new Map();
  return (arg) => cache.has(arg) ? cache.get(arg) : cache.set(arg, fn(arg)).get(arg);
}
```
