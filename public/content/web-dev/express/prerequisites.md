# Express.js — Prerequisites

## What You Need Before Starting

### 1. Basic Node.js (required)

Running a script with `node file.js`, installing packages with `npm install`, and a working understanding of `require`/`import` and the module system. Express is a library that runs *on top of* Node — this course does not re-teach the Node runtime itself (the event loop, `npm`, modules). If any of that still feels shaky, this platform's own **Node.js** technology is the right starting point first; Express's Fundamentals tab picks up directly from there.

### 2. Basic understanding of HTTP methods and status codes (recommended, not required)

Knowing roughly what `GET`, `POST`, `PUT`, and `DELETE` are for, and that status codes like `200`, `404`, and `500` mean something specific, makes the routing and error-handling material click faster. It is not a hard requirement — the Fundamentals tab explains each method as it introduces the corresponding route type — but prior exposure (even just from using a REST API as a frontend developer) helps.

### 3. What you do *not* need yet

- **Prior experience with any other web framework** — Django, Flask, Rails, Spring, or anything similar. Express's middleware-based model is explained from scratch and doesn't assume familiarity with how another framework handles routing or requests.
- **Database experience** — connecting a route to a database is covered conceptually in Intermediate, with a pointer to this platform's Databases academy for the actual database-side depth; you don't need that background to start here.
- **Authentication/security background** — covered at a conceptual level in Advanced (rate limiting, `helmet`, `cors`) and built out properly in this platform's later Authentication technology, not assumed upfront.

### Quick self-check

Can you write and run a plain Node.js script that reads a JSON file with `fs.readFileSync`, installs and `require`s an npm package, and logs its output — without looking anything up? If yes, you're ready to start at Fundamentals. If any part of that (especially `require`/`npm install`) feels unfamiliar, spend time on this platform's Node.js technology first — Express is built entirely on those foundations rather than re-covering them.
