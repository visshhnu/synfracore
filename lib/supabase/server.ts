import { createClient } from "@supabase/supabase-js";
import { getAuthSafely } from "@/lib/clerk/authFallback";

// Server-side Supabase client (Server Components, Route Handlers, Server
// Actions) — authenticated via Clerk's native Third-Party Auth integration.
// See CLAUDE.md: RLS policies must check auth.jwt()->>'sub', not auth.uid().
export function createSupabaseServerClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      // getAuthSafely() already swallows auth() failures and falls back to
      // manually verifying the session cookie (needed specifically inside
      // Server Actions on this Cloudflare adapter — see its own comment).
      // Without that fallback here, this callback silently returned null on
      // every Server Action call, which meant Supabase sent requests with no
      // Clerk JWT attached — Postgres saw auth.jwt()->>'sub' as null, so any
      // RLS-enabled table (e.g. user_domain_preferences) rejected the write
      // with a 42501, even though the caller was genuinely signed in.
      accessToken: async () => (await getAuthSafely()).token,
    }
  );
}
