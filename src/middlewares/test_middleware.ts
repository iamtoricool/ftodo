import type { Context } from "hono";
import { responseWithData } from "../utils/base_http_response";

export async function testMiddleware(ctx: Context, next: Function) {
  const token = ctx.req.header()["authorization"];

  if (!token) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: "Invalid token",
        data: null,
      }),
      401
    );
  }

  await next();
}
