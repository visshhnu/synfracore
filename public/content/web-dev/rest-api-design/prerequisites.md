# REST API Design — Prerequisites

## What You Need Before Starting

### 1. Basic understanding of HTTP (required)

You need to know that a **request** has a method (GET, POST, ...), a URL, headers, and optionally a body, and that a **response** has a status code, headers, and optionally a body. You don't need to know every method or every status code — that's what this course teaches — just the shape of a request/response pair. If "a request has a method and a URL" sounds unfamiliar, spend 20 minutes on MDN's HTTP overview first.

This platform's own **Express** technology (in this academy) is ideal prior context — building even one small API with it means every principle in this course maps onto something concrete you've already touched, rather than staying abstract.

### 2. Recommended: having built at least one basic API

Not required, but genuinely useful. If you've written even a handful of routes — a GET that returns a list, a POST that creates something — you'll recognize immediately why "resources as nouns" or "PUT vs PATCH" matter, because you've probably already made the mistake this course explains how to avoid.

### 3. Not needed

- **Any specific programming language or framework** — this course is deliberately language-agnostic. The design principles (resource modeling, status codes, versioning, idempotency) apply identically whether the API is implemented in Node, Python, Go, Java, or anything else.
- **Prior API design experience** — that's what this course teaches from the ground up.
- **Deep HTTP protocol internals** (TCP handshakes, HTTP/2 framing, etc.) — this course stays at the application-design level: methods, status codes, headers, URLs, bodies. Protocol internals aren't required to design a good API.

### Quick self-check

Can you look at `POST /users` returning `201 Created` and explain, in your own words, what both the method and the status code are telling you? If yes, you're ready to start at **Fundamentals**. If the status code part is unclear, that's exactly what Fundamentals covers first — no need to look anything up beforehand.
