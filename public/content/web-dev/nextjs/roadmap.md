# Next.js — Learning Roadmap

## Estimated Time to Job-Ready

**4-6 weeks** of consistent learning (2-3 hours/day), assuming solid React fluency already — this roadmap assumes components, props, state, and hooks are comfortable and builds Next.js-specific concepts directly on top of that rather than re-teaching React itself.

## Phase 1: Routing & Project Structure (Week 1)

- Get a project scaffolded and running locally (see Installation tab)
- Understand file-system routing as a concept — a file's location determines its URL — before worrying about exact syntax
- Learn the historical Pages Router vs. App Router distinction and why both exist in real codebases
- Build a small multi-page app using shared layouts and client-side navigation between pages

**Checkpoint:** can you explain, without looking anything up, why Next.js's navigation mechanism is preferred over a plain `<a>` tag for internal links? *(the client-side navigation vs. full-reload distinction from the Fundamentals tab)*

## Phase 2: Rendering Strategies & Data Fetching (Week 2)

- Understand the three-way tradeoff: ahead-of-time rendering, per-request rendering, client-side rendering — and what each is actually good for
- Fetch real data (from a public API or a small local data source) into a page and render it
- Build a dynamic route (e.g. a product-detail page parameterized by ID) and confirm it renders correctly for multiple different IDs

**Checkpoint:** for a page showing a list of blog posts that get published a few times a week, which rendering strategy would you default to, and why? *(this is a genuine judgment call the Advanced tab covers in depth — the right answer depends on how "fresh" the list actually needs to feel to visitors)*

## Phase 3: API Routes, Middleware & Real App Structure (Week 3-4)

- Build a route handler / API route that talks to a real data source (even a simple one) — practice the pattern of keeping credentials server-only
- Add a loading state and an error state to at least one route deliberately, rather than leaving the default behavior
- Understand middleware conceptually and where it would fit in a real app (auth-gating a section, redirecting based on some condition)
- Complete a hands-on project combining routing, a mix of rendering strategies, and at least one API route — see the Projects tab

**Checkpoint:** can you explain the actual security reason server-only environment variables must never be shipped to the client bundle, in your own words, not just recite the naming convention?

## Phase 4: Caching, Performance & Interview Readiness (Week 5-6)

- Understand caching/revalidation conceptually — why ahead-of-time rendered content needs a refresh mechanism at all
- Practice diagnosing a deliberately-introduced rendering-strategy mismatch (see Troubleshooting tab) — this is a genuinely common real interview and on-the-job scenario
- Review this course's Interview Q&A material and practice explaining the historical Pages-to-App-Router shift, rendering-strategy tradeoffs, and what a meta-framework adds over plain React — out loud, not just recognizing the answer when reading it
- Build (or extend an existing) project that a portfolio reviewer or interviewer could reasonably ask you to walk through end to end

## Common Pitfalls Specific to Next.js (Not Generic Study Advice)

- **Defaulting every page to the "always fresh" rendering strategy out of caution** — this quietly costs real speed and server load on pages that didn't actually need per-visit freshness
- **Copying a code example from documentation or a tutorial without checking which paradigm/version it targets** — Pages Router and App Router code is not interchangeable, and mixing patterns from both in confusion is a real, common beginner trap
- **Accidentally exposing a server-only secret to the client bundle** — a genuinely easy mistake to make once, and a serious one; treat the client/server variable distinction as a hard rule, not a suggestion
- **Assuming a caching/revalidation setting is working as intended without actually verifying it** — see the Troubleshooting tab's stale-data scenario; this is easy to get subtly wrong even when the code looks correct

## Getting Your First Next.js-Heavy Role

1. **Portfolio:** at least one project that demonstrates a genuine rendering-strategy decision (not every page rendered the same way by default) plus at least one real API route/route handler — this signals you understand the framework's actual value proposition, not just its component syntax
2. **Resume:** be specific — "chose per-page rendering strategies based on data-freshness requirements, reducing server load on high-traffic static pages" is far stronger than "experience with Next.js"
3. **Know you'll encounter both router paradigms in the wild:** interviewers and real codebases span both Pages Router and App Router eras — being able to recognize which one you're looking at, and why it matters, is a real, practical skill
4. **Interview prep:** rendering-strategy tradeoffs and the historical paradigm shift come up constantly precisely because they distinguish real, thought-through experience from tutorial-level familiarity
