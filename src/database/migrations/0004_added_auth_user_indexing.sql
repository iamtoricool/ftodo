CREATE UNIQUE INDEX IF NOT EXISTS "auth_idx" ON "auth_users" USING btree (user_id);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "passkey" ON "auth_users" USING btree (passkey);--> statement-breakpoint
ALTER TABLE "auth_users" ADD CONSTRAINT "auth_users_user_id_unique" UNIQUE("user_id");