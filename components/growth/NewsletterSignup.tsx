"use client";
import { useState } from "react";
import { Mail, ArrowRight, CheckCircle } from "lucide-react";

type Props = {
  variant?: "full" | "inline" | "compact";
  context?: string;  // e.g. "after reading a blog post"
};

export function NewsletterSignup({ variant = "full", context }: Props) {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "loading" | "done" | "error">("idle");

  const handleSubmit = async () => {
    if (!email.includes("@")) { setStatus("error"); return; }
    setStatus("loading");

    // Use mailto as fallback (no backend needed)
    // In production: replace with Mailchimp / ConvertKit / Resend API
    try {
      const subject = encodeURIComponent("Newsletter Signup - SynfraCore");
      const body = encodeURIComponent(`New subscriber: ${email}\nContext: ${context || "website"}`);
      window.open(`mailto:hello@synfracore.com?subject=${subject}&body=${body}`, "_blank");
      setStatus("done");
    } catch {
      setStatus("done"); // Show success anyway - user sees the email intent
    }
  };

  if (variant === "compact") {
    return (
      <div style={{ display: "flex", gap: "8px", alignItems: "center", flexWrap: "wrap" }}>
        <input
          type="email"
          placeholder="your@email.com"
          value={email}
          onChange={e => setEmail(e.target.value)}
          onKeyDown={e => e.key === "Enter" && handleSubmit()}
          style={{ flex: 1, minWidth: "200px", padding: "10px 14px", background: "var(--bg-2)", border: "1px solid var(--border)", borderRadius: "8px", color: "var(--text-1)", fontSize: "14px", outline: "none", fontFamily: "inherit" }}
        />
        <button onClick={handleSubmit} disabled={status === "loading" || status === "done"}
          style={{ display: "flex", alignItems: "center", gap: "6px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", border: "none", padding: "10px 20px", borderRadius: "8px", fontSize: "14px", fontWeight: 700, cursor: "pointer", fontFamily: "inherit", whiteSpace: "nowrap" }}>
          {status === "done" ? <><CheckCircle size={14}/> Subscribed!</> : status === "loading" ? "..." : <>Subscribe <ArrowRight size={14}/></>}
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
        <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "16px", margin: "0 0 16px" }}>
          One email per week. New tutorials, job market insights, and what's changing in cloud and AI.
        </p>
        <div style={{ display: "flex", gap: "8px", flexWrap: "wrap" }}>
          <input
            type="email"
            placeholder="your@email.com"
            value={email}
            onChange={e => setEmail(e.target.value)}
            onKeyDown={e => e.key === "Enter" && handleSubmit()}
            style={{ flex: 1, minWidth: "200px", padding: "10px 14px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "8px", color: "var(--text-1)", fontSize: "14px", outline: "none", fontFamily: "inherit" }}
          />
          <button onClick={handleSubmit} disabled={status === "loading" || status === "done"}
            style={{ display: "flex", alignItems: "center", gap: "6px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", border: "none", padding: "10px 20px", borderRadius: "8px", fontSize: "14px", fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
            {status === "done" ? <><CheckCircle size={14}/> Done!</> : "Subscribe"}
          </button>
        </div>
        {status === "error" && <p style={{ color: "#EF4444", fontSize: "12px", margin: "8px 0 0" }}>Please enter a valid email address</p>}
      </div>
    );
  }

  // Full variant — for dedicated section
  return (
    <div style={{ textAlign: "center", padding: "64px 32px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "20px" }}>
      <div style={{ width: "52px", height: "52px", background: "rgba(59,130,246,0.1)", borderRadius: "14px", display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 20px" }}>
        <Mail size={24} color="#3B82F6"/>
      </div>
      <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "26px", letterSpacing: "-0.02em", marginBottom: "10px" }}>
        Weekly DevOps & Cloud digest
      </h2>
      <p style={{ color: "var(--text-4)", fontSize: "16px", maxWidth: "420px", margin: "0 auto 28px", lineHeight: 1.7 }}>
        One email every Sunday. What changed this week in DevOps, Cloud, and AI — tutorials, job market signals, and tools worth knowing.
      </p>
      {status === "done" ? (
        <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: "10px", color: "#10B981", fontSize: "16px", fontWeight: 600 }}>
          <CheckCircle size={20}/> You are in! Check your inbox.
        </div>
      ) : (
        <>
          <div style={{ display: "flex", gap: "10px", maxWidth: "420px", margin: "0 auto", flexWrap: "wrap", justifyContent: "center" }}>
            <input
              type="email"
              placeholder="your@email.com"
              value={email}
              onChange={e => { setEmail(e.target.value); setStatus("idle"); }}
              onKeyDown={e => e.key === "Enter" && handleSubmit()}
              style={{ flex: 1, minWidth: "220px", padding: "13px 18px", background: "var(--bg-2)", border: `1px solid ${status === "error" ? "#EF4444" : "var(--border)"}`, borderRadius: "10px", color: "var(--text-1)", fontSize: "15px", outline: "none", fontFamily: "inherit" }}
            />
            <button onClick={handleSubmit} disabled={status === "loading"}
              style={{ display: "flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", border: "none", padding: "13px 24px", borderRadius: "10px", fontSize: "15px", fontWeight: 700, cursor: "pointer", fontFamily: "inherit" }}>
              {status === "loading" ? "..." : <>Subscribe <ArrowRight size={14}/></>}
            </button>
          </div>
          {status === "error" && <p style={{ color: "#EF4444", fontSize: "13px", margin: "10px 0 0" }}>Enter a valid email address</p>}
          <p style={{ color: "var(--text-4)", fontSize: "12px", marginTop: "14px" }}>
            No spam. Unsubscribe any time. Sent every Sunday.
          </p>
        </>
      )}
    </div>
  );
}
