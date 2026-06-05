"use client";
import Link from "next/link";
import { useState } from "react";
import { navigation } from "@/lib/data/navigation";
import { Menu, X, Zap } from "lucide-react";

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);

  return (
    <header
      style={{
        background: "rgba(5, 10, 20, 0.85)",
        borderBottom: "1px solid #1E2D47",
        backdropFilter: "blur(20px)",
        WebkitBackdropFilter: "blur(20px)",
        position: "sticky",
        top: 0,
        zIndex: 100,
      }}
    >
      <div className="mx-auto max-w-7xl px-6 py-4 flex items-center justify-between">
        {/* Logo */}
        <Link href="/" className="flex items-center gap-2 group">
          <div
            style={{
              background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
              borderRadius: "10px",
              padding: "6px",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
            }}
          >
            <Zap size={18} style={{ color: "#fff" }} />
          </div>
          <span
            style={{
              fontFamily: "'Syne', sans-serif",
              fontSize: "20px",
              fontWeight: 700,
              background: "linear-gradient(135deg, #60A5FA, #A78BFA)",
              WebkitBackgroundClip: "text",
              WebkitTextFillColor: "transparent",
              backgroundClip: "text",
            }}
          >
            SynfraCore
          </span>
        </Link>

        {/* Desktop Nav */}
        <nav className="hidden lg:flex items-center gap-1">
          {navigation.map((item) => (
            <Link
              key={item.name}
              href={item.href}
              style={{
                color: "#9BA8C0",
                fontSize: "14px",
                fontWeight: 500,
                padding: "6px 14px",
                borderRadius: "8px",
                transition: "all 0.2s",
                textDecoration: "none",
              }}
              className="hover:bg-white/5 hover:text-white transition-colors"
            >
              {item.name}
            </Link>
          ))}
        </nav>

        {/* CTA */}
        <div className="hidden lg:flex items-center gap-3">
          <Link
            href="/academies"
            style={{
              background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
              color: "#fff",
              padding: "8px 20px",
              borderRadius: "10px",
              fontSize: "14px",
              fontWeight: 600,
              textDecoration: "none",
              transition: "opacity 0.2s",
            }}
            className="hover:opacity-90"
          >
            Start Learning
          </Link>
        </div>

        {/* Mobile toggle */}
        <button
          className="lg:hidden"
          onClick={() => setMobileOpen(!mobileOpen)}
          style={{ color: "#9BA8C0", background: "none", border: "none", cursor: "pointer" }}
        >
          {mobileOpen ? <X size={22} /> : <Menu size={22} />}
        </button>
      </div>

      {/* Mobile menu */}
      {mobileOpen && (
        <div
          style={{
            background: "#0C1524",
            borderBottom: "1px solid #1E2D47",
            padding: "16px 24px",
          }}
        >
          {navigation.map((item) => (
            <Link
              key={item.name}
              href={item.href}
              onClick={() => setMobileOpen(false)}
              style={{
                display: "block",
                color: "#9BA8C0",
                padding: "10px 0",
                fontSize: "15px",
                borderBottom: "1px solid #1E2D47",
                textDecoration: "none",
              }}
            >
              {item.name}
            </Link>
          ))}
          <Link
            href="/academies"
            style={{
              display: "block",
              marginTop: "16px",
              background: "linear-gradient(135deg, #3B82F6, #8B5CF6)",
              color: "#fff",
              padding: "10px 20px",
              borderRadius: "10px",
              textAlign: "center",
              fontWeight: 600,
              textDecoration: "none",
            }}
          >
            Start Learning
          </Link>
        </div>
      )}
    </header>
  );
}
