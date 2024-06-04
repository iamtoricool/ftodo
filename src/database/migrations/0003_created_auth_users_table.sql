CREATE TABLE IF NOT EXISTS "auth_users" (
	"user_id" uuid NOT NULL,
	"passkey" text NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "auth_users" ADD CONSTRAINT "auth_users_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
