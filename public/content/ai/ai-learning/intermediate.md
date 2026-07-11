# AI Learning Engine — Intermediate

## How per-topic quizzes are actually generated

Each quiz question is generated specifically for the page you're on, tuned to the difficulty level selected (Beginner / Engineer / Architect) rather than pulled from a fixed, pre-written question bank. Beginner-level questions test definitions and basic recall — "what does X do." Engineer-level questions test applied understanding — "given this scenario, what would you do." Architect-level questions test design judgment and tradeoffs — "which approach would you choose, and why, given these constraints." The level you select changes the *kind* of question generated, not just its difficulty within the same style.

## Using the assistant effectively: specific prompts beat generic ones

The assistant has context about whatever page you're currently on — asking "explain this simply" gets a real, page-specific simplification, not a generic definition. A few prompt patterns that consistently produce more useful responses than a bare "explain this":

- **"Give me a real example"** — pushes past abstract definitions toward a concrete, worked scenario.
- **"Quiz me"** — triggers active-recall practice instead of passive re-reading, which is measurably more effective for retention than reading the same material again.
- **"What would an interviewer ask about this?"** — reframes the material specifically around how it gets tested in a real interview context, not just how it's explained academically.
- **"What's a common mistake people make with this?"** — surfaces the specific pitfalls worth being alert to, which static reference content doesn't always call out explicitly.

## Tracking progress over time

Quiz scores are tracked per topic and per difficulty level, not just as a single aggregate — this is deliberate, since "I understand Kubernetes broadly" and "I can answer Architect-level Kubernetes questions" are genuinely different claims, and conflating them into one score would hide exactly the gap worth knowing about. Reviewing which specific topics have low Engineer/Architect-level scores, even with a solid Beginner-level score, is a more actionable signal than an overall average — it tells you precisely where to focus next study time, rather than a vague "get better at Kubernetes generally."

## Why AI-generated quiz content still needs the underlying page to be accurate

The assistant generates questions grounded in the actual page content it has context on — this means the quality and accuracy of a topic's quiz questions is directly bounded by the quality of that topic's underlying written content. A page with the templated/placeholder content problem this site has been actively remediating (see the site's own internal content-quality tracking) would produce correspondingly generic or unreliable quiz questions if used as grounding — a real, practical reason page-content quality work and the AI features built on top of it aren't actually separate concerns.

## When to use "quiz me" vs. working through the written content first

Quizzing immediately, before reading a topic's content, is a legitimate and often effective learning strategy (retrieval practice, testing what you can figure out or already partially know) — but it works best as a *complement* to reading the underlying material, not a substitute for it entirely. For a genuinely unfamiliar topic, working through Fundamentals first, then quizzing to check retention, is generally more effective than quizzing cold on material you haven't seen at all — the quiz has nothing to correct against yet if you get something wrong with zero prior exposure to the actual content.
