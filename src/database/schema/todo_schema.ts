import { pgTable, uuid, varchar, text, boolean } from "drizzle-orm/pg-core";

import { createInsertSchema, createSelectSchema } from "drizzle-zod";
import { z } from "zod";

export const todo = pgTable("todos", {
  id: uuid("id").primaryKey().defaultRandom().unique(),
  title: varchar("title", { length: 255 }).notNull(),
  description: text("description"),
  isCompleted: boolean("is_completed").default(false),
});

const createTodoSchema = createInsertSchema(todo);
