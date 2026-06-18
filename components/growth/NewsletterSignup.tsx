"use client";
import { useState } from "react";
import { Mail, ArrowRight, CheckCircle } from "lucide-react";

type Props = {
  variant?: "full" | "inline" | "compact";
  context?: string;
};

export function NewsletterSignup({ variant = "full", context }: Props) {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "loading" | "done" | "error">("idle");
  const [errorMsg, setErrorMsg] = useState("Enter a valid email address");

  const handleSubmit = async () => {
    if (!email.includes("@") || !email.includes(".")) {
      setStatus("error");
      setErrorMsg("Enter a valid email address");
      return;
    }
    setStatus("loading");
    try {
      const res = await fetch("/api/subscribe", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, context }),
      });
      if (res.ok) {
        setStatus("done");
      } else {
        const data = await res.json();
        setStatus("error");
        setErrorMsg(data.error || "Something went wrong. Try again.");
      }
    } catch {
      setStatus("error");
      setErrorMsg("Connection error. Please try again.");
    }
  };

  const inputStyle: React.CSSProperties = {
    flex: 1, minWidth: "200px", padding: "11px 14px",
    background: "var(--bg-2)", border: `1px solid ${status === "error" ? "#EF4444" : "var(--border)"}`,
    borderRadius: "8px", color: "var(--text-1)", fontSize: "14px", outline: "none", fontFamily: "inherit",
  };

  const btnStyle: React.CSSProperties = {
    display: "flex", alignItems: "center", gap: "6px",
    background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
    color: "#fff", border: "none", padding: "11px 20px", borderRadius: "8px",
    fontSize: "14px", fontWeight: 700, cursor: "pointer", fontFamily: "inherit", whiteSpace: "nowrap",
    opacity: status === "loading" || status === "done" ? 0.7 : 1,
  };

  const btnContent = status === "done"
    ? <><CheckCircle size={14}/> Subscribed!</>
    : status === "loading" ? "..." : <>Subscribe <ArrowRight size={14}/></>;

  if (variant === "compact") {
    return (
      <div style={{ display: "flex", gap: "8px", alignItems: "center", flexWrap: "wrap" }}>
        <input type="email" placeholder="your@email.com" value={email}
          onChange={e => { setEmail(e.target.value); setStatus("idle"); }}
          onKeyDown={e => e.key === "Enter" && handleSubmit()} style={inputStyle}/>
        <button onClick={handleSubmit} disabled={status === "loading" || status === "done"} style={btnStyle}>
          {btnContent}
        </button>
      </div>
    );
  }

  if (variant === "inline") {
    return (
      <div style={{ background: "linear-gradient(135deg, rgba(59,130,246,0.08), rgba(139,92,246,0.08))", border: "1px solid rgba(59,130,246,0.15)", borderRadius: "16px", padding: "28px 32px" }}>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "8px" }}>
          <Mail size={18} color="#3B82F6"/>
          <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", margin: 0 }}>
            Weekly DevOps & Cloud digest
          </h3>
        </div>
        <p style={{ color: "var(--text-4)", fontSize: "14px", margin: "0 0 16px" }}>
          Every Sunday — tutorials, interview questions, tips, and what changed in DevOps and Cloud this week.
        </p>
        <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
          <input type="email" placeholder="your@email.com" value={email}
            onChange={e => { setEmail(e.target.value); setStatus("idle"); }}
            onKeyDown={e => e.key === "Enter" && handleSubmit()} style={{ ...inputStyle, background: "var(--bg-1)" }}/>
          <button onClick={handleSubmit} disabled={status === "loading" || status === "done"} style={btnStyle}>
            {btnContent}
          </button>
        </div>
        {status === "error" && <p style={{ color: "#EF4444", fontSize: "12px", margin: "8px 0 0" }}>{errorMsg}</p>}
        {status === "done" && <p style={{ color: "#10B981", fontSize: "13px", margin: "10px 0 0", fontWeight: 600 }}>✓ Check your inbox for the welcome email!</p>}
      </div>
    );
  }

  // Full variant
  return (
    <div style={{ textAlign: "center", padding: "64px 32px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px" }}>
      <div style={{ width: "52px", height: "52px", background: "rgba(59,130,246,0.1)", borderRadius: "14px", display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 20px" }}>
        <Mail size={24} color="#3B82F6"/>
      </div>
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "26px", letterSpacing: "-0.02em", marginBottom: "10px" }}>
        SynfraCore Weekly Digest
      </h2>
      <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "420px", margin: "0 auto 28px", lineHeight: 1.7 }}>
        Every Sunday. Tutorials, interview Q&amp;A, a practical tip, and what changed in DevOps, Cloud, and AI this week.
      </p>
      {status === "done" ? (
        <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: "10px", color: "#10B981", fontSize: "16px", fontWeight: 600 }}>
          <CheckCircle size={20}/> You're in! Check your inbox for the welcome email.
        </div>
      ) : (
        <>
          <div style={{ display: "flex", gap: "10px", maxWidth: "420px", margin: "0 auto", flexWrap: "wrap", justifyContent: "center" }}>
            <input type="email" placeholder="your@email.com" value={email}
              onChange={e => { setEmail(e.target.value); setStatus("idle"); }}
              onKeyDown={e => e.key === "Enter" && handleSubmit()}
              style={{ ...inputStyle, minWidth: "220px", padding: "13px 18px", fontSize: "15px" }}/>
            <button onClick={handleSubmit} disabled={status === "loading"} style={{ ...btnStyle, padding: "13px 24px", fontSize: "15px" }}>
              {status === "loading" ? "..." : <>Subscribe <ArrowRight size={14}/></>}
            </button>
          </div>
          {status === "error" && <p style={{ color: "#EF4444", fontSize: "13px", margin: "10px 0 0" }}>{errorMsg}</p>}
          <p style={{ color: "var(--text-4)", fontSize: "12px", marginTop: "14px" }}>
            No spam. Unsubscribe any time. Sent every Sunday.
          </p>
        </>
      )}
    </div>
  );
}
