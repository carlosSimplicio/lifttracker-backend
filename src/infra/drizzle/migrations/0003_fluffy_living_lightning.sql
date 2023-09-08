ALTER TABLE "mesocycle" RENAME COLUMN "macrocyle_id" TO "macrocycle_id";--> statement-breakpoint
ALTER TABLE "mesocycle" DROP CONSTRAINT "mesocycle_macrocyle_id_macrocycle_id_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "mesocycle" ADD CONSTRAINT "mesocycle_macrocycle_id_macrocycle_id_fk" FOREIGN KEY ("macrocycle_id") REFERENCES "macrocycle"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
