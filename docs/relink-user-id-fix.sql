-- Self-healing user re-linking for Clerk test-mode -> live-mode migration
-- collisions. Clerk's dev/test and live keys are separate user pools, so a
-- fresh sign-in under new live keys gets a brand-new Clerk user id -- which
-- collides with an existing users.email unique constraint if that email
-- already has a row under the old (now-orphaned) test-mode id. Postgres
-- error 23505 on users_email_key is the signature.
--
-- Run this once against production. See docs/audit/06-roadmap.md for the
-- incident this was built from (found and manually fixed for one account
-- via this exact sequence of statements, then generalized here so it never
-- needs a manual SQL Editor fix again).
--
-- EXECUTE is intentionally restricted to service_role only -- this function
-- can re-point any user's data to any id, and must never be reachable under
-- a normal signed-in user's own permissions.

CREATE OR REPLACE FUNCTION relink_user_id(old_id TEXT, new_id TEXT)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE users SET id = new_id, updated_at = now() WHERE id = old_id;
  UPDATE user_domain_preferences SET user_id = new_id WHERE user_id = old_id;
  UPDATE recent_activity SET user_id = new_id WHERE user_id = old_id;
  UPDATE paper_attempts SET user_id = new_id WHERE user_id = old_id;
END;
$$;

REVOKE ALL ON FUNCTION relink_user_id(TEXT, TEXT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION relink_user_id(TEXT, TEXT) TO service_role;

-- The three foreign keys below must be DEFERRABLE INITIALLY DEFERRED for the
-- function body above to work at all -- confirmed live (2026-07-15) that
-- without this, even a single PL/pgSQL function body enforces each
-- statement's FK checks immediately rather than at the end of the implicit
-- transaction, causing exactly the chicken-and-egg failure this function
-- exists to avoid. Idempotent -- safe to re-run.
ALTER TABLE user_domain_preferences ALTER CONSTRAINT user_domain_preferences_user_id_fkey DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE recent_activity        ALTER CONSTRAINT recent_activity_user_id_fkey        DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE paper_attempts         ALTER CONSTRAINT paper_attempts_user_id_fkey         DEFERRABLE INITIALLY DEFERRED;
