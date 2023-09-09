import { varchar, pgTable, serial, boolean, date } from "drizzle-orm/pg-core";

export const macrocycle = pgTable("macrocycle", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  startDate: date("start_date", { mode: "date" }).notNull(),
  endDate: date("end_date", { mode: "date" }).notNull(),
  finished: boolean("finished").default(false),
  objective: varchar("objective", { length: 256 }).notNull(),
});

export type Macrocycle = typeof macrocycle.$inferSelect;
export type NewMacrocycle = typeof macrocycle.$inferInsert;
