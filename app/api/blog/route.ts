export const runtime = "edge";

// Blog reactions API — stores likes per slug in Cloudflare KV
// KV binding: BLOG_KV (add in Cloudflare Pages settings)
// Falls back gracefully if KV not configured

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const slug = searchParams.get("slug");
  if (!slug) return Response.json({ error: "Missing slug" }, { status: 400 });

  try {
    const kv = (globalThis as any).BLOG_KV;
    if (!kv) return Response.json({ likes: 0, comments: [] });

    const [likesRaw, commentsRaw] = await Promise.all([
      kv.get(`likes:${slug}`),
      kv.get(`comments:${slug}`),
    ]);

    return Response.json({
      likes: likesRaw ? parseInt(likesRaw) : 0,
      comments: commentsRaw ? JSON.parse(commentsRaw) : [],
    });
  } catch {
    return Response.json({ likes: 0, comments: [] });
  }
}

export async function POST(request: Request) {
  const body = await request.json();
  const { slug, action, name, text } = body;
  if (!slug || !action) return Response.json({ error: "Missing params" }, { status: 400 });

  try {
    const kv = (globalThis as any).BLOG_KV;
    if (!kv) return Response.json({ success: true, likes: 1, comments: [] });

    if (action === "like") {
      const current = await kv.get(`likes:${slug}`);
      const newCount = (current ? parseInt(current) : 0) + 1;
      await kv.put(`likes:${slug}`, String(newCount));
      return Response.json({ success: true, likes: newCount });
    }

    if (action === "comment") {
      if (!name || !text) return Response.json({ error: "Name and text required" }, { status: 400 });
      if (text.length > 1000) return Response.json({ error: "Comment too long" }, { status: 400 });

      const current = await kv.get(`comments:${slug}`);
      const comments = current ? JSON.parse(current) : [];
      const newComment = {
        id: Date.now(),
        name: name.slice(0, 50),
        text: text.slice(0, 1000),
        date: new Date().toLocaleDateString("en-IN", { day: "numeric", month: "short", year: "numeric" }),
      };
      comments.push(newComment);
      // Keep last 100 comments
      if (comments.length > 100) comments.splice(0, comments.length - 100);
      await kv.put(`comments:${slug}`, JSON.stringify(comments));
      return Response.json({ success: true, comment: newComment });
    }

    return Response.json({ error: "Unknown action" }, { status: 400 });
  } catch {
    return Response.json({ error: "Storage error" }, { status: 500 });
  }
}
