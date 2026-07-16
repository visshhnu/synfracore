"use client";

import { useEffect, useState } from "react";
import { useAuth } from "@clerk/nextjs";
import Link from "next/link";
import { ArrowRight } from "lucide-react";
import StartButton from "./StartButton";

type AttemptStatus = {
  inProgress: { id: string } | null;
  lastSubmitted: { id: string; score: number | null; total: number | null } | null;
};

type Props = { paperSlug: string; initial: AttemptStatus };

// Re-derives inProgress/lastSubmitted client-side on every isSignedIn
// transition, instead of trusting only the one-time server-rendered
// snapshot the parent Server Component passes as `initial`. Signing in or
// out via the Navbar's modal never navigates away from this page, so
// nothing would otherwise re-run that server render — see
// app/api/question-bank/attempt-status/route.ts's comment for the full
// mechanism this works around.
export default function AttemptStatusButtons({ paperSlug, initial }: Props) {
  const { isLoaded, isSignedIn } = useAuth();
  const [status, setStatus] = useState<AttemptStatus>(initial);
  const [signedInSnapshot, setSignedInSnapshot] = useState<boolean | undefined>(undefined);

  useEffect(() => {
    if (!isLoaded) return;
    // Skip the very first resolved isLoaded — `initial` already reflects
    // that same auth state from the server render, so refetching here
    // would just be a redundant round-trip on every page load.
    if (signedInSnapshot === undefined) {
      setSignedInSnapshot(isSignedIn);
      return;
    }
    if (signedInSnapshot === isSignedIn) return;
    setSignedInSnapshot(isSignedIn);

    if (!isSignedIn) {
      setStatus({ inProgress: null, lastSubmitted: null });
      return;
    }
    fetch(`/api/question-bank/attempt-status?paperSlug=${encodeURIComponent(paperSlug)}`)
      .then((res) => res.json())
      .then((data: AttemptStatus) => setStatus(data))
      .catch(() => {});
  }, [isLoaded, isSignedIn, signedInSnapshot, paperSlug]);

  return (
    <>
      {status.inProgress ? (
        <Link href={`/question-bank/${paperSlug}/attempt/${status.inProgress.id}`} className="btn-primary">
          Continue attempt <ArrowRight size={15} />
        </Link>
      ) : (
        <StartButton paperSlug={paperSlug} />
      )}
      {status.lastSubmitted && (
        <Link href={`/question-bank/${paperSlug}/attempt/${status.lastSubmitted.id}/results`} className="btn-secondary">
          View last results ({status.lastSubmitted.score}/{status.lastSubmitted.total})
        </Link>
      )}
    </>
  );
}
