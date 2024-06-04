CREATE TABLE IF NOT EXISTS "auth_users" (
	"user_id" uuid NOT NULL,
	"email" varchar NOT NULL,
	"passkey" text NOT NULL,
	CONSTRAINT "auth_users_user_id_unique" UNIQUE("user_id"),
	CONSTRAINT "auth_users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "auth_users" ADD CONSTRAINT "auth_users_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "auth_users" ADD CONSTRAINT "auth_users_email_users_email_fk" FOREIGN KEY ("email") REFERENCES "public"."users"("email") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "auth_idx" ON "auth_users" USING btree (user_id);--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "auth_email" ON "auth_users" USING btree (email);--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "passkey" ON "auth_users" USING btree (passkey);