"use client";
import { useEffect } from "react";

export function CopyProtection() {
  useEffect(() => {
    // Disable right-click on content pages
    const handleContextMenu = (e: MouseEvent) => {
      const target = e.target as HTMLElement;
      const isContent = target.closest("article, .prose, pre, code");
      if (isContent) {
        e.preventDefault();
        return false;
      }
    };

    // Disable text selection copy on content
    const handleCopy = (e: ClipboardEvent) => {
      const target = e.target as HTMLElement;
      const isContent = target.closest("article, .prose");
      if (isContent) {
        e.preventDefault();
        if (e.clipboardData) {
          e.clipboardData.setData(
            "text/plain",
            "Content is protected. Visit synfracore.com to study."
          );
        }
      }
    };

    // Disable keyboard shortcuts for saving/printing
    const handleKeyDown = (e: KeyboardEvent) => {
      // Block Ctrl+S, Ctrl+P, Ctrl+U (view source)
      if ((e.ctrlKey || e.metaKey) && ["s", "p", "u"].includes(e.key.toLowerCase())) {
        e.preventDefault();
        return false;
      }
    };

    // Disable drag to copy images/text
    const handleDragStart = (e: DragEvent) => {
      const target = e.target as HTMLElement;
      if (target.closest("article, .prose")) {
        e.preventDefault();
      }
    };

    document.addEventListener("contextmenu", handleContextMenu);
    document.addEventListener("copy", handleCopy);
    document.addEventListener("keydown", handleKeyDown);
    document.addEventListener("dragstart", handleDragStart);

    return () => {
      document.removeEventListener("contextmenu", handleContextMenu);
      document.removeEventListener("copy", handleCopy);
      document.removeEventListener("keydown", handleKeyDown);
      document.removeEventListener("dragstart", handleDragStart);
    };
  }, []);

  return null;
}
