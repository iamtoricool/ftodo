import type { Context, Next } from "hono";
import { decode, verify } from "hono/jwt";
import { responseWithData } from "../utils/base_http_response";

import {
  JwtTokenNotBefore,
  JwtHeaderInvalid,
  JwtTokenExpired,
  JwtTokenIssuedAt,
  JwtTokenSignatureMismatched,
  JwtTokenInvalid,
} from "hono/utils/jwt/types";
import { userSelectSchema, type User } from "../database/schema/zod_schema";

export async function authMiddleware(ctx: Context, next: Next) {
  let reqToken: string[] = [];

  try {
    reqToken = ctx.req.header()["authorization"].split(" ");
  } catch (_) {}

  if (reqToken.length !== 2) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: "Invalid token format! please check request token.",
        data: null,
      }),
      400
    );
  }

  const tokenPrefix = reqToken[0].trim();
  const token = reqToken[1].trim();
  if (tokenPrefix !== process.env.JWT_TOKEN_PREFIX) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: "Invalid token prefix! please check request token prefix.",
        data: null,
      }),
      400
    );
  }
  if (token.length === 0) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: "Invalid token! please check request token.",
        data: null,
      }),
      400
    );
  }

  try {
    const decodedToken = await verify(
      token,
      process.env.JWT_SECRET as string,
      "HS512"
    );

    const { data, error } = await userSelectSchema.safeParseAsync(decodedToken);

    if (error) {
      console.log("Error occured", error);

      return ctx.json(
        responseWithData<null>({
          error: true,
          message:
            "Something went wrong decoding the provided token. please check request token and try again later",
          data: null,
        }),
        400
      );
    }

    ctx.set("jwtPayload", data);
    await next();
  } catch (error) {
    const errorTypes = [
      JwtTokenNotBefore,
      JwtHeaderInvalid,
      JwtTokenExpired,
      JwtTokenIssuedAt,
      JwtTokenSignatureMismatched,
      JwtTokenInvalid,
    ];

    let errorMessage: string | undefined;
    for (const errorType of errorTypes) {
      if (error instanceof errorType) {
        switch (errorType) {
          case JwtTokenNotBefore:
            errorMessage = "Token is not yet valid (not before claim)";
            break;
          case JwtHeaderInvalid:
            errorMessage = "Invalid JWT header";
            break;
          case JwtTokenExpired:
            errorMessage = "Token has expired!";
            break;
          case JwtTokenSignatureMismatched:
            errorMessage = "Invalid token signature!";
            break;
          case JwtTokenInvalid:
            errorMessage = "Invalid JWT token!";
            break;
          default:
            errorMessage = "An unexpected JWT error occurred.";
        }
        break;
      }
    }

    if (errorMessage) {
      return ctx.json(
        responseWithData<null>({
          error: true,
          message: errorMessage,
          data: null,
        }),
        401
      );
    }

    return ctx.json(
      responseWithData<null>({
        error: true,
        message: "An unexpected error occurred during authentication.",
        data: null,
      }),
      401
    );
  }
}
