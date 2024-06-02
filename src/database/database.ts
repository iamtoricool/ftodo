import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";

import * as schema from "./schema/schema";

const pgClient = postgres(process.env.DATABASE_URL as string);

export const dbClient = drizzle(pgClient, { schema, logger: true });