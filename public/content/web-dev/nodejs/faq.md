# Node.js — FAQ

## Is Node.js multi-threaded?

No, and this is worth correcting precisely rather than just saying "no." JavaScript execution in Node runs on exactly one thread — the same single-call-stack model as the browser. What's not single-threaded is I/O: libuv, Node's underlying library, hands file/network/DNS operations off to the operating system's async facilities (or a small internal thread pool for what the OS can't do natively async), and only brings the result back to the one JS thread once it's ready. So Node handles many concurrent connections without being multi-threaded for JS itself — the concurrency lives in the waiting, not in parallel code execution.

## Is Node.js good for CPU-heavy work, like image processing or video encoding?

Not natively — and this is exactly what blocks the event loop when someone tries it directly. A genuinely CPU-bound operation running on the main thread occupies the single JS call stack for its entire duration, meaning every other request the process is handling waits behind it, since there's no I/O to hand off during pure computation. The real answer is `worker_threads` (genuine parallel JS within the process) or offloading the work entirely to a separate service better suited to it. Node being poorly suited to CPU-heavy work *without* that escape hatch is a real, specific limitation — not a myth to wave away, and not a reason to avoid Node for the I/O-heavy parts of a system that don't have this problem.

## Is Node.js a framework, like Express or Django?

No — Node.js is the runtime; Express is a framework that runs *on top of* Node, adding routing and middleware conveniences. This distinction matters practically: everything a framework provides (matching a URL to a handler, parsing a request body) is something you can write yourself directly against Node's built-in `http` module, just with more code — which is exactly why this course builds a raw-`http` REST API before introducing Express, so the framework's abstractions read as genuine conveniences rather than unexplained magic.

## Why did my API's other, unrelated endpoints get slow when only one endpoint was doing something heavy?

This is the specific signature of a blocked event loop, not generic overload — because Node runs on one JS thread, a synchronous, CPU-heavy operation anywhere in the process (a large `JSON.stringify`, a synchronous crypto call, a `*Sync` `fs` call) blocks *every* concurrent request currently being handled, not just the one that triggered it. If unrelated endpoints degrade together under load, look for something synchronous and expensive somewhere in the request path, rather than assuming a database or infrastructure issue first.

## What's actually different between CommonJS and ES Modules, practically?

CommonJS (`require`/`module.exports`) is Node's original, synchronous module system, and still the default unless a project opts out. ES Modules (`import`/`export`) are the standardized JavaScript syntax, loaded asynchronously, and shared with modern frontend tooling — opted into via `"type": "module"` in `package.json` or the `.mjs` extension. The practical consequence: a project has to be consistent about which one it uses, since mixing them incorrectly (trying to `require()` an ES Module directly) is a real, common source of confusing loader errors — check `package.json`'s `"type"` field first when debugging one in unfamiliar code.

## My process crashed with an unhandled rejection — is that a Node bug?

No — it means somewhere in the code, an `async` function was called without being `await`-ed or `.catch()`-ed, and its eventual rejection had nowhere to go. Older Node versions only logged a warning for this; newer versions, by default, can terminate the process outright on an unhandled rejection, since it's treated as seriously as an uncaught synchronous exception. The fix is finding the fire-and-forget async call and adding explicit error handling, not suppressing the warning — `process.on("unhandledRejection", ...)` is worth having as a logged safety net, but it shouldn't be the only place errors are actually handled.

## Why do people say "use streams" for large files instead of just reading the whole file — does it really matter for a small app?

It matters proportionally to file size relative to available memory and to how many concurrent requests might be reading large files at once — for a genuinely small file, the difference is negligible either way. But `fs.readFile` loads the entire file into memory before any of it can be sent, so memory usage scales directly with file size, and a handful of concurrent large-file requests can add up fast. `fs.createReadStream().pipe(res)` keeps memory roughly constant regardless of file size and starts sending data immediately rather than waiting for the whole read to finish. It's a genuine architectural decision worth making deliberately once file sizes or concurrency stop being trivially small, not a premature optimization to avoid on principle.

## Does `npm install` always give me the same versions as my teammate?

Only if `package-lock.json` is committed to the repository and both of you run `npm ci` (not `npm install`) — `package.json` alone only specifies semver *ranges* (like `^4.19.2`), which can resolve to a newer matching version depending on exactly when the install runs and what's been published since. `package-lock.json` records the exact resolved version tree that was actually installed, and committing it is what makes installs reproducible across machines and over time, not `package.json`'s version ranges by themselves.
