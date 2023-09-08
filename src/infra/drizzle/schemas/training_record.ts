import {
  varchar,
  pgTable,
  serial,
  integer,
  timestamp,
} from "drizzle-orm/pg-core";
import { mesocycle } from "./mesocycle";
import { trainingTemplate } from "./training_template";

export const trainingRecord = pgTable("training_record", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  startDate: timestamp("start_date", { mode: "date" }).defaultNow(),
  endDate: timestamp("end_date", { mode: "date" }),
  week: integer("week").notNull(),
  finished: timestamp("finished", { mode: "date" }),
  mesocycleId: integer("mesocycle_id")
    .references(() => mesocycle.id)
    .notNull(),
  trainingTemplateId: integer("training_template_id")
    .notNull()
    .references(() => trainingTemplate.id),
});

export type TrainingRecord = typeof trainingRecord.$inferSelect;
export type NewTrainingRecord = typeof trainingRecord.$inferInsert;
