# JavaScript — Learning Roadmap

## Estimated Time to Job-Ready

**8-12 weeks** of consistent learning (1.5-2.5 hours/day), assuming no prior programming experience. Faster (4-6 weeks) if you already know another programming language and are mainly learning JavaScript's specific syntax and async model.

## Phase 1: Core Syntax & the DOM (Week 1-3)

Get comfortable with the language itself before touching anything asynchronous.

- Variables (`let`/`const`), data types, operators
- Functions, including arrow functions
- Arrays and objects, including basic built-in methods
- The DOM: selecting elements, reading/writing `textContent` and attributes
- Event listeners: click, input, submit
- Build 2-3 tiny interactive pages (a counter, a to-do list, a simple form validator)

**Checkpoint:** Can you build a page where clicking a button changes visible text on the page, with no page reload — from scratch, without copying a tutorial?

## Phase 2: Asynchronous JavaScript & ES6+ (Week 4-6)

This phase is where most real JavaScript competence is actually built — async is where the language gets genuinely hard.

- Callbacks, then Promises, then `async`/`await` — in that order, so the "why" of each step is clear
- `fetch()` and working with a real public API
- Destructuring, spread/rest, template literals
- `import`/`export` modules
- Basic error handling (`try`/`catch`) for both sync and async code

**Checkpoint:** Can you fetch data from a real public API, handle a failed request without the page breaking, and display the result in the DOM?

## Phase 3: Depth & Production Patterns (Week 7-9)

- The event loop in depth: microtasks vs. macrotasks
- Prototypal inheritance and `class` syntax
- Closures used deliberately (private state, memoization)
- Debounce/throttle for real UI performance problems
- Generators (enough to recognize the pattern, not necessarily fluency)
- Read real open-source JavaScript — not just tutorials — to see these patterns in the wild

**Checkpoint:** Can you explain, out loud, why `setTimeout(fn, 0)` doesn't run "immediately," using the words "call stack," "microtask queue," and "macrotask"?

## Phase 4: Interview Ready & Portfolio (Week 10-12)

- Build all 3 portfolio projects (see the Projects tab)
- Work through the Interview Prep and Interview tabs — practice explaining answers out loud, not just reading them
- Do a few real coding exercises under time pressure (array manipulation, a small closure-based problem, an async data-fetching component)
- Review Troubleshooting and Real-World Scenarios — production bugs, not textbook problems, are what actually get asked about in interviews

**Checkpoint:** Given a live coding prompt ("debounce this search input," "fix this race condition"), can you solve it in under 15 minutes without looking anything up?
