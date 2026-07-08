import { DynamicClerkBoundary } from "@/components/layout/DynamicClerkBoundary";

export default function DashboardLayout({ children }: { children: React.ReactNode }) {
  return <DynamicClerkBoundary>{children}</DynamicClerkBoundary>;
}
