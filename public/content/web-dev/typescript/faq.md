# TypeScript — FAQ

## Does TypeScript make my code faster at runtime?

No, and this is worth correcting directly — TypeScript's types are entirely erased during compilation, leaving plain JavaScript with no trace they ever existed. There's no runtime type-checking machinery left running, so there's no runtime performance cost from using types, but there's also no runtime performance *benefit* either — TypeScript's value is exclusively at compile time / edit time (catching mistakes before code runs), not at execution time.

## Do I need to rewrite my whole JavaScript codebase to adopt TypeScript?

No — incremental adoption is the normal, expected path, not a compromise. Because every valid JavaScript file is already valid TypeScript, you can rename files to `.ts` one at a time, add types gradually, and even keep `strict` mode off for legacy files while requiring it for new ones. TypeScript's own compiler supports mixed `.js`/`.ts` codebases specifically to make this realistic; very few real production migrations happen as one all-at-once rewrite.

## If TypeScript compiles away, can it actually catch a bug from bad data at runtime, like a malformed API response?

No — this is a genuinely important limit to understand, not a minor caveat. TypeScript's checking happens entirely at compile time, based on the types you've declared or that it inferred; it has no visibility into what actually arrives over the network at runtime. If you type an API response as `User` but the server actually sends back something missing a required field, TypeScript will not catch that — it trusted the type you gave it. Runtime validation (a library like Zod, or manual checks) is the correct tool for genuinely verifying data that crosses a real I/O boundary; TypeScript verifies your own code's internal consistency, not external reality.

## Is `any` the same as "no type," or is it actually worse than that?

It's meaningfully worse than simply having no type information — `any` doesn't just fail to help, it actively suppresses checking everywhere that value flows afterward, silently, with no warning that this suppression is happening. A value with no declared type at all in a loosely-configured project might still get inference applied to it in various places; `any` explicitly opts out of all of that everywhere it's used, including at every downstream consumer.

## Why does TypeScript sometimes complain about code that "obviously works fine"?

Usually because the type reflects a broader possibility than the one specific case you're thinking about — array access (`arr[0]`) is typed as possibly `undefined` under `strictNullChecks` because *in general*, the array could be empty, even if you happen to know it never is in this particular call. The compiler reasons from the declared type, not from your specific runtime knowledge; the fix is usually to either actually handle the edge case, or narrow/assert deliberately with a documented reason, rather than assuming the compiler is simply being overly cautious.

## Should I use `enum` or a string-literal union for a fixed set of values?

Both are valid, and the tradeoff is worth knowing rather than defaulting to one automatically. A string-literal union (`type Status = "pending" | "shipped" | "delivered"`) compiles to nothing extra at runtime — true type erasure, zero runtime footprint. A numeric `enum` actually generates a small runtime JavaScript object, which is a real (if usually minor) departure from TypeScript's typical "types are free" guarantee. Many real, modern codebases prefer string-literal unions for exactly this reason, though `enum` remains fully valid and is still common, especially in codebases that adopted TypeScript earlier.

## Can TypeScript work with React, Node, or other frameworks, or is it a separate thing I'd use instead?

TypeScript is a general-purpose addition to JavaScript itself, not tied to any one framework — it works with React (`.tsx` files, typed props/state), Node.js (typed request/response handling, typed database queries), and virtually every major modern JavaScript framework, most of which now ship first-class TypeScript support in their own tooling. You're not choosing TypeScript *instead of* a framework; you're choosing to write that framework's code with types.

## I turned on `strict` mode and got hundreds of errors on an existing project. Did I do something wrong?

No — this is the expected, normal result of enabling `strict` on a codebase that was written without it, not a sign of a misconfiguration. `strictNullChecks` in particular tends to surface a large number of previously-implicit, unchecked `null`/`undefined` assumptions all at once, because those assumptions existed in the code the whole time — `strict` just makes them visible instead of allowing them to fail silently at runtime later. Fixing them incrementally (rather than turning `strict` back off) is the recommended path; see the Real-World Scenarios tab for what happens when teams instead disable it "temporarily."
