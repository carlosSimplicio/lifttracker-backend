import {
  varchar,
  pgTable,
  serial,
  integer,
  boolean,
  date,
} from "drizzle-orm/pg-core";

export const mesocycles = pgTable("mesocycle", {
  id: serial("id").primaryKey(),
  name: varchar("name", { length: 256 }).notNull(),
  weeks: integer("weeks").notNull(),
  currentWeek: integer("current_week").default(1),
  finished: boolean("finished").default(false),
  createdAt: date("created_at", { mode: "date" }).notNull(),
  updatedAt: date("updated_at", { mode: "date" }).defaultNow(),
});

export type Mesocycle = typeof mesocycles.$inferSelect;
export type NewMesocycle = typeof mesocycles.$inferInsert;
