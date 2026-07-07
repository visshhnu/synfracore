# SynfraCore — The Complete Tech Learning Ecosystem

> Learn → Practice → Build → Troubleshoot → Get Certified → Get Hired

## Tech Stack
- **Framework:** Next.js 15 (App Router, TypeScript)
- **Auth:** Clerk (session/identity) + Supabase (Postgres only, RLS via Clerk JWT — see `CLAUDE.md`)
- **Styling:** Tailwind CSS v4 + custom dark design system
- **AI:** Anthropic Claude API — gated behind `AI_ASSISTANT_ENABLED` (see `.env.example`); off by default
- **Fonts:** Space Grotesk · Syne · JetBrains Mono
- **Deploy:** Cloudflare Pages (via `@cloudflare/next-on-pages` + `wrangler`) — **not Vercel**

## 18 Academies · 200+ Technologies · 17 Certifications

Counts above are verified against `lib/data/academies.ts`/`lib/data/navigation.ts` directly — treat those files as the live source of truth rather than this number, since it will drift as content is added. Academies include DevOps, Cloud, Databases, AI, Data, Security, Healthcare, Essentials, Education, Exams, Law, Agriculture, Finance, Telecom, Economics, State PSC, Central Exams, and Professional Certs.

## Deploy to Cloudflare Pages

```bash
npm run deploy
# = npm run pages:build (bundles via @cloudflare/next-on-pages) && wrangler pages deploy
```

Requires `wrangler` to be authenticated (`npx wrangler login`) and the Cloudflare Pages project already created, with all required environment variables/secrets set in the Cloudflare dashboard (or via `wrangler pages secret put <NAME>`) — see `.env.example` for the full list. Public (`NEXT_PUBLIC_*`) values live in `wrangler.toml`; secrets (`CLERK_SECRET_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `ANTHROPIC_API_KEY`, etc.) must never go in `wrangler.toml` — add them as Cloudflare secrets instead.

## Local Development

```bash
npm install
cp .env.example .env.local   # fill in real values, never commit this file
npm run dev
# Open http://localhost:3000
```

## Project Structure

```
app/
  page.tsx                    # Homepage
  academies/[academy]/        # Academy hub pages
    [technology]/             # Tech hub page
      [section]/page.tsx      # Lesson content — pre-written markdown by default,
                               # with an optional AI-generate fallback when a
                               # section has no registered content yet
  ai-assistant/               # AI assistant UI (backing API gated off by default)
  roadmaps/, certifications/
  labs/, projects/, interview/
  troubleshooting/, community/, career/

components/
  layout/  Navbar, Footer
  home/    Hero, Stats, AcademyGrid, LearningPaths, FeaturedLabs,
           AIAssistantTeaser, TroubleshootingPreview, Certs, Journey
  tech/    SectionContent (renders pre-written content; falls back to
           on-demand AI generation only when nothing is registered)

lib/data/
  academies.ts    All academies + technologies — the live source of truth
  navigation.ts   Nav, certifications, roadmaps, section-type definitions
```

## Roadmap
- Phase 1 ✅ — Knowledge base, roadmaps, AI content generation
- Phase 2 🔄 — Interactive labs, real projects
- Phase 3 📋 — Community, progress tracking
- Phase 4 📋 — AI Mentor, RAG search
- Phase 5 📋 — Career portal, job board
- Phase 6 📋 — Enterprise training platform

## Operational docs

- `CLAUDE.md` — architecture decisions, auth setup steps, env vars, content rules.
- `docs/audit/` — a staged architecture/security/performance/data/ops audit of this codebase; read before making structural changes.
