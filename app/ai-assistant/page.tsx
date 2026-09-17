// This route previously shipped its own inline chat component that called
// https://api.anthropic.com/v1/messages directly from the browser with no
// API key, no auth check, and no AI_ASSISTANT_ENABLED gate — every message
// failed (blocked before Anthropic's own auth check, since direct-browser
// calls require an explicit anthropic-dangerous-direct-browser-access header
// that was never sent), always landing on a hardcoded "Connection error.
// Please try again." AIAssistantClient.tsx (in this same directory) already
// correctly posts to /api/ai — which enforces the sign-in check and the
// AI_ASSISTANT_ENABLED kill switch server-side — but was never imported here.
// Fixed 2026-08-11: delegate to it instead of maintaining two implementations.
import AIAssistantClient from "./AIAssistantClient";
import { pageMetadata } from "@/lib/seo/metadata";

// Real bug found live via Search Console (2026-09-17): this page had no
// metadata export at all, so it silently inherited the root layout's
// alternates.canonical ("/") -- telling Google it was a duplicate of the
// homepage instead of its own real page.
export const metadata = pageMetadata({
  title: "AI Assistant — Ask Anything About Any Technology",
  description: "SynfraCore's free AI assistant, powered by Cloudflare Workers AI — ask questions about any academy's content and get instant, in-context answers while signed in.",
  path: "/ai-assistant",
  keywords: ["AI assistant", "SynfraCore AI", "learning chatbot"],
});

export default function AIAssistantPage() {
  return <AIAssistantClient />;
}
