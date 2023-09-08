import { pgTable, serial, integer, varchar } from "drizzle-orm/pg-core";
import { muscleGroup } from "./muscleGroup";

export const exercise = pgTable("exercise", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  muscleGroupId: integer("muscle_group_id")
    .notNull()
    .references(() => muscleGroup.id),
});

export type Exercise = typeof exercise.$inferSelect;
export type NewExercise = typeof exercise.$inferInsert;
