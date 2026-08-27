// Shared palette for FlowDiagram and ConceptBoxGrid — every value is a CSS
// custom property reference (defined in app/globals.css under :root and
// html.light), never a literal hex/rgba, so a diagram's colors resolve
// against whichever theme is active at render time instead of being baked
// in once. This is the direct fix for the hand-authored-SVG diagrams this
// replaces, which used fixed dark-palette hex colors that don't adapt when
// the page is viewed in light mode.
export type DiagramColor = "blue" | "purple" | "green" | "amber" | "slate" | "red" | "cyan";

export function diagramColorVars(color: DiagramColor): { bg: string; border: string; text: string } {
  return {
    bg: `var(--flow-${color}-bg)`,
    border: `var(--flow-${color}-border)`,
    text: `var(--flow-${color}-text)`,
  };
}
