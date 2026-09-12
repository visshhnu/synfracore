"use client";

import { useState, useEffect, useTransition, type CSSProperties, type FormEvent } from "react";
import { useRouter } from "next/navigation";
import { connectTelegram, createScheduledPost } from "@/app/settings/social/actions";
import type { SocialConnection, ScheduledPost } from "@/lib/supabase/social";

type Props = {
  initialConnections: SocialConnection[];
  initialScheduledPosts: ScheduledPost[];
};

// Pure, exported for a direct unit test (see scratchpad test — no browser
// available this session, so this is what makes the fix genuinely
// verifiable rather than just re-read). Bug this fixes: `useState(x)`'s
// initial value only ever applies on the component's first mount — it was
// used to seed `connectionId` from `initialConnections[0]?.id`, which is ""
// on first load (no connections exist yet). Connecting a channel calls
// router.refresh(), which re-renders this same component instance with a
// new `initialConnections` prop — but does NOT remount it, so that stale ""
// state survived untouched. The <select> then visually fell back to
// rendering its first real <option> (browsers do this whenever a
// controlled value matches no option), while the actual `connectionId`
// state — what handleSchedule actually reads and submits — stayed "".
// That's the exact reported symptom: a channel visibly shown selected, but
// the server action rejecting with "Choose a connection to post to."
export function resolveSelectedConnectionId(currentId: string, connections: { id: string }[]): string {
  if (connections.length === 0) return "";
  if (connections.some((c) => c.id === currentId)) return currentId;
  return connections[0].id;
}

const STATUS_COLORS: Record<ScheduledPost["status"], string> = {
  pending: "#F59E0B",
  sent: "#34D399",
  failed: "#F87171",
};

const cardStyle: CSSProperties = {
  background: "var(--bg-2)",
  border: "1px solid var(--border)",
  borderRadius: "16px",
  padding: "24px",
  marginBottom: "20px",
};
const inputStyle: CSSProperties = {
  width: "100%",
  padding: "10px 12px",
  borderRadius: "8px",
  border: "1px solid var(--border)",
  background: "var(--bg-1)",
  color: "var(--text-1)",
  fontSize: "14px",
  fontFamily: "inherit",
};
const labelStyle: CSSProperties = {
  display: "block",
  fontSize: "12px",
  fontWeight: 600,
  color: "var(--text-3)",
  marginBottom: "6px",
};

// Server Actions called directly from client-side state (not a raw <form
// action={...}>) so success/error can render inline without a full page
// navigation — router.refresh() afterward re-runs the Server Component
// (app/settings/social/page.tsx) to pick up the new row, same effect as
// revalidatePath() achieves server-side, just also refreshing this
// component's own props.
export function SocialSettingsClient({ initialConnections, initialScheduledPosts }: Props) {
  const router = useRouter();
  const [isPending, startTransition] = useTransition();

  const [chatIdentifier, setChatIdentifier] = useState("");
  const [connectError, setConnectError] = useState("");
  const [connectSuccess, setConnectSuccess] = useState(false);

  const [connectionId, setConnectionId] = useState(initialConnections[0]?.id ?? "");
  // Re-syncs whenever initialConnections changes (e.g. after connecting a
  // channel triggers router.refresh()) — useState's initializer above only
  // ever runs once, on first mount, so without this the state above goes
  // stale the moment a real connection appears after the initial empty load.
  useEffect(() => {
    setConnectionId((prev) => resolveSelectedConnectionId(prev, initialConnections));
  }, [initialConnections]);
  const [content, setContent] = useState("");
  const [scheduledAt, setScheduledAt] = useState("");
  const [postError, setPostError] = useState("");
  const [postSuccess, setPostSuccess] = useState(false);

  function handleConnect(e: FormEvent) {
    e.preventDefault();
    setConnectError("");
    setConnectSuccess(false);
    const formData = new FormData();
    formData.set("chatIdentifier", chatIdentifier);
    startTransition(async () => {
      const result = await connectTelegram(formData);
      if (result.success) {
        setChatIdentifier("");
        setConnectSuccess(true);
        router.refresh();
      } else {
        setConnectError(result.error);
      }
    });
  }

  function handleSchedule(e: FormEvent) {
    e.preventDefault();
    setPostError("");
    setPostSuccess(false);
    const formData = new FormData();
    formData.set("connectionId", connectionId);
    formData.set("content", content);
    formData.set("scheduledAt", scheduledAt);
    // datetime-local has no timezone of its own — the server needs this
    // offset to convert correctly regardless of where it runs (see
    // app/settings/social/actions.ts's own comment on this).
    formData.set("scheduledAtOffsetMinutes", String(new Date().getTimezoneOffset()));
    startTransition(async () => {
      const result = await createScheduledPost(formData);
      if (result.success) {
        setContent("");
        setScheduledAt("");
        setPostSuccess(true);
        router.refresh();
      } else {
        setPostError(result.error);
      }
    });
  }

  return (
    <>
      <div style={cardStyle}>
        <h2 style={{ fontSize: "16px", fontWeight: 700, marginBottom: "4px" }}>Connect Telegram</h2>
        <p style={{ fontSize: "13px", color: "var(--text-4)", marginBottom: "14px" }}>
          Add <strong>@SynfraCoreBot</strong> as an admin to your channel or group first, then enter its
          username (e.g. <code>@mychannel</code>) or numeric chat ID below.
        </p>
        <form onSubmit={handleConnect}>
          <label style={labelStyle} htmlFor="chatIdentifier">Channel/group username or ID</label>
          <div style={{ display: "flex", gap: "8px" }}>
            <input
              id="chatIdentifier"
              style={inputStyle}
              value={chatIdentifier}
              onChange={(e) => setChatIdentifier(e.target.value)}
              placeholder="@mychannel"
              disabled={isPending}
            />
            <button
              type="submit"
              className="btn-primary"
              disabled={isPending || !chatIdentifier.trim()}
              style={{ padding: "10px 20px", borderRadius: "8px", fontSize: "13px", fontWeight: 700, whiteSpace: "nowrap" }}
            >
              {isPending ? "Verifying..." : "Connect"}
            </button>
          </div>
          {connectError && <p style={{ color: "#F87171", fontSize: "12px", marginTop: "8px" }}>{connectError}</p>}
          {connectSuccess && <p style={{ color: "#34D399", fontSize: "12px", marginTop: "8px" }}>Connected!</p>}
        </form>

        {initialConnections.length > 0 && (
          <div style={{ marginTop: "18px", display: "flex", flexDirection: "column", gap: "8px" }}>
            {initialConnections.map((c) => (
              <div
                key={c.id}
                style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "10px 12px", borderRadius: "8px", background: "var(--bg-1)", border: "1px solid var(--border)" }}
              >
                <span style={{ fontSize: "13px", fontWeight: 600 }}>{c.display_name ?? c.external_id}</span>
                <span style={{ fontSize: "11px", color: "var(--text-4)", textTransform: "capitalize" }}>{c.platform}</span>
              </div>
            ))}
          </div>
        )}
      </div>

      <div style={cardStyle}>
        <h2 style={{ fontSize: "16px", fontWeight: 700, marginBottom: "14px" }}>Schedule a post</h2>
        {initialConnections.length === 0 ? (
          <p style={{ fontSize: "13px", color: "var(--text-4)" }}>Connect a channel above before scheduling a post.</p>
        ) : (
          <form onSubmit={handleSchedule}>
            {/* Single option today — the <select> is real UI, not decoration,
                so a second platform slots in later without a rewrite. */}
            <label style={labelStyle} htmlFor="platformSelect">Platform</label>
            <select id="platformSelect" style={{ ...inputStyle, marginBottom: "14px" }} disabled>
              <option>Telegram</option>
            </select>

            <label style={labelStyle} htmlFor="connectionSelect">Post to</label>
            <select
              id="connectionSelect"
              style={{ ...inputStyle, marginBottom: "14px" }}
              value={connectionId}
              onChange={(e) => setConnectionId(e.target.value)}
              disabled={isPending}
            >
              {initialConnections.map((c) => (
                <option key={c.id} value={c.id}>{c.display_name ?? c.external_id}</option>
              ))}
            </select>

            <label style={labelStyle} htmlFor="content">Content</label>
            <textarea
              id="content"
              style={{ ...inputStyle, marginBottom: "14px", minHeight: "100px", resize: "vertical" }}
              value={content}
              onChange={(e) => setContent(e.target.value)}
              placeholder="What do you want to post?"
              disabled={isPending}
            />

            <label style={labelStyle} htmlFor="scheduledAt">When</label>
            <input
              id="scheduledAt"
              type="datetime-local"
              style={{ ...inputStyle, marginBottom: "14px" }}
              value={scheduledAt}
              onChange={(e) => setScheduledAt(e.target.value)}
              disabled={isPending}
            />

            <button
              type="submit"
              className="btn-primary"
              disabled={isPending || !content.trim() || !scheduledAt}
              style={{ padding: "10px 20px", borderRadius: "8px", fontSize: "13px", fontWeight: 700 }}
            >
              {isPending ? "Scheduling..." : "Schedule post"}
            </button>
            {postError && <p style={{ color: "#F87171", fontSize: "12px", marginTop: "8px" }}>{postError}</p>}
            {postSuccess && <p style={{ color: "#34D399", fontSize: "12px", marginTop: "8px" }}>Scheduled!</p>}
          </form>
        )}
      </div>

      <div style={cardStyle}>
        <h2 style={{ fontSize: "16px", fontWeight: 700, marginBottom: "14px" }}>Scheduled posts</h2>
        {initialScheduledPosts.length === 0 ? (
          <p style={{ fontSize: "13px", color: "var(--text-4)" }}>No scheduled posts yet.</p>
        ) : (
          <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
            {initialScheduledPosts.map((p) => (
              <div key={p.id} style={{ padding: "12px", borderRadius: "8px", background: "var(--bg-1)", border: "1px solid var(--border)" }}>
                <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "4px" }}>
                  <span style={{ fontSize: "11px", fontWeight: 700, color: STATUS_COLORS[p.status], textTransform: "uppercase" }}>
                    {p.status}
                  </span>
                  <span style={{ fontSize: "11px", color: "var(--text-4)" }}>{new Date(p.scheduled_at).toLocaleString()}</span>
                </div>
                <p style={{ fontSize: "13px", color: "var(--text-2)", margin: 0 }}>{p.content}</p>
                {p.status === "failed" && p.error && (
                  <p style={{ fontSize: "11px", color: "#F87171", marginTop: "4px" }}>{p.error}</p>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </>
  );
}
