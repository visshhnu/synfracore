export const runtime = "edge";

// Subscriber store using Cloudflare KV or simple JSON file
// We use Resend for email delivery

export async function POST(request: Request) {
  try {
    const { email } = await request.json();

    if (!email || !email.includes("@") || !email.includes(".")) {
      return Response.json({ error: "Invalid email address" }, { status: 400 });
    }

    const RESEND_API_KEY = process.env.RESEND_API_KEY;

    if (!RESEND_API_KEY) {
      // No Resend key configured yet — still save the email intent
      console.log(`New subscriber (no Resend key): ${email}`);
      return Response.json({ success: true, message: "Subscribed successfully" });
    }

    // 1. Add to Resend audience
    const audienceId = process.env.RESEND_AUDIENCE_ID;
    if (audienceId) {
      await fetch(`https://api.resend.com/audiences/${audienceId}/contacts`, {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${RESEND_API_KEY}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email,
          subscribed: true,
        }),
      });
    }

    // 2. Send welcome email
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
        html: `
          <!DOCTYPE html>
          <html>
          <head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"></head>
          <body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: #0A0F1E; color: #E2E8F0; margin: 0; padding: 0;">
            <div style="max-width: 600px; margin: 0 auto; padding: 40px 24px;">

              <!-- Header -->
              <div style="text-align: center; margin-bottom: 40px;">
                <div style="display: inline-block; background: linear-gradient(135deg, #3B82F6, #8B5CF6); border-radius: 12px; padding: 12px 20px; margin-bottom: 16px;">
                  <span style="color: white; font-weight: 800; font-size: 20px; letter-spacing: -0.5px;">SynfraCore</span>
                </div>
                <h1 style="color: #F1F5F9; font-size: 28px; font-weight: 800; margin: 0 0 8px; letter-spacing: -0.5px;">
                  Welcome aboard! 🎉
                </h1>
                <p style="color: #94A3B8; font-size: 16px; margin: 0;">
                  You're now subscribed to the SynfraCore Weekly Digest
                </p>
              </div>

              <!-- Body -->
              <div style="background: #111827; border: 1px solid #1E2D47; border-radius: 16px; padding: 32px; margin-bottom: 32px;">
                <p style="color: #CBD5E1; font-size: 16px; line-height: 1.7; margin: 0 0 20px;">
                  Hi there,
                </p>
                <p style="color: #CBD5E1; font-size: 16px; line-height: 1.7; margin: 0 0 20px;">
                  Every Sunday morning, you'll receive a digest packed with:
                </p>
                <ul style="color: #CBD5E1; font-size: 15px; line-height: 1.8; margin: 0 0 24px; padding-left: 20px;">
                  <li>🐳 This week's top DevOps and Cloud tutorials</li>
                  <li>❓ A must-know interview question with a detailed answer</li>
                  <li>⚡ One practical command-line tip you can use today</li>
                  <li>🤖 What's new in AI engineering and LLMOps</li>
                  <li>📊 Job market signals and salary insights</li>
                </ul>
                <p style="color: #CBD5E1; font-size: 15px; line-height: 1.7; margin: 0;">
                  First digest arrives this Sunday. In the meantime, explore everything on SynfraCore:
                </p>
              </div>

              <!-- CTA Buttons -->
              <div style="text-align: center; margin-bottom: 40px;">
                <a href="https://synfracore.com/academies/devops" 
                   style="display: inline-block; background: linear-gradient(135deg, #3B82F6, #8B5CF6); color: white; text-decoration: none; padding: 14px 28px; border-radius: 10px; font-weight: 700; font-size: 15px; margin: 6px;">
                  DevOps Academy →
                </a>
                <a href="https://synfracore.com/blog" 
                   style="display: inline-block; background: #1E2D47; color: #94A3B8; text-decoration: none; padding: 14px 28px; border-radius: 10px; font-weight: 600; font-size: 15px; margin: 6px;">
                  Read Blog →
                </a>
              </div>

              <!-- Footer -->
              <div style="text-align: center; border-top: 1px solid #1E2D47; padding-top: 24px;">
                <p style="color: #475569; font-size: 13px; margin: 0 0 8px;">
                  SynfraCore · Learn DevOps, Cloud, AI and more
                </p>
                <p style="color: #334155; font-size: 12px; margin: 0;">
                  You subscribed at synfracore.com · 
                  <a href="https://synfracore.com/unsubscribe?email=${email}" style="color: #475569;">Unsubscribe</a>
                </p>
              </div>

            </div>
          </body>
          </html>
        `,
      }),
    });

    return Response.json({ success: true, message: "Subscribed successfully" });
  } catch (error) {
    console.error("Subscribe error:", error);
    return Response.json({ error: "Something went wrong" }, { status: 500 });
  }
}
