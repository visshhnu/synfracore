import Link from "next/link";

type Props = {
  variant?: "banner" | "card" | "pill";
};

export function TelegramBanner({ variant = "banner" }: Props) {
  const TelegramIcon = () => (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
      <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/>
    </svg>
  );

  if (variant === "pill") {
    return (
      <a href="https://t.me/synfracore" target="_blank" rel="noopener noreferrer"
        style={{ display: "inline-flex", alignItems: "center", gap: "7px", background: "rgba(0,136,204,0.12)", color: "#0088CC", border: "1px solid rgba(0,136,204,0.25)", padding: "7px 14px", borderRadius: "20px", textDecoration: "none", fontSize: "13px", fontWeight: 600 }}>
        <TelegramIcon/> Join Telegram Community
      </a>
    );
  }

  if (variant === "card") {
    return (
      <a href="https://t.me/synfracore" target="_blank" rel="noopener noreferrer"
        style={{ display: "flex", alignItems: "center", gap: "16px", background: "rgba(0,136,204,0.06)", border: "1px solid rgba(0,136,204,0.15)", borderRadius: "14px", padding: "18px 22px", textDecoration: "none", color: "var(--text-1)" }}>
        <div style={{ width: "44px", height: "44px", background: "#0088CC", borderRadius: "12px", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, color: "#fff" }}>
          <TelegramIcon/>
        </div>
        <div style={{ flex: 1 }}>
          <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "15px", marginBottom: "3px" }}>Join our Telegram Community</div>
          <div style={{ color: "var(--text-4)", fontSize: "13px" }}>Daily DevOps tips, job alerts, Q&A — join engineers learning together</div>
        </div>
        <div style={{ color: "#0088CC", fontSize: "18px", flexShrink: 0 }}>→</div>
      </a>
    );
  }

  // banner variant
  return (
    <div style={{ background: "linear-gradient(135deg, rgba(0,136,204,0.1), rgba(0,136,204,0.04))", border: "1px solid rgba(0,136,204,0.2)", borderRadius: "16px", padding: "28px 32px", display: "flex", alignItems: "center", justifyContent: "space-between", gap: "24px", flexWrap: "wrap" }}>
      <div style={{ display: "flex", alignItems: "center", gap: "16px" }}>
        <div style={{ width: "52px", height: "52px", background: "#0088CC", borderRadius: "14px", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, color: "#fff" }}>
          <svg width="26" height="26" viewBox="0 0 24 24" fill="currentColor">
            <path d="M11.944 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.056 0zm4.962 7.224c.1-.002.321.023.465.14a.506.506 0 0 1 .171.325c.016.093.036.306.02.472-.18 1.898-.962 6.502-1.36 8.627-.168.9-.499 1.201-.82 1.23-.696.065-1.225-.46-1.9-.902-1.056-.693-1.653-1.124-2.678-1.8-1.185-.78-.417-1.21.258-1.91.177-.184 3.247-2.977 3.307-3.23.007-.032.014-.15-.056-.212s-.174-.041-.249-.024c-.106.024-1.793 1.14-5.061 3.345-.48.33-.913.49-1.302.48-.428-.008-1.252-.241-1.865-.44-.752-.245-1.349-.374-1.297-.789.027-.216.325-.437.893-.663 3.498-1.524 5.83-2.529 6.998-3.014 3.332-1.386 4.025-1.627 4.476-1.635z"/>
          </svg>
        </div>
        <div>
          <div style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "17px", marginBottom: "4px" }}>
            Join 1000s of engineers on Telegram
          </div>
          <div style={{ color: "var(--text-4)", fontSize: "14px" }}>
            Daily tips · Job alerts · Interview help · Real answers from engineers
          </div>
        </div>
      </div>
      <a href="https://t.me/synfracore" target="_blank" rel="noopener noreferrer"
        style={{ display: "inline-flex", alignItems: "center", gap: "8px", background: "#0088CC", color: "#fff", padding: "12px 24px", borderRadius: "10px", textDecoration: "none", fontSize: "14px", fontWeight: 700, flexShrink: 0 }}>
        Join Now →
      </a>
    </div>
  );
}
