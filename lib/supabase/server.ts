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
      // Swallow auth() failures here rather than letting them reject inside
      // supabase-js's request pipeline — every caller (ensureUserRecord,
      // dashboard/page.tsx's other queries) already handles a missing/failed
      // token as "unauthenticated", so returning null is strictly safer than
      // letting an exception escape from inside this callback.
      accessToken: async () => {
        try {
          return (await auth()).getToken();
        } catch (err) {
          console.error("accessToken callback failed:", err);
          return null;
        }
      },
    }
  );
}
