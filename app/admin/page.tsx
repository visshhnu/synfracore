export const runtime = "edge";

import Link from "next/link";
import { notFound } from "next/navigation";
import { ensureUserRecord } from "@/lib/supabase/ensureUser";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getAllUsersForAdmin, getAdminUserStats } from "@/lib/supabase/queries";

export const metadata = { title: "Admin | SynfraCore" };

type Props = { searchParams: Promise<{ page?: string }> };

export default async function AdminPage({ searchParams }: Props) {
  // Both "is signed in" AND "is admin" are enforced right here, not in
  // middleware (see middleware.ts's comment on why /admin is deliberately
  // excluded from its auth.protect() call). ensureUserRecord() returns a
  // null profile for a signed-out visitor (currentUser() resolves to null);
  // the role check below then covers signed-in non-admins too, against our
  // own Supabase `role` column (not Clerk's org/role system, which this
  // project doesn't use). Both cases call notFound() directly from this
  // Server Component — a native use of notFound() that renders a real,
  // stable 404 rather than a redirect, so nobody can tell this page exists
  // unless they're actually an admin.
  const { profile } = await ensureUserRecord();
  if (!profile || profile.role !== "admin") notFound();

  const { page: pageParam } = await searchParams;
  const page = Math.max(1, Number(pageParam) || 1);

  const supabase = createSupabaseServerClient();
  const [{ users, totalCount }, stats] = await Promise.all([
    getAllUsersForAdmin(supabase, page),
    getAdminUserStats(supabase),
  ]);

  const pageSize = 50;
  const totalPages = Math.max(1, Math.ceil(totalCount / pageSize));

  return (
    <div style={{ maxWidth: "1200px", margin: "0 auto", padding: "40px 24px 64px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "26px", fontWeight: 800, marginBottom: "6px" }}>
        Admin — Learner Overview
      </h1>
      <p style={{ color: "var(--text-4)", fontSize: "13px", marginBottom: "28px" }}>
        Visible only to accounts with role = 'admin'. Every learner still only ever sees their own data — this view is powered by the is_admin() RLS policy, not a service-role bypass.
      </p>

      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(160px, 1fr))", gap: "12px", marginBottom: "28px" }}>
        {[
          { label: "Total users", value: stats.totalCount },
          { label: "Onboarded", value: stats.onboardedCount },
          { label: "Not onboarded", value: stats.totalCount - stats.onboardedCount },
        ].map(s => (
          <div key={s.label} style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "12px", padding: "16px" }}>
            <div style={{ fontSize: "24px", fontWeight: 800, color: "var(--text-1)" }}>{s.value}</div>
            <div style={{ fontSize: "12px", color: "var(--text-4)" }}>{s.label}</div>
          </div>
        ))}
      </div>

      <div style={{ background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "16px", overflow: "hidden" }}>
        {users.length === 0 ? (
          <p style={{ padding: "32px", textAlign: "center", color: "var(--text-4)", fontSize: "13px" }}>
            No users yet — this fills in as people sign in (each sign-in guarantees a row via ensureUserRecord()).
          </p>
        ) : (
          <div style={{ overflowX: "auto" }}>
            <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "13px" }}>
              <thead>
                <tr style={{ background: "var(--bg-1)", borderBottom: "1px solid var(--border)" }}>
                  {["User", "Role", "Onboarding", "Learner type", "Domains", "Progress rows", "Quiz attempts", "Joined"].map(h => (
                    <th key={h} style={{ textAlign: "left", padding: "10px 14px", fontSize: "11px", fontWeight: 700, letterSpacing: "0.05em", textTransform: "uppercase", color: "var(--text-4)" }}>{h}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {users.map(u => (
                  <tr key={u.id} style={{ borderBottom: "1px solid var(--border)" }}>
                    <td style={{ padding: "10px 14px" }}>
                      <div style={{ fontWeight: 600, color: "var(--text-1)" }}>{u.full_name}</div>
                      <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{u.email}</div>
                    </td>
                    <td style={{ padding: "10px 14px" }}>
                      <span style={{ padding: "2px 8px", borderRadius: "6px", fontSize: "11px", fontWeight: 700, background: u.role === "admin" ? "rgba(239,68,68,0.12)" : "var(--bg-1)", color: u.role === "admin" ? "#F87171" : "var(--text-3)" }}>{u.role}</span>
                    </td>
                    <td style={{ padding: "10px 14px" }}>
                      {u.onboarding_completed ? <span style={{ color: "#10B981" }}>✓ Done</span> : <span style={{ color: "var(--text-4)" }}>Pending</span>}
                    </td>
                    <td style={{ padding: "10px 14px", color: "var(--text-3)", textTransform: "capitalize" }}>{u.learner_type?.replace(/-/g, " ") || "—"}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-3)" }}>{u.domainCount}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-3)" }}>{u.progressCount}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-3)" }}>{u.quizAttemptCount}</td>
                    <td style={{ padding: "10px 14px", color: "var(--text-4)", fontSize: "12px" }}>{new Date(u.created_at).toLocaleDateString()}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {totalPages > 1 && (
        <div style={{ display: "flex", justifyContent: "center", alignItems: "center", gap: "12px", marginTop: "20px", fontSize: "13px", color: "var(--text-3)" }}>
          {page > 1 ? (
            <Link href={`/admin?page=${page - 1}`} style={{ padding: "6px 14px", borderRadius: "7px", border: "1px solid var(--border)", color: "var(--text-2)", textDecoration: "none" }}>← Prev</Link>
          ) : (
            <span style={{ padding: "6px 14px", borderRadius: "7px", border: "1px solid var(--border)", color: "var(--text-4)" }}>← Prev</span>
          )}
          <span>Page {page} of {totalPages}</span>
          {page < totalPages ? (
            <Link href={`/admin?page=${page + 1}`} style={{ padding: "6px 14px", borderRadius: "7px", border: "1px solid var(--border)", color: "var(--text-2)", textDecoration: "none" }}>Next →</Link>
          ) : (
            <span style={{ padding: "6px 14px", borderRadius: "7px", border: "1px solid var(--border)", color: "var(--text-4)" }}>Next →</span>
          )}
        </div>
      )}
    </div>
  );
}
