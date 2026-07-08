export const metadata = {
  title: "Terms of Service | SynfraCore",
  description: "Terms and conditions for using SynfraCore learning platform.",
};

export default function TermsPage() {
  const sections = [
    { title: "Acceptance of Terms", content: "By accessing or using SynfraCore, you agree to be bound by these Terms of Service and our Privacy Policy. If you do not agree to these terms, please do not use the platform. We reserve the right to modify these terms at any time with notice." },
    { title: "Use of the Platform", content: "You may use SynfraCore for lawful educational purposes only. You agree not to: share account credentials, scrape or copy content systematically, attempt to access unauthorized areas, use the platform to harass others, or reverse engineer any part of the service." },
    { title: "Intellectual Property", content: "All content on SynfraCore — including text, code examples, diagrams, and course materials — is owned by SynfraCore or its licensors. You may use content for personal learning only. Redistribution, republishing, or commercial use requires written permission." },
    { title: "User Content", content: "By submitting content (questions, feedback, forum posts), you grant SynfraCore a non-exclusive license to use, display, and improve the platform. You retain ownership of your content. You are responsible for content you submit and must not submit content that infringes rights or violates laws." },
    { title: "Subscription and Payment", content: "Free tier features are provided as-is without warranty. Paid subscriptions are billed in advance. Refunds are available within 7 days of purchase for annual plans if you have not accessed premium content. Contact hello@synfracore.com for billing support." },
    { title: "Disclaimers", content: "SynfraCore is provided 'as is' without warranties of any kind. We do not guarantee that certifications obtained after using the platform will result in employment. Technical content reflects best practices at time of writing and may become outdated. Always verify information with official documentation." },
    { title: "Limitation of Liability", content: "SynfraCore shall not be liable for indirect, incidental, or consequential damages arising from use of the platform. Our total liability for any claim shall not exceed the amount you paid in the 12 months preceding the claim." },
    { title: "Termination", content: "We may suspend or terminate accounts that violate these terms. You may delete your account at any time. Upon termination, your right to access the platform ceases, but provisions regarding intellectual property, disclaimers, and limitations of liability survive." },
  ];
  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "56px 24px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "8px" }}>Terms of Service</h1>
      <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "40px" }}>Last updated: January 2025 · Questions: hello@synfracore.com</p>
      <div style={{ display: "flex", flexDirection: "column", gap: "32px" }}>
        {sections.map(s => (
          <div key={s.title}>
            <h2 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontWeight: 700, fontSize: "18px", marginBottom: "10px" }}>{s.title}</h2>
            <p style={{ color: "var(--text-3)", fontSize: "15px", lineHeight: 1.8 }}>{s.content}</p>
          </div>
        ))}
      </div>
    </div>
  );
}
