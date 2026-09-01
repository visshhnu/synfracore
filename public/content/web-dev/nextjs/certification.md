# Next.js Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Vercel/Next.js — no official proctored certification exists** | — | — | — |
| Various third-party course "certificates of completion" (Udemy, Coursera, freeCodeCamp-adjacent projects) | Various | Varies | Project/quiz-based |

Vercel (the company that maintains Next.js) does not currently run an official proctored certification program comparable to, say, AWS's or Kubernetes' certifications. *(needs verification — Vercel/Next.js's certification offerings could change; confirm directly on nextjs.org and vercel.com before treating this absence as permanent)*

What actually gets checked in hiring for Next.js roles, in practice, is a portfolio — real projects demonstrating deliberate rendering-strategy choices, working API routes, and a working deployed app — far more than any single credential. This mirrors how this platform frames React's certification landscape (see the React technology's own Certification tab): a real project you can walk through end to end carries more weight than a certificate of completion.

*(needs verification — pricing/format for any specific third-party course claiming a "Next.js certificate"; confirm current details directly with that provider before citing them as fact)*

---

## Core Topics a Hiring Interview Actually Probes

Even without a formal exam, these are the topics that come up repeatedly in real Next.js interviews and technical screens — treat this as the closest thing to a "syllabus" for this technology:

```text
1. What a meta-framework adds over plain React (routing, rendering
   strategy, build tooling) -- the conceptual value proposition
2. Rendering-strategy tradeoffs -- ahead-of-time vs per-request vs
   client-side, and picking correctly per page
3. The historical Pages Router -> App Router shift -- real history,
   and why both still show up in real codebases
4. Server-only vs client-exposed environment variables, and the
   actual security reason for the distinction
5. Caching/revalidation at a conceptual level -- why ahead-of-time
   content needs a refresh mechanism at all
6. Debugging a hydration mismatch -- a genuinely common real bug
   this platform's Troubleshooting tab covers directly
```

*(needs verification — this list reflects durable, framework-level concepts; the exact API names an interviewer might reference for any of these should be checked against current Next.js docs, not assumed from this list)*

## Building Real Evidence Instead of a Certificate

1. **Deploy at least one real project** (see the Projects tab) — a live, working URL is stronger signal than any certificate for this specific technology, precisely because there's no dominant proctored exam to compare against.
2. **Be able to explain a rendering-strategy decision you actually made**, not just recite the tradeoff generically — "I used ahead-of-time rendering for the blog listing because it updates a few times a week, and per-request rendering for the checkout page because inventory changes constantly" is the kind of specific, judgment-backed answer that signals real understanding.
3. **Know which router paradigm your own project uses**, and be ready to explain that choice too — given the platform's real historical paradigm shift, this is a legitimate, common interview question in itself.
