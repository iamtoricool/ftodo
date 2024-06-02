import {
  pgTable,
  uuid,
  varchar,
  pgEnum,
  index,
  uniqueIndex,
} from "drizzle-orm/pg-core";

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
