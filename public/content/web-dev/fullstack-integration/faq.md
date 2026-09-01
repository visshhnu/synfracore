# Full-Stack Integration & Deployment — FAQ

## If I already know React and Express separately, do I already know full-stack development?

Not quite, and this is the exact reason this technology exists as its own thing rather than being folded into React or Express. Knowing React and knowing Express independently doesn't teach CORS, the public/private environment-variable distinction, the full auth-token handshake between frontend and backend, or deployment topology tradeoffs — none of those show up if you only ever practiced either technology in isolation, disconnected from a real deployed counterpart. The integration layer is a genuinely separate, learnable skill, and it's specifically the skill most tutorials skip because most tutorials only ever run everything on `localhost`.

## Should I use AI coding assistants for a portfolio project?

Yes, honestly — this is realistic, standard professional practice in 2026, and pretending otherwise in a portfolio or an interview doesn't help you. The real requirement isn't avoiding AI assistance; it's being able to explain and defend every line you ship, including AI-generated ones, the same way you'd need to defend a teammate's code you reviewed and merged. Project 2 in the Projects tab is built specifically around documenting this honestly — what the assistant helped with, and what needed your own judgment, particularly anything security-sensitive.

## Why does a CORS error show up only after I deploy, when everything worked fine locally?

Because locally, frontend and backend often share `localhost` (or a dev proxy hides the cross-origin call entirely), while a real deployment usually puts them on two genuinely different origins — exactly the condition CORS exists to gate. This isn't a new bug introduced by deployment; it's a browser security mechanism that simply had no opportunity to trigger locally. See the Troubleshooting tab's first issue for the full diagnostic and fix.

## Is it safe to put my database connection string in a frontend environment variable if I'm careful about it?

No — this isn't a matter of care, it's a hard security boundary. Any variable prefixed `NEXT_PUBLIC_` (or your framework's equivalent convention) is compiled directly into the JavaScript bundle shipped to every visitor's browser at build time, fully readable via browser dev tools regardless of how carefully it's used elsewhere. A database connection string, a signing secret, or any private API key must always live as a backend-only environment variable, with no exceptions based on intended usage.

## Why does this course keep pointing to other academies instead of just teaching everything itself?

Because this platform's Databases, DevOps, and AI Engineering academies already cover schema design, indexing, CI/CD pipeline construction, containerization, and AI tooling in far more depth than this technology could add without duplicating (and diluting) that material. This technology's actual job is narrower and specific: show exactly how those pieces plug into a working full-stack app, and point directly to where the real depth lives once you need it. That's a deliberate scoping decision made throughout every section of this technology, not a gap.

## Do I need to deploy my frontend and backend on the same platform?

No — there's a real, genuine tradeoff either way, covered in the Advanced tab. Deploying together (same origin) eliminates CORS between them and simplifies deployment to one pipeline, at the cost of coupling the backend to the frontend platform's constraints. Deploying separately allows independent scaling and release cycles for a backend with real infrastructure needs, at the cost of reintroducing CORS and requiring two deployments to stay in sync. Neither is the "correct" default — the right choice depends on what your backend actually needs.

## My app worked in staging but broke in production with the exact same code. How is that possible?

Almost always configuration drift, not a code bug — since the code is identical, the difference has to be in what's genuinely different between the two environments: an environment variable set in one but not the other, a different database version, or a network/firewall rule that only applies in one environment. Diff the actual environment configuration between the two environments directly, rather than assuming a code-level explanation the premise itself rules out. See the Advanced tab's environment-parity section and the Troubleshooting tab's fourth issue.

## What actually makes a full-stack portfolio project "count" for hiring purposes?

A live, working, deployed link a stranger can actually click and use — not a repository that only runs on your own machine. Full-stack skill is specifically evaluated at the integration and deployment layer, since that's the layer that proves the pieces genuinely work together, not just individually. This is why every project in the Projects tab treats deployment itself as part of the deliverable, not an afterthought once the "real" code is finished.
