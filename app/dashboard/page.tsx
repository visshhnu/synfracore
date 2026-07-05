export const runtime = "edge";

import Link from "next/link";
import Image from "next/image";
import { currentUser } from "@clerk/nextjs/server";
import { ensureUserRecord } from "@/lib/supabase/ensureUser";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import {
  getDomainPreferences,
  getProgressSummary,
  getRecentActivity,
  getBookmarks,
  getQuizSummary,
} from "@/lib/supabase/queries";
import { academies } from "@/lib/data/academies";

export const metadata = { title: "Dashboard | SynfraCore" };

const ACTIVITY_LABELS: Record<string, string> = {
  lesson_viewed: "Viewed",
  lesson_completed: "Completed",
  quiz_attempted: "Took a quiz in",
  bookmark_added: "Bookmarked",
  onboarding_completed: "Completed onboarding",
};

function timeAgo(iso: string): string {
  const diffMs = Date.now() - new Date(iso).getTime();
  const mins = Math.floor(diffMs / 60000);
  if (mins < 1) return "just now";
  if (mins < 60) return `${mins}m ago`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `${hours}h ago`;
  const days = Math.floor(hours / 24);
  return `${days}d ago`;
}

export default async function DashboardPage() {
  const [profile, clerkUser] = await Promise.all([ensureUserRecord(), currentUser()]);

  const supabase = createSupabaseServerClient();
  const userId = clerkUser?.id ?? "";
  const [domainPrefs, progressSummary, recentActivity, bookmarks, quizSummary] = userId
    ? await Promise.all([
        getDomainPreferences(supabase, userId),
        getProgressSummary(supabase, userId),
        getRecentActivity(supabase, userId, 6),
        getBookmarks(supabase, userId, 5),
        getQuizSummary(supabase, userId),
      ])
    : [[], [], [], [], { totalAttempts: 0, averageScorePct: 0, weakTopics: [] }];

  const displayName = profile?.full_name || clerkUser?.fullName || clerkUser?.firstName || "there";
  const avatarUrl = profile?.avatar_url || clerkUser?.imageUrl;
  const onboardingCompleted = profile?.onboarding_completed ?? false;
  const isAdmin = profile?.role === "admin";

  const interestedAcademies = academies.filter(a => domainPrefs.includes(a.slug));
  const recommendedAcademies = interestedAcademies.length > 0 ? interestedAcademies : academies.slice(0, 4);
  const touchedSlugs = new Set(progressSummary.map(p => p.academySlug));
  const progressAcademies = academies.filter(a => touchedSlugs.has(a.slug));

  const mostRecentActivity = recentActivity[0];
  const continueLink = mostRecentActivity?.academy_slug && mostRecentActivity?.technology_slug
    ? `/academies/${mostRecentActivity.academy_slug}/${mostRecentActivity.technology_slug}/${mostRecentActivity.section_slug || "overview"}`
    : null;

  return (
    <div style={{ maxWidth: "1100px", margin: "0 auto", padding: "40px 24px 64px" }}>

      {/* Onboarding prompt */}
      {!onboardingCompleted && (
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", gap: "16px", flexWrap: "wrap", background: "linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1))", border: "1px solid rgba(99,102,241,0.25)", borderRadius: "14px", padding: "18px 22px", marginBottom: "28px" }}>
          <div>
            <div style={{ fontWeight: 700, fontSize: "14px", color: "var(--text-1)", marginBottom: "2px" }}>Personalize your dashboard</div>
            <div style={{ fontSize: "13px", color: "var(--text-3)" }}>Tell us what you're learning for — takes under a minute, and never restricts what you can access.</div>
          </div>
          <Link href="/onboarding" className="btn-primary" style={{ padding: "9px 20px", borderRadius: "8px", fontSize: "13px", fontWeight: 700, whiteSpace: "nowrap" }}>
            Get started →
          </Link>
        </div>
      )}

      {/* Welcome / identity */}
      <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "32px" }}>
        {avatarUrl ? (
          <Image src={avatarUrl} alt={displayName} width={56} height={56} style={{ borderRadius: "50%", height: "56px", width: "56px", objectFit: "cover" }} />
        ) : (
          <div style={{ width: "56px", height: "56px", borderRadius: "50%", background: "var(--bg-2)", border: "1px solid var(--border)", display: "flex", alignItems: "center", justifyContent: "center", fontSize: "22px", fontWeight: 700, color: "var(--text-3)" }}>
            {displayName.charAt(0).toUpperCase()}
          </div>
        )}
        <div>
          <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "24px", fontWeight: 800, marginBottom: "2px" }}>
            Welcome back, {displayName.split(" ")[0]}
          </h1>
          <p style={{ color: "var(--text-4)", fontSize: "13px" }}>{profile?.email || clerkUser?.primaryEmailAddress?.emailAddress}</p>
        </div>
        {isAdmin && (
          <Link href="/admin" style={{ marginLeft: "auto", padding: "8px 16px", borderRadius: "8px", fontSize: "12px", fontWeight: 700, background: "rgba(239,68,68,0.1)", border: "1px solid rgba(239,68,68,0.25)", color: "#F87171", textDecoration: "none" }}>
            🛡️ Admin panel
          </Link>
        )}
      </div>

      {/* Profile summary */}
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))", gap: "12px", marginBottom: "28px" }}>
        {[
          { label: "Learner type", value: profile?.learner_type?.replace(/-/g, " ") || "Not set" },
          { label: "Current level", value: profile?.current_level || "Not set" },
          { label: "Goal", value: profile?.primary_goal || "Not set" },
          { label: "Timeline", value: profile?.goal_timeline || "Not set" },
        ].map(item => (
          <div key={item.label} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", padding: "14px 16px" }}>
            <div style={{ fontSize: "10px", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase", color: "var(--text-4)", marginBottom: "4px" }}>{item.label}</div>
            <div style={{ fontSize: "14px", fontWeight: 600, color: "var(--text-1)", textTransform: "capitalize" }}>{item.value}</div>
          </div>
        ))}
        <Link href="/onboarding" style={{ display: "flex", alignItems: "center", justifyContent: "center", background: "var(--bg-2)", border: "1px dashed var(--border)", borderRadius: "12px", padding: "14px 16px", fontSize: "13px", fontWeight: 600, color: "var(--text-3)", textDecoration: "none" }}>
          ✏️ Edit preferences
        </Link>
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1.4fr 1fr", gap: "20px", marginBottom: "20px" }}>
        {/* Continue learning */}
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "16px" }}>Continue learning</div>
          {continueLink && mostRecentActivity ? (
            <Link href={continueLink} style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "14px 16px", borderRadius: "10px", background: "var(--bg-1)", border: "1px solid var(--border)", textDecoration: "none" }}>
              <div>
                <div style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)", textTransform: "capitalize" }}>
                  {mostRecentActivity.technology_slug?.replace(/-/g, " ")} — {mostRecentActivity.section_slug}
                </div>
                <div style={{ fontSize: "11px", color: "var(--text-4)", marginTop: "2px", textTransform: "capitalize" }}>{mostRecentActivity.academy_slug}</div>
              </div>
              <span style={{ color: "#3B82F6", fontSize: "13px", fontWeight: 700 }}>Resume →</span>
            </Link>
          ) : (
            <div style={{ textAlign: "center", padding: "24px 16px" }}>
              <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "14px" }}>You haven't started a lesson yet — pick any academy and jump in.</p>
              <Link href="/academies" className="btn-primary" style={{ padding: "9px 20px", borderRadius: "8px", fontSize: "13px", fontWeight: 700 }}>Browse academies</Link>
            </div>
          )}
        </div>

        {/* Quiz performance */}
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "16px" }}>Quiz performance</div>
          {quizSummary.totalAttempts > 0 ? (
            <>
              <div style={{ display: "flex", alignItems: "baseline", gap: "8px", marginBottom: "10px" }}>
                <span style={{ fontSize: "32px", fontWeight: 800, color: "#3B82F6" }}>{quizSummary.averageScorePct}%</span>
                <span style={{ fontSize: "12px", color: "var(--text-4)" }}>avg across {quizSummary.totalAttempts} attempt{quizSummary.totalAttempts !== 1 ? "s" : ""}</span>
              </div>
              {quizSummary.weakTopics.length > 0 && (
                <div>
                  <div style={{ fontSize: "11px", fontWeight: 700, color: "var(--text-4)", marginBottom: "6px" }}>NEEDS REVIEW</div>
                  {quizSummary.weakTopics.map(t => (
                    <div key={`${t.academySlug}-${t.technologySlug}`} style={{ fontSize: "12px", color: "var(--text-3)", padding: "4px 0", textTransform: "capitalize" }}>
                      {t.technologySlug.replace(/-/g, " ")} — <span style={{ color: "#F59E0B", fontWeight: 700 }}>{t.scorePct}%</span>
                    </div>
                  ))}
                </div>
              )}
            </>
          ) : (
            <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No quiz attempts yet — quizzes appear at the bottom of lesson pages as content gets verification questions added.</p>
          )}
        </div>
      </div>

      {/* Progress by domain */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", marginBottom: "20px" }}>
        <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "16px" }}>Progress by domain</div>
        {progressAcademies.length > 0 ? (
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))", gap: "14px" }}>
            {progressAcademies.map(a => {
              const summary = progressSummary.find(p => p.academySlug === a.slug)!;
              const pct = summary.touched > 0 ? Math.round((summary.completed / summary.touched) * 100) : 0;
              return (
                <Link key={a.slug} href={`/academies/${a.slug}`} style={{ textDecoration: "none", display: "block", padding: "14px", borderRadius: "12px", border: "1px solid var(--border)", background: "var(--bg-1)" }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "8px" }}>
                    <span style={{ fontSize: "16px" }}>{a.icon}</span>
                    <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-1)" }}>{a.title}</span>
                  </div>
                  <div style={{ height: "6px", borderRadius: "3px", background: "var(--bg-2)", overflow: "hidden", marginBottom: "6px" }}>
                    <div style={{ height: "100%", width: `${pct}%`, background: a.color, borderRadius: "3px" }} />
                  </div>
                  <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{summary.completed}/{summary.touched} sections completed</div>
                </Link>
              );
            })}
          </div>
        ) : (
          <p style={{ color: "var(--text-4)", fontSize: "13px" }}>No progress recorded yet — this fills in as you complete lessons.</p>
        )}
      </div>

      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: "20px", marginBottom: "20px" }}>
        {/* Recommended domains */}
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "4px" }}>
            {interestedAcademies.length > 0 ? "Your domains" : "Recommended for you"}
          </div>
          <p style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "14px" }}>
            {interestedAcademies.length > 0 ? "Picked during onboarding — edit anytime." : "Popular starting points. Every academy is always open to explore."}
          </p>
          <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
            {recommendedAcademies.map(a => (
              <Link key={a.slug} href={`/academies/${a.slug}`} style={{ display: "flex", alignItems: "center", gap: "10px", padding: "10px 12px", borderRadius: "10px", textDecoration: "none" }}
                >
                <span style={{ fontSize: "15px" }}>{a.icon}</span>
                <span style={{ fontSize: "13px", fontWeight: 600, color: "var(--text-2)" }}>{a.title}</span>
                <span style={{ marginLeft: "auto", color: a.color, fontSize: "12px", fontWeight: 700 }}>→</span>
              </Link>
            ))}
          </div>
        </div>

        {/* Bookmarks */}
        <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px" }}>
          <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "14px" }}>Saved topics</div>
          {bookmarks.length > 0 ? (
            <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
              {bookmarks.map(b => (
                <Link key={b.id} href={`/academies/${b.academy_slug}/${b.technology_slug}/${b.section_slug}`} style={{ display: "flex", alignItems: "center", gap: "8px", padding: "8px 10px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", color: "var(--text-2)" }}>
                  🔖 {b.title}
                </Link>
              ))}
            </div>
          ) : (
            <p style={{ color: "var(--text-4)", fontSize: "13px" }}>Nothing bookmarked yet — save topics you want to revisit later.</p>
          )}
        </div>
      </div>

      {/* Recent activity */}
      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", padding: "24px", marginBottom: "28px" }}>
        <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "14px" }}>Recent activity</div>
        {recentActivity.length > 0 ? (
          <div style={{ display: "flex", flexDirection: "column", gap: "2px" }}>
            {recentActivity.map(item => (
              <div key={item.id} style={{ display: "flex", alignItems: "center", gap: "10px", padding: "8px 0", borderBottom: "1px solid var(--border)", fontSize: "13px" }}>
                <span style={{ color: "var(--text-3)" }}>{ACTIVITY_LABELS[item.activity_type] || item.activity_type}</span>
                {item.technology_slug && <span style={{ fontWeight: 600, color: "var(--text-1)", textTransform: "capitalize" }}>{item.technology_slug.replace(/-/g, " ")}</span>}
                <span style={{ marginLeft: "auto", color: "var(--text-4)", fontSize: "11px" }}>{timeAgo(item.created_at)}</span>
              </div>
            ))}
          </div>
        ) : (
          <p style={{ color: "var(--text-4)", fontSize: "13px" }}>Your activity — lessons viewed, quizzes taken, bookmarks saved — will show up here.</p>
        )}
      </div>

      {/* Browse all CTA */}
      <div style={{ textAlign: "center", padding: "28px", background: "linear-gradient(135deg, rgba(59,130,246,0.08), rgba(139,92,246,0.08))", border: "1px solid rgba(99,102,241,0.2)", borderRadius: "16px" }}>
        <div style={{ fontWeight: 700, fontSize: "15px", marginBottom: "6px" }}>Every domain, always open</div>
        <p style={{ fontSize: "13px", color: "var(--text-3)", marginBottom: "16px" }}>DevOps, Cloud, AI, Law, Finance, Healthcare, Exams, Wellness, and more — one account, no restrictions.</p>
        <Link href="/academies" className="btn-primary" style={{ padding: "11px 26px", borderRadius: "10px", fontSize: "14px", fontWeight: 700 }}>
          Browse all academies
        </Link>
      </div>
    </div>
  );
}
