import { Hono } from "hono";
import { zValidator } from "@hono/zod-validator";

import {
  todo as todoTable,
  todoInsertSchema,
  type Todo,
  type User,
} from "../../database/schema/zod_schema";

import { responseWithData } from "../../utils/base_http_response";
import { dbClient } from "../../database/database";
import { multiTodoStatusChanger, multiTodoActionSchema } from "./_zod_shema";
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
    orderBy: (fields, operators) => {
      return (
        operators.asc(fields.isCompleted) && operators.desc(fields.updatedAt)
      );
    },
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

todoRoute.delete("/:id{[0-9]+}", async (ctx) => {
  const userId = ctx.get("jwtPayload")["id"];
  const todoId = Number.parseInt(ctx.req.param()["id"]);

  const todo = (
    await dbClient
      .delete(todoTable)
      .where(and(eq(todoTable.userId, userId), eq(todoTable.id, todoId)))
      .returning()
  )[0];

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

  return ctx.json(
    responseWithData<typeof todo>({
      message: "Todo deleted successfully",
      data: todo,
    }),
    200
  );
});

todoRoute.patch(
  "/",
  zValidator("json", multiTodoStatusChanger),
  async (ctx) => {
    const user = ctx.get("jwtPayload") as User;
    const ids = ctx.req.valid("json")["todoId"];
    const isCompleted = ctx.req.valid("json")["isCompleted"];

    const updatedTodos = [];
    for (let index = 0; index < ids.length; index++) {
      const id = ids[index];
      const updatedTodo = (
        await dbClient
          .update(todoTable)
          .set({ isCompleted: isCompleted })
          .where(and(eq(todoTable.userId, user.id), eq(todoTable.id, id)))
          .returning()
      )[0];
      updatedTodos.push(updatedTodo);
    }

    return ctx.json(
      responseWithData<typeof updatedTodos>({
        message: `Selected Todos marked as ${
          isCompleted ? "Complete" : "Incomplete"
        }`,
        data: updatedTodos,
      })
    );
  }
);