"use client";
import { useState, useEffect } from "react";
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
      elements.push(<table key={`t-${key}`} style={{ width: "100%", borderCollapse: "collapse", margin: "16px 0" }}><tbody>{tableBuffer}</tbody></table>);
      tableBuffer = [];
    }
  };

  while (i < lines.length) {
    const line = lines[i];

    if (line.startsWith("```")) {
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
    } else if (line.startsWith("| ") && line.includes("|")) {
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
    } else {
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
    overview: `Write a comprehensive overview of ${techName} for DevOps/Cloud engineers. Cover what it is, why it matters, core architecture, key use cases, and how it fits the modern tech stack. Use markdown with tables.`,
    fundamentals: `Write ${techName} fundamentals. Cover essential commands/concepts with code examples in fenced blocks. Be practical and hands-on.`,
    intermediate: `Write intermediate ${techName} content with real-world patterns, best practices, and code examples.`,
    advanced: `Write advanced ${techName} content covering production patterns, performance optimization, security hardening, and enterprise patterns.`,
    roadmap: `Create a structured learning roadmap for mastering ${techName} with phases, topics, timelines, and resources.`,
    labs: `Design 6 hands-on labs for ${techName}: 2 beginner, 2 intermediate, 2 advanced. Each with objective, steps, and expected outcome.`,
    projects: `Design 5 portfolio projects for ${techName}: beginner to capstone. Each with description, architecture, and implementation steps.`,
    interview: `Create ${techName} interview Q&A: 5 beginner, 5 intermediate, 5 advanced, 3 architect questions with detailed answers.`,
    troubleshooting: `Write a ${techName} troubleshooting guide for 8-10 common production issues with root cause analysis and step-by-step fixes.`,
    certification: `Write a certification guide for ${techName} with exam details, study plan, and top resources.`,
    cheatsheets: `Create a comprehensive ${techName} cheat sheet with commands grouped by category and code examples.`,
    notes: `Create study notes for ${techName} with key concepts, mental models, patterns vs anti-patterns.`,
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
      if (content) {
        setPreContent(content);
        setMode("pre");
      } else {
        setMode("empty");
      }
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
          model: "claude-sonnet-4-20250514",
          max_tokens: 1000,
          system: `You are an expert ${techName} engineer. Write accurate, practical, production-relevant content in clean markdown with code examples in fenced code blocks with language tags.`,
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
    <div style={{ display: "flex", alignItems: "center", gap: "12px", padding: "60px 0", color: "var(--text-4)" }}>
      <Loader2 size={18} style={{ animation: "spin 1s linear infinite" }} />
      Loading content...
      <style>{`@keyframes spin{to{transform:rotate(360deg)}}`}</style>
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

  // Empty state
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
