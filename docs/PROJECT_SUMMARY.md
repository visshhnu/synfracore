# SynfraCore — Project Summary & Decisions Log
_A record of the planning conversation, for context handoff to Claude Code or any new collaborator._

## 1. What SynfraCore is today
A learning platform (synfracore.com) covering DevOps, Cloud, AI, and ~17 other
verticals (exams, law, health, etc.), positioned as "education should be free."

## 2. Audit findings (from inspecting the live site)
- Site has strong structure: 17 academies, 890+ topics, each with a 14-tab
  template (Overview, Fundamentals, Intermediate, Advanced, Labs, Projects,
  Interview Q&A, Troubleshooting, Certification, Cheatsheet, Notes, PYQ,
  Real World, FAQ).
- **Core problem:** the actual content body on beginner-facing pages
  (Overview, Fundamentals) was found to be effectively empty on the pages
  checked — just navigation and bylines, no explanation, analogy, or
  diagrams. Structure was built faster than content was written.
- No visible monetization model, no team/instructor identities, no
  testimonials or proof of outcomes, no pricing page.
- Scope (17 unrelated verticals at once) is a strategic risk — dilutes SEO
  topical authority and content-quality bandwidth.

## 3. Product decision: "One account, one platform"
Instead of 10 separate learning platforms/logins, one unified account and
progress engine, with each subject area ("academy") as a modular plug-in
on the same core (same login, same XP, same certificates, same portfolio).

## 4. Key decisions made
| Area | Decision |
|---|---|
| Auth | **Clerk** — handles sign-in, sessions, identity |
| Database | **Supabase** (Postgres only, NOT Supabase's own Auth) |
| Auth↔DB link | Supabase native Third-Party Auth integration with Clerk (NOT the deprecated JWT-template method) |
| `users.id` | Stores Clerk's user ID (`sub` claim) as TEXT, not a generated UUID |
| RLS pattern | `auth.jwt()->>'sub' = user_id` — never `auth.uid()` |
| Rollout | Launch deep on 3 flagship academies first (recommended: DevOps, Cloud/AI, one exam vertical) before re-enabling the rest |
| Pricing | Freemium: free content, paid Academy Pass / All-Access / Institutional tiers, pay-per-certification |
| Content | Every Overview/Fundamentals lesson must include: plain-English hook, one analogy, one diagram, one annotated example, one 2-minute "try it" task — enforced via an `is_beginner_ready` DB column |
| Gamification | Tiered challenges — Micro (daily) / Skill (weekly) / Build / Hackathon (monthly) / Exam Sprint — always matched to the learner's own level, never a global leaderboard |

## 5. Files produced (place in `/docs`)
- `synfracore-schema.sql` — full Postgres schema, Clerk-compatible, with content-template fields and tiered-challenge fields
- `synfracore-dashboard-wireframe.html` — unified dashboard mockup (progress ring across academies, level-matched challenge panel)
- `synfracore-pitch-onepager.html` — one-page pitch (problem, product, pricing, roadmap)
- `CLAUDE.md` — stack rules and setup steps for Claude Code (project root, not `/docs`)

## 6. Immediate next steps (as of this handoff)
1. Scaffold the project (see `setup.sh`).
2. Wire up Clerk + Supabase per `CLAUDE.md`.
3. Run `synfracore-schema.sql` against Supabase.
4. Rebuild the Overview/Fundamentals pages for the top ~20 highest-traffic
   topics using the 5-part content template — highest-leverage content fix.
5. Ship the auth + dashboard shell before touching any academy beyond the
   first 3.
