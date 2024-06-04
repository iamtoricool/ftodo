import { pgTable, text, uuid } from "drizzle-orm/pg-core";

import { user } from "./user_schema";
import { createInsertSchema } from "drizzle-zod";

export const authUser = pgTable("auth_users", {
  userId: uuid("user_id")
    .references(() => user.id)
    .notNull(),
  passKey: text("passkey").notNull(),
});

export const authInsertSchema = createInsertSchema(authUser);
