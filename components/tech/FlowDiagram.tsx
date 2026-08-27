import { diagramColorVars, type DiagramColor } from "./diagramColors";

export type FlowStep = {
  label: string;
  sublabel?: string;
  detail?: string;
  color: DiagramColor;
};

export type FlowDiagramProps = {
  title?: string;
  // "flow": boxes left-to-right connected by arrows (a pipeline/sequence).
  // "stack": full-width boxes stacked top-to-bottom, no arrows — array
  // order is the stack's visual order. Doubles as what would otherwise be
  // a separate "StackDiagram" component: the underlying shape (an ordered
  // list of labeled, colored boxes) is identical, only the layout direction
  // and connector differ, so one component with a layout switch covers both
  // rather than maintaining two near-duplicate components.
  layout?: "flow" | "stack";
  steps: FlowStep[];
};

function Box({ step }: { step: FlowStep }) {
  const { bg, border, text } = diagramColorVars(step.color);
  return (
    <div
      data-diagram-box="flow"
      style={{
        flex: "1 1 160px",
        minWidth: "160px",
        background: bg,
        border: `1.5px solid ${border}`,
        borderRadius: "10px",
        padding: "14px 16px",
      }}
    >
      <div style={{ fontSize: "13px", fontWeight: 700, color: text, marginBottom: step.sublabel || step.detail ? "4px" : 0 }}>
        {step.label}
      </div>
      {step.sublabel && (
        <div style={{ fontSize: "12px", color: "var(--text-2)", marginBottom: step.detail ? "2px" : 0 }}>
          {step.sublabel}
        </div>
      )}
      {step.detail && (
        <div style={{ fontSize: "11px", color: "var(--text-4)" }}>{step.detail}</div>
      )}
    </div>
  );
}

function Arrow() {
  return (
    <div
      aria-hidden="true"
      style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        flex: "0 0 auto",
        color: "var(--text-4)",
        fontSize: "18px",
        padding: "0 2px",
      }}
    >
      →
    </div>
  );
}

export function FlowDiagram({ title, layout = "flow", steps }: FlowDiagramProps) {
  return (
    <div
      style={{
        margin: "24px 0",
        borderRadius: "16px",
        border: "1px solid var(--border)",
        background: "var(--bg-2)",
        padding: "20px",
      }}
    >
      {title && (
        <div style={{ fontSize: "13px", fontWeight: 800, color: "var(--text-1)", marginBottom: "16px", textAlign: "center" }}>
          {title}
        </div>
      )}
      {layout === "stack" ? (
        <div style={{ display: "flex", flexDirection: "column", gap: "6px" }}>
          {steps.map((step, i) => (
            <Box key={i} step={step} />
          ))}
        </div>
      ) : (
        <div style={{ display: "flex", flexWrap: "wrap", alignItems: "stretch", gap: "4px" }}>
          {steps.map((step, i) => (
            <div key={i} style={{ display: "contents" }}>
              {i > 0 && <Arrow />}
              <Box step={step} />
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
