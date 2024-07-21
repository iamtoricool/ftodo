import { Hono } from "hono";
import { sign } from "hono/jwt";
import { zValidator } from "@hono/zod-validator";

import {
  userInsertSchema,
  user as userTable,
  authUser as authTable,
  signInSchema,
} from "../../database/schema/zod_schema";

import { dbClient } from "../../database/database";

import { responseWithData } from "../../utils/base_http_response";
import { and, eq } from "drizzle-orm";

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
    .then((value) => value?.email === userData.email);

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

  const result = (
    await dbClient
      .select()
      .from(authTable)
      .where(eq(authTable.email, signInData.email))
      .innerJoin(userTable, eq(authTable.userId, userTable.id))
  )[0];

  if (!result) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `No user found within ${signInData.email} this email`,
        data: null,
      }),
      401
    );
  }

  const matchedPassword = await Bun.password.verify(
    signInData.password,
    result.auth_users.passKey,
    "bcrypt"
  );

  if (!matchedPassword) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `Incorrect password for user: ${signInData.email}`,
        data: null,
      }),
      401
    );
  }

  const expireDate = Math.floor(Date.now() / 1000) + 60; //30 * 24 * 60 * 60;
  const tokenPayload = { ...result.users, exp: expireDate };

  const jwtToken = await sign(
    tokenPayload,
    process.env.JWT_SECRET as string,
    "HS512"
  );

  const expiresAt = formatDate(expireDate);
  const sanitizedData = {
    ...result.users,
    token: jwtToken,
    expiresAt: expiresAt,
  };

  return ctx.json(
    responseWithData<typeof sanitizedData>({ data: sanitizedData })
  );
});

function formatDate(timestamp: number) {
  const date = new Date(timestamp * 1000);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  const miliSeconds = String(date.getMilliseconds() * 100).padStart(8, "0");

  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}.${miliSeconds}+06`;
}
