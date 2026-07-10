import type { SupabaseClient } from "@supabase/supabase-js";

// Every function here is defensive by design: the learner-platform-schema.sql
// tables may not exist yet in a given Supabase project (it's a manual SQL
// step — see docs/learner-platform-schema.sql), and a thrown error from a
// missing table must never crash a page the way the Clerk middleware outage
// did. Each function catches its own errors and returns a safe empty value
// instead of throwing, so dashboard/admin pages always render — with empty
// states — rather than 500ing.

export type Profile = {
  id: string;
  email: string;
  full_name: string;
  avatar_url: string | null;
  role: string;
  country: string | null;
  education_level: string | null;
  onboarding_completed: boolean;
  learner_type: string | null;
  primary_goal: string | null;
  current_level: string | null;
  goal_timeline: string | null;
  created_at: string;
  last_active_at: string | null;
};

export async function getProfile(supabase: SupabaseClient, userId: string): Promise<Profile | null> {
  try {
    const { data, error } = await supabase.from("users").select("*").eq("id", userId).maybeSingle();
    if (error) throw error;
    return data as Profile | null;
  } catch (err) {
    console.error("getProfile failed:", err);
    return null;
  }
}

export type OnboardingInput = {
  learnerType: string;
  primaryGoal: string;
  currentLevel: string;
  goalTimeline: string;
  domains: string[];
};

export async function saveOnboarding(supabase: SupabaseClient, userId: string, input: OnboardingInput): Promise<boolean> {
  try {
    const { error: userErr } = await supabase
      .from("users")
      .update({
        learner_type: input.learnerType,
        primary_goal: input.primaryGoal || null,
        current_level: input.currentLevel,
        goal_timeline: input.goalTimeline || null,
        onboarding_completed: true,
        updated_at: new Date().toISOString(),
      })
      .eq("id", userId);
    if (userErr) throw userErr;

    if (input.domains.length > 0) {
      const rows = input.domains.map(slug => ({ user_id: userId, academy_slug: slug, interest_level: "exploring" }));
      const { error: prefErr } = await supabase.from("user_domain_preferences").upsert(rows, { onConflict: "user_id,academy_slug" });
      if (prefErr) throw prefErr;
    }

    await recordActivity(supabase, userId, "onboarding_completed", {});
    return true;
  } catch (err) {
    console.error("saveOnboarding failed:", err);
    return false;
  }
}

export async function getDomainPreferences(supabase: SupabaseClient, userId: string): Promise<string[]> {
  try {
    const { data, error } = await supabase.from("user_domain_preferences").select("academy_slug").eq("user_id", userId);
    if (error) throw error;
    return (data ?? []).map(r => r.academy_slug as string);
  } catch (err) {
    console.error("getDomainPreferences failed:", err);
    return [];
  }
}

export type AcademyProgressSummary = { academySlug: string; touched: number; completed: number };

export async function getProgressSummary(supabase: SupabaseClient, userId: string): Promise<AcademyProgressSummary[]> {
  try {
    const { data, error } = await supabase.from("lesson_progress").select("academy_slug, status").eq("user_id", userId);
    if (error) throw error;
    const byAcademy = new Map<string, AcademyProgressSummary>();
    for (const row of data ?? []) {
      const slug = row.academy_slug as string;
      const entry = byAcademy.get(slug) ?? { academySlug: slug, touched: 0, completed: 0 };
      entry.touched += 1;
      if (row.status === "completed") entry.completed += 1;
      byAcademy.set(slug, entry);
    }
    return Array.from(byAcademy.values());
  } catch (err) {
    console.error("getProgressSummary failed:", err);
    return [];
  }
}

export type ActivityRow = {
  id: string;
  activity_type: string;
  academy_slug: string | null;
  technology_slug: string | null;
  section_slug: string | null;
  created_at: string;
};

export async function getRecentActivity(supabase: SupabaseClient, userId: string, limit = 8): Promise<ActivityRow[]> {
  try {
    const { data, error } = await supabase
      .from("recent_activity")
      .select("id, activity_type, academy_slug, technology_slug, section_slug, created_at")
      .eq("user_id", userId)
      .order("created_at", { ascending: false })
      .limit(limit);
    if (error) throw error;
    return (data ?? []) as ActivityRow[];
  } catch (err) {
    console.error("getRecentActivity failed:", err);
    return [];
  }
}

// Fire-and-forget — never let an activity-log failure break the calling page.
export async function recordActivity(
  supabase: SupabaseClient,
  userId: string,
  activityType: string,
  meta: { academySlug?: string; technologySlug?: string; sectionSlug?: string; metadata?: Record<string, unknown> }
): Promise<void> {
  try {
    await supabase.from("recent_activity").insert({
      user_id: userId,
      activity_type: activityType,
      academy_slug: meta.academySlug ?? null,
      technology_slug: meta.technologySlug ?? null,
      section_slug: meta.sectionSlug ?? null,
      metadata: meta.metadata ?? null,
    });
  } catch (err) {
    console.error("recordActivity failed:", err);
  }
}

export type BookmarkRow = { id: string; academy_slug: string; technology_slug: string; section_slug: string; title: string; created_at: string };

export async function getBookmarks(supabase: SupabaseClient, userId: string, limit = 10): Promise<BookmarkRow[]> {
  try {
    const { data, error } = await supabase
      .from("bookmarks")
      .select("id, academy_slug, technology_slug, section_slug, title, created_at")
      .eq("user_id", userId)
      .order("created_at", { ascending: false })
      .limit(limit);
    if (error) throw error;
    return (data ?? []) as BookmarkRow[];
  } catch (err) {
    console.error("getBookmarks failed:", err);
    return [];
  }
}

export type QuizSummary = { totalAttempts: number; averageScorePct: number; weakTopics: { academySlug: string; technologySlug: string; scorePct: number }[] };

export async function getQuizSummary(supabase: SupabaseClient, userId: string): Promise<QuizSummary> {
  try {
    const { data, error } = await supabase
      .from("quiz_attempts")
      .select("academy_slug, technology_slug, score, total")
      .eq("user_id", userId);
    if (error) throw error;
    const rows = data ?? [];
    if (rows.length === 0) return { totalAttempts: 0, averageScorePct: 0, weakTopics: [] };

    const totalScore = rows.reduce((s, r) => s + (r.total > 0 ? r.score / r.total : 0), 0);
    const averageScorePct = Math.round((totalScore / rows.length) * 100);

    const byTopic = new Map<string, { academySlug: string; technologySlug: string; score: number; total: number }>();
    for (const r of rows) {
      const key = `${r.academy_slug}/${r.technology_slug}`;
      const entry = byTopic.get(key) ?? { academySlug: r.academy_slug, technologySlug: r.technology_slug, score: 0, total: 0 };
      entry.score += r.score;
      entry.total += r.total;
      byTopic.set(key, entry);
    }
    const weakTopics = Array.from(byTopic.values())
      .map(t => ({ academySlug: t.academySlug, technologySlug: t.technologySlug, scorePct: t.total > 0 ? Math.round((t.score / t.total) * 100) : 0 }))
      .filter(t => t.scorePct < 70)
      .sort((a, b) => a.scorePct - b.scorePct)
      .slice(0, 5);

    return { totalAttempts: rows.length, averageScorePct, weakTopics };
  } catch (err) {
    console.error("getQuizSummary failed:", err);
    return { totalAttempts: 0, averageScorePct: 0, weakTopics: [] };
  }
}

export type QuizQuestion = { id: string; question: string; options: string[]; correct_index: number; explanation: string | null; difficulty: string };

export async function getQuizQuestions(supabase: SupabaseClient, academySlug: string, technologySlug: string, sectionSlug = "overview"): Promise<QuizQuestion[]> {
  try {
    const { data, error } = await supabase
      .from("quiz_questions")
      .select("id, question, options, correct_index, explanation, difficulty")
      .eq("academy_slug", academySlug)
      .eq("technology_slug", technologySlug)
      .eq("section_slug", sectionSlug);
    if (error) throw error;
    return (data ?? []) as QuizQuestion[];
  } catch (err) {
    console.error("getQuizQuestions failed:", err);
    return [];
  }
}

export async function submitQuizAttempt(
  supabase: SupabaseClient,
  userId: string,
  input: { academySlug: string; technologySlug: string; sectionSlug: string; score: number; total: number; answers: unknown }
): Promise<boolean> {
  try {
    const { error } = await supabase.from("quiz_attempts").insert({
      user_id: userId,
      academy_slug: input.academySlug,
      technology_slug: input.technologySlug,
      section_slug: input.sectionSlug,
      score: input.score,
      total: input.total,
      answers: input.answers,
    });
    if (error) throw error;
    await recordActivity(supabase, userId, "quiz_attempted", {
      academySlug: input.academySlug,
      technologySlug: input.technologySlug,
      sectionSlug: input.sectionSlug,
      metadata: { score: input.score, total: input.total },
    });
    return true;
  } catch (err) {
    console.error("submitQuizAttempt failed:", err);
    return false;
  }
}

// ── Admin queries — rely on the is_admin() RLS policy; a non-admin caller
// simply gets an empty/own-row-only result set back, never an error. ──

export type AdminUserStats = { totalCount: number; onboardedCount: number };

// head:true means Postgres does an index-only count, no rows returned — this
// stays cheap at any table size, unlike counting the (now-paginated) current
// page's users, which would only reflect whichever 50 rows are on screen.
export async function getAdminUserStats(supabase: SupabaseClient): Promise<AdminUserStats> {
  try {
    const [{ count: totalCount, error: totalErr }, { count: onboardedCount, error: onboardedErr }] = await Promise.all([
      supabase.from("users").select("*", { count: "exact", head: true }),
      supabase.from("users").select("*", { count: "exact", head: true }).eq("onboarding_completed", true),
    ]);
    if (totalErr) throw totalErr;
    if (onboardedErr) throw onboardedErr;
    return { totalCount: totalCount ?? 0, onboardedCount: onboardedCount ?? 0 };
  } catch (err) {
    console.error("getAdminUserStats failed:", err);
    return { totalCount: 0, onboardedCount: 0 };
  }
}

export type AdminUserRow = Profile & { domainCount: number; progressCount: number; quizAttemptCount: number };
export type AdminUserPage = { users: AdminUserRow[]; totalCount: number };

const ADMIN_PAGE_SIZE = 50;

// Builds a { user_id -> row count } map in one pass instead of re-filtering
// the whole array per user (was O(users x rows); this is O(rows)) — the
// query itself only ever pulls user_id, so this is the cheap side of the
// original problem. The other side (unbounded .select on `users`) is fixed
// below via .range() pagination. See docs/audit/06-roadmap.md 3.1 /
// docs/audit/04-data-scalability.md F2 for the full history of why this
// mattered enough to fix even though it's fine at today's user count.
function countByUserId(rows: { user_id: string }[] | null | undefined): Map<string, number> {
  const counts = new Map<string, number>();
  for (const r of rows ?? []) counts.set(r.user_id, (counts.get(r.user_id) ?? 0) + 1);
  return counts;
}

export async function getAllUsersForAdmin(supabase: SupabaseClient, page = 1): Promise<AdminUserPage> {
  try {
    const from = (page - 1) * ADMIN_PAGE_SIZE;
    const to = from + ADMIN_PAGE_SIZE - 1;
    const { data: users, count: totalCount, error } = await supabase
      .from("users")
      .select("*", { count: "exact" })
      .order("created_at", { ascending: false })
      .range(from, to);
    if (error) throw error;
    if (!users || users.length === 0) return { users: [], totalCount: totalCount ?? 0 };

    const ids = users.map(u => u.id);
    const [{ data: prefs }, { data: progress }, { data: quiz }] = await Promise.all([
      supabase.from("user_domain_preferences").select("user_id").in("user_id", ids),
      supabase.from("lesson_progress").select("user_id").in("user_id", ids),
      supabase.from("quiz_attempts").select("user_id").in("user_id", ids),
    ]);

    const prefCounts = countByUserId(prefs);
    const progressCounts = countByUserId(progress);
    const quizCounts = countByUserId(quiz);

    return {
      totalCount: totalCount ?? users.length,
      users: (users as Profile[]).map(u => ({
        ...u,
        domainCount: prefCounts.get(u.id) ?? 0,
        progressCount: progressCounts.get(u.id) ?? 0,
        quizAttemptCount: quizCounts.get(u.id) ?? 0,
      })),
    };
  } catch (err) {
    console.error("getAllUsersForAdmin failed:", err);
    return { users: [], totalCount: 0 };
  }
}
