import { pgTable, uuid, varchar, text, boolean } from "drizzle-orm/pg-core";

export const todosTable = pgTable("todos", {
  id: uuid("id").primaryKey().defaultRandom().unique(),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  isCompleted: boolean("isCompleted").default(false),
});
