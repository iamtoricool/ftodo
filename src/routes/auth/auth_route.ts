import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";

import {
  userInsertSchema,
  user as userTable,
  authUser as authTable,
} from "../../database/schema/zod_schema";

import { dbClient } from "../../database/database";

import { responseWithData } from "../../utils/base_http_response";

export const authRoute = new Hono();

authRoute.on(["GET", "PUT", "PATCH", "DELETE"], "/*", async (ctx) => {
  return ctx.json(
    responseWithData<null>({
      error: true,
      message: `${ctx.req.method} not allowed at this route`,
      data: null,
    }),
    405
  );
});

authRoute.post(
  "/register",
  zValidator("json", userInsertSchema),
  async (ctx) => {
    const userData = ctx.req.valid("json");

    const _emailAlreadyTaken = await dbClient.query.user
      .findFirst({
        where: (field, operator) => operator.eq(field.email, userData.email),
      })
      .then((value) => value?.email == userData.email);

    if (_emailAlreadyTaken) {
      return ctx.json(
        responseWithData<null>({
          error: true,
          message: `${userData.email} this email is already taken.`,
          data: null,
        })
      );
    }

    const createdUser = (
      await dbClient.insert(userTable).values(userData).returning()
    )[0];

    const _userId = createdUser.id;
    const hashedPassword = await Bun.password.hash(userData.password, {
      algorithm: "bcrypt",
      cost: 4,
    });

    const authInfo = (
      await dbClient
        .insert(authTable)
        .values({
          userId: _userId,
          passKey: hashedPassword,
        })
        .returning()
    )[0];

    console.log(authInfo);

    return ctx.json(
      responseWithData<typeof createdUser>({
        message: "Registered successfully",
        data: createdUser,
      }),
      201
    );
  }
);
