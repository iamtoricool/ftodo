import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";

import {
  userInsertSchema,
  user as userTable,
  authUser as authTable,
  signInSchema,
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

authRoute.post("/signup", zValidator("json", userInsertSchema), async (ctx) => {
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

  const hashedPassword = await Bun.password.hash(userData.password, {
    algorithm: "bcrypt",
    cost: 4,
  });

  const authInfo = (
    await dbClient
      .insert(authTable)
      .values({
        userId: createdUser.id,
        email: createdUser.email,
        passKey: hashedPassword,
      })
      .returning()
  )[0];

  return ctx.json(
    responseWithData<typeof createdUser>({
      message: "Registered successfully",
      data: createdUser,
    }),
    201
  );
});

authRoute.post("/signin", zValidator("json", signInSchema), async (ctx) => {
  const signInData = ctx.req.valid("json");
  const _foundUser = await dbClient.query.authUser.findFirst({
    where: (field, operator) => operator.eq(field.email, signInData.email),
  });

  if (!_foundUser) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `No user found with the email: ${signInData.email} `,
        data: null,
      })
    );
  }

  const _passwordHash = await Bun.password.verify(
    signInData.password,
    _foundUser.passKey
  );

  if (!_passwordHash) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `Incorrect password`,
        data: null,
      })
    );
  }

  return ctx.json(responseWithData<string>({ data: "" }));
});
