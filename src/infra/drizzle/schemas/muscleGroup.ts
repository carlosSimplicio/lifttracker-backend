import { pgTable, serial, varchar } from "drizzle-orm/pg-core";

export const muscleGroup = pgTable("muscleGroup", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
});

export type MuscleGroup = typeof muscleGroup.$inferSelect;
export type NewMuscleGroup = typeof muscleGroup.$inferInsert;
