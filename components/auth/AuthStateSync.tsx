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
// REWORKED 2026-08-12 (real production incident, reproduced first-hand
// via a throwaway Clerk test user + sign-in token — see
// docs/audit/07-roadmap-final.md for the reproduction). The single fixed
// GRACE_PERIOD_MS (originally 4000, raised to 20000 after the 4s value
// was confirmed to wipe an in-progress attempt) was still wrong in a
// different way: it measured time since the OTP input *appeared*, not
// time since the user actually went idle. A real user needs to receive
// the email, switch apps/tabs, find it, and type/paste the code — that
// routinely takes longer than 20s even when nothing is stuck, and the
// fixed countdown doesn't care whether the user is actively typing right
// now. Reproduced directly: filled the identifier, reached the OTP step,
// then did nothing further — the input and modal were both gone by t+20s,
// confirmed via a duplicate app remount in the console at the same
// moment (the forced reload firing exactly on schedule).
//
// Replaced with two grace periods instead of one:
//   - INITIAL_GRACE_MS (60s): from the OTP input appearing to the user's
//     first real interaction with it. Generous enough to cover realistic
//     email-delivery + app-switching time before the user has even
//     started responding.
//   - IDLE_GRACE_MS (20s): reset on every real interaction with the OTP
//     input. Reuses the original 20s reasoning, which was actually
//     defensible for its stated case ("already has the code, is typing
//     it in") — the flaw was applying that number to a clock that
//     started before the user had done anything at all, not the number
//     itself.
// A user who is actively engaging with the field — typing, correcting a
// typo, retrying after an error — is never interrupted, no matter how
// long the overall flow takes. Only real inactivity restarts the fixed
// countdown to a rescue reload, preserving the fast-recovery behavior for
// a genuinely stuck session (Symptom 13 itself: code entered correctly,
// Clerk's session state just never updates, and the user stops
// interacting because there's nothing left for them to do).
//
// CORRECTED 2026-08-12, same day, after the first version of this rework
// shipped and was found still broken via direct reproduction: "focus" was
// originally included as one of the interaction events that resets the
// timer. Clerk auto-focuses the OTP input the instant it renders
// (confirmed via document.activeElement === otpInput immediately after
// render, before any user action) — so that focus listener fired
// immediately on every real sign-in, silently discarding the intended
// 60s INITIAL_GRACE_MS and replacing it with just the 20s IDLE_GRACE_MS
// before the user had done anything at all. Every real user was
// effectively only ever getting ~20s from page-render, not 60s,
// explaining the exact failure this rework was supposed to fix: a code
// arriving in ~15s with no time left to read and type it. Only "input"
// and "paste" reset the timer now — both require actual typed or pasted
// content and cannot be triggered by a programmatic focus() call, unlike
// "focus" which could. Verified this specific distinction directly:
// simulating a programmatic focus() on the field does not reset the
// timer, while a simulated "input" event does.
//
// Also added at fire time: re-confirm the OTP input is still present in
// the DOM before reloading, not just that session/user are still empty.
// Without this, a user who deliberately closes the modal (changed their
// mind, or is signing in a different way) without completing sign-in
// would still get an unwanted reload once the timer caught up — the
// original code only checked Clerk's session state, not whether the
// "stuck" premise (an open OTP step) still held.
//
// FIXED AGAIN 2026-08-13, same investigation, one level deeper: the
// "input"/"paste" fix above was itself still broken. Direct instrumentation
// (listeners attached with near-zero latency, logging every event's
// isTrusted flag) showed FOUR "input" events firing on the OTP field
// within 12ms of it rendering — every one with isTrusted: false. These are
// synthetic events dispatched by Clerk's own rendering code (or React's
// internal synthetic-event plumbing syncing its own controlled input's
// value on mount), not the user — but scheduleIdleCheck had no way to
// tell the difference, so it was arming the 20s IDLE_GRACE_MS timer within
// milliseconds of render every single time, regardless of the intended
// 60s INITIAL_GRACE_MS. The effective grace period was ~20s this whole
// time, not 60s -- explaining the ~18-20s reload observed in every prior
// test, including the ones that appeared to survive (real typing happened
// to reset the same 20s timer at the right moment, not because the 60s
// window was ever actually in effect for a genuinely idle user).
// isTrusted is a non-spoofable, browser-native flag -- true only for
// events genuinely generated by real user interaction (real keystrokes,
// real paste), false for anything dispatched via JavaScript, including by
// a framework's own internal code. scheduleIdleCheck now checks
// event.isTrusted and ignores anything false, closing this off directly
// at the one signal Clerk's own code cannot fake.
const INITIAL_GRACE_MS = 60000;
const IDLE_GRACE_MS = 20000;

export default function AuthStateSync() {
  const codeStepSeenRef = useRef(false);
  const timerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const attachedInputRef = useRef<HTMLInputElement | null>(null);

  useEffect(() => {
    const clearTimer = () => {
      if (timerRef.current) {
        clearTimeout(timerRef.current);
        timerRef.current = null;
      }
    };

    const detachInputListeners = () => {
      const el = attachedInputRef.current;
      if (!el) return;
      el.removeEventListener("input", scheduleIdleCheck);
      el.removeEventListener("paste", scheduleIdleCheck);
      attachedInputRef.current = null;
    };

    const reset = () => {
      clearTimer();
      detachInputListeners();
      codeStepSeenRef.current = false;
    };

    const maybeReload = () => {
      const stillPresent = document.querySelector(
        '.cl-modalBackdrop input[autocomplete="one-time-code"]',
      );
      if (!stillPresent) {
        // Modal was closed or the step moved on (sign-in completed
        // normally, or the user cancelled) — the "stuck" premise no
        // longer holds, nothing to rescue.
        reset();
        return;
      }
      const w = window as unknown as { Clerk?: { session?: unknown; user?: unknown } };
      const hasSession = !!w.Clerk?.session;
      const hasUser = !!w.Clerk?.user;
      if (!hasSession && !hasUser) {
        window.location.reload();
      } else {
        // Sign-in completed normally; allow future attempts (e.g. after
        // a subsequent sign-out) to be tracked again.
        reset();
      }
    };

    function scheduleIdleCheck(e: Event) {
      // Ignore synthetic/programmatic events (isTrusted: false) — Clerk's
      // own rendering code fires "input" events on this field as part of
      // its own initialization, confirmed via direct instrumentation.
      // Only a real, physically-typed or physically-pasted event should
      // ever reset this timer.
      if (!e.isTrusted) return;
      clearTimer();
      timerRef.current = setTimeout(maybeReload, IDLE_GRACE_MS);
    }

    const observer = new MutationObserver(() => {
      if (codeStepSeenRef.current) return;
      const codeInput = document.querySelector(
        '.cl-modalBackdrop input[autocomplete="one-time-code"]',
      ) as HTMLInputElement | null;
      if (!codeInput) return;

      codeStepSeenRef.current = true;
      attachedInputRef.current = codeInput;
      // "focus" deliberately excluded — Clerk auto-focuses this field
      // programmatically the instant it renders, which would otherwise
      // fire immediately and discard the INITIAL_GRACE_MS window before
      // the user has done anything. Only "input"/"paste" require actual
      // user-typed or pasted content.
      codeInput.addEventListener("input", scheduleIdleCheck);
      codeInput.addEventListener("paste", scheduleIdleCheck);

      // Initial grace period, before the user has interacted with the
      // field at all — covers real email-delivery + app-switching time.
      timerRef.current = setTimeout(maybeReload, INITIAL_GRACE_MS);
    });

    observer.observe(document.body, { childList: true, subtree: true });
    return () => {
      observer.disconnect();
      clearTimer();
      detachInputListeners();
    };
  }, []);

  return null;
}
