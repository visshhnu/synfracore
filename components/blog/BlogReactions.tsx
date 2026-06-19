"use client";
import { useState, useEffect } from "react";
import { Heart, MessageCircle, Send, ChevronDown, ChevronUp } from "lucide-react";

interface Comment { id: number; name: string; text: string; date: string; }
interface Props { slug: string; title: string; }

export function BlogReactions({ slug, title }: Props) {
  const [likes, setLikes]       = useState(0);
  const [comments, setComments] = useState<Comment[]>([]);
  const [liked, setLiked]       = useState(false);
  const [showComments, setShow] = useState(false);
  const [name, setName]         = useState("");
  const [text, setText]         = useState("");
  const [posting, setPosting]   = useState(false);
  const [posted, setPosted]     = useState(false);
  const [error, setError]       = useState("");

  useEffect(() => {
    fetch(`/api/blog?slug=${slug}`)
      .then(r => r.json())
      .then(d => { setLikes(d.likes || 0); setComments(d.comments || []); })
      .catch(() => {});
    if (typeof window !== "undefined") {
      setLiked(!!localStorage.getItem(`liked:${slug}`));
    }
  }, [slug]);

  const handleLike = async () => {
    if (liked) return;
    setLiked(true);
    setLikes(l => l + 1);
    localStorage.setItem(`liked:${slug}`, "1");
    fetch("/api/blog", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ slug, action: "like" }),
    }).catch(() => {});
  };

  const handleComment = async () => {
    if (!name.trim() || !text.trim()) { setError("Name and comment are required."); return; }
    if (text.length > 1000) { setError("Comment must be under 1000 characters."); return; }
    setPosting(true); setError("");
    try {
      const res = await fetch("/api/blog", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ slug, action: "comment", name: name.trim(), text: text.trim() }),
      });
      const data = await res.json();
      if (data.comment) {
        setComments(c => [...c, data.comment]);
        setText(""); setPosted(true);
        setTimeout(() => setPosted(false), 3000);
      }
    } catch { setError("Failed to post. Please try again."); }
    finally { setPosting(false); }
  };

  const inp: React.CSSProperties = {
    width: "100%", padding: "10px 14px", background: "var(--bg-2)",
    border: "1px solid var(--border)", borderRadius: "8px",
    color: "var(--text-1)", fontSize: "14px", fontFamily: "inherit",
    outline: "none", boxSizing: "border-box",
  };

  return (
    <div style={{ marginTop: "48px", paddingTop: "32px", borderTop: "1px solid var(--border)" }}>
      <div style={{ display: "flex", alignItems: "center", gap: "16px", marginBottom: "28px" }}>
        <button onClick={handleLike} style={{
          display: "flex", alignItems: "center", gap: "8px", padding: "9px 18px",
          borderRadius: "50px", border: liked ? "1px solid #EF4444" : "1px solid var(--border)",
          background: liked ? "rgba(239,68,68,0.08)" : "var(--bg-2)",
          color: liked ? "#EF4444" : "var(--text-3)", cursor: liked ? "default" : "pointer",
          fontSize: "14px", fontWeight: 600, fontFamily: "inherit",
        }}>
          <Heart size={16} fill={liked ? "#EF4444" : "none"} />
          {likes > 0 ? `${likes} ` : ""}{liked ? "Liked!" : "Like"}
        </button>
        <button onClick={() => setShow(!showComments)} style={{
          display: "flex", alignItems: "center", gap: "8px", padding: "9px 18px",
          borderRadius: "50px", border: "1px solid var(--border)", background: "var(--bg-2)",
          color: "var(--text-3)", cursor: "pointer", fontSize: "14px", fontWeight: 600, fontFamily: "inherit",
        }}>
          <MessageCircle size={16} />
          {comments.length > 0 ? `${comments.length} Comment${comments.length !== 1 ? "s" : ""}` : "Comment"}
          {showComments ? <ChevronUp size={14}/> : <ChevronDown size={14}/>}
        </button>
      </div>
      {showComments && (
        <div>
          {comments.length > 0 && (
            <div style={{ marginBottom: "20px" }}>
              {comments.map(c => (
                <div key={c.id} style={{ padding: "14px 16px", borderRadius: "10px", background: "var(--bg-1)", border: "1px solid var(--border)", marginBottom: "8px" }}>
                  <div style={{ display: "flex", justifyContent: "space-between", marginBottom: "6px" }}>
                    <span style={{ fontWeight: 700, fontSize: "14px" }}>{c.name}</span>
                    <span style={{ fontSize: "12px", color: "var(--text-4)" }}>{c.date}</span>
                  </div>
                  <p style={{ fontSize: "14px", color: "var(--text-3)", margin: 0, lineHeight: 1.6 }}>{c.text}</p>
                </div>
              ))}
            </div>
          )}
          <div style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "20px" }}>
            <h4 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "15px", margin: "0 0 14px" }}>Leave a comment</h4>
            <input type="text" placeholder="Your name" value={name} onChange={e => setName(e.target.value)} maxLength={50} style={{ ...inp, marginBottom: "10px" }} />
            <textarea placeholder={`Your thoughts on "${title}"...`} value={text} onChange={e => setText(e.target.value)} maxLength={1000} rows={3}
              style={{ ...inp, resize: "vertical", minHeight: "80px", marginBottom: "4px" }} />
            <div style={{ textAlign: "right", fontSize: "11px", color: "var(--text-4)", marginBottom: "10px" }}>{text.length}/1000</div>
            {error && <p style={{ color: "#EF4444", fontSize: "13px", margin: "0 0 10px" }}>{error}</p>}
            {posted && <p style={{ color: "#10B981", fontSize: "13px", margin: "0 0 10px", fontWeight: 600 }}>Comment posted!</p>}
            <button onClick={handleComment} disabled={posting || !name.trim() || !text.trim()} style={{
              display: "flex", alignItems: "center", gap: "8px", padding: "10px 20px",
              borderRadius: "8px", background: "linear-gradient(135deg,#3B82F6,#8B5CF6)",
              color: "white", border: "none", cursor: "pointer",
              fontSize: "14px", fontWeight: 700, fontFamily: "inherit",
              opacity: posting || !name.trim() || !text.trim() ? 0.6 : 1,
            }}>
              <Send size={14}/>{posting ? "Posting..." : "Post Comment"}
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
