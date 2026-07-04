"use client";

import { useSession } from "@clerk/nextjs";
import { createClient } from "@supabase/supabase-js";

// Browser-side Supabase client, authenticated via Clerk's native
// Third-Party Auth integration (see CLAUDE.md — do NOT use auth.uid()
// in RLS policies, this is not Supabase's own auth).
export function useSupabaseClient() {
  const { session } = useSession();

  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      accessToken: async () => session?.getToken() ?? null,
    }
  );
}
