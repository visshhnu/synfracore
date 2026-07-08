"use client";
import { useState } from "react";
import { Sparkles, Send, Loader2, BookOpen, Code2, Terminal } from "lucide-react";

export default function AIAssistantPage() {
  const [input, setInput] = useState("");
  const [messages, setMessages] = useState<{role:string;content:string}[]>([]);
  const [loading, setLoading] = useState(false);

  const suggestions = [
    "Explain Docker vs Kubernetes",
    "How does a Kubernetes pod work?",
    "What is the difference between SQL and NoSQL?",
    "Explain RAG in simple terms",
    "What is Infrastructure as Code?",
    "How does HTTPS work?",
  ];

  const send = async (text: string) => {
    if (!text.trim() || loading) return;
    const userMsg = { role: "user", content: text };
    const newMessages = [...messages, userMsg];
    setMessages(newMessages);
    setInput("");
    setLoading(true);

    try {
      const res = await fetch("https://api.anthropic.com/v1/messages", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "claude-haiku-4-5-20251001",
          max_tokens: 1000,
          system: "You are SynfraAI, an expert teaching assistant created by SynfraCore for DevOps, Cloud, Databases, AI Engineering, Security, and tech education. Give concise, practical answers with code examples when helpful. Use markdown formatting.",
          messages: newMessages.map(m => ({ role: m.role, content: m.content })),
        }),
      });
      const data = await res.json();
      const reply = data.content?.[0]?.text || "Sorry, I couldn't get a response.";
      setMessages([...newMessages, { role: "assistant", content: reply }]);
    } catch {
      setMessages([...newMessages, { role: "assistant", content: "Connection error. Please try again." }]);
    }
    setLoading(false);
  };

  return (
    <div style={{ maxWidth: "860px", margin: "0 auto", padding: "40px 24px", minHeight: "80vh", display: "flex", flexDirection: "column" }}>
      {/* Header */}
      <div style={{ textAlign: "center", marginBottom: "40px" }}>
        <div style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "rgba(139,92,246,0.1)", border: "1px solid rgba(139,92,246,0.2)", borderRadius: "20px", padding: "6px 16px", fontSize: "13px", color: "#8B5CF6", fontWeight: 600, marginBottom: "16px" }}>
          <Sparkles size={14}/> Powered by SynfraAI
        </div>
        <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px, 4vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "12px" }}>
          SynfraAI — Your Learning Assistant
        </h1>
        <p style={{ color: "var(--text-4)", fontSize: "16px", lineHeight: 1.6 }}>
          Ask anything about DevOps, Cloud, Kubernetes, AI, Databases, or Security
        </p>
      </div>

      {/* Chat area */}
      <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: "16px", marginBottom: "24px", minHeight: "300px" }}>
        {messages.length === 0 ? (
          <div>
            <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "16px", textAlign: "center" }}>Try asking:</p>
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(240px, 1fr))", gap: "10px" }}>
              {suggestions.map(s => (
                <button key={s} onClick={() => send(s)}
                  style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "10px", padding: "12px 16px", cursor: "pointer", textAlign: "left", fontSize: "13px", color: "var(--text-3)", transition: "all 0.15s" }}
                  onMouseEnter={e => { e.currentTarget.style.borderColor = "#8B5CF6"; e.currentTarget.style.color = "#8B5CF6"; }}
                  onMouseLeave={e => { e.currentTarget.style.borderColor = "var(--border)"; e.currentTarget.style.color = "var(--text-3)"; }}>
                  {s}
                </button>
              ))}
            </div>
          </div>
        ) : (
          messages.map((m, i) => (
            <div key={i} style={{ display: "flex", justifyContent: m.role === "user" ? "flex-end" : "flex-start" }}>
              <div style={{ maxWidth: "80%", padding: "14px 18px", borderRadius: m.role === "user" ? "16px 16px 4px 16px" : "16px 16px 16px 4px", background: m.role === "user" ? "linear-gradient(135deg, #3B82F6, #8B5CF6)" : "var(--bg-1)", border: m.role === "user" ? "none" : "1px solid var(--border)", color: m.role === "user" ? "#fff" : "var(--text-1)", fontSize: "14px", lineHeight: 1.7, whiteSpace: "pre-wrap" }}>
                {m.content}
              </div>
            </div>
          ))
        )}
        {loading && (
          <div style={{ display: "flex", justifyContent: "flex-start" }}>
            <div style={{ padding: "14px 18px", borderRadius: "16px 16px 16px 4px", background: "var(--bg-1)", border: "1px solid var(--border)", display: "flex", alignItems: "center", gap: "8px", color: "var(--text-4)", fontSize: "14px" }}>
              <Loader2 size={14} style={{ animation: "spin 1s linear infinite" }}/> Thinking...
            </div>
          </div>
        )}
      </div>

      {/* Input */}
      <div style={{ display: "flex", gap: "10px", background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "8px 8px 8px 16px" }}>
        <input value={input} onChange={e => setInput(e.target.value)}
          onKeyDown={e => e.key === "Enter" && !e.shiftKey && (e.preventDefault(), send(input))}
          placeholder="Ask about Docker, Kubernetes, AWS, SQL, AI..." autoFocus
          style={{ flex: 1, background: "transparent", border: "none", outline: "none", fontSize: "15px", color: "var(--text-1)", padding: "8px 0" }}/>
        <button onClick={() => send(input)} disabled={loading || !input.trim()}
          style={{ background: loading || !input.trim() ? "var(--bg-2)" : "linear-gradient(135deg, #3B82F6, #8B5CF6)", border: "none", borderRadius: "10px", width: "42px", height: "42px", display: "flex", alignItems: "center", justifyContent: "center", cursor: loading || !input.trim() ? "not-allowed" : "pointer", flexShrink: 0 }}>
          <Send size={16} color={loading || !input.trim() ? "var(--text-4)" : "#fff"}/>
        </button>
      </div>
      <p style={{ textAlign: "center", color: "var(--text-4)", fontSize: "12px", marginTop: "12px" }}>
        Powered by SynfraAI · Answers may occasionally be incorrect · Always verify critical information
      </p>
    </div>
  );
}
