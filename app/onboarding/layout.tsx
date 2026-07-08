import { DynamicClerkBoundary } from "@/components/layout/DynamicClerkBoundary";

export default function OnboardingLayout({ children }: { children: React.ReactNode }) {
  return <DynamicClerkBoundary>{children}</DynamicClerkBoundary>;
}
