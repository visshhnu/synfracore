"use client";
import { useState, useRef, useEffect } from "react";
import { Send, Bot, User, Loader2, Sparkles, Zap } from "lucide-react";

type Message = {
  role: "user" | "assistant";
  content: string;
  id: string;
};

const suggestions = [
  "Explain Kubernetes pod lifecycle",
  "How does Terraform state locking work?",
  "Compare EKS vs AKS vs GKE",
  "Write a Jenkins declarative pipeline for Node.js",
  "What is GitOps and how does ArgoCD implement it?",
  "Explain AWS VPC CIDR design",
  "How to troubleshoot CrashLoopBackOff?",
  "Explain RAG architecture for LLMs",
  "Set up Prometheus monitoring for Kubernetes",
  "What is FinOps and how to implement it?",
];

function formatInline(text: string): string {
  return text
    .replace(/\*\*(.+?)\*\*/g, '<strong style="color:#E8EDF5;font-weight:600">$1</strong>')
    .replace(/`(.+?)`/g, '<code style="background:rgba(59,130,246,0.12);border:1px solid rgba(59,130,246,0.2);padding:1px 5px;border-radius:4px;font-size:12px;color:#93C5FD;font-family:monospace">$1</code>')
    .replace(/\*(.+?)\*/g, '<em style="color:#A78BFA">$1</em>');
}

function renderMarkdown(content: string) {
  const lines = content.split("\n");
  const elements: React.ReactNode[] = [];
  let i = 0;
  while (i < lines.length) {
    const line = lines[i];
    if (line.startsWith("```")) {
      const lang = line.slice(3).trim();
      const codeLines: string[] = [];
      i++;
      while (i < lines.length && !lines[i].startsWith("```")) {
        codeLines.push(lines[i]);
        i++;
      }
      elements.push(
        <div key={`code-${i}`} style={{ margin: "12px 0", borderRadius: "10px", overflow: "hidden", border: "1px solid #1E2D47" }}>
          {lang && <div style={{ background: "#1a2540", padding: "4px 14px", fontSize: "11px", color: "#60A5FA", fontFamily: "monospace", fontWeight: 600 }}>{lang}</div>}
          <pre style={{ background: "#070E1A", padding: "16px", margin: 0, overflowX: "auto" }}>
            <code style={{ color: "#CBD5E1", fontSize: "13px", fontFamily: "monospace", lineHeight: 1.7 }}>{codeLines.join("\n")}</code>
          </pre>
        </div>
      );
      i++;
      continue;
    }
    if (line.startsWith("# ")) elements.push(<h1 key={i} style={{ fontSize: "20px", fontWeight: 700, margin: "16px 0 8px", color: "#E8EDF5" }}>{line.slice(2)}</h1>);
    else if (line.startsWith("## ")) elements.push(<h2 key={i} style={{ fontSize: "17px", fontWeight: 700, margin: "14px 0 6px", color: "#E8EDF5" }}>{line.slice(3)}</h2>);
    else if (line.startsWith("### ")) elements.push(<h3 key={i} style={{ fontSize: "15px", fontWeight: 700, margin: "12px 0 4px", color: "#E8EDF5" }}>{line.slice(4)}</h3>);
    else if (line.match(/^[-*] /)) elements.push(
      <div key={i} style={{ display: "flex", gap: "8px", margin: "4px 0" }}>
        <span style={{ color: "#60A5FA", flexShrink: 0 }}>•</span>
        <span style={{ color: "#9BA8C0", fontSize: "14px", lineHeight: 1.6 }} dangerouslySetInnerHTML={{ __html: formatInline(line.slice(2)) }} />
      </div>
    );
    else if (line.match(/^\d+\. /)) {
      const num = line.match(/^(\d+)\. /)?.[1];
      elements.push(
        <div key={i} style={{ display: "flex", gap: "10px", margin: "4px 0" }}>
          <span style={{ color: "#60A5FA", flexShrink: 0, fontSize: "13px", fontWeight: 600, minWidth: "20px" }}>{num}.</span>
          <span style={{ color: "#9BA8C0", fontSize: "14px", lineHeight: 1.6 }} dangerouslySetInnerHTML={{ __html: formatInline(line.replace(/^\d+\. /, "")) }} />
        </div>
      );
    }
    else if (line.startsWith("> ")) elements.push(<div key={i} style={{ borderLeft: "3px solid #3B82F6", background: "rgba(59,130,246,0.05)", padding: "8px 14px", margin: "8px 0", borderRadius: "0 6px 6px 0" }}><p style={{ color: "#9BA8C0", fontSize: "13px", margin: 0 }}>{line.slice(2)}</p></div>);
    else if (line === "---") elements.push(<hr key={i} style={{ border: "none", borderTop: "1px solid #1E2D47", margin: "16px 0" }} />);
    else if (line.trim() === "") elements.push(<div key={i} style={{ height: "6px" }} />);
    else elements.push(<p key={i} style={{ color: "#9BA8C0", fontSize: "14px", lineHeight: 1.75, margin: "3px 0" }} dangerouslySetInnerHTML={{ __html: formatInline(line) }} />);
    i++;
  }
  return elements;
}

export default function AIAssistantClient() {
  const [messages, setMessages] = useState<Message[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const bottomRef = useRef<HTMLDivElement>(null);
  const textareaRef = useRef<HTMLTextAreaElement>(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, loading]);

  const sendMessage = async (text?: string) => {
    const content = text || input.trim();
    if (!content || loading) return;
    setInput("");
    if (textareaRef.current) textareaRef.current.style.height = "auto";

    const userMsg: Message = { role: "user", content, id: Date.now().toString() };
    setMessages((prev) => [...prev, userMsg]);
    setLoading(true);

    try {
      const history = [...messages, userMsg].map((m) => ({ role: m.role, content: m.content }));
      const res = await fetch("/api/ai", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "claude-sonnet-4-20250514",
          max_tokens: 1000,
          system: `You are SynfraCore AI — an expert DevOps, Cloud, Platform Engineering, and AI Engineering assistant. 
Specialties: Linux, Docker, Kubernetes, Helm, ArgoCD, Terraform, Ansible, Jenkins, GitHub Actions, AWS, Azure, GCP, Prometheus, Grafana, ELK, Python, LangChain, RAG, LLMOps, Cybersecurity, Data Analytics, Medical Coding.
Always provide: accurate technical answers, working code examples in fenced blocks with language tags, best practices, and clear structure using markdown.`,
          messages: history,
        }),
      });
      const data = await res.json();
      const reply = data.content?.[0]?.text || "Sorry, I couldn't generate a response.";
      setMessages((prev) => [...prev, { role: "assistant", content: reply, id: (Date.now() + 1).toString() }]);
    } catch {
      setMessages((prev) => [...prev, { role: "assistant", content: "I encountered an error. Please try again.", id: (Date.now() + 1).toString() }]);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ height: "calc(100vh - 65px)", display: "flex", flexDirection: "column" }}>
      {/* Header */}
      <div style={{ borderBottom: "1px solid #1E2D47", padding: "14px 24px", display: "flex", alignItems: "center", gap: "14px", background: "#0C1524", flexShrink: 0 }}>
        <div style={{ width: "38px", height: "38px", borderRadius: "11px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", display: "flex", alignItems: "center", justifyContent: "center" }}>
          <Bot size={19} style={{ color: "#fff" }} />
        </div>
        <div>
          <h1 style={{ fontSize: "15px", fontWeight: 700 }}>SynfraCore AI Assistant</h1>
          <p style={{ color: "#6B7A99", fontSize: "12px" }}>Expert in DevOps · Cloud · AI · Kubernetes · Terraform</p>
        </div>
        <div style={{ marginLeft: "auto", display: "flex", alignItems: "center", gap: "6px", background: "rgba(16,185,129,0.1)", border: "1px solid rgba(16,185,129,0.2)", color: "#34D399", padding: "3px 11px", borderRadius: "100px", fontSize: "11px", fontWeight: 600 }}>
          <span style={{ width: "6px", height: "6px", borderRadius: "50%", background: "#34D399", display: "inline-block" }} />
          Online
        </div>
      </div>

      {/* Messages */}
      <div style={{ flexGrow: 1, overflowY: "auto", padding: "24px" }}>
        {messages.length === 0 ? (
          <div style={{ maxWidth: "740px", margin: "0 auto" }}>
            <div style={{ textAlign: "center", marginBottom: "40px", paddingTop: "24px" }}>
              <div style={{ width: "68px", height: "68px", borderRadius: "20px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 18px" }}>
                <Sparkles size={30} style={{ color: "#fff" }} />
              </div>
              <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "24px", fontWeight: 700, marginBottom: "10px" }}>SynfraCore AI</h2>
              <p style={{ color: "#6B7A99", fontSize: "15px", maxWidth: "400px", margin: "0 auto" }}>
                Ask anything about DevOps, Cloud, Kubernetes, Terraform, AWS, Azure, AI Engineering, Cybersecurity, and more.
              </p>
            </div>
            <p style={{ color: "#6B7A99", fontSize: "11px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", marginBottom: "12px" }}>Suggested questions</p>
            <div style={{ display: "grid", gap: "8px", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))" }}>
              {suggestions.map((s) => (
                <button key={s} onClick={() => sendMessage(s)} style={{ background: "#0F1A2E", border: "1px solid #1E2D47", borderRadius: "11px", padding: "11px 15px", textAlign: "left", color: "#9BA8C0", fontSize: "13px", cursor: "pointer", transition: "all 0.2s", display: "flex", alignItems: "center", gap: "10px" }}
                  className="hover:border-blue-500/40 hover:bg-blue-500/5">
                  <Zap size={13} style={{ color: "#60A5FA", flexShrink: 0 }} />
                  {s}
                </button>
              ))}
            </div>
          </div>
        ) : (
          <div style={{ maxWidth: "740px", margin: "0 auto" }}>
            {messages.map((msg) => (
              <div key={msg.id} style={{ display: "flex", gap: "12px", marginBottom: "22px", flexDirection: msg.role === "user" ? "row-reverse" : "row" }}>
                <div style={{ width: "33px", height: "33px", borderRadius: "10px", flexShrink: 0, display: "flex", alignItems: "center", justifyContent: "center", background: msg.role === "user" ? "rgba(139,92,246,0.15)" : "linear-gradient(135deg,#3B82F6,#8B5CF6)", border: msg.role === "user" ? "1px solid rgba(139,92,246,0.3)" : "none" }}>
                  {msg.role === "user" ? <User size={15} style={{ color: "#A78BFA" }} /> : <Bot size={15} style={{ color: "#fff" }} />}
                </div>
                <div style={{ maxWidth: "87%", padding: "13px 17px", borderRadius: msg.role === "user" ? "16px 4px 16px 16px" : "4px 16px 16px 16px", background: msg.role === "user" ? "rgba(139,92,246,0.12)" : "#0F1A2E", border: `1px solid ${msg.role === "user" ? "rgba(139,92,246,0.2)" : "#1E2D47"}` }}>
                  {msg.role === "user"
                    ? <p style={{ color: "#E8EDF5", fontSize: "14px", lineHeight: 1.6, margin: 0 }}>{msg.content}</p>
                    : <div>{renderMarkdown(msg.content)}</div>}
                </div>
              </div>
            ))}
            {loading && (
              <div style={{ display: "flex", gap: "12px", marginBottom: "22px" }}>
                <div style={{ width: "33px", height: "33px", borderRadius: "10px", display: "flex", alignItems: "center", justifyContent: "center", background: "linear-gradient(135deg,#3B82F6,#8B5CF6)", flexShrink: 0 }}>
                  <Bot size={15} style={{ color: "#fff" }} />
                </div>
                <div style={{ padding: "13px 17px", borderRadius: "4px 16px 16px 16px", background: "#0F1A2E", border: "1px solid #1E2D47", display: "flex", alignItems: "center", gap: "8px" }}>
                  <Loader2 size={15} style={{ color: "#6B7A99", animation: "spin 1s linear infinite" }} />
                  <span style={{ color: "#6B7A99", fontSize: "13px" }}>Thinking...</span>
                </div>
              </div>
            )}
            <div ref={bottomRef} />
          </div>
        )}
      </div>

      {/* Input */}
      <div style={{ borderTop: "1px solid #1E2D47", padding: "14px 24px", background: "#0C1524", flexShrink: 0 }}>
        <div style={{ maxWidth: "740px", margin: "0 auto" }}>
          <div style={{ display: "flex", gap: "10px", background: "#0F1A2E", border: "1px solid #2A3F5E", borderRadius: "14px", padding: "8px 8px 8px 16px", alignItems: "flex-end" }}>
            <textarea
              ref={textareaRef}
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => { if (e.key === "Enter" && !e.shiftKey) { e.preventDefault(); sendMessage(); } }}
              placeholder="Ask anything about DevOps, Cloud, Kubernetes, AI Engineering..."
              rows={1}
              style={{ flexGrow: 1, background: "none", border: "none", outline: "none", color: "#E8EDF5", fontSize: "14px", resize: "none", fontFamily: "'Space Grotesk', sans-serif", lineHeight: 1.5, paddingTop: "6px", paddingBottom: "6px", maxHeight: "160px", overflowY: "auto" }}
              onInput={(e) => { const t = e.target as HTMLTextAreaElement; t.style.height = "auto"; t.style.height = Math.min(t.scrollHeight, 160) + "px"; }}
            />
            <button
              onClick={() => sendMessage()}
              disabled={!input.trim() || loading}
              style={{ width: "37px", height: "37px", borderRadius: "10px", background: input.trim() && !loading ? "linear-gradient(135deg,#3B82F6,#8B5CF6)" : "#1E2D47", border: "none", display: "flex", alignItems: "center", justifyContent: "center", cursor: input.trim() && !loading ? "pointer" : "not-allowed", flexShrink: 0, transition: "all 0.2s" }}
            >
              <Send size={15} style={{ color: "#fff" }} />
            </button>
          </div>
          <p style={{ color: "#6B7A99", fontSize: "11px", textAlign: "center", marginTop: "7px" }}>Enter to send · Shift+Enter for new line</p>
        </div>
      </div>
      <style>{`@keyframes spin{to{transform:rotate(360deg)}}`}</style>
    </div>
  );
}
