import { Hono } from "hono";
import {
  todo as todoTable,
  todo,
  todoReqSchema,
  type Todo,
} from "../../database/schema/zod_schema";

import { responseWithData } from "../../utils/base_http_response";
import { zValidator } from "@hono/zod-validator";
import { dbClient } from "../../database/database";

export const todoRoute = new Hono();

todoRoute.get("/", async (ctx) => {
  const todos = await dbClient.query.todo.findMany({
    columns: { userId: false },
  });
  return ctx.json(responseWithData<Todo[]>({ data: todos }));
});

todoRoute.get("/:id{[0-9]+}", async (ctx) => {
  const id = Number.parseInt(ctx.req.param()["id"]);
  const todo = await dbClient.query.todo.findFirst({
    columns: { userId: false },
    where: (field, operator) => operator.eq(field.id, id),
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

todoRoute.post("/", zValidator("json", todoReqSchema), async (ctx) => {
  const reqData = ctx.req.valid("json");

  const todo = await dbClient
    .insert(todoTable)
    .values({ ...reqData, userId: "90f91b4a-63dc-49ee-9118-3191bbc59271" })
    .returning();

  return ctx.json(responseWithData<typeof todo>({ data: todo }), 201);

  // return ctx.json(
  //   responseWithData<Todo>({ data: { id: newId, ...todo } }),
  //   201
  // );
});

/*
todoRoute.put(
  "/:id{[0-9]+}",
  zValidator("json", todoReqSchema),
  async (ctx) => {
    const id = Number.parseInt(ctx.req.param()["id"]);
    let todoIndex = todos.findIndex((todo) => todo.id === id);

    if (!todoIndex) {
      return ctx.json(
        responseWithData<null>({
          error: true,
          message: `No todo found with id ${id}`,
          data: null,
        }),
        404
      );
    }
    const updatedTodo = { id: id, ...ctx.req.valid("json") };
    todos[todoIndex] = updatedTodo;
    return ctx.json(responseWithData<Todo>({ data: updatedTodo }));
  }
);

todoRoute.delete("/:id{[0-9]+}", async (ctx) => {
  const id = Number.parseInt(ctx.req.param()["id"]);

  const todoIndex = todos.findIndex((todo) => todo.id === id);

  if (todoIndex === -1) {
    return ctx.json(
      responseWithData<null>({
        error: true,
        message: `No todo found with id ${id}`,
        data: null,
      }),
      404
    );
  }

  const [removedTodo] = todos.splice(todoIndex, 1);

  return ctx.json(responseWithData<Todo | null>({ data: removedTodo }));
});
*/
