# Stage 2 — Security & Auth Audit

**Scope**: authentication/authorization design (Clerk + Supabase RLS), API design, security vulnerabilities, secrets handling, input validation, dependency risks. Excludes code architecture/reusability (Stage 1) and SQL schema design beyond RLS correctness (later stage if needed).

**Method**: read every API route in `app/api/`, every `.sql` file in `docs/`, `middleware.ts`, both Supabase client constructors, ran `npm audit` (full and production-only), searched the entire git history (not just working tree) for leaked secret patterns.

**Priority item per your note**: Finding 1 (open `/api/ai` proxy) is audited in full below — this is the endpoint the planned SynfraAI tutor feature will build on, so its current state matters beyond just "fix a bug."

---

## Finding 1 — `/api/ai`: full audit (auth, rate limiting, metering, cost exposure)
**Severity: Critical**

This carries over from Stage 1 Finding 1; here's the complete picture across all four angles you asked for.

**Auth requirements — currently: none.** `app/api/ai/route.ts` has no Clerk session check of any kind — not `auth()`, not `auth.protect()`, nothing. It doesn't even check that the request came from a signed-in visitor, let alone a specific user. `middleware.ts`'s `isProtectedRoute` matcher (`/dashboard(.*)`, `/onboarding(.*)`, `/admin(.*)`, `/profile(.*)`) does **not** include `/api/ai` — it is reachable by anyone, signed in or not.

**Rate limiting — currently: none.** No per-IP, per-user, per-session, or global request cap exists anywhere in the route or in `middleware.ts`. Cloudflare's dashboard-level rate-limiting rules aren't part of this repo, so I can't confirm from code whether one exists at the edge — but nothing in the application layer enforces one, which means the application cannot be relied on to protect itself even if a platform-level rule is (or isn't) configured.

**Per-user metering — currently: none.** There's no concept of "user X has made N requests today" anywhere. The `BLOG_KV` Cloudflare KV namespace already exists (`wrangler.toml`) and is proven to work for simple counters (`app/api/blog/route.ts` already does `kv.get`/`kv.put` for like-counts) — the infrastructure for metering already exists in this codebase and is simply unused here.

**Cost exposure — currently: fully attacker-controlled, unbounded per request.** The route does `body: JSON.stringify(body)` where `body` is the raw, unvalidated `await request.json()` of whatever the caller sent (`route.ts:6, 20`). The client (`SectionContent.tsx:211-212`) sends `model: "claude-sonnet-4-6"` and `max_tokens: 1000` — but that's the *legitimate* client's choice, not an enforced limit. Anyone calling the endpoint directly (trivially discovered — it's called from public client-side JS visible in the browser's network tab) controls `model`, `max_tokens`, and `messages` entirely, with the server blindly forwarding it to Anthropic on the account's own `ANTHROPIC_API_KEY`. There is no per-request cost ceiling, no daily budget cap, no circuit breaker.

**Compounding factor — wildcard CORS**: `Access-Control-Allow-Origin: "*"` (`route.ts:24, 42`) means any third-party website's client-side JS can call this endpoint directly and read the response — turning synfracore.com's Anthropic account into a free backend for unrelated sites. (Note for the record: CORS headers only govern whether a *browser* lets cross-origin JS read the response — they do nothing to stop a direct script/curl call from any origin at all, since CORS is a browser-enforced restriction, not a server-side one. Tightening CORS is worth doing for defense-in-depth, but it is not, by itself, a fix for the missing auth/rate-limit/cost problems above.)

**Recommended fix (unchanged from Stage 1, restated with the full picture)**:
1. Require a valid Clerk session (`auth()` check, reject with 401 if no `userId`) — this alone stops anonymous scripted abuse and gives you a `userId` to meter against.
2. Ignore whatever `model`/`max_tokens` the client sends; pin both server-side to fixed, known-cost values.
3. Rebuild the prompt server-side from `{academy, technology, section}` only — never forward client-supplied message content to Anthropic verbatim. This closes the cost exposure *and* a prompt-injection surface in one change.
4. Add per-user daily/hourly request counters in the existing `BLOG_KV` namespace (or a new dedicated KV namespace) — the pattern is already proven working in `app/api/blog/route.ts`.
5. Replace the wildcard CORS with the site's own origin, as defense-in-depth alongside (not instead of) #1.

**Relevance to the planned SynfraAI tutor feature**: building a tutor on top of this endpoint *as it exists today* means the tutor inherits an unauthenticated, unmetered, uncapped-cost foundation — every one of the four items above needs to be in place before that feature is designed, not after, since per-user metering in particular is a foundational data-model decision (where/how usage is tracked) that's much cheaper to get right now than to retrofit once a tutor UI depends on the current shape.

**Breaking or non-breaking**: non-breaking for legitimate use (the real client already only ever sends `{academy, technology, section}`-derived requests, matching what a rebuilt server-side prompt would produce).

**Migration strategy**: ship the auth check + model/token pinning first (highest value, near-zero risk, no user-facing change). Add KV-based metering as an immediate fast-follow, before any tutor feature work begins.

**Rollback strategy**: single-file revert; no data migration involved.

---

## Finding 2 — Supabase RLS coverage is actually complete and correctly implemented (positive finding, with one caveat)
**Severity: Informational / Low (caveat only)**

**Verified**: every table across both `docs/synfracore-schema.sql` (15 tables) and `docs/learner-platform-schema.sql` (7 tables) that holds user-specific data has `ENABLE ROW LEVEL SECURITY` and a policy using `(select auth.jwt()->>'sub') = user_id` (or `= id` for the `users` table itself) — confirmed via `docs/rls-policies.sql` and the RLS block in `docs/learner-platform-schema.sql:150-212`. **Zero occurrences of `auth.uid()` in actual policy code** anywhere (it appears only in explanatory comments warning against it) — the exact mistake `CLAUDE.md` warns about was not made.

Public catalog tables with no `user_id` column (`academies`, `courses`, `modules`, `lessons`, `challenges`, `badges`, `plans`, `quiz_questions`) correctly get an open `USING (true)` read policy instead, explicitly commented as intentional. Admin visibility is handled via a `SECURITY DEFINER` `is_admin()` function (`learner-platform-schema.sql:138-148`) specifically to avoid the classic Supabase RLS-recursion gotcha (a policy on `users` that queries `users` to check role) — this is the correct, non-obvious pattern, and it's applied consistently everywhere admin read access is needed.

**The one real caveat — I cannot verify this from the repo.** These are SQL *script files*; nothing in the repo confirms they were actually executed against the live production Supabase project, or that a later manual change in the Supabase dashboard hasn't since diverged from what's in these files. Recommend running this verification query directly against production:
```sql
SELECT schemaname, tablename, rowsecurity
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;
```
Every user-data table should show `rowsecurity = true`. If any show `false`, the corresponding `ALTER TABLE ... ENABLE ROW LEVEL SECURITY` from these scripts was never actually run.

**Minor completeness note (not a vulnerability)**: `lesson_progress` and `roadmap_progress` have no `DELETE` policy — meaning even the owning user cannot delete their own progress row via the client. This is the *safe* direction to be missing a policy in (Postgres RLS defaults to deny, so the absence of a policy makes the table more restrictive, not less) — flagging only because it may be an intentional product decision, or may not be, worth a quick confirmation either way.

---

## Finding 3 — No service-role key or other secret is exposed client-side or in git history
**Severity: Informational (positive finding)**

**Verified**:
- `lib/supabase/client.ts` and `lib/supabase/server.ts` both construct their Supabase client with `NEXT_PUBLIC_SUPABASE_ANON_KEY` only (the intentionally-public, RLS-constrained key) — never the service-role key.
- `SUPABASE_SERVICE_ROLE_KEY` appears in exactly one file, `app/api/webhooks/clerk/route.ts` — a server-only edge route that never ships to the client bundle, with a clear comment explaining why a webhook (no end-user JWT to satisfy RLS) is the one legitimate exception to the "always use the anon key + user JWT" rule.
- `.env` / `.env.local` are `.gitignore`d and confirmed never committed at any point in git history (`git log --all --diff-filter=A --name-only` returns zero hits for either).
- Searched the **full git history** (every commit's diff, not just the current tree) for secret-shaped strings (`sk_test_`, `sk_live_`, `sk-ant-`, key-shaped values assigned to `CLERK_SECRET_KEY`/`SUPABASE_SERVICE_ROLE_KEY`/`ANTHROPIC_API_KEY`) — the only matches were placeholder/example values in documentation (e.g. `sk-ant-your-key-here`), not real keys.
- `wrangler.toml` (git-tracked, intentionally) contains only `NEXT_PUBLIC_*` values, which are safe to commit since they're inlined into the client bundle at build time regardless of storage location — confirmed no `CLERK_SECRET_KEY` or `SUPABASE_SERVICE_ROLE_KEY` present there, consistent with the explicit comment in that file warning against ever adding them.

No action needed here — this is good practice already in place and worth preserving as new secrets are added (e.g. if `ANTHROPIC_API_KEY` metering/rotation is touched per Finding 1's fix).

---

## Finding 4 — Auth middleware fails open (not closed) when Clerk keys are misconfigured — already happened once in production
**Severity: High**

**Current implementation**: `middleware.ts`:
```ts
const hasClerkKeys = Boolean(
  process.env.NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY && process.env.CLERK_SECRET_KEY
);
export default hasClerkKeys
  ? clerkMiddleware(async (auth, req) => {
      if (isProtectedRoute(req)) await auth.protect();
    })
  : () => NextResponse.next();
```
If both Clerk env vars aren't present at runtime, middleware becomes a complete pass-through — `/dashboard`, `/onboarding`, and `/admin` receive **zero** redirect-to-sign-in enforcement for any visitor, signed in or not.

**This is not a theoretical concern** — this exact misconfiguration (missing `CLERK_SECRET_KEY` in the Cloudflare Pages production environment) already occurred earlier in this engagement and was the confirmed root cause of a prior incident (the onboarding page displaying a raw Clerk internal error to real visitors). The failure mode this finding describes is proven reachable, not hypothetical.

**Why it's a problem despite no confirmed data exposure**: in the incident that already happened, no unauthorized *data* access occurred, because the downstream layers happened to compensate — `currentUser()`/`auth()` calls inside the page components also fail when Clerk isn't configured (since `clerkMiddleware()` never ran to establish the auth context they depend on), so `ensureUserRecord()` returns a null profile, and `/admin`'s own `if (!profile || profile.role !== "admin") notFound()` check still correctly blocks access. Supabase RLS (Finding 2) provides an independent, second layer of protection regardless of what middleware does. **But this means the system currently survives a total auth-middleware failure by accident, via other layers' independent correctness — not because the middleware itself fails safe.** A "fail open" middleware is a latent risk: it happened to be caught by unrelated downstream checks this time; a future change to any of those downstream checks (e.g. relaxing the `admin`/`notFound()` check, or a new protected route that doesn't happen to call `currentUser()` itself) could silently remove the safety net middleware was supposed to provide in the first place.

**Business impact**: the intended UX (redirect anonymous visitors away from authenticated areas) silently stops working in exactly the misconfiguration state that already occurred once — visitors would see a raw `/dashboard` or `/admin` page shell attempt/error instead of a clean sign-in redirect, which is confusing and looks broken, even though the current downstream checks happen to prevent actual data leakage.

**Technical impact**: the "fail open" choice was made deliberately (per the code's own comment) to avoid `clerkMiddleware()`'s own hard crash taking down the *entire* site (including public marketing/academy pages) when keys are missing — a reasonable tradeoff for the *public* pages, but the same fallback is currently applied uniformly to the *protected* routes too, which is the wrong tradeoff for those specifically.

**Recommended fix**: keep the "don't crash the whole site" protection for public routes, but make protected routes fail closed instead of open: when `hasClerkKeys` is false, protected-route paths should redirect to `/sign-in` (or render a clear "temporarily unavailable" response) rather than silently passing through. Concretely: keep the no-op fallback for the general case, but add an explicit check inside it (or a separate lightweight middleware) that still redirects `isProtectedRoute` matches to `/sign-in` even in the no-Clerk-keys branch.

**Breaking or non-breaking**: non-breaking — this only changes behavior in the failure state (missing Clerk keys), which per `CLAUDE.md` and the deploy setup should never be the normal operating state anyway.

**Migration strategy**: add the redirect-on-protected-route-in-fallback-branch logic, verify locally by unsetting the Clerk env vars and confirming `/dashboard` now redirects instead of pass-through.

**Rollback strategy**: single-file revert of the added fallback-branch logic.

---

## Finding 5 — Public-facing API routes have no rate limiting or abuse controls (blog reactions, newsletter signup)
**Severity: Medium**

**Current implementation**:
- `app/api/blog/route.ts` POST (`like`/`comment` actions) has no auth, no rate limiting, no CAPTCHA, no per-IP throttling. `name`/`text` are free-form and length-capped (50/1000 chars) but otherwise unvalidated (no profanity/spam filtering, no dedup beyond the natural KV overwrite-by-key behavior for likes).
- `app/api/subscribe/route.ts` has no rate limiting either. Its email validation is minimal (`email.includes("@") && email.includes(".")`— accepts obviously-invalid strings like `"a@a.a"` fine, but also things like `"@.".includes` edge cases aren't rejected by this check specifically, though the double-substring check does block the most degenerate empty case). More importantly: this endpoint **sends an email, from the company's own domain, to whatever address is supplied**, with no verification step (no double opt-in/confirmation link) — a scripted loop calling this endpoint with arbitrary target addresses would cause Resend to send unsolicited "Welcome to SynfraCore" emails to those addresses, which is a real spam/reputation risk for the sending domain, not just a nuisance metric inflation risk.

**Why it's a problem**: neither endpoint requires a signed-in session (appropriately, for public-facing growth features), which means the *only* available control is rate limiting/abuse detection — and neither has any. This is the standard shape of an open-endpoint abuse vector: cheap to script, no signal to distinguish real users from automated abuse.

**Business impact**: comment spam on blog posts (public-facing, visible to all readers — reputational); newsletter endpoint abuse risks Resend/domain deliverability reputation if used to spam third-party inboxes with company-branded emails they never requested.

**Technical impact**: low technical complexity to exploit (a single scripted loop, no auth to bypass) — the barrier to abuse here is essentially zero today.

**Recommended fix**: add Cloudflare Turnstile (free, already the natural fit for a Cloudflare-hosted site) to both the comment form and the subscribe form; add basic per-IP rate limiting via the same KV-based counter pattern recommended for Finding 1. For `/api/subscribe` specifically, consider adding double opt-in (confirmation link) before sending the welcome email to an unverified address — this is the standard mitigation for exactly this abuse pattern and also improves list quality independent of the security angle.

**Breaking or non-breaking**: non-breaking — additive controls; legitimate users see at most a Turnstile challenge.

**Migration strategy**: rate limiting first (cheapest, no UI change); Turnstile as a fast-follow if spam is observed in practice.

**Rollback strategy**: remove the added checks; no data model impact.

---

## Finding 6 — Dependency audit: 9 known vulnerabilities, but real production exposure is limited to 3 moderate, low-practical-risk issues
**Severity: Medium (informational nuance matters here — see breakdown)**

**Full audit** (`npm audit`): 9 total (1 low, 6 moderate, 2 high, 0 critical).
**Production-dependency-only audit** (`npm audit --omit=dev`): **3 moderate**, specifically:
- `js-yaml` (moderate, quadratic-complexity DoS via crafted YAML) — reached only via `gray-matter` (used for blog/certification frontmatter parsing, `app/blog/[slug]/page.tsx`, `app/certifications/[id]/page.tsx`). Exploitability is low in practice: the YAML being parsed is first-party-authored content frontmatter, not arbitrary user/attacker input, so there's no realistic path for an attacker to supply the crafted YAML this vulnerability requires.
- `next` (moderate, transitively via `postcss`) and `postcss` itself (moderate, XSS via unescaped `</style>` in CSS *stringify* output) — this is a build-time CSS-processing vulnerability triggered by processing attacker-crafted CSS *source*; this app compiles its own static Tailwind CSS at build time from first-party source, never end-user-submitted CSS at request time, so real-world exploitability is effectively nil for this specific app despite the "moderate" advisory severity.

**The remaining 6 (1 low, 4 moderate excluded above, 2 high)** are dev-tooling-only (`esbuild`, `miniflare`, `undici`, `ws`, `cookie` — all pulled in transitively via `@cloudflare/next-on-pages`'s local dev-preview simulation, i.e. `wrangler pages dev`). These never ship to the production Cloudflare Pages edge runtime; they matter only if running local preview against untrusted network input, which isn't this project's normal workflow. `npm audit fix`/`--force` reports "No fix available" for `undici`/`ws` specifically — they're pinned by `miniflare`'s own dependency requirements, not something this project's `package.json` can unilaterally bump.

**Separate, non-security dependency-risk finding**: `npm ls` reports `next@15.5.19` as `invalid: ">=14.3.0 && <=15.5.2"` against `@cloudflare/next-on-pages@1.13.16`'s peer-dependency range — **the installed Next.js version exceeds what the Cloudflare adapter has been tested against.** This isn't a known CVE, but it is a real production-stability risk: the actual deployed runtime (Cloudflare Pages via this adapter) is running on an untested Next↔adapter combination, which could cause edge-runtime-specific bugs that wouldn't reproduce in local `next dev`.

**Recommended fix**: no urgent action on the 3 production-relevant CVEs given low practical exploitability, but track them for the next routine dependency bump. For the peer-dependency mismatch: either pin `next` to `<=15.5.2` to match what `@cloudflare/next-on-pages@1.13.16` actually supports, or check for a newer `@cloudflare/next-on-pages` release that's validated against 15.5.19+, and reconcile deliberately rather than leaving an unacknowledged mismatch.

**Breaking or non-breaking**: pinning `next` down is a downgrade (non-breaking in practice, but should be tested); upgrading `@cloudflare/next-on-pages` could be either depending on its own changelog.

**Migration strategy**: resolve the peer-dependency mismatch in an isolated PR/branch with a full deploy-preview test before merging, independent of any other work, since it affects the deploy pipeline itself.

**Rollback strategy**: revert the version pin; no runtime code changes involved.

---

## Finding 7 — One instance of raw internal error text returned in an API response (low real-world exposure)
**Severity: Low**

**Current implementation**: `app/api/webhooks/clerk/route.ts:79` returns `{ error: error.message }` (the raw Supabase error) with a 500 status when the user-sync upsert fails.

**Why it's low, not higher**: the audience for this response is Clerk's own webhook-delivery system, not a browser or end user — visible only via the Clerk dashboard's webhook delivery logs, which only the site owner can access. It's also gated behind `verifyWebhook(req)` succeeding first (`route.ts:52`), so an attacker without the webhook signing secret can't reach this code path at all to intentionally trigger and inspect it.

**Recommended fix**: log the full error server-side (`console.error`, already done one line above at `route.ts:78`) and return a generic `{ error: "sync failed" }` to the response body — purely a hygiene improvement, consistent with the fix already applied to the dashboard/onboarding UI banners earlier in this engagement (confirmed still in place: `app/dashboard/page.tsx`/`app/onboarding/page.tsx` now show a generic "couldn't sync your profile" message instead of the raw error, with full detail only in server logs).

**Breaking or non-breaking**: non-breaking.

**Migration strategy**: one-line change.

**Rollback strategy**: one-line revert.

---

## Summary table

| # | Finding | Severity | Type |
|---|---|---|---|
| 1 | `/api/ai` — no auth, no rate limit, no metering, unbounded cost (full audit) | **Critical** | Fix before SynfraAI tutor work |
| 4 | Auth middleware fails open on Clerk misconfig (already occurred once) | High | Fix |
| 5 | Blog comments/newsletter signup — no rate limiting or abuse controls | Medium | Fix |
| 6 | 3 production-relevant moderate CVEs (low practical exploitability) + Next↔adapter peer-dependency mismatch | Medium | Track / reconcile |
| 7 | Webhook route returns raw error text (low-exposure audience) | Low | Hygiene fix |
| 2 | Supabase RLS coverage — complete and correct | Informational | Verify live DB state matches scripts |
| 3 | No service-role key or secret exposed client-side or in git history | Informational | No action — preserve practice |

**Recommended order of attack**: 1 (Critical, blocks planned tutor feature) → 4 (High, proven-reachable failure mode) → 6's peer-dependency mismatch (deploy-pipeline stability) → 5 → 7 → confirm Finding 2's live-DB caveat with the verification query → 6's CVE tracking (routine hygiene, no urgency).
