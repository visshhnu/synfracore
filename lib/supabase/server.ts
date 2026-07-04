import { auth } from "@clerk/nextjs/server";
import { createClient } from "@supabase/supabase-js";

// Server-side Supabase client (Server Components, Route Handlers, Server
// Actions) — authenticated via Clerk's native Third-Party Auth integration.
// See CLAUDE.md: RLS policies must check auth.jwt()->>'sub', not auth.uid().
export function createSupabaseServerClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      accessToken: async () => (await auth()).getToken(),
    }
  );
}
