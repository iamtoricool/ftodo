DROP INDEX IF EXISTS "todo_idx";--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "todo_idx" ON "todos" USING btree (id);