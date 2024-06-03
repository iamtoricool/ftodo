import { Hono } from "hono";
import { dbClient } from "../../database/database";

import { responseWithData } from "../../utils/base_http_response";

import * as schema from "../../database/schema/schema";

export const userRoute = new Hono();

userRoute.get("/", async (ctx) => {
  const users = await dbClient.query.user.findMany();

  const statusCode = users.length <= 0 ? 204 : 200;

  return ctx.json(responseWithData<typeof users>({ data: users }), statusCode);
});

userRoute.get(`/:id`, async (ctx) => {
  const userId = ctx.req.param()["id"];

  const user = await dbClient.query.user.findFirst({
    where: (field, operator) => operator.eq(field.id, userId),
  });

  if (!user) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `No user found with the id: ${userId}`,
        data: null,
      }),
      404
    );
  }

  return ctx.json(responseWithData<typeof user>({ data: user }));
});
