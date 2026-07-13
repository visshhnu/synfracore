"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { ArrowRight } from "lucide-react";

type Props = { paperSlug: string };

// Calls the /api/question-bank/start Route Handler via fetch() rather than
// a native Server Action <form action> — see docs/audit/06-roadmap.md's 6th
// symptom entry (2026-07-13): a correctly-dispatched Server Action still
// 404s on this adapter, from inside Next.js's own action-verification code,
// before the action body ever runs. Route Handlers don't go through that
// mechanism at all.
export default function StartButton({ paperSlug }: Props) {
  const router = useRouter();
  const [isPending, startTransition] = useTransition();
  const [isLoading, setIsLoading] = useState(false);
  const [failed, setFailed] = useState(false);

  async function handleClick() {
    setFailed(false);
    setIsLoading(true);
    try {
      const res = await fetch("/api/question-bank/start", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ paperSlug }),
      });
      const data: { redirectTo?: string } = await res.json();
      if (data.redirectTo) {
        startTransition(() => router.push(data.redirectTo!));
      } else {
        setFailed(true);
      }
    } catch {
      setFailed(true);
    } finally {
      setIsLoading(false);
    }
  }

  const busy = isLoading || isPending;

  return (
    <>
      <button type="button" onClick={handleClick} disabled={busy} className="btn-primary" style={{ opacity: busy ? 0.6 : 1, display: "flex", alignItems: "center", gap: "6px" }}>
        {busy ? "Starting…" : <>Start practice exam <ArrowRight size={15} /></>}
      </button>
      {failed && (
        <p style={{ fontSize: "13px", color: "#F87171", marginTop: "8px" }}>⚠️ Something went wrong starting your attempt — please try again.</p>
      )}
    </>
  );
}
