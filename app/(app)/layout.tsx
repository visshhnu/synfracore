export const runtime = "edge";
import "../globals.css";
import { AppChrome } from "@/components/layout/AppChrome";
import { defaultMetadata } from "@/lib/seo/defaultMetadata";

export const metadata = defaultMetadata;

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <AppChrome>{children}</AppChrome>;
}
