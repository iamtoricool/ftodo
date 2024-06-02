import { Hono } from "hono";
import { dbClient } from "../../database/database";
import { eq, lt, gte, ne } from "drizzle-orm";

import { responseWithData } from "../../utils/base_http_response";

import * as schema from "../../database/schema/schema";

export const userRoute = new Hono();

userRoute.get("/", async (ctx) => {
  const users = await dbClient.query.user.findMany();

  return ctx.json(responseWithData<any>({ data: users }));
});

userRoute.get(`/:id`, async (ctx) => {
  const userId = ctx.req.param()["id"];

  let user;
  try {
    user = await dbClient.select().from(schema.user);
  } catch (error) {
    console.error(error);

    return ctx.json(
      responseWithData<typeof error>({
        data: error,
      })
    );
  }

  return ctx.json(responseWithData<typeof user>({ data: user }));
});
