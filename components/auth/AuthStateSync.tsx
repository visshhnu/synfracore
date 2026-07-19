"use client";

import { useEffect, useRef } from "react";

// Root-cause session, 2026-07-19 (docs/audit/07-roadmap-final.md, Symptom
// 13 — STOPGAP, not a resolution). Confirmed the actual failure is
// upstream of React: after a modal sign-in completes, window.Clerk.session
// and window.Clerk.user stay empty on deployed Cloudflare (0/5
// reproductions locally, 10/10 on deployed main) — Clerk's own
// client-side SDK state never updates, so useAuth()'s isSignedIn never
// transitions either (it's just a subscription to that same state).
//
// Two earlier attempts at this fix are documented and superseded here:
//   1. router.refresh() on isSignedIn transitions — could not work by
//      construction, since isSignedIn never transitions in the broken case.
//   2. window.location.reload() gated on the sign-in modal's
//      `.cl-modalBackdrop` closing — verified via a direct 15-second DOM
//      poll (backdropExists + display:flex the entire time, in exact
//      lockstep with session/user staying empty) that THE MODAL NEVER
//      CLOSES in the broken case at all. This isn't a detection bug — the
//      modal staying open IS the visible symptom users see. Gating on
//      modal-close meant the reload could never fire when it was needed,
//      by design.
//
// This version instead watches for the one-time-code input appearing
// (`input[autocomplete="one-time-code"]`) — the reliable last step before
// sign-in should complete, reached only once the user has real intent to
// finish (low false-positive risk, unlike timing from modal-open which
// would also catch slow typists on the identifier/password steps). Once
// seen, starts a grace period; if window.Clerk.session/user are still
// empty afterward, forces a hard reload regardless of whether the modal
// ever closes — a reload is the correct recovery either way, confirmed
// repeatedly to always show the real signed-in state correctly.
//
// Does not root-cause why Clerk's own sign-in completion (including its
// own modal-dismiss logic) hangs on deployed Cloudflare specifically —
// see Part 4i for the open question.
//
// Scoped to the modal only (2026-07-19, Part 4i follow-up): this
// component is mounted once in the root layout, so an unscoped
// `document.querySelector('input[autocomplete="one-time-code"]')` also
// matches the standalone /sign-in and /sign-up pages' own OTP input —
// those routes were never part of Symptom 13 and have their own working
// navigation-based state sync. A legitimately slow (not stuck) user
// entering an emailed code there could hit an unnecessary 20s reload
// mid-entry. Fixed by requiring the OTP input to be inside
// `.cl-modalBackdrop` (confirmed present only for the modal, absent on
// the standalone pages) before starting the grace-period timer at all.
//
// GRACE_PERIOD_MS was originally 4000 (4s) — verified live to be far too
// short: a 4s reload fires while a real user is still reading their email
// and typing the code, wiping their in-progress attempt entirely (this was
// mistaken for a mysterious "modal timeout" during testing before the
// actual cause — this component's own premature reload — was traced).
// 20s is a more realistic floor for a user who already has the code
// visible and is typing/pasting it directly into the field. Verified at
// 90s (test-only value, to survive slow chat-relayed manual testing) that
// the mechanism itself works: a validly-entered code, watched through the
// full window, showed the reload firing and correctly recovering the
// stuck session, on the same URL, with no data loss. 20s is the
// production-shipping value.
const GRACE_PERIOD_MS = 20000;

export default function AuthStateSync() {
  const codeStepSeenRef = useRef(false);

  useEffect(() => {
    const observer = new MutationObserver(() => {
      if (codeStepSeenRef.current) return;
      const codeInput = document.querySelector(
        '.cl-modalBackdrop input[autocomplete="one-time-code"]',
      );
      if (!codeInput) return;

      codeStepSeenRef.current = true;

      setTimeout(() => {
        const w = window as unknown as { Clerk?: { session?: unknown; user?: unknown } };
        const hasSession = !!w.Clerk?.session;
        const hasUser = !!w.Clerk?.user;
        if (!hasSession && !hasUser) {
          window.location.reload();
        } else {
          // Sign-in completed normally; allow future attempts (e.g. after
          // a subsequent sign-out) to be tracked again.
          codeStepSeenRef.current = false;
        }
      }, GRACE_PERIOD_MS);
    });

    observer.observe(document.body, { childList: true, subtree: true });
    return () => observer.disconnect();
  }, []);

  return null;
}
