# REST API Design — FAQ

## Does using JSON over HTTP automatically make an API RESTful?

No — this is a very common misuse of the term. REST implies specific conventions and constraints: resources modeled as nouns in URLs, HTTP methods carrying the action, status codes accurately reflecting outcome, and (in the fuller original sense) stateless interactions. An API can serve JSON over HTTP and still not be RESTful — for example, one that uses only POST for every operation with the action encoded in the request body (`{"action": "delete_user"}`) is using JSON over HTTP but ignoring REST's conventions entirely. "JSON API" and "RESTful API" aren't synonyms, even though they overlap heavily in practice.

## Is GraphQL better than REST?

No — it's a genuine tradeoff, not a strict upgrade. REST's fixed resource shapes are simple to cache by URL and straightforward to reason about, but can lead to over-fetching or under-fetching, requiring multiple round-trips to assemble some views. GraphQL lets a client specify exactly the fields it needs in one request, avoiding both, but at the cost of significantly harder HTTP-level caching and more server-side complexity. REST tends to fit public, general-purpose APIs well; GraphQL tends to fit client-driven applications with complex, highly variable data needs. Neither replaces the other universally.

## Is PUT the "correct" way to update a resource, and PATCH just an optional shortcut?

No — they mean genuinely different things, not one being a lesser version of the other. PUT replaces the resource entirely (anything omitted is treated as cleared); PATCH applies a partial change (only included fields change). Using PUT when you actually mean a partial update can silently wipe fields the client never intended to touch. Choose based on what the client is actually sending — the resource's complete new state (PUT) or just a change to part of it (PATCH) — not based on which one seems more "standard."

## Do I need to use idempotency keys on every POST endpoint?

No — only on non-idempotent operations where a duplicate caused by a retry would actually matter (payments, orders, anything with a real-world side effect that's costly to duplicate). A POST that creates a low-stakes, easily-corrected resource (a draft comment, say) usually doesn't need this complexity. The judgment is about the cost of a duplicate, not a blanket rule applied to every POST endpoint regardless of consequence.

## Why does versioning matter if I control both the API and every client that uses it?

It matters less in that specific case — if you genuinely control every consumer and can deploy client and server changes atomically together, strict versioning discipline is less critical, since there's no unknown third party depending on the old shape. It becomes essential the moment any external party (a public API, a mobile app you can't force-update instantly, a partner integration) depends on your API independently of your own deployment schedule — which is the far more common real-world situation this course assumes.

## Is offset-based pagination just wrong, and should I always use cursor-based instead?

No — offset-based pagination is genuinely fine for small, stable, or admin-only datasets where "jump to page 12" matters more than protecting against concurrent-write skew, and its simplicity (both to implement and for a client to reason about) is a real advantage in those cases. Cursor-based pagination earns its added complexity specifically on large or actively-mutating datasets, where offset's weaknesses (slow high offsets, skip/duplicate on concurrent writes) actually manifest. Pick based on the dataset's actual size and mutation rate, not as a blanket rule.

## Why does the API-design world care so much about status codes specifically?

Because status codes are the one thing every piece of generic tooling — retry logic, monitoring, alerting, HTTP client libraries — is built to trust as the primary success/failure signal, by HTTP convention. An API that returns `200` for every outcome (with the real result buried in the body) breaks that trust for every downstream consumer that hasn't specifically read and adapted to that API's custom body-shape convention. Getting status codes right isn't a stylistic preference — it's what makes an API interoperate correctly with tooling nobody involved in building the API had to coordinate with directly.

## Do I need to implement HATEOAS to have a "real" REST API?

No — despite HATEOAS being part of Fielding's original REST description and often treated as the "purist" ideal, it's rarely fully implemented in real-world production APIs. Most consumers build against fixed, documented URL patterns rather than following dynamically-returned links, which is a practical, widely-accepted departure from the fullest interpretation of REST. An API missing HATEOAS isn't thereby "not really RESTful" in any way that matters practically — it's simply following the much more common real-world convention.
