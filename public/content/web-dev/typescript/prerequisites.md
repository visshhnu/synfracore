# TypeScript — Prerequisites

## What You Need Before Starting

### 1. Solid JavaScript fundamentals (required)

Variables and scope (`let`/`const`), functions and return values, objects and arrays, and `async`/`await`. TypeScript is not a separate language — it's JavaScript plus a type system, and this course's own Fundamentals tab starts directly with TypeScript-specific material (type annotations, interfaces) rather than re-teaching JavaScript syntax from scratch. If writing a plain function that takes an object, checks a property, and returns something derived from it isn't yet comfortable, this platform's own JavaScript technology is the right starting point first.

### 2. Basic Node.js / npm familiarity (recommended, not required)

This course's examples run the TypeScript compiler (`tsc`) via npm scripts and `npx`. The Installation tab covers `npm install` and running compiler commands from scratch, but general comfort with a `package.json` and running `npm install`/`npm run` speeds things up considerably.

### 3. What you do *not* need yet

- **Prior experience with any other statically-typed language** (Java, C#, C++) — TypeScript's type system is explained from scratch here, and its structural typing model is actually different enough from most class-based languages' nominal typing that prior experience there can occasionally create more confusion than it removes, not less.
- **Deep JavaScript async internals or the event loop** — those are covered in this platform's JavaScript technology if not already comfortable; TypeScript's type system applies the same way regardless of how comfortable you are with async mechanics specifically.
- **Framework experience (React, Node/Express, etc.)** — this course teaches TypeScript itself, independent of any specific framework; framework-specific typing patterns are covered in each framework's own course.

### Quick self-check

Can you already write, without looking anything up, a JavaScript function that takes an object parameter, reads a couple of its properties, and returns a new object built from them — something like `function summarize(order) { return { total: order.price * order.qty }; }`? If yes, you're ready to start at Fundamentals — you already know everything TypeScript adds types *to*. If that feels unclear, spend time with this platform's JavaScript technology first; the TypeScript material here builds directly on that foundation rather than covering it again.
