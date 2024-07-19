import {
  pgTable,
  uuid,
  varchar,
  pgEnum,
  index,
  uniqueIndex,
  timestamp,
} from "drizzle-orm/pg-core";

import { createInsertSchema, createSelectSchema } from "drizzle-zod";
import { z } from "zod";

export const userMembershipEnum = pgEnum("membership", [
  "FREE",
  "BRONZE",
  "SILVER",
  "GOLD",
]);

export const user = pgTable(
  "users",
  {
    id: uuid("id").primaryKey().defaultRandom().unique(),
    firstName: varchar("first_name", { length: 255 }).notNull(),
    lastName: varchar("last_name", { length: 255 }).notNull(),
    email: varchar("email", { length: 255 }).notNull().unique(),
    membership: userMembershipEnum("membership").default("FREE"),
    createdAt: timestamp("created_at", { mode: "string" }).defaultNow(),
    updatedAt: timestamp("updated_at", { mode: "string" }).defaultNow(),
  },
  (table) => {
    return {
      userIdx: uniqueIndex("idx").on(table.id),
      emailIdx: uniqueIndex("email_idx").on(table.email),
      firstNameIdx: index("first_name_idx").on(table.firstName),
      lastNameIdx: index("last_name_idx").on(table.lastName),
    };
  }
);

export const userSelectSchema = createSelectSchema(user);

export const userInsertSchema = createInsertSchema(user, {
  firstName: (schema) =>
    schema.firstName
      .trim()
      .min(1, { message: `firstName is required` })
      .max(255),
  email: (schema) =>
    schema.email
      .trim()
      .toLowerCase()
      .email({ message: `invalid email format` }),
})
  .extend({
    password: z
      .string()
      .min(6, { message: "Password must be at least 6 characters" }),
  })
  .strict();

export const userUpdateSchema = userInsertSchema.omit({ password: true });
