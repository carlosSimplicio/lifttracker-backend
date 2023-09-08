ALTER TABLE "mesocycle" ADD COLUMN "macrocyle_id" integer;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "mesocycle" ADD CONSTRAINT "mesocycle_macrocyle_id_macrocycle_id_fk" FOREIGN KEY ("macrocyle_id") REFERENCES "macrocycle"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
