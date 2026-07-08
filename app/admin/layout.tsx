import { DynamicClerkBoundary } from "@/components/layout/DynamicClerkBoundary";

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return <DynamicClerkBoundary>{children}</DynamicClerkBoundary>;
}
