export const runtime = "edge";

export async function POST(request: Request) {
  try {
    const { email } = await request.json();

    if (!email || !email.includes("@") || !email.includes(".")) {
      return Response.json({ error: "Invalid email address" }, { status: 400 });
    }

    const RESEND_API_KEY = process.env.RESEND_API_KEY;

    if (!RESEND_API_KEY) {
      console.log(`Subscriber (Resend not configured yet): ${email}`);
      return Response.json({ success: true });
    }

    // Step 1: Add to global contacts (new Resend API — no audience_id needed)
    await fetch("https://api.resend.com/contacts", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${RESEND_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email,
        unsubscribed: false,
      }),
    });

    // Step 2: Send welcome email
    await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${RESEND_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "SynfraCore <digest@synfracore.com>",
        to: [email],
        subject: "Welcome to SynfraCore Weekly Digest 🚀",
        html: `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#0A0F1E;color:#E2E8F0;margin:0;padding:0;">
  <div style="max-width:600px;margin:0 auto;padding:40px 24px;">
    <div style="text-align:center;margin-bottom:32px;">
      <div style="display:inline-block;background:linear-gradient(135deg,#3B82F6,#8B5CF6);border-radius:12px;padding:10px 20px;margin-bottom:16px;">
        <span style="color:white;font-weight:800;font-size:18px;">SynfraCore</span>
      </div>
      <h1 style="color:#F1F5F9;font-size:26px;font-weight:800;margin:0 0 8px;">Welcome aboard! 🎉</h1>
      <p style="color:#94A3B8;font-size:15px;margin:0;">Subscribed to SynfraCore Weekly Digest</p>
    </div>
    <div style="background:#111827;border:1px solid #1E2D47;border-radius:16px;padding:28px;margin-bottom:28px;">
      <p style="color:#CBD5E1;font-size:15px;line-height:1.7;margin:0 0 16px;">Every Sunday morning, you will receive:</p>
      <ul style="color:#CBD5E1;font-size:14px;line-height:1.9;margin:0 0 20px;padding-left:20px;">
        <li>🐳 Top DevOps and Cloud tutorials this week</li>
        <li>❓ A must-know interview question with detailed answer</li>
        <li>⚡ One practical command-line tip</li>
        <li>🤖 What is new in AI engineering</li>
        <li>📊 Job market signals for India and remote roles</li>
      </ul>
    </div>
    <div style="text-align:center;margin-bottom:32px;">
      <a href="https://synfracore.com/academies/devops" style="display:inline-block;background:linear-gradient(135deg,#3B82F6,#8B5CF6);color:white;text-decoration:none;padding:12px 24px;border-radius:10px;font-weight:700;font-size:14px;margin:4px;">DevOps Academy</a>
      <a href="https://synfracore.com/blog" style="display:inline-block;background:#1E2D47;color:#94A3B8;text-decoration:none;padding:12px 24px;border-radius:10px;font-weight:600;font-size:14px;margin:4px;">Read Blog</a>
    </div>
    <div style="text-align:center;border-top:1px solid #1E2D47;padding-top:20px;">
      <p style="color:#475569;font-size:12px;margin:0;">SynfraCore · synfracore.com · No spam · Unsubscribe any time</p>
    </div>
  </div>
</body>
</html>`,
      }),
    });

    return Response.json({ success: true });
  } catch (error) {
    console.error("Subscribe error:", error);
    return Response.json({ error: "Something went wrong" }, { status: 500 });
  }
}
