# React — Prerequisites

## What You Need Before Starting

### 1. Solid JavaScript (required)

React is a JavaScript library — every component you'll write is JavaScript (or JSX, which compiles to JavaScript function calls) underneath. Specifically, this course assumes real comfort with:

- **Functions** — declarations, arrow functions, parameters, return values
- **Arrays and objects**, including common array methods (`.map`, `.filter`, `.find`) — `.map` in particular shows up constantly for rendering lists of components
- **Destructuring** — `const { name, age } = user` and `const [first, second] = array` — props and hooks are both consumed with this syntax throughout every example on this platform
- **`async`/`await`** — data fetching inside `useEffect` is written this way, not with raw `.then()` chains

If any of this feels shaky, this platform's own **JavaScript** technology (in this same Frontend/Web Development domain) is the right stop first — React's Fundamentals tab starts directly with JSX and components, assuming that foundation is already solid rather than re-teaching it.

### 2. Basic HTML/CSS (recommended, not required)

You don't need deep CSS expertise, but knowing what a `<div>`, a `<button>`, and a `<form>` are — and roughly how class-based styling works — means you can actually build something that looks like a real UI while learning React's mechanics, rather than fighting two unfamiliar things simultaneously.

### 3. What you do *not* need yet

- **Prior experience with any other UI framework** — Vue, Angular, Svelte experience isn't assumed and won't be referenced as a baseline; React is taught from first principles here.
- **Prior TypeScript** — React works completely fine written in plain JavaScript, and that's how this course's Fundamentals through Advanced material is written. Later modules do touch how JSX and TypeScript interact (typing props, typing hook state) for when you're ready, but it's not a prerequisite to start.
- **Command-line build tooling experience** — the Installation tab walks through the modern setup (Vite) from scratch; you don't need to already understand bundlers or build configs.

### Quick self-check

Can you write, without looking anything up, a function that takes an array of objects like `[{ name: "Alice", age: 30 }, { name: "Bob", age: 25 }]` and returns just the names, using `.map` and destructuring? If yes, you're ready to start at Fundamentals. If that feels unclear, spend time with this platform's JavaScript technology first — React's material builds directly on exactly that kind of comfort rather than re-covering it.
