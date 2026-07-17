export const runtime = "edge";
import { notFound } from "next/navigation";
import Link from "next/link";
import { ShareButtons } from "@/components/growth/ShareButtons";
import { NewsletterSignup } from "@/components/growth/NewsletterSignup";
import { TelegramBanner } from "@/components/growth/TelegramBanner";
import { BlogReactions } from "@/components/blog/BlogReactions";
import { articles } from "@/lib/data/blogPosts";
import { pageMetadata } from "@/lib/seo/metadata";

type Props = { params: Promise<{ slug: string }> };

const tagColors: Record<string, string> = {
  Docker: "#3B82F6", Kubernetes: "#8B5CF6", Terraform: "#7C3AED",
  Career: "#10B981", AI: "#F59E0B", Cloud: "#06B6D4", DevOps: "#3B82F6",
  Databases: "#10B981", Security: "#EF4444", Health: "#22C55E",
  Education: "#A855F7", Ansible: "#EF4444", AWS: "#F97316",
};

export async function generateMetadata({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) return pageMetadata({ title: "Article Not Found", description: "This blog post doesn't exist.", path: `/blog/${slug}` });
  return pageMetadata({ title: `${article.title} — Blog`, description: article.title, path: `/blog/${slug}` });
}

function formatInlineBlog(text: string): string {
  return text
    .replace(/`([^`]+)`/g, '<code style="background:var(--bg-2);padding:2px 6px;border-radius:4px;font-family:monospace;font-size:0.9em;color:#60A5FA">$1</code>')
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/\*([^*]+)\*/g, '<em>$1</em>')
    .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" style="color:#60A5FA;text-decoration:underline">$1</a>');
}

function renderLine(line: string, i: number) {
  if (line.startsWith("## ")) return <h2 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "22px", margin: "36px 0 12px" }}>{line.slice(3)}</h2>;
  if (line.startsWith("### ")) return <h3 key={i} style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontWeight: 700, fontSize: "18px", margin: "28px 0 10px" }}>{line.slice(4)}</h3>;
  if (line.match(/^[-*] /)) return <div key={i} style={{ display:"flex", gap:"10px", margin:"4px 0" }}><span style={{ color:"#60A5FA", flexShrink:0, marginTop:"2px" }}>•</span><span style={{ color:"var(--text-3)", fontSize:"15px", lineHeight:1.7 }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line.slice(2)) }}/></div>;
  if (line.match(/^\d+\. /)) { const num = line.match(/^(\d+)\. /)?.[1]; return <div key={i} style={{ display:"flex", gap:"10px", margin:"4px 0" }}><span style={{ color:"#60A5FA", flexShrink:0, fontWeight:700, minWidth:"20px" }}>{num}.</span><span style={{ color:"var(--text-3)", fontSize:"15px", lineHeight:1.7 }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line.replace(/^\d+\. /,"")) }}/></div>; }
  if (line.startsWith("| ")) return null;
  if (line.startsWith("```")) return null;
  if (line === "" || line === "---") return <div key={i} style={{ height:"8px" }}/>;
  return <p key={i} style={{ margin:"0 0 12px", lineHeight:1.85, color:"var(--text-3)", fontSize:"15px" }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(line) }}/>;
}

function renderBody(body: string[]) {
  // Flatten all body items — each item may contain \n-embedded multi-line content
  const rawLines: string[] = [];
  for (const item of body) {
    const expanded = item.split("\n");
    rawLines.push(...expanded);
  }

  const elements: React.ReactNode[] = [];
  let i = 0;

  while (i < rawLines.length) {
    const line = rawLines[i];

    // Code block
    if (line.startsWith("```")) {
      const lang = line.slice(3).trim();
      const codeLines: string[] = [];
      i++;
      while (i < rawLines.length && !rawLines[i].startsWith("```")) {
        codeLines.push(rawLines[i]);
        i++;
      }
      elements.push(
        <div key={`code-${i}`} style={{ margin:"16px 0", borderRadius:"12px", overflow:"hidden", border:"1px solid var(--border)" }}>
          {lang && <div style={{ background:"var(--bg-2)", padding:"5px 16px", fontSize:"11px", color:"#60A5FA", fontFamily:"monospace", fontWeight:700, letterSpacing:"0.06em", textTransform:"uppercase" as const }}>{lang}</div>}
          <pre style={{ background:"var(--bg)", padding:"20px", margin:0, overflowX:"auto" as const }}>
            <code style={{ color:"var(--text-2)", fontSize:"13px", fontFamily:"'JetBrains Mono',monospace", lineHeight:1.75 }}>{codeLines.join("\n")}</code>
          </pre>
        </div>
      );
    }
    // Table
    else if (line.startsWith("| ")) {
      const rows: string[] = [];
      while (i < rawLines.length && rawLines[i].startsWith("| ")) {
        rows.push(rawLines[i]);
        i++;
      }
      const [header, , ...dataRows] = rows;
      const headers = header.split("|").filter(Boolean).map(h => h.trim());
      elements.push(
        <div key={`tbl-${i}`} style={{ overflowX:"auto" as const, margin:"16px 0" }}>
          <table style={{ width:"100%", borderCollapse:"collapse" as const, fontSize:"14px" }}>
            <thead>
              <tr style={{ borderBottom:"2px solid var(--border)", background:"var(--bg-2)" }}>
                {headers.map((h, hi) => <th key={hi} style={{ padding:"10px 16px", textAlign:"left" as const, fontWeight:700 }}>{h}</th>)}
              </tr>
            </thead>
            <tbody>
              {dataRows.filter(r => !r.includes("---")).map((row, ri) => (
                <tr key={ri} style={{ borderBottom:"1px solid var(--border)" }}>
                  {row.split("|").filter(Boolean).map((c, ci) => (
                    <td key={ci} style={{ padding:"10px 16px", color:"var(--text-3)" }} dangerouslySetInnerHTML={{ __html: formatInlineBlog(c.trim()) }}/>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      );
      continue;
    }
    else {
      const el = renderLine(line, i);
      if (el) elements.push(el);
    }
    i++;
  }
  return elements;
}

export default async function BlogPost({ params }: Props) {
  const { slug } = await params;
  const article = articles[slug];
  if (!article) notFound();
  const color = tagColors[article.tag] || "#3B82F6";

  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "48px 24px" }}>
      <div style={{ display: "flex", gap: "8px", alignItems: "center", fontSize: "13px", color: "var(--text-4)", marginBottom: "32px" }}>
        <Link href="/blog" style={{ color: "var(--text-4)", textDecoration: "none" }}>Blog</Link>
        <span>/</span>
        <span style={{ background: `${color}18`, color, padding: "2px 8px", borderRadius: "4px", fontWeight: 700 }}>{article.tag}</span>
      </div>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans',sans-serif", fontSize: "clamp(22px,3.5vw,36px)", fontWeight: 800, letterSpacing: "-0.02em", lineHeight: 1.25, marginBottom: "16px" }}>
        {article.title}
      </h1>
      <div style={{ display: "flex", gap: "16px", fontSize: "13px", color: "var(--text-4)", marginBottom: "40px", paddingBottom: "32px", borderBottom: "1px solid var(--border)" }}>
        <span>SynfraCore</span><span>·</span><span>{article.date}</span><span>·</span><span>{article.readTime}</span>
      </div>
      <div style={{ fontSize: "16px" }}>
        {renderBody(article.body)}
      </div>
      {/* Likes and Comments */}
      <BlogReactions slug={slug} title={article.title} />

      {/* Share buttons */}
      <div style={{ marginTop: "32px" }}>
        <ShareButtons title={article.title} url={`https://synfracore.com/blog/${slug}`} />
      </div>

      {/* Newsletter signup */}
      <div style={{ marginTop: "24px" }}>
        <NewsletterSignup variant="inline" context="blog article" />
      </div>

      {/* Telegram CTA */}
      <div style={{ marginTop: "16px" }}>
        <TelegramBanner variant="card" />
      </div>

      {/* Article footer nav */}
      <div style={{ marginTop: "40px", paddingTop: "32px", borderTop: "1px solid var(--border)", display: "flex", justifyContent: "space-between", alignItems: "center", gap: "16px", flexWrap: "wrap" }}>
        <Link href="/blog" style={{ color: "var(--text-4)", textDecoration: "none", fontSize: "14px" }}>← All articles</Link>
        <Link href="/academies" style={{ background: `${color}18`, color, padding: "8px 16px", borderRadius: "8px", textDecoration: "none", fontSize: "13px", fontWeight: 700 }}>
          Start Learning {article.tag} →
        </Link>
      </div>
    </div>
  );
}
