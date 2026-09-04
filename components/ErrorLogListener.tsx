"use client";

import { useEffect } from "react";
import { logClientError } from "@/lib/errorLog";

// Catches truly uncaught exceptions/rejections outside React's render tree
// entirely (a setTimeout callback, an event handler, a promise with no
// .catch) — the 4 error.tsx boundaries + global-error.tsx only ever see
// exceptions React itself catches while rendering. Mounted once in the
// root layout, same pattern as AuthStateSync.tsx.
export default function ErrorLogListener() {
  useEffect(() => {
    function onError(event: ErrorEvent) {
      logClientError({
        message: event.message || "Unhandled error",
        stack: event.error?.stack ?? null,
        source: "unhandled",
      });
    }
    function onRejection(event: PromiseRejectionEvent) {
      const reason = event.reason;
      logClientError({
        message: reason instanceof Error ? reason.message : String(reason ?? "Unhandled promise rejection"),
        stack: reason instanceof Error ? reason.stack : null,
        source: "unhandled",
      });
    }
    window.addEventListener("error", onError);
    window.addEventListener("unhandledrejection", onRejection);
    return () => {
      window.removeEventListener("error", onError);
      window.removeEventListener("unhandledrejection", onRejection);
    };
  }, []);

  return null;
}
