# JavaScript — FAQ

## Is JavaScript the same as Java?

No — despite the similar name, they are unrelated languages with different syntax, different execution models, and different creators. The name "JavaScript" was largely a 1990s marketing decision (Java was popular at the time); the languages share only surface-level C-family syntax similarities (curly braces, semicolons) with essentially every other C-descended language. Java is a statically-typed, compiled (to bytecode) language typically used for backend systems and Android apps; JavaScript is dynamically-typed and runs natively in browsers (and via Node.js, on servers).

## Is JavaScript single-threaded?

Yes, with an important nuance: the JavaScript engine itself executes on a single thread — only one line of your JavaScript code runs at any given instant, and two pieces of JavaScript can never truly run simultaneously in the same context. But the browser (or Node.js) around that single thread handles things like network requests, timers, and file I/O using separate underlying mechanisms (Web APIs in a browser, libuv's thread pool in Node.js), and hands the results back to JavaScript's single thread via the event loop once they're ready. That's how JavaScript stays responsive during a slow network request without actually running multiple threads of your code at once.

## Do I need to learn a framework (React, Vue) before I can get a job?

Not to start learning, but realistically yes, before most job applications — the overwhelming majority of real frontend job postings list a specific framework (usually React) as a requirement. The correct order is: learn plain ("vanilla") JavaScript deeply first (this course), then learn a framework — frameworks are built on top of JavaScript concepts (closures, the event loop, `this`, modules) and are genuinely harder to understand well without that foundation already in place. Skipping straight to a framework tends to produce developers who can copy patterns but can't debug when something breaks outside the framework's guardrails.

## What's the difference between JavaScript and ECMAScript?

ECMAScript is the official language specification (standardized by TC39, a technical committee under Ecma International); JavaScript is the most well-known implementation of that specification. In practice the terms are used almost interchangeably in casual conversation, but "ES6" / "ES2015", "ES2020", etc. specifically refer to yearly ECMAScript specification versions — the actual source of truth for what syntax is officially part of the language in a given year.

## Why does `0.1 + 0.2` not equal `0.3` in JavaScript?

It's not a JavaScript bug — it's how essentially every language using IEEE 754 floating-point numbers (which is nearly all of them, including Python, Java, and C) represents decimal numbers in binary, where numbers like 0.1 can't be stored exactly. `console.log(0.1 + 0.2)` prints `0.30000000000000004`. For money or anything requiring exact decimal precision, don't do arithmetic directly on floating-point numbers — work in the smallest whole unit (cents instead of dollars) or use a dedicated decimal library.

## Do I need to learn TypeScript?

Not to learn JavaScript itself — TypeScript is a separate (though closely related) language that adds static typing on top of JavaScript, compiling down to plain JavaScript before it runs. It's widely used in professional codebases and worth learning after you're comfortable with plain JavaScript, but it is a genuinely different skill, not a JavaScript prerequisite, and is out of scope for this technology.

## Is `let` always better than `var`? Is there ever a reason to use `var`?

For new code, use `let`/`const` — block scoping matches what almost everyone intuitively expects, and it avoids the closure-in-a-loop and accidental-leak bugs `var`'s function scoping causes. There's essentially no scenario in modern JavaScript where `var`'s function-scoping behavior is something you'd deliberately want; it exists in the language for backward compatibility with code written before `let`/`const` existed (2015 and earlier), not because it's still recommended.

## Can JavaScript run outside the browser?

Yes — this is a genuinely major part of why JavaScript matters as much as it does today. **Node.js** is a JavaScript runtime that runs the same language on a server, in a terminal, or in a build tool, completely independent of any browser. It's what npm, most modern JavaScript build tooling, and most JavaScript-based backend servers run on. See the Installation tab for setting it up.
