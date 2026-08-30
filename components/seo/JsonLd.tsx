// Structured data for Google rich results — Course, BreadcrumbList, WebSite, Organization, FAQPage
//
// Note on FAQPage (added 2026-08-11): Google discontinued the FAQ rich
// result for all sites as of 2026-05-07 (it had already been restricted to
// government/health sites only since 2023) — this markup will not produce a
// SERP snippet. It's kept here because Google has stated it still parses
// FAQPage markup for page understanding, and other consumers (Bing, AI
// answer engines that crawl schema.org data) do still use it. Don't assume
// this drives a visible rich result — it doesn't, currently.

interface CourseJsonLdProps {
  name: string;
  description: string;
  url: string;
  provider?: string;
  // Real git-derived last-updated date (YYYY-MM-DD), from
  // lib/content/last-updated.ts. Omitted from the structured data
  // entirely when unavailable, rather than fabricating one.
  dateModified?: string;
}

interface BreadcrumbJsonLdProps {
  items: { name: string; url: string }[];
}

export function CourseJsonLd({ name, description, url, provider = "SynfraCore", dateModified }: CourseJsonLdProps) {
  const data = {
    "@context": "https://schema.org",
    "@type": "Course",
    "name": name,
    "description": description,
    "url": url,
    "provider": {
      "@type": "Organization",
      "name": provider,
      "sameAs": "https://synfracore.com",
    },
    "educationalLevel": "Beginner to Advanced",
    "inLanguage": "en",
    "isAccessibleForFree": true,
    "courseMode": "online",
    ...(dateModified ? { "dateModified": dateModified } : {}),
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data) }}
    />
  );
}

export function BreadcrumbJsonLd({ items }: BreadcrumbJsonLdProps) {
  const data = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": items.map((item, index) => ({
      "@type": "ListItem",
      "position": index + 1,
      "name": item.name,
      "item": item.url,
    })),
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data) }}
    />
  );
}

export function WebSiteJsonLd() {
  const data = {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "SynfraCore",
    "url": "https://synfracore.com",
    "description": "Master DevOps, Cloud, AI, Databases, Security and more with interactive labs, real projects, and interview prep.",
    "potentialAction": {
      "@type": "SearchAction",
      "target": {
        "@type": "EntryPoint",
        "urlTemplate": "https://synfracore.com/search?q={search_term_string}",
      },
      "query-input": "required name=search_term_string",
    },
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data) }}
    />
  );
}

interface FAQJsonLdProps {
  items: { question: string; answer: string }[];
}

// Caller is responsible for not rendering this at all when items is empty —
// an empty mainEntity array is invalid FAQPage structured data, not a valid
// "no FAQs" state. See lib/seo/parseFaq.ts's parseFaqMarkdown() contract.
export function FAQJsonLd({ items }: FAQJsonLdProps) {
  if (items.length === 0) return null;

  const data = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": items.map((item) => ({
      "@type": "Question",
      "name": item.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": item.answer,
      },
    })),
  };

  // Unlike the other JsonLd components above (whose data is all
  // hardcoded/first-party strings), this one embeds real content pulled from
  // faq.md files — JSON.stringify does not escape "<", so an answer
  // containing a literal "</script>" sequence (unlikely today, confirmed via
  // corpus grep, but not structurally prevented) would terminate this script
  // tag early and corrupt the page. <-escaping "<" closes that off.
  const json = JSON.stringify(data).replace(/</g, "\\u003c");

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: json }}
    />
  );
}

export function OrganizationJsonLd() {
  const data = {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "SynfraCore",
    "url": "https://synfracore.com",
    "logo": "https://synfracore.com/android-chrome-512x512.png",
    "description": "Practitioner-built learning platform for DevOps, Cloud, AI, Security, and career readiness. Expert content, hands-on labs, interview prep, and certification guides.",
    "knowsAbout": ["DevOps", "Kubernetes", "Cloud Computing", "AWS", "Azure", "Terraform", "Ansible", "Platform Engineering", "AI Engineering"],
    "sameAs": [
      "https://linkedin.com/company/synfracore",
      "https://t.me/synfracore",
      "https://github.com/synfracore",
    ],
    "contactPoint": {
      "@type": "ContactPoint",
      "email": "synfracore@gmail.com",
      "contactType": "customer support",
    },
  };

  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data) }}
    />
  );
}
