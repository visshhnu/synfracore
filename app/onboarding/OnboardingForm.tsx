"use client";
import { useState, useTransition } from "react";
import { academies } from "@/lib/data/academies";
import { submitOnboarding, skipOnboarding } from "./actions";

const LEARNER_TYPES = [
  { value: "school", label: "School student", icon: "🏫" },
  { value: "college", label: "College student", icon: "🎓" },
  { value: "competitive-exam", label: "Competitive exam aspirant", icon: "📝" },
  { value: "tech", label: "Tech learner", icon: "💻" },
  { value: "healthcare", label: "Healthcare learner", icon: "🏥" },
  { value: "finance-law-mgmt", label: "Finance / Law / Management professional", icon: "💼" },
  { value: "career-switcher", label: "Career switcher", icon: "🔄" },
  { value: "wellness", label: "Wellness / life-skills learner", icon: "🌱" },
];

const LEVELS = [
  { value: "beginner", label: "Beginner" },
  { value: "intermediate", label: "Intermediate" },
  { value: "advanced", label: "Advanced" },
];

export default function OnboardingForm({ existingDomains }: { existingDomains: string[] }) {
  const [learnerType, setLearnerType] = useState("");
  const [level, setLevel] = useState("beginner");
  const [domains, setDomains] = useState<string[]>(existingDomains);
  const [pending, startTransition] = useTransition();

  const toggleDomain = (slug: string) => {
    setDomains(d => (d.includes(slug) ? d.filter(s => s !== slug) : [...d, slug]));
  };

  return (
    <form
      action={formData => startTransition(() => submitOnboarding(formData))}
      style={{ display: "flex", flexDirection: "column", gap: "28px" }}
    >
      {/* Learner type */}
      <div>
        <label style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px", display: "block" }}>
          What brings you here?
        </label>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(220px, 1fr))", gap: "8px" }}>
          {LEARNER_TYPES.map(t => (
            <label key={t.value} style={{
              display: "flex", alignItems: "center", gap: "8px", padding: "10px 12px", borderRadius: "10px",
              border: `1px solid ${learnerType === t.value ? "#3B82F6" : "var(--border)"}`,
              background: learnerType === t.value ? "rgba(59,130,246,0.08)" : "var(--bg-2)",
              cursor: "pointer", fontSize: "13px", color: "var(--text-2)",
            }}>
              <input type="radio" name="learnerType" value={t.value} checked={learnerType === t.value}
                onChange={() => setLearnerType(t.value)} required style={{ accentColor: "#3B82F6" }} />
              <span>{t.icon}</span> {t.label}
            </label>
          ))}
        </div>
      </div>

      {/* Target goal */}
      <div>
        <label style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px", display: "block" }}>
          Target exam, role, or certification <span style={{ color: "var(--text-4)", fontWeight: 400 }}>(optional)</span>
        </label>
        <input name="primaryGoal" placeholder="e.g. UPSC IAS, AWS Solutions Architect, CA Final"
          style={{ width: "100%", padding: "11px 14px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-2)", color: "var(--text-1)", fontSize: "14px", fontFamily: "inherit" }} />
      </div>

      {/* Current level */}
      <div>
        <label style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px", display: "block" }}>
          Current level
        </label>
        <div style={{ display: "flex", gap: "8px" }}>
          {LEVELS.map(l => (
            <label key={l.value} style={{
              flex: 1, textAlign: "center", padding: "10px", borderRadius: "10px",
              border: `1px solid ${level === l.value ? "#3B82F6" : "var(--border)"}`,
              background: level === l.value ? "rgba(59,130,246,0.08)" : "var(--bg-2)",
              cursor: "pointer", fontSize: "13px", color: "var(--text-2)", fontWeight: 600,
            }}>
              <input type="radio" name="currentLevel" value={l.value} checked={level === l.value}
                onChange={() => setLevel(l.value)} style={{ display: "none" }} />
              {l.label}
            </label>
          ))}
        </div>
      </div>

      {/* Goal timeline */}
      <div>
        <label style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "10px", display: "block" }}>
          Goal timeline <span style={{ color: "var(--text-4)", fontWeight: 400 }}>(optional)</span>
        </label>
        <input name="goalTimeline" placeholder="e.g. 3 months, 1 year"
          style={{ width: "100%", padding: "11px 14px", borderRadius: "10px", border: "1px solid var(--border)", background: "var(--bg-2)", color: "var(--text-1)", fontSize: "14px", fontFamily: "inherit" }} />
      </div>

      {/* Domains of interest */}
      <div>
        <label style={{ fontSize: "13px", fontWeight: 700, color: "var(--text-1)", marginBottom: "6px", display: "block" }}>
          Domains you're interested in <span style={{ color: "var(--text-4)", fontWeight: 400 }}>(pick as many as you like)</span>
        </label>
        <p style={{ fontSize: "12px", color: "var(--text-4)", marginBottom: "10px" }}>
          This only personalizes your dashboard — every academy stays open to browse regardless of what you pick here.
        </p>
        <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(180px, 1fr))", gap: "8px" }}>
          {academies.map(a => (
            <label key={a.slug} style={{
              display: "flex", alignItems: "center", gap: "8px", padding: "9px 12px", borderRadius: "10px",
              border: `1px solid ${domains.includes(a.slug) ? a.color : "var(--border)"}`,
              background: domains.includes(a.slug) ? `${a.color}14` : "var(--bg-2)",
              cursor: "pointer", fontSize: "13px", color: "var(--text-2)",
            }}>
              <input type="checkbox" name="domains" value={a.slug} checked={domains.includes(a.slug)}
                onChange={() => toggleDomain(a.slug)} style={{ accentColor: a.color }} />
              <span>{a.icon}</span> {a.title}
            </label>
          ))}
        </div>
      </div>

      <div style={{ display: "flex", gap: "12px", marginTop: "8px" }}>
        <button type="submit" disabled={pending} className="btn-primary"
          style={{ padding: "12px 28px", borderRadius: "10px", fontSize: "14px", fontWeight: 700, opacity: pending ? 0.6 : 1, cursor: pending ? "default" : "pointer" }}>
          {pending ? "Saving…" : "Save and go to dashboard"}
        </button>
        <button type="button" disabled={pending} onClick={() => startTransition(() => skipOnboarding())}
          style={{ padding: "12px 20px", borderRadius: "10px", fontSize: "14px", fontWeight: 600, background: "none", border: "1px solid var(--border)", color: "var(--text-3)", cursor: pending ? "default" : "pointer" }}>
          Skip for now
        </button>
      </div>
    </form>
  );
}
