# Next.js — Portfolio Projects

## Project 1 — Static Content Blog

**Level:** Beginner **Time:** 4-6 hours **GitHub repo name suggestion:** `nextjs-static-blog`

**What you build:** A blog whose posts are known ahead of time (from local markdown/JSON files, or a simple content source) and rendered using an ahead-of-time rendering strategy — the whole point of this project is picking the *right* strategy for content that genuinely doesn't need to be regenerated on every visit.

```jsx
// Conceptual shape -- listing posts and rendering one post's detail
// page via a dynamic route
// (needs verification -- exact current data-fetching and dynamic-
// route APIs; confirm against current Next.js docs)
async function BlogIndex() {
  const posts = await getAllPosts();
  return (
    <ul>
      {posts.map((post) => (
        <li key={post.slug}>
          <Link href={`/blog/${post.slug}`}>{post.title}</Link>
        </li>
      ))}
    </ul>
  );
}
```

What this project actually proves: you can identify content that's a good fit for ahead-of-time rendering and implement it that way deliberately — not just that you can display a list of items.

---

## Project 2 — Dashboard With Mixed Rendering Strategies

**Level:** Intermediate **Time:** 8-12 hours **GitHub repo name suggestion:** `nextjs-mixed-dashboard`

**What you build:** A small dashboard app with at least two sections that genuinely warrant *different* rendering strategies within the same app — e.g. a "reports" section (data that changes rarely, good fit for ahead-of-time rendering with revalidation) and a "live status" section (data that must reflect the current moment, good fit for per-request or client-side rendering). Add at least one loading state and one error state, deliberately, rather than relying on default framework behavior.

```jsx
// Conceptual shape -- two sections of the same app, each using a
// different rendering approach on purpose
// (needs verification -- exact current APIs for each strategy)
```

What this project actually proves: you understand rendering-strategy choice as a real per-page/per-section decision, not a single app-wide setting — this is the single most interview-relevant skill this course covers.

---

## Project 3 — Full-Stack App With a Database

**Level:** Advanced **Time:** 15-20 hours **GitHub repo name suggestion:** `nextjs-fullstack-app`

**What you build:** A genuinely full-stack app — a real database-backed feature (e.g. a simple task tracker, a comment system) using route handlers/API routes to talk to a database with server-only credentials, plus a page that fetches and renders that data. This project deliberately points forward to this platform's later **Full-Stack Integration** technology, where connecting a frontend framework to a real backend and database is covered in much greater depth — this project is your first hands-on taste of that pattern inside Next.js specifically.

```jsx
// Conceptual shape -- a route handler reading/writing a database,
// and a page rendering the current data
// (needs verification -- exact current route-handler API/convention,
// and follow your database's own connection-security guidance for
// keeping credentials server-only)
export async function POST(request) {
  const body = await request.json();
  const saved = await saveToDatabase(body);
  return Response.json(saved);
}
```

What this project actually proves: you can build a genuinely full-stack feature inside a single Next.js project — routing, rendering, and a real server-only data layer working together — which is exactly the "batteries included" value proposition from the Overview tab, demonstrated end to end.
