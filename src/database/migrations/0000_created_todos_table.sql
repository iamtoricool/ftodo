CREATE TABLE IF NOT EXISTS "todos" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" text,
	"isCompleted" boolean DEFAULT false,
	CONSTRAINT "todos_id_unique" UNIQUE("id")
);
