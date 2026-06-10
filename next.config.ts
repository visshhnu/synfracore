import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  async redirects() {
    return [
      // Old infrastructure → new devops slug
      {
        source: "/academies/infrastructure/:path*",
        destination: "/academies/devops/:path*",
        permanent: true,
      },
    ];
  },
};

export default nextConfig;
