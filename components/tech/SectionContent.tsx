"use client";
import { useState, useEffect } from "react";
import ReactMarkdown from "react-markdown";
import { Loader2, RefreshCw, Sparkles } from "lucide-react";

type Props = {
  academy: string;
  technology: string;
  section: string;
  techName: string;
  techIcon: string;
  sectionLabel: string;
  accentColor: string;
};

function buildPrompt(techName: string, section: string, sectionLabel: string): string {
  const prompts: Record<string, string> = {
    overview: `Write a comprehensive overview of ${techName} for a DevOps/Cloud engineer. Include:
- What it is and why it matters
- Core concepts and architecture
- Key use cases and real-world applications
- How it fits in the modern tech stack
- Comparison with alternatives
- Getting started summary
Format in clean Markdown with clear sections.`,

    fundamentals: `Write detailed fundamentals content for ${techName}. Include:
- Core concepts and terminology (with definitions)
- Basic commands/syntax (in code blocks)
- Architecture components explained simply
- Step-by-step beginner workflow
- Common beginner mistakes to avoid
- Key configuration options
Format in clear Markdown with code examples.`,

    intermediate: `Write intermediate-level ${techName} content for someone who knows the basics. Cover:
- Advanced configuration patterns
- Integration with other tools
- Performance tuning concepts
- Real scenario implementations
- Best practices and patterns
- Intermediate commands and workflows
Use code examples and practical scenarios.`,

    advanced: `Write advanced ${techName} content for experienced practitioners. Cover:
- Production-grade architecture patterns
- Advanced features and internals
- Performance optimization at scale
- Security hardening
- Debugging and deep troubleshooting
- Enterprise patterns
- Edge cases and gotchas
Include complex code examples.`,

    roadmap: `Create a detailed learning roadmap for mastering ${techName}. Include:
- Phase 1: Foundation (beginner topics, timeline ~2 weeks)
- Phase 2: Core Skills (intermediate topics, timeline ~4 weeks)  
- Phase 3: Advanced Usage (production skills, timeline ~4 weeks)
- Phase 4: Expert Level (architecture, timeline ~2 weeks)
For each phase list specific topics, resources, and practical exercises. End with certification recommendations.`,

    labs: `Create 6 hands-on labs for ${techName}:
**Beginner Labs (2):** Simple step-by-step exercises
**Intermediate Labs (2):** Scenario-based implementations
**Advanced Labs (2):** Production-level deployments

For each lab include:
- Lab title and objective
- Prerequisites
- Step-by-step instructions with commands
- Expected output
- What you learned`,

    projects: `Design 5 practical projects for ${techName}:
1. **Beginner Project** — Simple, build-and-run
2. **Intermediate Project** — Multi-component system
3. **Advanced Project** — Enterprise-grade implementation
4. **Integration Project** — Connect with 2-3 other tools
5. **Capstone Project** — Real-world problem simulation

For each include: Project description, architecture diagram (describe it), tech stack, implementation steps, learning outcomes.`,

    interview: `Create comprehensive ${techName} interview preparation:

**Beginner Questions (5):** Basic concepts, what/why/how
**Intermediate Questions (5):** Implementation and scenario questions
**Advanced Questions (5):** Architecture, scale, design decisions
**Architect Questions (3):** System design and trade-off questions

For each question provide:
- The question (bold)
- Detailed answer (2-5 sentences)
- Follow-up question (italic)`,

    troubleshooting: `Create a ${techName} troubleshooting guide:

**Most Common Issues (8-10 issues):**
For each issue:
- **Issue name** (as heading)
- Symptoms / error messages
- Root cause analysis
- Step-by-step fix
- Prevention tips

Include issues like startup failures, performance problems, configuration errors, connectivity issues, and common misconfigurations.`,

    certification: `Write a ${techName} certification guide:
- Available certifications (official and third-party)
- Exam details (domains, question count, passing score, cost, validity)
- Recommended study plan (8-12 week breakdown)
- Top study resources (free and paid)
- Practice exam tips
- Day-of-exam tips
- Post-certification career paths`,

    cheatsheets: `Create a comprehensive ${techName} cheat sheet with:
- Essential commands grouped by category (in code blocks)
- Key configuration examples
- Important flags and options
- Quick reference for common operations
- Shortcuts and time-savers
- Regex/patterns commonly used
Format as a scannable reference with lots of code blocks.`,

    notes: `Create detailed ${techName} study notes covering:
- Architecture diagrams (describe with ASCII art or text)
- Key concepts summarized in bullet points
- Important formulas/algorithms if applicable
- Mental models for understanding
- Common patterns and anti-patterns
- Memory aids and mnemonics
- Links between concepts`,

    "real-world-scenarios": `Create 5 real-world ${techName} scenarios from actual production environments:

For each scenario include:
- **Scenario title** (realistic company/situation)
- Business context and challenge
- Technical implementation details
- Challenges faced and solutions
- Results and metrics
- Key lessons learned

Make them realistic and practical.`,

    faq: `Create a comprehensive ${techName} FAQ with 15-20 questions covering:
- Setup and installation questions
- Common configuration questions
- Integration questions
- Performance and scaling questions
- Troubleshooting questions
- Best practice questions

Format: Bold question, then clear answer.`,
  };

  return prompts[section] || `Write comprehensive ${sectionLabel} content for ${techName} in clean Markdown format. Be detailed, practical, and include code examples where relevant.`;
}

export default function SectionContent({
  academy,
  technology,
  section,
  techName,
  techIcon,
  sectionLabel,
  accentColor,
}: Props) {
  const [content, setContent] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const cacheKey = `synfracore:${academy}:${technology}:${section}`;

  const fetchContent = async (skipCache = false) => {
    setLoading(true);
    setError("");
    setContent("");

    if (!skipCache) {
      const cached = sessionStorage.getItem(cacheKey);
      if (cached) {
        setContent(cached);
        setLoading(false);
        return;
      }
    }

    try {
      const prompt = buildPrompt(techName, section, sectionLabel);

      const response = await fetch("/api/ai", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "claude-sonnet-4-20250514",
          max_tokens: 1000,
          system: `You are an expert ${techName} engineer and educator. Write clear, accurate, practical content for professional engineers. Use clean Markdown formatting. Include code examples in fenced code blocks with language tags. Be comprehensive but avoid fluff.`,
          messages: [{ role: "user", content: prompt }],
        }),
      });

      const data = await response.json();

      if (data.error) {
        throw new Error(data.error.message);
      }

      const text = data.content?.[0]?.text || "";
      setContent(text);
      sessionStorage.setItem(cacheKey, text);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load content");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchContent();
  }, [academy, technology, section]);

  if (loading) {
    return (
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          padding: "80px 40px",
          gap: "20px",
        }}
      >
        <div
          style={{
            width: "56px",
            height: "56px",
            borderRadius: "16px",
            background: `${accentColor}15`,
            border: `1px solid ${accentColor}30`,
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            fontSize: "26px",
          }}
        >
          {techIcon}
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: "10px", color: "#6B7A99", fontSize: "15px" }}>
          <Loader2 size={18} style={{ animation: "spin 1s linear infinite" }} />
          <span>Generating {techName} {sectionLabel} content...</span>
        </div>
        <div
          style={{
            width: "200px",
            height: "3px",
            background: "#0C1524",
            borderRadius: "100px",
            overflow: "hidden",
          }}
        >
          <div
            style={{
              height: "100%",
              background: `linear-gradient(90deg, ${accentColor}, transparent)`,
              borderRadius: "100px",
              animation: "shimmer 1.5s ease-in-out infinite",
              width: "60%",
            }}
          />
        </div>
        <style>{`
          @keyframes spin { to { transform: rotate(360deg); } }
          @keyframes shimmer { 0% { transform: translateX(-100%); } 100% { transform: translateX(200%); } }
        `}</style>
      </div>
    );
  }

  if (error) {
    return (
      <div
        style={{
          padding: "32px",
          background: "rgba(244, 63, 94, 0.05)",
          border: "1px solid rgba(244, 63, 94, 0.2)",
          borderRadius: "16px",
          textAlign: "center",
        }}
      >
        <p style={{ color: "#FB7185", marginBottom: "16px", fontSize: "14px" }}>{error}</p>
        <button
          onClick={() => fetchContent(true)}
          style={{
            display: "inline-flex",
            alignItems: "center",
            gap: "8px",
            background: "rgba(244, 63, 94, 0.1)",
            border: "1px solid rgba(244, 63, 94, 0.2)",
            color: "#FB7185",
            padding: "8px 18px",
            borderRadius: "8px",
            cursor: "pointer",
            fontSize: "13px",
            fontWeight: 600,
          }}
        >
          <RefreshCw size={14} /> Retry
        </button>
      </div>
    );
  }

  return (
    <div>
      {/* AI badge */}
      <div
        style={{
          display: "inline-flex",
          alignItems: "center",
          gap: "6px",
          background: `${accentColor}10`,
          border: `1px solid ${accentColor}20`,
          color: accentColor,
          padding: "4px 12px",
          borderRadius: "100px",
          fontSize: "11px",
          fontWeight: 600,
          marginBottom: "24px",
        }}
      >
        <Sparkles size={12} /> AI-Generated · {techName} Expert Content
      </div>

      {/* Markdown content */}
      <article className="prose prose-invert max-w-none">
        <ReactMarkdown>{content}</ReactMarkdown>
      </article>

      {/* Regenerate button */}
      <div style={{ marginTop: "32px", paddingTop: "20px", borderTop: "1px solid #1E2D47" }}>
        <button
          onClick={() => fetchContent(true)}
          style={{
            display: "inline-flex",
            alignItems: "center",
            gap: "8px",
            background: "rgba(255,255,255,0.04)",
            border: "1px solid #1E2D47",
            color: "#6B7A99",
            padding: "8px 16px",
            borderRadius: "8px",
            cursor: "pointer",
            fontSize: "13px",
            fontWeight: 500,
          }}
        >
          <RefreshCw size={14} /> Regenerate Content
        </button>
      </div>
    </div>
  );
}
