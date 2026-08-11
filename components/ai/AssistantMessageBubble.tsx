import type { CSSProperties, ReactNode } from "react";

// Shared visual pattern for an AI-assistant chat bubble.
//
// Extracted 2026-08-12 after finding this was hand-duplicated in two places
// — app/ai-assistant/AIAssistantClient.tsx (the real chat page) and
// components/home/AIAssistantTeaser.tsx (the homepage's static chat mockup)
// — with values that had already drifted apart (#0F1A2E vs #0C1524
// background, "4px 16px 16px 16px" vs "4px 14px 14px 14px" radius). Both
// copies also shared the same real bug: a background/border combo too close
// in luminance to the page's dark-mode background stack (--bg: #04080F,
// --bg-1: #080D18, --bg-2: #0D1526, --bg-3: #111D30 — all near-black navy)
// to read as a distinct bubble the way the user message's colored purple
// pill does. Fixed here with a blue tint (this app's primary accent color,
// already used for the bot avatar gradient and nav accents) at roughly the
// same tint strength as the user bubble's purple — genuinely different hue
// so assistant vs. user stays visually unambiguous, genuinely more contrast
// against the page than another shade of dark navy.
//
// Dark-mode only for now, matching both call sites' current scope — this
// component has no light-mode styling path. Logged as a separate, deferred
// item in docs/audit/07-roadmap-final.md Part 10, not fixed here.
export function AssistantMessageBubble({
  children,
  maxWidth = "87%",
  style,
}: {
  children: ReactNode;
  maxWidth?: string;
  style?: CSSProperties;
}) {
  return (
    <div
      style={{
        maxWidth,
        padding: "13px 17px",
        borderRadius: "4px 16px 16px 16px",
        background: "rgba(59,130,246,0.07)",
        border: "1px solid rgba(59,130,246,0.18)",
        ...style,
      }}
    >
      {children}
    </div>
  );
}
