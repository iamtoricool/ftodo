DO $$ BEGIN
 CREATE TYPE "public"."membership" AS ENUM('FREE', 'BRONZE', 'SILVER', 'GOLD');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "todos" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" uuid,
	"title" varchar(255) NOT NULL,
	"description" text,
	"is_completed" boolean DEFAULT false
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"membership" "membership" DEFAULT 'FREE',
	CONSTRAINT "users_id_unique" UNIQUE("id"),
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "todos" ADD CONSTRAINT "todos_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "todo_idx" ON "todos" USING btree (user_id);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "user_idx" ON "todos" USING btree (user_id);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "title_idx" ON "todos" USING btree (title);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "idx" ON "users" USING btree (id);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "email_idx" ON "users" USING btree (email);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "first_name_idx" ON "users" USING btree (first_name);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "last_name_idx" ON "users" USING btree (last_name);