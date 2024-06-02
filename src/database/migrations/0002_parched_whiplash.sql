DROP INDEX IF EXISTS "user_idx";--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "user_idx" ON "todos" USING btree (user_id);