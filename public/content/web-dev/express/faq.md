# Express.js — FAQ

## Is Express required to build a Node.js API?

No — Node's built-in `http` module is fully capable of serving HTTP requests on its own, with no external dependency required. Express doesn't add new fundamental capability; it removes the repetitive boilerplate of manually parsing URLs, matching routes, checking methods, and parsing bodies that the bare `http` module leaves entirely to you. For a genuinely trivial single-endpoint script, `http` alone is fine. For anything with more than a couple of routes, Express (or a comparable framework) is the practical, standard choice — not because `http` can't do it, but because reimplementing routing and middleware by hand for every project is wasted, error-prone effort.

## Does Express automatically catch errors thrown in an async route handler?

Historically, no — and this is a genuinely important, commonly-misunderstood gotcha. A synchronous `throw` inside a regular route handler is caught automatically by Express's default error handling and routed to error-handling middleware. A rejected Promise from an `async` handler was **not** caught the same way in Express 4.x by default — the rejection could go unhandled, potentially crashing the process or leaving the request hanging. The fix is explicit: wrap `await` calls in `try/catch` and call `next(err)`, or use a reusable wrapper utility for every async route. `(needs verification — recheck the exact current default behavior against the Express major version actually in use, since this specific mechanic has evolved across versions and shouldn't be stated unqualified without checking.)`

## Why does my middleware seem to just never run?

Almost always a registration-order issue — Express runs middleware and routes strictly in the order they were registered, top to bottom. If a route matches and sends a response before Express ever reaches a later-registered middleware, that middleware simply never executes for that request — no error, no warning. Check whether the middleware in question is registered *before* the routes it's meant to affect, not just that it's registered somewhere in the file.

## Is `express.Router()` actually necessary, or can I just put everything on `app`?

Not strictly necessary for a small project — a handful of routes directly on `app` works fine. It becomes genuinely necessary for maintainability once an app has more than a few resources' worth of routes: `Router()` lets each resource's routes live in their own file, mounted onto the main app with a clean prefix, rather than all being crammed into one growing file. Most real production Express codebases use it from early on specifically to avoid that growth problem later.

## Why is my `req.body` `undefined` even though I'm definitely sending a JSON body?

`express.json()` middleware almost certainly hasn't been registered, or was registered after the route in question. Express does not parse request bodies automatically — that's entirely opt-in behavior via `app.use(express.json())`, registered before any route that needs to read `req.body`. This is the single most common Express beginner bug precisely because it produces no error at all, just a silently missing value.

## What's the actual difference between `helmet` and `cors` — don't they both handle security?

They handle different, unrelated concerns that both happen to fall under "security." `helmet` sets a collection of HTTP response headers (with sensible defaults) that reduce exposure to certain browser-side attack classes — it's about what the server tells any browser about how to treat its responses. `cors` specifically controls which origins are allowed to make cross-origin requests to the API at all from a browser — it's about access control between specific origins, not general header hardening. A real production API typically uses both, for different reasons. `(needs verification — recheck specific current default configurations against source.)`

## Do I need to learn Express before learning a newer framework like Fastify or Hono?

Not strictly, technically — but it's still the practically recommended path. Express remains the most widely-adopted Node.js web framework, meaning the overwhelming majority of existing tutorials, Stack Overflow answers, job postings, and production codebases assume it. Its core concept — the middleware pipeline — also transfers conceptually to most other Node frameworks, even where the exact API differs. Learning Express first maximizes both learning-resource availability and near-term employability, even if a specific project later benefits from a newer framework's specific performance or API design.

## Why did my Express app crash with "Cannot set headers after they are sent"?

More than one response was sent for the same request — `res.send()`/`res.json()`/`res.end()` was called twice, somewhere in the chain for that request. The most common concrete cause is a missing `return` after a conditional response inside a middleware: without it, execution falls through and calls `next()` (or sends a second response) even though a response was already sent. Adding `return` before every conditional `res.json()`/`res.send()` call is the standard fix.
