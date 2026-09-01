# JavaScript — Fundamentals

## Variables & Scope (`let`, `const`, `var`)

A variable is a named box that holds a value. JavaScript gives you three ways to declare one, and the difference between them is genuinely important, not cosmetic.

```javascript
var oldWay = "function-scoped, avoid in new code";
let canChange = "block-scoped, reassignable";
const cannotChange = "block-scoped, cannot be reassigned";

canChange = "this works fine";
// cannotChange = "this throws a TypeError";
```

- **`var`** is scoped to the nearest *function*, not the nearest block — a `var` declared inside an `if` block "leaks" out to the whole function. This is a real, historical source of bugs.
- **`let`** and **`const`** are scoped to the nearest *block* (`{ }` — an `if`, a `for` loop, a function body). This matches what most people intuitively expect.
- **`const`** doesn't mean "immutable" — it means the variable binding itself can't be reassigned. An object or array stored in a `const` can still have its contents changed:

```javascript
const user = { name: "Asha" };
user.name = "Priya";      // fine -- mutating the object, not reassigning the variable
// user = { name: "New" };  // throws -- this reassigns the variable itself
```

**Default rule:** use `const` unless you know the variable needs to be reassigned, in which case use `let`. Avoid `var` in new code entirely.

## Functions & Closures

A function is a reusable block of code. JavaScript has several ways to write one:

```javascript
function greet(name) {           // function declaration
  return `Hello, ${name}!`;
}

const greetArrow = (name) => {   // arrow function
  return `Hello, ${name}!`;
};

const greetShort = (name) => `Hello, ${name}!`;  // implicit return, one expression
```

**Closures** are one of JavaScript's most powerful — and most interview-tested — features. Think of a closure like a backpack: when a function is created, it packs up references to the variables it needs from its surrounding scope, and it carries that backpack with it wherever it goes, even after the outer function has already finished running.

```javascript
function makeCounter() {
  let count = 0;               // this variable gets packed into the backpack
  return function () {
    count++;
    return count;
  };
}

const counter1 = makeCounter();
const counter2 = makeCounter(); // a completely separate backpack

console.log(counter1()); // 1
console.log(counter1()); // 2
console.log(counter2()); // 1 -- counter2's backpack is independent of counter1's
```

`count` is not a global variable — nothing outside `makeCounter` can reach in and change it directly. That's a real, practical use of closures: private state without a class.

## Arrays & Objects

Arrays hold ordered lists; objects hold named key-value pairs.

```javascript
const fruits = ["apple", "banana", "cherry"];
console.log(fruits[0]);        // "apple"
console.log(fruits.length);    // 3

const person = {
  name: "Rahul",
  age: 28,
  isStudent: false,
};
console.log(person.name);      // "Rahul"
console.log(person["age"]);    // 28 -- bracket notation, useful for dynamic keys
```

Arrays come with built-in methods for the most common operations — covered in depth in Intermediate (`map`, `filter`, `reduce`), but the basics:

```javascript
fruits.push("date");           // add to the end
fruits.pop();                  // remove from the end
console.log(fruits.includes("banana")); // true
```

## The DOM & Events

The **DOM** (Document Object Model) is the browser's live, in-memory representation of the HTML on a page — a tree of objects JavaScript can read and modify. When JavaScript changes the DOM, the browser re-renders the visible page to match, immediately.

```javascript
const button = document.querySelector("#myButton");
const output = document.querySelector("#output");

button.addEventListener("click", () => {
  output.textContent = "Button was clicked!";
  output.style.color = "green";
});
```

`addEventListener` is how JavaScript "listens" for something happening — a click, a keystroke (`"input"`), a form submission (`"submit"`) — and runs a function in response. This is the actual mechanism behind every interactive element you've ever used on a web page.

## `this` Binding

`this` refers to a different value depending on *how* a function is called — not where it's written. This trips up nearly everyone at first.

```javascript
const car = {
  brand: "Toyota",
  describe: function () {
    console.log(this.brand);   // "Toyota" -- called as car.describe(), so `this` is `car`
  },
};
car.describe();

const describeFn = car.describe;
// describeFn();               // `this` is now undefined (strict mode) -- lost the connection to `car`

const carArrow = {
  brand: "Honda",
  describe: () => {
    console.log(this.brand);   // NOT "Honda" -- arrow functions don't get their own `this`
  },                            // it inherits `this` from where it was DEFINED, not called
};
```

**Practical rule:** use a regular `function` when you need `this` to reflect the calling object (an object method). Use an arrow function when you want `this` to stay whatever it was in the surrounding code (very common inside callbacks — an event handler inside a class method, for example, where you want `this` to stay the class instance).

## Async Basics: Callbacks → Promises → `async`/`await`

JavaScript handles anything that takes time (loading data, waiting on a timer) without freezing the page, using three generations of the same underlying idea.

```conceptgrid
{
  "boxes": [
    { "title": "1. Callbacks", "description": "A function passed in to run once the slow thing finishes. Nesting many gets hard to read ('callback hell')", "color": "amber" },
    { "title": "2. Promises", "description": "An object representing a value that will exist eventually. .then() chains instead of nested callbacks", "color": "blue" },
    { "title": "3. async/await", "description": "Modern standard -- write async code that reads top-to-bottom like normal, synchronous code", "color": "green" }
  ]
}
```

```javascript
// 1. Callback style
setTimeout(() => {
  console.log("This runs after 1 second");
}, 1000);

// 2. Promise style
function waitOneSecond() {
  return new Promise((resolve) => {
    setTimeout(() => resolve("done waiting"), 1000);
  });
}
waitOneSecond().then((result) => console.log(result));

// 3. async/await -- built on Promises, reads like synchronous code
async function run() {
  const result = await waitOneSecond();
  console.log(result);
}
run();
```

`async`/`await` is not a different mechanism from Promises — it's syntax that makes Promise-based code easier to read. `await` can only be used inside a function marked `async`.

## Try It (2 Minutes)

Open your browser console and paste this in:

```javascript
function makeGreeting(greeting) {
  return function (name) {
    return `${greeting}, ${name}!`;
  };
}

const sayHello = makeGreeting("Hello");
const sayNamaste = makeGreeting("Namaste");

console.log(sayHello("Priya"));     // Hello, Priya!
console.log(sayNamaste("Priya"));   // Namaste, Priya!
```

Notice `sayHello` and `sayNamaste` each "remember" their own `greeting` value, even though `makeGreeting` already finished running by the time you call them. That's a closure — the exact same mechanism as the counter example above, just with a string instead of a number.
