import { varchar, pgTable, serial, integer } from "drizzle-orm/pg-core";
import { mesocycle } from "./mesocycle";

export const trainingTemplate = pgTable("training_template", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  currentWeek: integer("current_week").default(1),
  mesocycleId: integer("mesocycle_id")
    .references(() => mesocycle.id)
    .notNull(),
});

export type TrainingTemplate = typeof trainingTemplate.$inferSelect;
export type NewTrainingTemplate = typeof trainingTemplate.$inferInsert;
