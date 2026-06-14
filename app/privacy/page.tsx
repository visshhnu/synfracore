export const metadata = {
  title: "Privacy Policy | SynfraCore",
  description: "How SynfraCore collects, uses, and protects your personal information.",
};

export default function PrivacyPage() {
  const sections = [
    {
      title: "Information We Collect",
      content: `We collect information you provide directly: account registration data (email, name), learning progress, quiz results, and content you submit. We automatically collect usage data including pages visited, time spent, features used, and device/browser information via cookies and analytics.`,
    },
    {
      title: "How We Use Your Information",
      content: `We use collected information to: provide and improve the learning platform, personalize your experience and track progress, send important product updates and security notices, analyze usage patterns to improve content quality, and respond to support requests.`,
    },
    {
      title: "Information Sharing",
      content: `We do not sell your personal information. We share data only with: service providers who help operate the platform (hosting, analytics, email delivery), when required by law or to protect rights, or with your explicit consent. All third-party providers are contractually required to protect your data.`,
    },
    {
      title: "Data Storage and Security",
      content: `Your data is stored on servers in India and the United States with industry-standard encryption at rest and in transit. We implement technical and organizational measures to protect against unauthorized access. You can request deletion of your account and data at any time.`,
    },
    {
      title: "Cookies",
      content: `We use essential cookies for authentication and preferences, analytics cookies to understand usage (Google Analytics), and performance cookies. You can control cookies through browser settings. Disabling essential cookies may affect platform functionality.`,
    },
    {
      title: "Your Rights",
      content: `You have the right to: access the personal data we hold about you, correct inaccurate information, request deletion of your data, object to certain processing, and data portability. To exercise these rights, contact us at hello@synfracore.com.`,
    },
    {
      title: "Children's Privacy",
      content: `SynfraCore is not directed at children under 13. We do not knowingly collect personal information from children under 13. If you believe we have collected such information, please contact us immediately.`,
    },
    {
      title: "Changes to This Policy",
      content: `We may update this privacy policy periodically. We will notify registered users by email of significant changes. Continued use of the platform after changes constitutes acceptance of the updated policy.`,
    },
  ];
  return (
    <div style={{ maxWidth: "760px", margin: "0 auto", padding: "56px 24px" }}>
      <h1 style={{ fontFamily: "'Plus Jakarta Sans', sans-serif", fontSize: "clamp(28px,4vw,44px)", fontWeight: 800, letterSpacing: "-0.02em", marginBottom: "8px" }}>Privacy Policy</h1>
      <p style={{ color: "var(--text-4)", fontSize: "14px", marginBottom: "40px" }}>Last updated: January 2025 · Contact: hello@synfracore.com</p>
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
