# JavaScript — Certification

## Framing Note

There is no single, universally recognized proctored "Certified JavaScript Developer" credential the way there is for, say, a cloud platform (AWS, Azure). JavaScript's hiring signal comes overwhelmingly from a portfolio and live coding ability, not a certificate. What exists are a handful of genuinely real, freely available credentials worth knowing about — treat them as a structured way to learn and prove basic competency, not as a substitute for building real projects.

## What Actually Exists

| Credential | Provider | What it actually validates |
|---|---|---|
| JavaScript Algorithms and Data Structures Certification | freeCodeCamp | Free, self-paced, project-based — genuinely widely recognized as a legitimate free credential; covers ES6, functional programming patterns, and algorithm/data-structure fundamentals in JavaScript |
| JavaScript Developer I / II | Various bootcamp/course platforms (Coursera, Udemy specializations) | Course-completion certificates, not third-party-proctored exams — useful for structured learning, weak as a standalone hiring signal |
| Meta Front-End Developer Professional Certificate | Coursera (Meta) | Broader front-end program including JavaScript, React, and version control — a real, paid, structured pathway rather than a JS-specific exam |

`(needs verification — recheck against current source: exact curriculum content, pricing, and whether a given credential is free vs. paid change over time — confirm current details directly on the provider's site before treating any of the above as settled.)`

## Why None of These Function Like an AWS or Azure Certification

Cloud certifications gate real hiring decisions and often unlock specific job requisitions directly. JavaScript credentials don't work that way in practice — almost every JavaScript hiring process (junior through senior) leans on a live coding interview, a take-home project, or a portfolio review instead of checking for a specific certificate. That doesn't make these credentials worthless — freeCodeCamp's, specifically, is a genuinely well-regarded, free way to structure your learning and prove you finished real projects — but budget your prep time toward the Projects and Interview Prep tabs on this platform first, and treat a certificate as a bonus, not a substitute.

## A Realistic Path, in Order

1. Complete this course's Fundamentals → Intermediate → Advanced tabs.
2. Build the 3 portfolio projects in the Projects tab — a working GitHub repo with real, running code is a stronger signal than any certificate.
3. If you want a free, structured credential to point to: freeCodeCamp's JavaScript Algorithms and Data Structures certification.
4. Practice live coding under time pressure using the Interview Prep and Interview tabs — this is what actually gets tested in a real interview loop.

## Core Topics (Reference)

```javascript
// Variables & scope
const x = 10;       // block-scoped, cannot be reassigned
let y = 20;          // block-scoped, reassignable

// Functions
const add = (a, b) => a + b;

// Async
async function getData() {
  const res = await fetch("/api/data");
  return res.json();
}

// Array methods
[1, 2, 3].map((n) => n * 2);        // [2, 4, 6]
[1, 2, 3].filter((n) => n > 1);     // [2, 3]
[1, 2, 3].reduce((sum, n) => sum + n, 0); // 6

// Destructuring
const { name, age } = { name: "Dev", age: 25 };

// Classes / prototypal inheritance
class Animal {
  constructor(name) { this.name = name; }
  speak() { return `${this.name} makes a sound.`; }
}
```
