export const runtime = "edge";

// Weekly digest sender — call this API with a secret key to send the digest
// Trigger: Claude Routine every Sunday, or GitHub Action, or manual call

const DIGEST_TEMPLATE = (content: DigestContent) => `
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"></head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: #0A0F1E; color: #E2E8F0; margin: 0; padding: 0;">
  <div style="max-width: 600px; margin: 0 auto; padding: 40px 24px;">

    <!-- Header -->
    <div style="text-align: center; margin-bottom: 32px;">
      <div style="display: inline-block; background: linear-gradient(135deg, #3B82F6, #8B5CF6); border-radius: 12px; padding: 10px 18px; margin-bottom: 12px;">
        <span style="color: white; font-weight: 800; font-size: 18px;">SynfraCore</span>
      </div>
      <h1 style="color: #F1F5F9; font-size: 24px; font-weight: 800; margin: 0 0 6px; letter-spacing: -0.5px;">
        Weekly Digest 📬
      </h1>
      <p style="color: #64748B; font-size: 14px; margin: 0;">${content.weekOf}</p>
    </div>

    <!-- Top Story -->
    <div style="background: linear-gradient(135deg, rgba(59,130,246,0.1), rgba(139,92,246,0.1)); border: 1px solid rgba(59,130,246,0.2); border-radius: 16px; padding: 28px; margin-bottom: 24px;">
      <div style="font-size: 11px; color: #3B82F6; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px;">📌 THIS WEEK'S FOCUS</div>
      <h2 style="color: #F1F5F9; font-size: 20px; font-weight: 700; margin: 0 0 12px;">${content.topStory.title}</h2>
      <p style="color: #94A3B8; font-size: 15px; line-height: 1.7; margin: 0 0 16px;">${content.topStory.summary}</p>
      <a href="${content.topStory.link}" style="color: #60A5FA; text-decoration: none; font-weight: 600; font-size: 14px;">Read more →</a>
    </div>

    <!-- Articles -->
    <div style="margin-bottom: 24px;">
      <div style="font-size: 11px; color: #8B5CF6; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 16px;">📚 NEW ARTICLES</div>
      ${content.articles.map(a => `
        <div style="border-bottom: 1px solid #1E2D47; padding: 14px 0;">
          <span style="display: inline-block; background: rgba(59,130,246,0.1); color: #60A5FA; font-size: 11px; font-weight: 600; padding: 2px 8px; border-radius: 6px; margin-bottom: 8px;">${a.tag}</span>
          <div><a href="${a.link}" style="color: #E2E8F0; text-decoration: none; font-weight: 600; font-size: 15px; line-height: 1.4;">${a.title}</a></div>
        </div>
      `).join("")}
    </div>

    <!-- Interview Question -->
    <div style="background: #111827; border: 1px solid #1E2D47; border-radius: 12px; padding: 24px; margin-bottom: 24px;">
      <div style="font-size: 11px; color: #10B981; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;">❓ INTERVIEW QUESTION OF THE WEEK</div>
      <p style="color: #F1F5F9; font-size: 16px; font-weight: 600; margin: 0 0 12px;">${content.interviewQ.question}</p>
      <p style="color: #94A3B8; font-size: 14px; line-height: 1.7; margin: 0; border-left: 3px solid #10B981; padding-left: 12px;">${content.interviewQ.answer}</p>
    </div>

    <!-- Tip -->
    <div style="background: rgba(245,158,11,0.08); border: 1px solid rgba(245,158,11,0.2); border-left: 4px solid #F59E0B; border-radius: 0 12px 12px 0; padding: 20px 24px; margin-bottom: 32px;">
      <div style="font-size: 11px; color: #F59E0B; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px;">⚡ QUICK TIP</div>
      <p style="color: #CBD5E1; font-size: 14px; line-height: 1.7; margin: 0;">${content.tip}</p>
    </div>

    <!-- CTA -->
    <div style="text-align: center; margin-bottom: 40px;">
      <a href="https://synfracore.com/academies" 
         style="display: inline-block; background: linear-gradient(135deg, #3B82F6, #8B5CF6); color: white; text-decoration: none; padding: 14px 32px; border-radius: 10px; font-weight: 700; font-size: 15px;">
        Explore All Academies →
      </a>
    </div>

    <!-- Footer -->
    <div style="text-align: center; border-top: 1px solid #1E2D47; padding-top: 24px;">
      <p style="color: #475569; font-size: 13px; margin: 0 0 8px;">SynfraCore · Learn DevOps, Cloud, AI and more</p>
      <p style="color: #334155; font-size: 12px; margin: 0;">
        You subscribed at synfracore.com · 
        <a href="https://synfracore.com/unsubscribe" style="color: #475569;">Unsubscribe</a>
      </p>
    </div>

  </div>
</body>
</html>
`;

interface Article { tag: string; title: string; link: string; }
interface DigestContent {
  weekOf: string;
  topStory: { title: string; summary: string; link: string; };
  articles: Article[];
  interviewQ: { question: string; answer: string; };
  tip: string;
}

export async function POST(request: Request) {
  try {
    const { secret, content, recipients } = await request.json();

    // Verify secret key to prevent unauthorized sends
    if (secret !== process.env.DIGEST_SECRET) {
      return Response.json({ error: "Unauthorized" }, { status: 401 });
    }

    const RESEND_API_KEY = process.env.RESEND_API_KEY;
    if (!RESEND_API_KEY) {
      return Response.json({ error: "RESEND_API_KEY not configured" }, { status: 500 });
    }

    const html = DIGEST_TEMPLATE(content as DigestContent);

    // Send to list using Resend Broadcast (audience) or individual emails
    const audienceId = process.env.RESEND_AUDIENCE_ID;

    if (audienceId) {
      // Send to entire audience via Resend Broadcast
      const res = await fetch("https://api.resend.com/broadcasts", {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${RESEND_API_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          audience_id: audienceId,
          from: "SynfraCore <digest@synfracore.com>",
          subject: `SynfraCore Weekly — ${(content as DigestContent).weekOf}`,
          html,
        }),
      });
      const data = await res.json();

      // Send (schedule immediately)
      if (data.id) {
        await fetch(`https://api.resend.com/broadcasts/${data.id}/send`, {
          method: "POST",
          headers: { "Authorization": `Bearer ${RESEND_API_KEY}` },
        });
      }

      return Response.json({ success: true, broadcast_id: data.id });
    }

    // Fallback: send to specific recipient list
    if (recipients && Array.isArray(recipients)) {
      await fetch("https://api.resend.com/emails", {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${RESEND_API_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          from: "SynfraCore <digest@synfracore.com>",
          to: recipients,
          subject: `SynfraCore Weekly — ${(content as DigestContent).weekOf}`,
          html,
        }),
      });
      return Response.json({ success: true, sent_to: recipients.length });
    }

    return Response.json({ error: "No audience_id or recipients provided" }, { status: 400 });
  } catch (error) {
    console.error("Digest error:", error);
    return Response.json({ error: "Failed to send digest" }, { status: 500 });
  }
}
