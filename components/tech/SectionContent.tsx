"use client";
import { useState, useEffect } from "react";
import { ShareButtons } from "@/components/growth/ShareButtons";
import { TelegramBanner } from "@/components/growth/TelegramBanner";
import { Loader2, RefreshCw, Sparkles, BookOpen } from "lucide-react";
import { hasContent, fetchContent } from "@/lib/content";

type Props = {
  academy: string;
  technology: string;
  section: string;
  techName: string;
  techIcon: string;
  sectionLabel: string;
  accentColor: string;
};

function formatInline(text: string): string {
  return text
    .replace(/\*\*(.+?)\*\*/g, '<strong class="md-strong">$1</strong>')
    .replace(/`(.+?)`/g, '<code class="md-code">$1</code>')
    .replace(/\*(.+?)\*/g, '<em class="md-em">$1</em>');
}

function renderMarkdown(content: string) {
  const lines = content.split("\n");
  const elements: React.ReactNode[] = [];
  let i = 0;
  let tableBuffer: React.ReactNode[] = [];

  const flushTable = (key: string) => {
    if (tableBuffer.length > 0) {
      elements.push(
        <div key={`tw-${key}`} style={{ overflowX: "auto", margin: "16px 0" }}>
          <table style={{ width: "100%", borderCollapse: "collapse" }}>
            <tbody>{tableBuffer}</tbody>
          </table>
        </div>
      );
      tableBuffer = [];
    }
  };

  while (i < lines.length) {
    const line = lines[i];

    // ── SVG DIAGRAM BLOCK ──
    if (line.trim() === "```svg") {
      flushTable(`svg-${i}`);
      const svgLines: string[] = [];
      i++;
      while (i < lines.length && lines[i].trim() !== "```") {
        svgLines.push(lines[i]);
        i++;
      }
      const svgContent = svgLines.join("\n");
      elements.push(
        <div key={`svg-${i}`} style={{
          margin: "24px 0", borderRadius: "16px", overflow: "hidden",
          border: "1px solid var(--border)", background: "var(--bg-2)",
          padding: "24px", display: "flex", justifyContent: "center"
        }}>
          <div dangerouslySetInnerHTML={{ __html: svgContent }} style={{ maxWidth: "100%", overflow: "auto" }} />
        </div>
      );
    }

    // ── CODE BLOCKS ──
    else if (line.startsWith("```")) {
      flushTable(`code-${i}`);
      const lang = line.slice(3).trim();
      const codeLines: string[] = [];
      i++;
      while (i < lines.length && !lines[i].startsWith("```")) {
        codeLines.push(lines[i]);
        i++;
      }
      elements.push(
        <div key={`code-${i}`} style={{ margin: "16px 0", borderRadius: "12px", overflow: "hidden", border: "1px solid var(--border)" }}>
          {lang && <div style={{ background: "var(--bg-2)", padding: "5px 16px", fontSize: "11px", color: "#60A5FA", fontFamily: "monospace", fontWeight: 700, letterSpacing: "0.06em", textTransform: "uppercase" }}>{lang}</div>}
          <pre style={{ background: "var(--bg)", padding: "20px", margin: 0, overflowX: "auto" }}>
            <code style={{ color: "var(--text-2)", fontSize: "13px", fontFamily: "monospace", lineHeight: 1.75 }}>{codeLines.join("\n")}</code>
          </pre>
        </div>
      );
    }

    // ── CALLOUT BOXES ── :::tip, :::info, :::warning, :::danger
    else if (line.match(/^:::(tip|info|warning|danger|note)\s*(.*)$/)) {
      flushTable(`callout-${i}`);
      const m = line.match(/^:::(tip|info|warning|danger|note)\s*(.*)$/)!;
      const type = m[1];
      const title = m[2] || type;
      const calloutLines: string[] = [];
      i++;
      while (i < lines.length && lines[i].trim() !== ":::") {
        calloutLines.push(lines[i]);
        i++;
      }
      const colors: Record<string, [string, string, string]> = {
        tip:     ["#10B981", "rgba(16,185,129,0.08)", "rgba(16,185,129,0.2)"],
        info:    ["#3B82F6", "rgba(59,130,246,0.08)", "rgba(59,130,246,0.2)"],
        note:    ["#6366F1", "rgba(99,102,241,0.08)", "rgba(99,102,241,0.2)"],
        warning: ["#F59E0B", "rgba(245,158,11,0.08)", "rgba(245,158,11,0.2)"],
        danger:  ["#EF4444", "rgba(239,68,68,0.08)",  "rgba(239,68,68,0.2)"],
      };
      const icons: Record<string, string> = { tip: "💡", info: "ℹ️", note: "📝", warning: "⚠️", danger: "🚫" };
      const [color, bg, border] = colors[type] || colors.info;
      elements.push(
        <div key={`callout-${i}`} style={{ margin: "20px 0", padding: "16px 20px", background: bg, border: `1px solid ${border}`, borderLeft: `4px solid ${color}`, borderRadius: "0 12px 12px 0" }}>
          <div style={{ fontWeight: 700, color, fontSize: "13px", marginBottom: "8px", display: "flex", alignItems: "center", gap: "6px" }}>
            {icons[type]} {title.charAt(0).toUpperCase() + title.slice(1)}
          </div>
          {calloutLines.map((cl, ci) => (
            <p key={ci} style={{ margin: "3px 0", color: "var(--text-2)", fontSize: "14px", lineHeight: 1.7 }}
              dangerouslySetInnerHTML={{ __html: formatInline(cl) }} />
          ))}
        </div>
      );
    }

    // ── TABLES ──
    else if (line.startsWith("| ") && line.includes("|")) {
      if (!line.includes("---")) {
        const cells = line.split("|").slice(1, -1).map(c => c.trim());
        const isHeader = tableBuffer.length === 0;
        tableBuffer.push(
          <tr key={`tr-${i}`} style={{ borderBottom: "1px solid var(--border)" }}>
            {cells.map((cell, ci) => isHeader
              ? <th key={ci} style={{ background: "var(--bg-2)", color: "var(--text-1)", padding: "10px 14px", textAlign: "left", fontSize: "13px", fontWeight: 600, border: "1px solid var(--border)" }}>{cell}</th>
              : <td key={ci} style={{ padding: "10px 14px", border: "1px solid var(--border)", color: "var(--text-3)", fontSize: "13px" }} dangerouslySetInnerHTML={{ __html: formatInline(cell) }} />
            )}
          </tr>
        );
      }
    }

    // ── STANDARD MARKDOWN ──
    else {
      flushTable(`pre-${i}`);
      if (line.startsWith("# ")) elements.push(<h1 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "26px", fontWeight: 800, margin: "24px 0 12px", color: "var(--text-1)", letterSpacing: "-0.02em" }}>{line.slice(2)}</h1>);
      else if (line.startsWith("## ")) elements.push(<h2 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "20px", fontWeight: 700, margin: "20px 0 10px", color: "var(--text-1)" }}>{line.slice(3)}</h2>);
      else if (line.startsWith("### ")) elements.push(<h3 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "16px", fontWeight: 700, margin: "16px 0 8px", color: "var(--text-1)" }}>{line.slice(4)}</h3>);
      else if (line.match(/^[-*] /)) elements.push(<div key={i} style={{ display: "flex", gap: "10px", margin: "5px 0" }}><span style={{ color: "#2563EB", flexShrink: 0 }}>•</span><span style={{ color: "var(--text-2)", fontSize: "15px", lineHeight: 1.7 }} dangerouslySetInnerHTML={{ __html: formatInline(line.slice(2)) }} /></div>);
      else if (line.match(/^\d+\. /)) { const num = line.match(/^(\d+)\. /)?.[1]; elements.push(<div key={i} style={{ display: "flex", gap: "10px", margin: "5px 0" }}><span style={{ color: "#2563EB", flexShrink: 0, fontWeight: 700, fontSize: "13px", minWidth: "20px", marginTop: "2px" }}>{num}.</span><span style={{ color: "var(--text-2)", fontSize: "15px", lineHeight: 1.7 }} dangerouslySetInnerHTML={{ __html: formatInline(line.replace(/^\d+\. /, "")) }} /></div>); }
      else if (line.startsWith("> ")) elements.push(<div key={i} style={{ borderLeft: "3px solid #2563EB", background: "rgba(37,99,235,0.06)", padding: "10px 16px", margin: "12px 0", borderRadius: "0 8px 8px 0" }}><p style={{ color: "var(--text-3)", fontSize: "14px", margin: 0 }} dangerouslySetInnerHTML={{ __html: formatInline(line.slice(2)) }} /></div>);
      else if (line === "---") elements.push(<hr key={i} style={{ border: "none", borderTop: "1px solid var(--border)", margin: "20px 0" }} />);
      else if (line.trim() === "") elements.push(<div key={i} style={{ height: "8px" }} />);
      else elements.push(<p key={i} style={{ color: "var(--text-2)", fontSize: "15px", lineHeight: 1.8, margin: "4px 0" }} dangerouslySetInnerHTML={{ __html: formatInline(line) }} />);
    }
    i++;
  }
  flushTable("end");
  return elements;
}

function buildPrompt(techName: string, section: string): string {
  const map: Record<string, string> = {
    overview: `Write a comprehensive overview of ${techName}. Include: what it is, why it matters, core architecture, key use cases. Use markdown with tables and diagrams where helpful.`,
    fundamentals: `Write ${techName} fundamentals with essential commands/concepts, code examples in fenced blocks, and practical tips.`,
    intermediate: `Write intermediate ${techName} content with real-world patterns, best practices, and production code examples.`,
    advanced: `Write advanced ${techName} content covering production patterns, performance optimization, security hardening, and enterprise patterns.`,
    roadmap: `Create a structured learning roadmap for mastering ${techName} with phases, topics, timelines, and resources.`,
    labs: `Design 6 hands-on labs for ${techName}: 2 beginner, 2 intermediate, 2 advanced. Each with objective, steps, and expected outcome.`,
    projects: `Design 5 portfolio projects for ${techName}: beginner to capstone. Each with description, architecture, and implementation steps.`,
    interview: `Create ${techName} interview Q&A: 5 beginner, 5 intermediate, 5 advanced questions with detailed answers.`,
    troubleshooting: `Write a ${techName} troubleshooting guide for 8-10 common production issues with root cause analysis and fixes.`,
    certification: `Write a certification guide for ${techName} with exam details, study plan, and top resources.`,
    cheatsheets: `Create a comprehensive ${techName} cheat sheet with commands grouped by category and code examples.`,
    notes: `Create study notes for ${techName} with key concepts, mental models, and patterns vs anti-patterns.`,
    "real-world-scenarios": `Describe 5 real-world production ${techName} scenarios with context, implementation, results, and lessons learned.`,
    faq: `Write 15 FAQ about ${techName} with clear, direct answers covering setup, config, common issues, and best practices.`,
  };
  return map[section] || `Write comprehensive ${section} content for ${techName} in clear markdown with code examples.`;
}

export default function SectionContent({ academy, technology, section, techName, techIcon, sectionLabel, accentColor }: Props) {
  const [preContent, setPreContent] = useState<string | null>(null);
  const [aiContent, setAiContent] = useState("");
  const [loading, setLoading] = useState(true);
  const [aiLoading, setAiLoading] = useState(false);
  const [error, setError] = useState("");
  const [mode, setMode] = useState<"pre" | "ai" | "empty">("empty");

  useEffect(() => {
    setLoading(true);
    setPreContent(null);
    setAiContent("");
    setMode("empty");
    fetchContent(academy, technology, section).then(content => {
      if (content) { setPreContent(content); setMode("pre"); }
      else setMode("empty");
      setLoading(false);
    });
  }, [academy, technology, section]);

  const generateAI = async (force = false) => {
    const cacheKey = `ai:${academy}:${technology}:${section}`;
    if (!force) {
      const cached = sessionStorage.getItem(cacheKey);
      if (cached) { setAiContent(cached); setMode("ai"); return; }
    }
    setAiLoading(true);
    setError("");
    setMode("ai");
    try {
      const res = await fetch("/api/ai", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "claude-sonnet-4-6",
          max_tokens: 1000,
          system: `You are SynfraAI, an expert ${techName} engineer created by SynfraCore. Write accurate, practical, production-relevant content in clean markdown with code examples in fenced code blocks with language tags.`,
          messages: [{ role: "user", content: buildPrompt(techName, section) }],
        }),
      });
      const data = await res.json();
      const text = data.content?.[0]?.text || "";
      if (!text) throw new Error("Empty response");
      setAiContent(text);
      sessionStorage.setItem(cacheKey, text);
    } catch {
      setError("Failed to generate. Please try again.");
    } finally {
      setAiLoading(false);
    }
  };

  if (loading) return (
    <div style={{ maxWidth: "800px" }}>
      <style>{`
        @keyframes shimmer {
          0% { background-position: -800px 0; }
          100% { background-position: 800px 0; }
        }
        .skeleton {
          background: linear-gradient(90deg, var(--bg-2) 25%, var(--bg-1) 50%, var(--bg-2) 75%);
          background-size: 800px 100%;
          animation: shimmer 1.5s infinite;
          border-radius: 6px;
        }
      `}</style>
      {/* Skeleton: Title */}
      <div className="skeleton" style={{ height: "28px", width: "55%", marginBottom: "20px" }} />
      {/* Skeleton: Body paragraphs */}
      {[100, 85, 92, 78, 95, 60].map((w, i) => (
        <div key={i} className="skeleton" style={{ height: "16px", width: `${w}%`, marginBottom: "12px" }} />
      ))}
      {/* Skeleton: Code block */}
      <div className="skeleton" style={{ height: "120px", width: "100%", borderRadius: "10px", margin: "24px 0" }} />
      {/* More text */}
      {[88, 72, 95, 65].map((w, i) => (
        <div key={`b${i}`} className="skeleton" style={{ height: "16px", width: `${w}%`, marginBottom: "12px" }} />
      ))}
    </div>
  );

  if (mode === "pre" && preContent) return (
    <div>
      <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "28px", paddingBottom: "18px", borderBottom: "1px solid var(--border)" }}>
        <span style={{ background: "rgba(16,185,129,0.1)", border: "1px solid rgba(16,185,129,0.2)", color: "#34D399", padding: "3px 12px", borderRadius: "100px", fontSize: "11px", fontWeight: 700, letterSpacing: "0.04em", display: "flex", alignItems: "center", gap: "5px" }}>
          <BookOpen size={11} /> Expert Content
        </span>
        <button onClick={() => generateAI()} style={{ marginLeft: "auto", display: "flex", alignItems: "center", gap: "6px", background: "rgba(139,92,246,0.08)", border: "1px solid rgba(139,92,246,0.15)", color: "#A78BFA", padding: "5px 14px", borderRadius: "8px", cursor: "pointer", fontSize: "12px", fontWeight: 600 }}>
          <Sparkles size={12} /> Try AI Version
        </button>
      </div>
      <article style={{ maxWidth: "800px" }}>{renderMarkdown(preContent)}</article>
      {/* Share this page + community CTA */}
      <div style={{ maxWidth: "800px", marginTop: "40px", display: "flex", flexDirection: "column", gap: "12px" }}>
        <ShareButtons title={`${sectionLabel} — ${techName} | SynfraCore`} compact />
        <TelegramBanner variant="card" academy={academy} />
      </div>
    </div>
  );

  if (mode === "ai") {
    if (aiLoading) return (
      <div style={{ display: "flex", flexDirection: "column", alignItems: "center", padding: "80px 24px", gap: "16px" }}>
        <div style={{ width: "52px", height: "52px", borderRadius: "14px", background: `${accentColor}15`, border: `1px solid ${accentColor}25`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "24px" }}>{techIcon}</div>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "var(--text-4)", fontSize: "14px" }}>
          <Loader2 size={16} style={{ animation: "spin 1s linear infinite" }} />
          Generating {techName} {sectionLabel}...
        </div>
        <style>{`@keyframes spin{to{transform:rotate(360deg)}}`}</style>
      </div>
    );
    if (error) return (
      <div style={{ padding: "32px", background: "rgba(244,63,94,0.05)", border: "1px solid rgba(244,63,94,0.15)", borderRadius: "14px", textAlign: "center" }}>
        <p style={{ color: "var(--text-danger, #FB7185)", marginBottom: "16px" }}>{error}</p>
        <button onClick={() => generateAI(true)} style={{ display: "inline-flex", alignItems: "center", gap: "6px", background: "rgba(244,63,94,0.1)", border: "1px solid rgba(244,63,94,0.2)", color: "var(--text-danger, #FB7185)", padding: "8px 18px", borderRadius: "8px", cursor: "pointer", fontSize: "13px", fontWeight: 600 }}>
          <RefreshCw size={13} /> Retry
        </button>
      </div>
    );
    if (aiContent) return (
      <div>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", marginBottom: "28px", paddingBottom: "18px", borderBottom: "1px solid var(--border)" }}>
          <span style={{ background: "rgba(139,92,246,0.1)", border: "1px solid rgba(139,92,246,0.2)", color: "#A78BFA", padding: "3px 12px", borderRadius: "100px", fontSize: "11px", fontWeight: 700, display: "flex", alignItems: "center", gap: "5px" }}>
            <Sparkles size={11} /> AI Generated
          </span>
          {preContent && <button onClick={() => setMode("pre")} style={{ marginLeft: "auto", background: "transparent", border: "1px solid var(--border)", color: "var(--text-4)", padding: "4px 12px", borderRadius: "8px", cursor: "pointer", fontSize: "12px" }}>← Expert Version</button>}
          <button onClick={() => generateAI(true)} style={{ display: "flex", alignItems: "center", gap: "6px", background: "transparent", border: "1px solid var(--border)", color: "var(--text-4)", padding: "4px 12px", borderRadius: "8px", cursor: "pointer", fontSize: "12px" }}>
            <RefreshCw size={12} /> Regenerate
          </button>
        </div>
        <article style={{ maxWidth: "800px" }}>{renderMarkdown(aiContent)}</article>
      </div>
    );
  }

  return (
    <div style={{ textAlign: "center", padding: "80px 24px" }}>
      <div style={{ fontSize: "48px", marginBottom: "20px" }}>{techIcon}</div>
      <h3 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "20px", fontWeight: 700, marginBottom: "10px", color: "var(--text-1)" }}>
        {sectionLabel} for {techName}
      </h3>
      <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "28px", maxWidth: "400px", margin: "0 auto 28px" }}>
        Pre-written content coming soon. Generate AI content instantly.
      </p>
      <button onClick={() => generateAI()} style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #2563EB, #7C3AED)", color: "#fff", padding: "12px 28px", borderRadius: "10px", cursor: "pointer", fontSize: "14px", fontWeight: 600, border: "none", boxShadow: "0 4px 20px rgba(37,99,235,0.3)" }}>
        <Sparkles size={16} /> Generate AI Content
      </button>
    </div>
  );
}
