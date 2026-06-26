export const runtime = "edge";

interface DigestContent {
  weekOf: string;
  topStory: { title: string; summary: string; link: string };
  articles: { tag: string; title: string; link: string }[];
  interviewQ: { question: string; answer: string };
  tip: string;
}

function buildHtml(c: DigestContent): string {
  return `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#0A0F1E;color:#E2E8F0;margin:0;padding:0;">
  <div style="max-width:600px;margin:0 auto;padding:40px 24px;">

    <div style="text-align:center;margin-bottom:28px;">
      <div style="display:inline-block;background:linear-gradient(135deg,#3B82F6,#8B5CF6);border-radius:12px;padding:10px 18px;margin-bottom:10px;">
        <span style="color:white;font-weight:800;font-size:18px;">SynfraCore</span>
      </div>
      <h1 style="color:#F1F5F9;font-size:22px;font-weight:800;margin:0 0 4px;">Weekly Digest 📬</h1>
      <p style="color:#64748B;font-size:13px;margin:0;">${c.weekOf}</p>
    </div>

    <div style="background:linear-gradient(135deg,rgba(59,130,246,0.1),rgba(139,92,246,0.1));border:1px solid rgba(59,130,246,0.2);border-radius:14px;padding:24px;margin-bottom:20px;">
      <div style="font-size:11px;color:#3B82F6;font-weight:700;text-transform:uppercase;letter-spacing:1px;margin-bottom:10px;">📌 THIS WEEK'S FOCUS</div>
      <h2 style="color:#F1F5F9;font-size:18px;font-weight:700;margin:0 0 10px;">${c.topStory.title}</h2>
      <p style="color:#94A3B8;font-size:14px;line-height:1.7;margin:0 0 14px;">${c.topStory.summary}</p>
      <a href="${c.topStory.link}" style="color:#60A5FA;text-decoration:none;font-weight:600;font-size:13px;">Read more →</a>
    </div>

    <div style="margin-bottom:20px;">
      <div style="font-size:11px;color:#8B5CF6;font-weight:700;text-transform:uppercase;letter-spacing:1px;margin-bottom:14px;">📚 NEW ARTICLES</div>
      ${c.articles.map(a => `
        <div style="border-bottom:1px solid #1E2D47;padding:12px 0;">
          <span style="display:inline-block;background:rgba(59,130,246,0.1);color:#60A5FA;font-size:11px;font-weight:600;padding:2px 8px;border-radius:6px;margin-bottom:6px;">${a.tag}</span>
          <div><a href="${a.link}" style="color:#E2E8F0;text-decoration:none;font-weight:600;font-size:14px;">${a.title}</a></div>
        </div>`).join("")}
    </div>

    <div style="background:#111827;border:1px solid #1E2D47;border-radius:12px;padding:22px;margin-bottom:20px;">
      <div style="font-size:11px;color:#10B981;font-weight:700;text-transform:uppercase;letter-spacing:1px;margin-bottom:10px;">❓ INTERVIEW QUESTION OF THE WEEK</div>
      <p style="color:#F1F5F9;font-size:15px;font-weight:600;margin:0 0 10px;">${c.interviewQ.question}</p>
      <p style="color:#94A3B8;font-size:13px;line-height:1.7;margin:0;border-left:3px solid #10B981;padding-left:12px;">${c.interviewQ.answer}</p>
    </div>

    <div style="background:rgba(245,158,11,0.08);border:1px solid rgba(245,158,11,0.2);border-left:4px solid #F59E0B;border-radius:0 12px 12px 0;padding:18px 22px;margin-bottom:28px;">
      <div style="font-size:11px;color:#F59E0B;font-weight:700;text-transform:uppercase;letter-spacing:1px;margin-bottom:8px;">⚡ QUICK TIP</div>
      <p style="color:#CBD5E1;font-size:13px;line-height:1.7;margin:0;">${c.tip}</p>
    </div>

    <div style="text-align:center;margin-bottom:32px;">
      <a href="https://synfracore.com/academies" style="display:inline-block;background:linear-gradient(135deg,#3B82F6,#8B5CF6);color:white;text-decoration:none;padding:13px 28px;border-radius:10px;font-weight:700;font-size:14px;">
        Explore All Academies →
      </a>
    </div>

    <div style="text-align:center;border-top:1px solid #1E2D47;padding-top:20px;">
      <p style="color:#475569;font-size:12px;margin:0;">SynfraCore · synfracore.com · No spam</p>
      <p style="color:#334155;font-size:11px;margin:6px 0 0;">
        <a href="https://synfracore.com/unsubscribe" style="color:#475569;">Unsubscribe</a>
      </p>
    </div>

  </div>
</body>
</html>`;
}

export async function POST(request: Request) {
  try {
    const { secret, content, to } = await request.json();

    if (secret !== process.env.DIGEST_SECRET) {
      return Response.json({ error: "Unauthorized" }, { status: 401 });
    }

    const RESEND_API_KEY = process.env.RESEND_API_KEY;
    if (!RESEND_API_KEY) {
      return Response.json({ error: "RESEND_API_KEY not set" }, { status: 500 });
    }

    const html = buildHtml(content as DigestContent);
    const subject = `SynfraCore Weekly — ${(content as DigestContent).weekOf}`;

    // Send to a specific email (for testing or manual digest)
    // For bulk send to all contacts, use Resend Broadcasts in the dashboard
    const res = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${RESEND_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "SynfraCore <digest@synfracore.com>",
        to: to || ["vishnu@synfracore.com"],
        subject,
        html,
      }),
    });

    const data = await res.json();
    return Response.json({ success: true, id: data.id });
  } catch (error) {
    console.error("Digest error:", error);
    return Response.json({ error: "Failed to send" }, { status: 500 });
  }
}
