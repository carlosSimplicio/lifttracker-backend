import { pgTable, serial, integer, varchar } from "drizzle-orm/pg-core";
import { trainingTemplate } from "./training_template";
import { exercise } from "./exercise";

export const exerciseTemplate = pgTable("exercise_template", {
  id: serial("id").primaryKey(),
  trainingTemplateId: integer("training_template_id")
    .references(() => trainingTemplate.id)
    .notNull(),
  maxReps: integer("max_reps").notNull(),
  minReps: integer("min_reps").notNull(),
  setCount: integer("set_count").notNull(),
  exerciseId: integer("exercise_id")
    .notNull()
    .references(() => exercise.id),
  order: integer("order").notNull(),
  annotations: varchar("annotations", { length: 512 }),
});

export type ExerciseTemplate = typeof exerciseTemplate.$inferSelect;
export type NewExerciseTemplate = typeof exerciseTemplate.$inferInsert;
