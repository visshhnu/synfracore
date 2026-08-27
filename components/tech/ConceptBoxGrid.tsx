import { diagramColorVars, type DiagramColor } from "./diagramColors";

export type ConceptBox = {
  title: string;
  description: string;
  color: DiagramColor;
};

export type ConceptBoxGridProps = {
  boxes: ConceptBox[];
};

export function ConceptBoxGrid({ boxes }: ConceptBoxGridProps) {
  return (
    <div
      style={{
        display: "grid",
        gridTemplateColumns: "repeat(auto-fit, minmax(140px, 1fr))",
        gap: "10px",
        margin: "24px 0",
      }}
    >
      {boxes.map((box, i) => {
        const { bg, border, text } = diagramColorVars(box.color);
        return (
          <div
            key={i}
            data-diagram-box="conceptgrid"
            style={{
              background: bg,
              border: `1.5px solid ${border}`,
              borderRadius: "10px",
              padding: "14px",
            }}
          >
            <div style={{ fontSize: "12px", fontWeight: 700, color: text, marginBottom: "6px" }}>
              {box.title}
            </div>
            <div style={{ fontSize: "11px", color: "var(--text-3)", lineHeight: 1.5 }}>
              {box.description}
            </div>
          </div>
        );
      })}
    </div>
  );
}
