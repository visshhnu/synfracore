"use client";

type Props = {
  total: number;
  currentIndex: number;
  answeredIndexes: Set<number>;
  /** Visited (moved away from) but never answered — distinct from never-opened. */
  skippedIndexes: Set<number>;
  onJump: (index: number) => void;
  disabled?: boolean;
};

// Left-rail grid of numbered buttons for a 100-question attempt — a strictly
// sequential next/prev flow doesn't give a candidate any sense of overall
// progress or a way to jump back to a specific earlier question without
// paging through, which matters at this question count.
export default function QuestionNavigator({ total, currentIndex, answeredIndexes, skippedIndexes, onJump, disabled }: Props) {
  return (
    <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(34px, 1fr))", gap: "6px" }}>
      {Array.from({ length: total }, (_, i) => {
        const isCurrent = i === currentIndex;
        const isAnswered = answeredIndexes.has(i);
        const isSkipped = !isAnswered && skippedIndexes.has(i);
        let bg = "var(--bg-2)";
        let color = "var(--text-3)";
        let border = "1px solid var(--border)";
        if (isSkipped) { bg = "rgba(245,158,11,0.12)"; color = "#F59E0B"; border = "1px solid rgba(245,158,11,0.3)"; }
        if (isAnswered) { bg = "rgba(16,185,129,0.12)"; color = "#10B981"; border = "1px solid rgba(16,185,129,0.3)"; }
        if (isCurrent) { border = "1px solid #3B82F6"; color = "#3B82F6"; bg = "rgba(59,130,246,0.1)"; }
        return (
          <button
            key={i}
            type="button"
            disabled={disabled}
            onClick={() => onJump(i)}
            style={{
              width: "34px", height: "34px", borderRadius: "6px", border, background: bg, color,
              fontSize: "12px", fontWeight: 700, cursor: disabled ? "not-allowed" : "pointer", fontFamily: "inherit",
              opacity: disabled ? 0.5 : 1,
            }}
          >
            {i + 1}
          </button>
        );
      })}
    </div>
  );
}
