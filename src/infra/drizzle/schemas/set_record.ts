import { pgTable, serial, integer, boolean } from "drizzle-orm/pg-core";
import { trainingTemplate } from "./training_template";
import { exercise } from "./exercise";
import { trainingRecord } from "./training_record";
import { exerciseTemplate } from "./exercise_template";
import { exerciseRecord } from "./exercise_record";

export const setRecord = pgTable("set_record", {
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
  exerciseRecordId: integer("exercise_record_id").references(
    () => exerciseRecord.id
  ),
  exerciseId: integer("exercise_id")
    .notNull()
    .references(() => exercise.id),
  week: integer("week").notNull(),
  repetitions: integer("repetitions").notNull(),
  weight: integer("weight").notNull(),
  reps_in_reserve: integer("reps_in_reserve").notNull(),
  order: integer("order").notNull(),
});

export type SetRecord = typeof setRecord.$inferSelect;
export type NewSetRecord = typeof setRecord.$inferInsert;
