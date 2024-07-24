import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";

import { eq } from "drizzle-orm";
import _ from "lodash";
import postgres from "postgres";

import {
  userUpdateSchema,
  user as userTable,
  todo as todoTable,
  type User,
} from "../../database/schema/zod_schema";
import { dbClient } from "../../database/database";
import { responseWithData } from "../../utils/base_http_response";
import { dbDateFormat } from "../../helpers/helpers";

export const userRoute = new Hono();

userRoute.get("/", async (ctx) => {
  const user: User = ctx.get("jwtPayload");

  const queryData = await dbClient
    .select()
    .from(todoTable)
    .where(eq(todoTable.userId, user.id));

  const overviewData = {
    createdTodo: 0,
    completeTodo: 0,
    incompleteTodo: 0,
  };

  _.forEach(queryData, (data) => {
    overviewData.createdTodo += 1;
    if (data.isCompleted) {
      overviewData.completeTodo += 1;
    } else {
      overviewData.incompleteTodo += 1;
    }
  });

  const responseData = {
    user: _.omit(user, ["updatedAt", "createdAt"]),
    overview: overviewData,
  };

  return ctx.json(
    responseWithData<typeof responseData>({ data: responseData })
  );
});

userRoute.put("/", zValidator("json", userUpdateSchema), async (ctx) => {
  let userId = ctx.get("jwtPayload")["id"];
  const requestedData = ctx.req.valid("json");

  try {
    const user = await dbClient
      .update(userTable)
      .set({
        firstName: requestedData.firstName,
        lastName: requestedData.lastName,
        email: requestedData.email,
        updatedAt: dbDateFormat(Date.now()),
      })
      .where(eq(userTable.id, userId))
      .returning();

    return ctx.json(responseWithData<typeof user>({ data: user }));
  } catch (error) {
    let errMessage: string | undefined;
    if (error instanceof postgres.PostgresError) {
      errMessage = error.detail ?? error.hint;
    }

    return ctx.json(
      responseWithData<typeof error>({
        error: true,
        message: errMessage,
        data: error,
      }),
      400
    );
  }
});
