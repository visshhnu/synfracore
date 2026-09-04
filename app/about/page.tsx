import Link from "next/link";
import Image from "next/image";
import { academies as allAcademies } from "@/lib/data/academies";
import { getRegisteredContentCount } from "@/lib/content";
export const metadata = {
  title: "About SynfraCore",
  description: "SynfraCore was founded by Vishnu B, a DevOps engineer with 10+ years of experience, to solve the real problem in learning technology: not a shortage of content, but not knowing where to start.",
};

// Derived from academies.ts, not hand-maintained — this page previously had
// its own separate hardcoded stats array (101/10) disagreeing with both the
// homepage's (890+/11) and the actual data (201/18) — see NF-6.
const totalTechnologies = allAcademies.reduce(
  (sum, a) => sum + a.domains.reduce((dSum, d) => dSum + d.technologies.length, 0),
  0
);

const stats = [
  { value: `${totalTechnologies}`, label: "Technologies" },
  { value: `${allAcademies.length}`, label: "Learning Academies" },
  { value: `${getRegisteredContentCount().toLocaleString()}+`, label: "Content Pages" },
  { value: "100%", label: "Free to Start" },
];

const values = [
  { icon: "🎯", title: "Practical First", desc: "Every concept is backed by labs you can run, projects you can build, and interview questions you can answer. Theory without practice is useless." },
  { icon: "📈", title: "Career-Focused", desc: "Content is structured around what gets you hired and promoted — not what's academically interesting. Real job requirements drive every topic we cover." },
  { icon: "🌍", title: "Built for India", desc: "Salaries, job market data, and career paths reflect the Indian tech industry. We include cloud certifications, GATE, NEET, and government exam prep alongside DevOps and AI." },
  { icon: "🚀", title: "From Zero to Architect", desc: "Each technology has a clear path: Installation → Fundamentals → Intermediate → Advanced → Projects → Certification. No prerequisite knowledge assumed without being stated." },
  { icon: "💡", title: "Open Access", desc: "Core content is free. We believe access to quality technical education should not depend on your ability to pay ₹50,000 for a bootcamp." },
  { icon: "🔄", title: "Always Current", desc: "Tech moves fast. We update content when tools release major versions, when job market demands shift, and when better explanations emerge." },
];

const academies = [
  { icon: "⚙️", name: "DevOps", techs: "Linux, Docker, Kubernetes, Terraform, Ansible, Jenkins, ArgoCD" },
  { icon: "☁️", name: "Cloud", techs: "AWS, Azure, GCP — 20 services with hands-on labs" },
  { icon: "🗄️", name: "Databases", techs: "PostgreSQL, Redis, MongoDB, MySQL, Cassandra, Elasticsearch" },
  { icon: "🤖", name: "AI Engineering", techs: "LLMs, RAG, LangChain, AI Agents, Prompt Engineering, LLMOps" },
  { icon: "📊", name: "Data Analytics", techs: "SQL, Pandas, Power BI, Tableau" },
  { icon: "🛡️", name: "Security", techs: "Network Security, Ethical Hacking, SOC, SIEM, Pen Testing" },
  { icon: "🏥", name: "Healthcare Coding", techs: "ICD-10-CM, CPT, HCPCS, OASIS, PDGM — CPC exam prep" },
  { icon: "💡", name: "Human Essentials", techs: "Nutrition, Mental Health, Personal Finance, First Aid" },
  { icon: "🎓", name: "CS Education", techs: "DSA, OS, DBMS, System Design, Java, C, C++" },
  { icon: "📝", name: "Competitive Exams", techs: "GATE CSE/ECE, JEE, NEET, UPSC, SSC CGL, RRB NTPC" },
];

// Founder-story sections (2-6) — each kept as its own block with generous
// spacing rather than one long block of text, per the "read like a real
// letter, not a marketing page" brief. Body copy stays in first person
// throughout this part of the page; the factual/marketing sections further
// down (Stats, What We Cover, Our Approach) keep their existing "we" voice
// since they're presented as supporting information after the personal
// narrative, not as the page's primary voice.
const letterSections = [
  {
    heading: "Why I started SynfraCore",
    paragraphs: [
      "I have an MCA, and I've spent over 10 years working as a DevOps engineer — enough time to have gone through nearly every stage of learning a new tool or technology myself: reading outdated blog posts, following tutorials that assumed knowledge I didn't have, and piecing together a real understanding from fragments scattered across five different sources.",
      "The one thing I kept running into — across every technology, every job, every skill I picked up — wasn't a shortage of content. It was the opposite. There's more tutorials, videos, and documentation available today than any one person could get through in a lifetime. The actual hard part was always the same: knowing where to start, and what order to learn things in so they build on each other instead of leaving gaps.",
      "SynfraCore exists to solve that specific problem. Not to be one more place with content — to be the place that tells you where to start, and gives you a real path from there to actually knowing something, not just having watched a video about it.",
    ],
  },
  {
    heading: "Learning that actually sticks",
    paragraphs: [
      "A lot of how people try to learn today is through short-form content — reels, shorts, 60-second explainers. They're useful for discovering that something exists. They are not how anyone actually learns to use it.",
      "Real learning happens when you read something in enough depth that it explains the 'why', not just the 'what'. It happens when you experiment — actually run the command, break the config, and see what happens. It happens when you troubleshoot something that doesn't work the way the tutorial said it would, because that's usually where real understanding lives. And it happens when you build something with it, even something small, because that's the only way to find out what you actually understood versus what you only recognized.",
      "Every technology on this platform is structured around that cycle — not around what's quick to consume, but around what actually leaves you able to do the thing afterward.",
    ],
  },
  {
    heading: "Beyond just technology",
    paragraphs: [
      "Outside of DevOps, I've had real exposure to the healthcare industry, and it changed how I think about what a learning platform should cover. Health and career shouldn't be treated as separate topics — an engineer who doesn't take care of their own health is one bad year away from losing the career they spent a decade building.",
      "That's part of why SynfraCore has real, substantive content on health and medical coding — not as an afterthought bolted onto a tech platform, but as a genuine part of what I think people building demanding careers actually need alongside the technical skills.",
    ],
  },
  {
    heading: "Education should be accessible",
    paragraphs: [
      "Core content on SynfraCore is, and will stay, free. Whether you can afford a ₹50,000 bootcamp shouldn't decide whether you get to learn DevOps, Cloud, or any other track here properly.",
      "Some content — full practice exam papers for certifications and competitive exams, the kind that take real, ongoing effort to build and keep accurate — is premium, priced fairly. Not to lock knowledge behind a paywall, but to make it sustainable to keep building everything else people get for free. A small, honest price on a narrow slice of content, so the rest can stay genuinely free, indefinitely.",
    ],
  },
  {
    heading: "This is just the beginning",
    paragraphs: [
      "SynfraCore today is one person building as much as I honestly can, as well as I can. It won't stay that way by choice — the plan has always been for this to grow into something people build with, not just learn from. If you know something well enough to teach it, have found a gap in what's here, or want to contribute content, code, or feedback, I want to hear from you.",
      "This platform gets better every time someone who actually knows a subject helps make it more accurate, more complete, or more honest about what beginners actually struggle with.",
    ],
  },
];

export default function AboutPage() {
  return (
    <div style={{ maxWidth: "1000px", margin: "0 auto", padding: "56px 24px" }}>

      {/* ============================================================
          Founder letter — Sections 1-6. Deliberately narrower (720px)
          and more spaced out than the factual sections below, so it
          reads like a real letter rather than a marketing page.
          ============================================================ */}
      <div style={{ maxWidth: "720px", margin: "0 auto 96px" }}>

        {/* Section 1 — Hero */}
        <div style={{ display: "flex", gap: "32px", alignItems: "flex-start", flexWrap: "wrap", marginBottom: "40px" }}>
          {/* Source photo is a 1280x1280 square; object-fit:cover on this
              4:5 box crops only ~18% off each side (centered, matching
              where the face already sits in the source), no vertical crop
              at all — full natural framing preserved, no re-processing of
              the source file itself. */}
          <div style={{ width: "180px", aspectRatio: "4 / 5", flexShrink: 0, borderRadius: "16px", overflow: "hidden", border: "1px solid var(--border)", position: "relative" }}>
            <Image
              src="/about/vishnu-founder.jpg"
              alt="Vishnu B, Founder of SynfraCore"
              fill
              sizes="180px"
              style={{ objectFit: "cover", objectPosition: "center" }}
              priority
            />
          </div>

          <div style={{ flex: 1, minWidth: "260px" }}>
            <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,3.6vw,38px)", fontWeight: 800, letterSpacing: "-0.02em", color: "var(--text-1)", marginBottom: "6px" }}>
              Vishnu B
            </h1>
            <p style={{ fontSize: "15px", color: "var(--text-4)", marginBottom: "24px" }}>
              Founder, SynfraCore · DevOps Engineer, 10+ years
            </p>
            <p
              style={{
                fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(20px,2.6vw,26px)", fontWeight: 700,
                lineHeight: 1.5, color: "var(--text-1)", borderLeft: "3px solid var(--accent)",
                paddingLeft: "20px", margin: 0,
              }}
            >
              &ldquo;I started SynfraCore because I kept noticing the same problem — the hardest part of learning anything isn&apos;t the content, it&apos;s knowing where to even start.&rdquo;
            </p>
          </div>
        </div>

        {/* Sections 2-6 */}
        {letterSections.map((s) => (
          <div key={s.heading} style={{ marginTop: "72px" }}>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "22px", color: "var(--text-1)", marginBottom: "20px" }}>
              {s.heading}
            </h2>
            {s.paragraphs.map((p, i) => (
              <p key={i} style={{ fontSize: "16.5px", lineHeight: 1.85, color: "var(--text-2)", marginTop: i === 0 ? 0 : "18px" }}>
                {p}
              </p>
            ))}
          </div>
        ))}

        {/* Closing line */}
        <p
          style={{
            fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 800, fontSize: "clamp(22px,3vw,28px)",
            letterSpacing: "0.02em", textAlign: "center", marginTop: "80px",
            background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", WebkitBackgroundClip: "text", backgroundClip: "text", color: "transparent",
          }}
        >
          Learn. Build. Share. Grow.
        </p>
      </div>

      {/* ============================================================
          Factual / marketing sections — unchanged in substance, just
          visually separated from the personal letter above.
          ============================================================ */}
      <div style={{ borderTop: "1px solid var(--border)", paddingTop: "64px" }}>

        {/* Stats */}
        <div style={{ display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: "16px", marginBottom: "64px" }}>
          {stats.map(s => (
            <div key={s.label} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "14px", padding: "24px", textAlign: "center" }}>
              <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "28px", fontWeight: 800, color: "#3B82F6", marginBottom: "6px" }}>{s.value}</div>
              <div style={{ fontSize: "13px", color: "var(--text-4)" }}>{s.label}</div>
            </div>
          ))}
        </div>

        {/* What we cover */}
        <div style={{ marginBottom: "64px" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "24px" }}>What We Cover</h2>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))", gap: "12px" }}>
            {academies.map(a => (
              <div key={a.name} style={{ background: "var(--bg-1)", border: "1px solid var(--border)", borderRadius: "12px", padding: "18px" }}>
                <div style={{ display: "flex", gap: "10px", alignItems: "center", marginBottom: "8px" }}>
                  <span style={{ fontSize: "20px" }}>{a.icon}</span>
                  <span style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px" }}>{a.name}</span>
                </div>
                <p style={{ color: "var(--text-4)", fontSize: "13px", lineHeight: 1.6, margin: 0 }}>{a.techs}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Values */}
        <div style={{ marginBottom: "64px" }}>
          <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "24px", marginBottom: "24px" }}>Our Approach</h2>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(300px, 1fr))", gap: "20px" }}>
            {values.map(v => (
              <div key={v.title} style={{ display: "flex", gap: "16px" }}>
                <span style={{ fontSize: "24px", flexShrink: 0, marginTop: "2px" }}>{v.icon}</span>
                <div>
                  <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "6px" }}>{v.title}</h3>
                  <p style={{ color: "var(--text-4)", fontSize: "14px", lineHeight: 1.7, margin: 0 }}>{v.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* CTA */}
        <div style={{ display: "flex", gap: "16px", flexWrap: "wrap" }}>
          <Link href="/academies" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "linear-gradient(135deg, #3B82F6, #8B5CF6)", color: "#fff", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 700 }}>
            Browse Academies →
          </Link>
          <Link href="/contact" style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "var(--bg-1)", border: "1px solid var(--border)", color: "var(--text-2)", padding: "14px 28px", borderRadius: "12px", textDecoration: "none", fontSize: "15px", fontWeight: 600 }}>
            Contact Us
          </Link>
        </div>
      </div>
    </div>
  );
}
