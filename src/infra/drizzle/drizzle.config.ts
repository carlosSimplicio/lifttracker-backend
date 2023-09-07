import type { Config } from "drizzle-kit";

export default {
  schema: "./src/infra/drizzle/schemas/*.ts",
  out: "./src/infra/drizzle/migrations",
  driver: "pg",
  dbCredentials: {
    connectionString: "postgres://postgres:1234@localhost:5432/postgres",
  },
} satisfies Config;
