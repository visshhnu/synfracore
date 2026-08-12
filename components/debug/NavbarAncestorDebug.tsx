"use client";

import { useEffect } from "react";

// TEMPORARY diagnostic, added 2026-08-12 to investigate a live report:
// the navbar (header, position:fixed) reportedly stops staying pinned to
// the viewport after signing in, working correctly signed-out. Read-only —
// queries computed styles and logs to the console, never writes to the
// DOM, never touches app state, never throws (everything wrapped in
// try/catch). Renders nothing. Safe to delete once the root cause is
// found; not meant to ship long-term.
//
// Only transform / filter / perspective / contain / will-change on an
// ANCESTOR create a new containing block that breaks position:fixed
// (plain overflow does not — that's the mechanism for position:sticky's
// "nearest scrolling ancestor", a different rule). This walks the header's
// real ancestor chain and reports which of those properties, if any, are
// actually present on each ancestor, plus whether the header is actually
// staying pinned to the viewport across a real scroll.
export default function NavbarAncestorDebug() {
  useEffect(() => {
    try {
      const header = document.querySelector("header");
      if (!header) {
        console.log("[navbar-debug] no <header> found on this page");
        return;
      }

      const describeAncestors = () => {
        const rows: Record<string, unknown>[] = [];
        let el: Element | null = header.parentElement;
        while (el) {
          const cs = getComputedStyle(el);
          rows.push({
            tag: el.tagName,
            id: el.id || undefined,
            className: typeof el.className === "string" ? el.className : undefined,
            inlineStyle: el.getAttribute("style") || undefined,
            transform: cs.transform,
            filter: cs.filter,
            willChange: cs.willChange,
            contain: cs.contain,
            perspective: cs.perspective,
            overflowX: cs.overflowX,
            overflowY: cs.overflowY,
            position: cs.position,
          });
          el = el.parentElement;
        }
        return rows;
      };

      const isSignedIn = !!document.querySelector(
        "header .cl-userButtonTrigger, header .cl-userButtonBox, header [class*='cl-userButton']"
      );

      const report = (label: string) => {
        const rect = header.getBoundingClientRect();
        const cs = getComputedStyle(header);
        console.log(`[navbar-debug] ${label}`, {
          signedInUiDetected: isSignedIn,
          headerPosition: cs.position,
          headerTop: rect.top,
          scrollY: window.scrollY,
          note:
            "headerTop should stay ~0 (position:fixed) regardless of scrollY. If headerTop tracks scrollY instead, the header has lost its fixed-to-viewport behavior.",
        });
        console.log("[navbar-debug] ancestor chain (body -> html):", describeAncestors());
      };

      // Report once shortly after mount (gives Clerk's UI time to finish
      // mounting UserButton if signed in) ...
      const t1 = setTimeout(() => report("on load"), 1500);

      // ...and again after a real scroll, to directly show whether the
      // header is actually staying pinned or scrolling away with the page.
      let reported2 = false;
      const onScroll = () => {
        if (reported2) return;
        if (window.scrollY > 150) {
          reported2 = true;
          report("after scrolling past 150px");
        }
      };
      window.addEventListener("scroll", onScroll, { passive: true });

      return () => {
        clearTimeout(t1);
        window.removeEventListener("scroll", onScroll);
      };
    } catch (e) {
      console.log("[navbar-debug] diagnostic itself errored (harmless, ignore):", e);
    }
  }, []);

  return null;
}
