import { pgTable, text, uuid, uniqueIndex, index } from "drizzle-orm/pg-core";

import { user } from "./user_schema";
import { createInsertSchema } from "drizzle-zod";

export const authUser = pgTable(
  "auth_users",
  {
    userId: uuid("user_id")
      .references(() => user.id)
      .notNull()
      .unique(),
    passKey: text("passkey").notNull(),
  },
  (table) => {
    return {
      userIdx: uniqueIndex("auth_idx").on(table.userId),
      passKey: index("passkey").on(table.passKey),
    };
  }
);

export const authInsertSchema = createInsertSchema(authUser);
