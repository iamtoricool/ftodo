import { drizzle } from "drizzle-orm/postgres-js";
import { migrate } from "drizzle-orm/postgres-js/migrator";
import postgres from "postgres";

const migrationClient = postgres(process.env.DATABASE_URL as string, {
  max: 1,
});

async function main() {
  console.log(`Started migration, please wait....`);
  try {
    await migrate(drizzle(migrationClient), {
      migrationsFolder: "./src/database/migrations/",
    });
    await migrationClient.end();
    console.log(`Migration completed successfully.`);
  } catch (error) {
    console.log(`Migration completed with error`, error);
  }
}
main();
