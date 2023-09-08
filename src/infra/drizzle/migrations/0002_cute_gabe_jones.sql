CREATE TABLE IF NOT EXISTS "exercise_record" (
	"id" serial PRIMARY KEY NOT NULL,
	"training_template_id" integer NOT NULL,
	"training_record_id" integer NOT NULL,
	"exercise_template_id" integer,
	"week" integer NOT NULL,
	"finished" boolean DEFAULT false,
	"exercise_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "exercise_template" (
	"id" serial PRIMARY KEY NOT NULL,
	"training_template_id" integer NOT NULL,
	"max_reps" integer NOT NULL,
	"min_reps" integer NOT NULL,
	"set_count" integer NOT NULL,
	"exercise_id" integer NOT NULL,
	"order" integer NOT NULL,
	"annotations" varchar(512)
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "exercise" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL,
	"muscle_group_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "muscleGroup" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "set_record" (
	"id" serial PRIMARY KEY NOT NULL,
	"training_template_id" integer NOT NULL,
	"training_record_id" integer NOT NULL,
	"exercise_template_id" integer,
	"exercise_record_id" integer,
	"exercise_id" integer NOT NULL,
	"week" integer NOT NULL,
	"repetitions" integer NOT NULL,
	"weight" integer NOT NULL,
	"reps_in_reserve" integer NOT NULL,
	"order" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "training_record" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL,
	"start_date" timestamp DEFAULT now(),
	"end_date" timestamp,
	"week" integer NOT NULL,
	"finished" timestamp,
	"mesocycle_id" integer NOT NULL,
	"training_template_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "training_template" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar(256) NOT NULL,
	"current_week" integer DEFAULT 1,
	"mesocycle_id" integer NOT NULL
);
--> statement-breakpoint
ALTER TABLE "mesocycle" ALTER COLUMN "created_at" SET DATA TYPE timestamp;--> statement-breakpoint
ALTER TABLE "mesocycle" ALTER COLUMN "created_at" SET DEFAULT now();--> statement-breakpoint
ALTER TABLE "mesocycle" ALTER COLUMN "created_at" DROP NOT NULL;--> statement-breakpoint
ALTER TABLE "mesocycle" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_record" ADD CONSTRAINT "exercise_record_training_template_id_training_template_id_fk" FOREIGN KEY ("training_template_id") REFERENCES "training_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_record" ADD CONSTRAINT "exercise_record_training_record_id_training_record_id_fk" FOREIGN KEY ("training_record_id") REFERENCES "training_record"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_record" ADD CONSTRAINT "exercise_record_exercise_template_id_exercise_template_id_fk" FOREIGN KEY ("exercise_template_id") REFERENCES "exercise_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_record" ADD CONSTRAINT "exercise_record_exercise_id_exercise_id_fk" FOREIGN KEY ("exercise_id") REFERENCES "exercise"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_template" ADD CONSTRAINT "exercise_template_training_template_id_training_template_id_fk" FOREIGN KEY ("training_template_id") REFERENCES "training_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise_template" ADD CONSTRAINT "exercise_template_exercise_id_exercise_id_fk" FOREIGN KEY ("exercise_id") REFERENCES "exercise"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "exercise" ADD CONSTRAINT "exercise_muscle_group_id_muscleGroup_id_fk" FOREIGN KEY ("muscle_group_id") REFERENCES "muscleGroup"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "set_record" ADD CONSTRAINT "set_record_training_template_id_training_template_id_fk" FOREIGN KEY ("training_template_id") REFERENCES "training_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "set_record" ADD CONSTRAINT "set_record_training_record_id_training_record_id_fk" FOREIGN KEY ("training_record_id") REFERENCES "training_record"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "set_record" ADD CONSTRAINT "set_record_exercise_template_id_exercise_template_id_fk" FOREIGN KEY ("exercise_template_id") REFERENCES "exercise_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "set_record" ADD CONSTRAINT "set_record_exercise_record_id_exercise_record_id_fk" FOREIGN KEY ("exercise_record_id") REFERENCES "exercise_record"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "set_record" ADD CONSTRAINT "set_record_exercise_id_exercise_id_fk" FOREIGN KEY ("exercise_id") REFERENCES "exercise"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "training_record" ADD CONSTRAINT "training_record_mesocycle_id_mesocycle_id_fk" FOREIGN KEY ("mesocycle_id") REFERENCES "mesocycle"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "training_record" ADD CONSTRAINT "training_record_training_template_id_training_template_id_fk" FOREIGN KEY ("training_template_id") REFERENCES "training_template"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "training_template" ADD CONSTRAINT "training_template_mesocycle_id_mesocycle_id_fk" FOREIGN KEY ("mesocycle_id") REFERENCES "mesocycle"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
