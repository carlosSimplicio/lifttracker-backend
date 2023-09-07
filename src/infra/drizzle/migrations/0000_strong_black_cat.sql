CREATE TABLE IF NOT EXISTS "macrocycle" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL,
	"start_date" date NOT NULL,
	"end_date" date NOT NULL,
	"finished" boolean DEFAULT false
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "mesocycle" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL,
	"weeks" integer NOT NULL,
	"current_week" integer DEFAULT 1,
	"finished" boolean DEFAULT false,
	"created_at" date NOT NULL,
	"updated_at" date DEFAULT now()
);
