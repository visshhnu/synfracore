export const dynamic = "force-dynamic";

export default function ThrowTestPage() {
  throw new Error("Deliberate test error for global-error.tsx verification");
}
