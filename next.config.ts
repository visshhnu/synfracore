import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  async redirects() {
    return [
      // Old academy slugs → new slugs
      { source: "/academies/infrastructure/:path*", destination: "/academies/devops/:path*", permanent: true },
      { source: "/academies/healthcare/:path*", destination: "/academies/healthcare/:path*", permanent: false },
      // Old cloud paths
      { source: "/academies/cloud/aws-iam/:path*", destination: "/academies/cloud/aws-iam/:path*", permanent: false },
      { source: "/academies/cloud/aws-ec2/:path*", destination: "/academies/cloud/aws-ec2/:path*", permanent: false },
    ];
  },
};

export default nextConfig;
