import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";

import {
  todo as todoTable,
  todoInsertSchema,
  type Todo,
} from "../../database/schema/zod_schema";

import { responseWithData } from "../../utils/base_http_response";
import { dbClient } from "../../database/database";
import { multiDeleteSchema } from "./_zod_shema";
import { and, eq } from "drizzle-orm";
import { dbDateFormat } from "../../helpers/helpers";

export const todoRoute = new Hono();

todoRoute.get("/", async (ctx) => {
  let userId = ctx.get("jwtPayload")["id"];

  const todos = await dbClient.query.todo.findMany({
    columns: { userId: false },
    where: (fields, operator) => {
      return operator.and(operator.eq(fields.userId, userId));
    },
    orderBy: (fields, operators) => operators.asc(fields.isCompleted),
  });
  return ctx.json(responseWithData<Todo[]>({ data: todos }));
});

todoRoute.get("/:id{[0-9]+}", async (ctx) => {
  let userId = ctx.get("jwtPayload")["id"];
  const id = Number.parseInt(ctx.req.param()["id"]);

  const todo = await dbClient.query.todo.findFirst({
    columns: { userId: false },
    where: (field, operator) =>
      operator.and(
        operator.eq(field.userId, userId),
        operator.eq(field.id, id)
      ),
  });

  if (!todo) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `No todo found with id ${id}`,
        data: null,
      }),
      404
    );
  }

  return ctx.json(responseWithData<Todo>({ data: todo }));
});

todoRoute.post("/", zValidator("json", todoInsertSchema), async (ctx) => {
  const userId = ctx.get("jwtPayload")["id"];
  const reqData = ctx.req.valid("json");

  const todo = (
    await dbClient
      .insert(todoTable)
      .values({ userId: userId, ...reqData })
      .returning()
  )[0];

  return ctx.json(responseWithData<typeof todo>({ data: todo }), 201);
});

todoRoute.put(
  "/:id{[0-9]+}",
  zValidator("json", todoInsertSchema),
  async (ctx) => {
    const userId = ctx.get("jwtPayload")["id"];
    const todoId = Number.parseInt(ctx.req.param("id"));
    const reqData = ctx.req.valid("json");

    let todo = await dbClient.query.todo.findFirst({
      where: (fields, operators) =>
        operators.and(
          operators.eq(fields.id, todoId),
          operators.eq(fields.userId, userId)
        ),
    });

    if (!todo) {
      return ctx.json(
        responseWithData<null>({
          error: true,
          message: `No todo found within id: ${todoId}`,
          data: null,
        }),
        204
      );
    }

    todo = (
      await dbClient
        .update(todoTable)
        .set({ ...reqData, updatedAt: dbDateFormat(Date.now()) })

        .where(and(eq(todoTable.userId, userId), eq(todoTable.id, todoId)))
        .returning()
    )[0];

    return ctx.json(
      responseWithData<typeof todo>({
        message: "Updated successfully",
        data: todo,
      })
    );
  }
);

todoRoute.delete("/", zValidator("json", multiDeleteSchema), async (ctx) => {
  return ctx.json(responseWithData<null>({ data: null }));
});
