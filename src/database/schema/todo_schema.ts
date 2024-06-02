import {
  pgTable,
  varchar,
  text,
  boolean,
  serial,
  uuid,
  index,
  uniqueIndex,
} from "drizzle-orm/pg-core";

import { createInsertSchema, createSelectSchema } from "drizzle-zod";
import { z } from "zod";

import { user } from "./user_schema";

export const todo = pgTable(
  "todos",
  {
    id: serial("id").primaryKey(),
    userId: uuid("user_id").references(() => user.id),
    title: varchar("title", { length: 255 }).notNull(),
    description: text("description"),
    isCompleted: boolean("is_completed").default(false),
  },
  (table) => {
    return {
      todoIdx: uniqueIndex("todo_idx").on(table.userId),
      userIdx: uniqueIndex("user_idx").on(table.userId),
      titleIdx: index("title_idx").on(table.title),
    };
  }
);
