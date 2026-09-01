# Next.js — PYQ (Previously Asked / Practice Questions)

**Framing note:** Next.js/Vercel does not run a proctored certification with a public past-paper archive — no such archive exists to draw from. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Next.js concepts rather than invented "leaked" content. Where a question would require citing a specific current API name, the answer flags it as needing verification rather than stating it as settled fact — consistent with this technology's higher evergreen-content risk (see the Notes tab's Versioning Note).

---

### 1. (Domain: Architecture) What does a meta-framework like Next.js add on top of plain React that React itself deliberately doesn't provide?

**Answer:** Routing derived from your project's file structure, a choice of rendering strategies (deciding per-page how much work happens ahead of time vs. per-request vs. in the browser), and integrated build/bundling tooling. React itself provides the component model, state, and rendering engine, but is deliberately unopinionated about how a URL becomes a page or how the app gets built for production — a meta-framework makes those decisions coherently as one system rather than leaving a team to wire together separate tools.

---

### 2. (Domain: Rendering Strategies) A page's content barely changes and is identical for every visitor. Which rendering strategy is the best default, and why?

**Answer:** Ahead-of-time rendering — since the content is the same for everyone and rarely changes, there's no benefit to redoing the rendering work on every single request; doing so would only add real server cost and latency with no actual freshness gain. Per-request rendering is the right choice specifically when content genuinely must reflect the current moment for every visitor, which this page does not.

---

### 3. (Domain: Architecture History) Explain the real historical relationship between the Pages Router and the App Router. Why does this matter for someone learning Next.js today?

**Answer:** The Pages Router was Next.js's original routing/data-fetching model. The App Router was introduced later as a new paradigm alongside it, built around newer React server-rendering capabilities, with a different directory convention and data-fetching model. Both are real and both still appear in active real-world codebases and tutorials — a learner who only knows one paradigm may be confused encountering the other in a real job's existing codebase, which is exactly why this matters practically, not just historically.

---

### 4. (Domain: Security) Why must a server-only environment variable never be exposed to the client-side JavaScript bundle?

**Answer:** Anything shipped to the client bundle is visible to anyone who inspects the page's JavaScript in their browser — there is no meaningful secrecy once a value reaches client-side code. Server-only variables (database credentials, private API keys) must stay server-side specifically because the client/server boundary is a real security boundary, not just a naming convention; a leaked credential from a client bundle is a genuine, exploitable security incident, not a cosmetic mistake.

---

### 5. (Domain: Troubleshooting) A developer sees a hydration mismatch warning in the browser console. What's the most common actual cause, and why does it happen specifically in a framework that renders on both server and client?

**Answer:** Using a value that legitimately differs between server and client directly during render — the current date/time, `Math.random()`, or checking `window`/browser-only globals — rather than computing it only after the component has mounted in the browser. Because the framework renders once on the server and then again ("hydrates") on the client, any such value genuinely can differ between those two renders, and the framework flags the mismatch rather than silently ignoring it.

---

### 6. (Domain: Caching) A team updates their database, but a live page keeps showing the old value for a while afterward. Is this necessarily a bug?

**Answer:** Not necessarily — if the page uses an ahead-of-time rendering strategy with a caching/revalidation window, this can be the system working exactly as configured, just not matching what the team actually intended for that specific page's freshness requirement. The real fix in that case isn't a bug fix but a configuration change — either shortening the revalidation window or choosing a different rendering strategy for that page.

---

### 7. (Domain: Build/CI) Why might a Next.js project build successfully on a developer's local machine but fail in a CI pipeline?

**Answer:** Common causes are environment differences: a missing environment variable that only existed locally, a Node.js version mismatch between local and CI, or an import path that only differs from the actual file by casing — many developers work on case-insensitive filesystems locally, while CI runners are typically case-sensitive and will fail on a mismatch that never surfaced locally.

---

### 8. (Domain: Rendering Strategies) Why is client-side rendering generally a weaker default choice for a page's initial content, specifically regarding SEO and first paint?

**Answer:** A purely client-side-rendered page sends a mostly-empty HTML shell first, then fills in real content only after JavaScript downloads and runs in the browser — meaning search-engine crawlers and the visitor's first meaningful paint both wait longer than they would for content rendered ahead of time or per-request on the server. Client-side rendering is still the right choice for genuinely interactive, non-content-critical sections, but as a default for a page's primary content, it trades away real SEO and perceived-speed advantages the other strategies provide.

---

### 9. (Domain: Production Debugging) An import that works fine in local development throws an error only after deploying to production. What's a common, specific cause of this exact pattern?

**Answer:** Code that references browser-only globals (`window`, `document`) directly, imported into a file that also gets executed on the server during rendering — a local dev server may tolerate or mask this in ways a genuine production build doesn't. The fix is confining browser-only access to code that only runs after the component has mounted in the browser (an effect), never during the shared render path.

---

### 10. (Domain: Career/Interview Readiness) Why does this platform recommend building and deploying a real project rather than pursuing a certification for Next.js specifically?

**Answer:** Next.js/Vercel doesn't run an official proctored certification comparable to other technologies' exams, so there's no single credential that reliably signals competence here. A real, deployed project that demonstrates a deliberate rendering-strategy choice and at least one working API route is stronger, more specific evidence of actual understanding than a course-completion certificate — and it gives an interviewer something concrete to ask about, rather than a credential to take on faith.
