import { DynamicClerkBoundary } from "@/components/layout/DynamicClerkBoundary";

export default function SignInLayout({ children }: { children: React.ReactNode }) {
  return <DynamicClerkBoundary>{children}</DynamicClerkBoundary>;
}
