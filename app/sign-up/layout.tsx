import { DynamicClerkBoundary } from "@/components/layout/DynamicClerkBoundary";

export default function SignUpLayout({ children }: { children: React.ReactNode }) {
  return <DynamicClerkBoundary>{children}</DynamicClerkBoundary>;
}
