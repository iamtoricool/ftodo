import { Hono } from "hono";
import { dbClient } from "../../database/database";
import { responseWithData } from "../../utils/base_http_response";

export const userRoute = new Hono();

userRoute.get("/", async (ctx) => {
  const users = await dbClient.query.user.findMany();

  return ctx.json(responseWithData<any>({ data: users }));
});
