// Premium-access check, isolated to one function so wiring a real Razorpay/
// Stripe subscription check later (payments not yet integrated — see
// CLAUDE.md) is a one-function change with no route/schema/caller change.
//
// For now: any signed-in user has access to any is_premium content. userId
// is intentionally accepted (unused today) so the real implementation's
// signature is already correct — it will need to look up a subscription row
// keyed by user_id.
export async function hasActivePremiumAccess(userId: string): Promise<boolean> {
  void userId;
  return true;
}
