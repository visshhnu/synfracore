"use client";
import { useState, useEffect } from "react";
import LabEnvironment from "./LabEnvironment";
import { type Lab } from "@/lib/data/labs";

type Props = {
  academy: string;
  technology: string;
  techName: string;
  accentColor: string;
};

export default function LabsSection({ academy, technology, techName, accentColor }: Props) {
  const [labs, setLabs] = useState<Lab[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Dynamic import to avoid SSR issues with the large labs data
    import("@/lib/data/labs").then(({ getLabsForTech }) => {
      setLabs(getLabsForTech(academy, technology));
      setLoading(false);
    });
  }, [academy, technology]);

  if (loading) {
    return (
      <div style={{ padding: "40px", textAlign: "center", color: "var(--text-4)" }}>
        Loading labs...
      </div>
    );
  }

  if (labs.length === 0) {
    return (
      <div style={{
        padding: "48px 32px",
        textAlign: "center",
        background: "var(--bg-1)",
        border: "1px solid var(--border)",
        borderRadius: "16px",
      }}>
        <div style={{ fontSize: "48px", marginBottom: "16px" }}>🧪</div>
        <h3 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "20px", marginBottom: "8px" }}>
          Labs Coming Soon
        </h3>
        <p style={{ color: "var(--text-4)", fontSize: "14px", maxWidth: "400px", margin: "0 auto" }}>
          Hands-on labs for {techName} are being developed. Check back soon for guided
          real-world scenarios with an interactive practice environment.
        </p>
      </div>
    );
  }

  return (
    <LabEnvironment labs={labs} accentColor={accentColor} techName={techName} />
  );
}
