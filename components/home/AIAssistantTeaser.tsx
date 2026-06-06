import Link from "next/link";
import { Bot, ArrowRight, Sparkles } from "lucide-react";

const demoMessages = [
  {
    role: "user",
    text: "How do I troubleshoot a Kubernetes pod stuck in CrashLoopBackOff?",
  },
  {
    role: "assistant",
    text: "A CrashLoopBackOff means the container starts, crashes, and Kubernetes keeps restarting it. Here's how to diagnose it:\n\n**1. Check pod logs:**\n```bash\nkubectl logs <pod-name> --previous\n```\n\n**2. Describe the pod for events:**\n```bash\nkubectl describe pod <pod-name>\n```\n\n**Common causes:** missing env vars, OOMKilled, bad entrypoint, liveness probe failure, or a misconfigured config/secret.",
  },
];

export default function AIAssistantTeaser() {
  return (
    <section className="mx-auto max-w-7xl px-6 py-20">
      <div className="grid lg:grid-cols-2 gap-16 items-center">
        {/* Left */}
        <div>
          <span style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: "rgba(139,92,246,0.1)", border: "1px solid rgba(139,92,246,0.2)", color: "#A78BFA", fontSize: "12px", fontWeight: 600, letterSpacing: "0.1em", textTransform: "uppercase", padding: "5px 14px", borderRadius: "100px", marginBottom: "20px" }}>
            <Sparkles size={12} /> AI-Powered
          </span>
          <h2 style={{ fontFamily: "'Syne', sans-serif", fontSize: "clamp(28px, 3.5vw, 44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "16px" }}>
            SynfraCore AI Assistant
          </h2>
          <p style={{ color: "var(--text-4)", fontSize: "16px", lineHeight: 1.7, marginBottom: "28px" }}>
            An expert AI trained on DevOps, Cloud, Kubernetes, Terraform, AWS, Azure, AI Engineering, and more. Get instant answers, code examples, and architectural guidance.
          </p>

          <div style={{ display: "flex", flexDirection: "column", gap: "12px", marginBottom: "32px" }}>
            {[
              "Instant answers to DevOps & Cloud questions",
              "Working code examples with proper syntax",
              "Architecture guidance and best practices",
              "Troubleshooting help with root cause analysis",
            ].map((item) => (
              <div key={item} style={{ display: "flex", alignItems: "center", gap: "10px" }}>
                <span style={{ width: "18px", height: "18px", borderRadius: "50%", background: "rgba(139,92,246,0.15)", border: "1px solid rgba(139,92,246,0.3)", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, fontSize: "10px", color: "#A78BFA" }}>✓</span>
                <span style={{ color: "var(--text-3)", fontSize: "14px" }}>{item}</span>
              </div>
            ))}
          </div>

          <Link href="/ai-assistant" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #8B5CF6, #EC4899)", color: "#fff", padding: "13px 28px", borderRadius: "12px", fontSize: "14px", fontWeight: 600, textDecoration: "none", boxShadow: "0 8px 32px rgba(139,92,246,0.3)" }}>
            <Bot size={17} /> Open AI Assistant <ArrowRight size={16} />
          </Link>
        </div>

        {/* Right — Chat preview */}
        <div style={{ background: "var(--bg-2)", border: "1px solid #1E2D47", borderRadius: "20px", overflow: "hidden" }} className="glow-violet">
          {/* Chat header */}
          <div style={{ background: "#0C1524", borderBottom: "1px solid #1E2D47", padding: "14px 18px", display: "flex", alignItems: "center", gap: "10px" }}>
            <div style={{ width: "32px", height: "32px", borderRadius: "9px", background: "linear-gradient(135deg, #8B5CF6, #EC4899)", display: "flex", alignItems: "center", justifyContent: "center" }}>
              <Bot size={16} style={{ color: "#fff" }} />
            </div>
            <span style={{ fontWeight: 600, fontSize: "14px" }}>SynfraCore AI</span>
            <div style={{ marginLeft: "auto", width: "8px", height: "8px", borderRadius: "50%", background: "#34D399" }} />
          </div>

          {/* Messages */}
          <div style={{ padding: "20px", display: "flex", flexDirection: "column", gap: "16px" }}>
            {/* User message */}
            <div style={{ display: "flex", justifyContent: "flex-end" }}>
              <div style={{ maxWidth: "85%", background: "rgba(139,92,246,0.12)", border: "1px solid rgba(139,92,246,0.2)", borderRadius: "14px 4px 14px 14px", padding: "12px 16px" }}>
                <p style={{ color: "var(--text-1)", fontSize: "13px", lineHeight: 1.5, margin: 0 }}>
                  How do I troubleshoot a Kubernetes pod stuck in CrashLoopBackOff?
                </p>
              </div>
            </div>

            {/* AI message */}
            <div style={{ display: "flex", gap: "10px" }}>
              <div style={{ width: "28px", height: "28px", borderRadius: "8px", background: "linear-gradient(135deg, #8B5CF6, #EC4899)", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                <Bot size={14} style={{ color: "#fff" }} />
              </div>
              <div style={{ background: "#0C1524", border: "1px solid #1E2D47", borderRadius: "4px 14px 14px 14px", padding: "14px 16px", maxWidth: "87%" }}>
                <p style={{ color: "var(--text-3)", fontSize: "12px", lineHeight: 1.6, margin: "0 0 10px" }}>
                  A <strong style={{ color: "#FB7185" }}>CrashLoopBackOff</strong> means the container starts, crashes, and Kubernetes keeps restarting it. Here&apos;s how to diagnose:
                </p>
                <div style={{ background: "#070E1A", border: "1px solid #1E2D47", borderRadius: "8px", padding: "10px 14px", fontSize: "12px", fontFamily: "monospace", color: "#93C5FD", lineHeight: 1.6 }}>
                  <span style={{ color: "var(--text-4)" }}># Check logs from previous crash</span>
                  <br />
                  kubectl logs &lt;pod&gt; --previous
                  <br />
                  kubectl describe pod &lt;pod&gt;
                </div>
              </div>
            </div>
          </div>

          {/* Input area */}
          <div style={{ borderTop: "1px solid #1E2D47", padding: "14px 16px", display: "flex", gap: "8px", alignItems: "center" }}>
            <div style={{ flexGrow: 1, background: "#0C1524", border: "1px solid #1E2D47", borderRadius: "10px", padding: "8px 14px", fontSize: "13px", color: "var(--text-4)" }}>
              Ask anything...
            </div>
            <Link href="/ai-assistant" style={{ width: "34px", height: "34px", borderRadius: "9px", background: "linear-gradient(135deg, #8B5CF6, #EC4899)", display: "flex", alignItems: "center", justifyContent: "center", textDecoration: "none", flexShrink: 0 }}>
              <ArrowRight size={15} style={{ color: "#fff" }} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}
