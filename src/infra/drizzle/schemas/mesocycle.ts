import {
  varchar,
  pgTable,
  serial,
  integer,
  boolean,
  timestamp,
} from "drizzle-orm/pg-core";
import { macrocycle } from "./macrocycle";

export const mesocycle = pgTable("mesocycle", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  weeks: integer("weeks").notNull(),
  currentWeek: integer("current_week").default(1),
  finished: boolean("finished").default(false),
  createdAt: timestamp("created_at", { mode: "date" }).defaultNow(),
  macrocycleId: integer("macrocycle_id").references(() => macrocycle.id),
});

export type Mesocycle = typeof mesocycle.$inferSelect;
export type NewMesocycle = typeof mesocycle.$inferInsert;
