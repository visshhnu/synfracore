// Structured data for Google rich results — Course, BreadcrumbList, WebSite, Organization

interface CourseJsonLdProps {
  name: string;
  description: string;
  url: string;
  provider?: string;
}

interface BreadcrumbJsonLdProps {
  items: { name: string; url: string }[];
}

export function CourseJsonLd({ name, description, url, provider = "SynfraCore" }: CourseJsonLdProps) {
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

export function OrganizationJsonLd() {
  const data = {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "SynfraCore",
    "url": "https://synfracore.com",
    "logo": "https://synfracore.com/icon-32.png",
    "description": "Tech learning platform for DevOps, Cloud, AI, and more.",
    "sameAs": [
      "https://t.me/synfracore",
      "https://github.com/visshhnu/synfracore",
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
