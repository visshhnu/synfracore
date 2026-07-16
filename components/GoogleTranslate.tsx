"use client";
import { useEffect } from "react";

// Minimal shape for the untyped third-party Google Translate widget global —
// only the members this component actually touches.
type GoogleTranslateWindow = Window & {
  googleTranslateElementInit?: () => void;
  google?: { translate: { TranslateElement: new (opts: Record<string, unknown>, id: string) => unknown } };
};

export function GoogleTranslate() {
  useEffect(() => {
    // Only run on client - prevents hydration mismatch (#418)
    const script = document.createElement("script");
    script.src = "//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit";
    script.async = true;
    document.head.appendChild(script);

    const w = window as GoogleTranslateWindow;
    w.googleTranslateElementInit = function () {
      try {
        new w.google!.translate.TranslateElement(
          { pageLanguage: "en", includedLanguages: "te,hi,kn,ta,ml,ar,es,pt,zh-TW,fr,de,ja", autoDisplay: false },
          "google_translate_element"
        );
      } catch {}
    };

    // Hide the Google Translate banner/toolbar
    const hideToolbar = () => {
      const frame = document.querySelector(".goog-te-banner-frame") as HTMLElement;
      if (frame) { frame.style.display = "none"; document.body.style.top = "0px"; }
      const skip = document.querySelector(".skiptranslate") as HTMLElement;
      if (skip) skip.style.display = "none";
    };
    const t1 = setTimeout(hideToolbar, 500);
    const t2 = setTimeout(hideToolbar, 2000);
    return () => { clearTimeout(t1); clearTimeout(t2); };
  }, []);

  return <div id="google_translate_element" style={{ display: "none" }} />;
}
