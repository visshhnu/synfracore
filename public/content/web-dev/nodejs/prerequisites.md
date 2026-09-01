# Node.js — Prerequisites

## What You Need Before Starting

### 1. Solid JavaScript (required)

This is a hard prerequisite, not a formality. Node.js is JavaScript — the syntax, the language semantics, and the event-loop *concept* are all identical to what you already learned in this platform's JavaScript course. This course does not re-teach:

- Functions, closures, and scope
- Arrays and objects, including destructuring and spread
- Promises and `async`/`await`
- The event-loop concept (call stack, hand off slow work, come back once free)

If any of those feel shaky, this platform's **JavaScript** technology is the right place to build them first — Node's Fundamentals tab starts directly with `require`/`module.exports` and the `fs` module, assuming the language itself is already comfortable.

### 2. Basic command-line comfort (recommended, not required)

Running `node script.js`, `npm install`, and navigating directories (`cd`, `ls`/`dir`) is the normal day-to-day workflow for Node development. The Installation tab walks through the exact commands needed — genuine terminal fear isn't a blocker, but expect to spend a little time getting comfortable with it early rather than avoiding it throughout the course.

### 3. What you do *not* need yet

- **Prior backend or server experience in any language** — this course assumes zero prior server-side experience. Whatever a "server," a "port," or an "HTTP request" concretely means in practice is explained from scratch as it comes up.
- **A specific framework (Express, etc.)** — this technology covers Node itself, the runtime underneath any framework. Express is a separate technology on this platform, and understanding raw Node first is what makes Express's abstractions (routing, middleware) make sense as *conveniences* rather than magic.
- **Database experience** — not touched in this technology at all; covered separately when backend work reaches a database-driven project.

### Quick self-check

Can you explain, without looking it up, what a closure is and write a short example of `async`/`await` handling a `fetch` call with error handling? If yes, you're ready to start at Fundamentals. If either one feels unclear, spend more time in this platform's JavaScript course first — Node's material assumes both are already solid, and re-explaining them here would only slow down what's actually new: running JavaScript on a server.
