# Next.js — FAQ

## Is Next.js a replacement for React?

No — Next.js is built directly on top of React, not a replacement for it. A Next.js page is still made of React components using props, state, and hooks exactly as this platform's own React technology teaches; Next.js adds routing, rendering-strategy choice, and build tooling around that component model, none of which replaces it. Learning Next.js without solid React fundamentals first is why this platform's Prerequisites tab treats React as a hard requirement, not a suggestion.

## Do I have to use Server Components to use Next.js?

*(needs verification — this answer is genuinely version/paradigm-dependent and shouldn't be treated as fixed)* Whether Server Components are required, optional, or the default depends on which router paradigm and version of Next.js a project is using — this is exactly the kind of specific-API-surface question this guide deliberately avoids answering with false certainty. Confirm against current Next.js documentation for the specific paradigm/version you're actually working with.

## Why does this course teach both the Pages Router and App Router distinction instead of just the current one?

Because both genuinely exist in real, active codebases and real job listings — a five-year-old production Next.js app and a brand-new one can look structurally different, and a developer who only recognizes one paradigm can be genuinely confused encountering the other for the first time on a real team. This platform's Overview and Roadmap tabs frame this directly as real history rather than glossing over it, since the practical cost of not knowing it (see the Real-World Scenarios tab) is a real, common onboarding friction point.

## Is Next.js only for building React web apps with server-rendering?

No, though server-rendering and SEO-sensitive content are genuinely common reasons teams choose it — Next.js's actual value proposition is broader: it's a coherent framework providing routing, a choice of rendering strategies per page, and build tooling, which is useful even for apps that lean heavily on client-side rendering for most of their interactive surface. The "it's for SEO" framing undersells the rest of what it provides.

## Why is picking the right rendering strategy described as "the real skill" in this course rather than just a setup step?

Because it's a genuine, ongoing tradeoff decision with real consequences — defaulting every page to the same strategy (commonly "always fresh," out of caution) quietly costs real server budget and speed on pages that didn't need that freshness, as covered directly in the Advanced tab and Scenario 1 of the Real-World Scenarios tab. It's not a one-time setup choice; it's a decision worth revisiting as an app's actual usage patterns become clearer.

## My page shows old data even though I updated the underlying source. Is Next.js broken?

Almost certainly not — this is very likely a caching/revalidation configuration working exactly as set, just not matching what you actually wanted for that specific page's freshness. See the Troubleshooting tab's "stale data" issue for the diagnostic steps: confirm which rendering strategy the page actually uses and what its revalidation setting is, rather than assuming a framework bug.

## Should I be worried that so much of this course's Next.js content is tagged "needs verification"?

No — that's a deliberate choice reflecting an honest, real property of this specific technology: its core paradigm has genuinely changed before (Pages Router → App Router), so exact API names are more likely to shift than the underlying concepts they implement. The concepts themselves (rendering-strategy tradeoffs, file-system routing as an idea, the meta-framework value proposition) are taught as durable fact throughout this course; only the specific, individually-verifiable API surface is flagged, so you know exactly what to double-check before writing real production code.

## Is a Next.js project's local dev-server behavior a reliable guide to how it'll behave in production?

Not always, and this course flags this directly in a few places (see Troubleshooting Issue 3 and Issue 5) — caching/revalidation and server-vs-client code boundaries in particular can behave more forgivingly in local development than in an actual production build, which is a real, common source of "it worked locally" bugs. Testing a genuinely production-like build before trusting a fix in either of these areas is worth the extra step.
