import { pgTable, serial, integer, boolean } from "drizzle-orm/pg-core";
import { trainingTemplate } from "./training_template";
import { exercise } from "./exercise";
import { trainingRecord } from "./training_record";
import { exerciseTemplate } from "./exercise_template";

export const exerciseRecord = pgTable("exercise_record", {
  id: serial("id").primaryKey(),
  trainingTemplateId: integer("training_template_id")
    .references(() => trainingTemplate.id)
    .notNull(),
  trainingRecordId: integer("training_record_id")
    .notNull()
    .references(() => trainingRecord.id),
  exerciseTemplateId: integer("exercise_template_id").references(
    () => exerciseTemplate.id
  ),
  week: integer("week").notNull(),
  finished: boolean("finished").default(false),
  exerciseId: integer("exercise_id")
    .notNull()
    .references(() => exercise.id),
});

export type ExerciseRecord = typeof exerciseRecord.$inferSelect;
export type NewExerciseRecord = typeof exerciseRecord.$inferInsert;
