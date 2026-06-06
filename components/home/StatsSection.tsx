import { stats } from "@/lib/data/navigation";

export default function StatsSection() {
  return (
    <section style={{ background: "#0C1524", borderTop: "1px solid #1E2D47", borderBottom: "1px solid #1E2D47" }}>
      <div className="mx-auto max-w-7xl px-6 py-12">
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
          {stats.map((item, i) => (
            <div key={item.label} className="text-center">
              <div
                style={{
                  fontFamily: "'Syne', sans-serif",
                  fontSize: "clamp(36px, 5vw, 52px)",
                  fontWeight: 800,
                  background: ["linear-gradient(135deg, #60A5FA, #818CF8)", "linear-gradient(135deg, #34D399, #06B6D4)", "linear-gradient(135deg, #A78BFA, #F472B6)", "linear-gradient(135deg, #FCD34D, #FB923C)"][i % 4],
                  WebkitBackgroundClip: "text",
                  WebkitTextFillColor: "transparent",
                  backgroundClip: "text",
                  lineHeight: 1,
                }}
              >
                {item.value}
              </div>
              <div style={{ color: "var(--text-4)", fontSize: "14px", marginTop: "8px", fontWeight: 500 }}>
                {item.label}
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
