import { Hono } from "hono";
import { todoReqSchema, type Todo } from "./todo_schema";
import { responseWithData } from "../../utils/base_http_response";
import { zValidator } from "@hono/zod-validator";

export const todoRoute = new Hono();

const todos: Todo[] = [
  {
    id: 1,
    title: "Learn Zod validation",
    description: "Explore Zod features and how to use them for data validation",
    isComplete: false,
  },
  {
    id: 2,
    title: "Build a basic API with Hono",
    description:
      "Set up a simple Hono server and create endpoints for CRUD operations",
    isComplete: true,
  },
  {
    id: 3,
    title: "Write unit tests for the API",
    description: "Ensure code functionality and handle potential edge cases",
    isComplete: false,
  },
  {
    id: 4,
    title: "Deploy the API to a cloud platform",
    description: "Choose a platform like Vercel or Netlify for hosting",
    isComplete: false,
  },
  {
    id: 5,
    title: "Celebrate your progress!",
    description: "Take a break and acknowledge your achievements",
    isComplete: false,
  },
];

todoRoute.get("/", async (ctx) => {
  return ctx.json(responseWithData<Todo[]>({ data: todos }));
});

todoRoute.get("/:id{[0-9]+}", async (ctx) => {
  const id = Number.parseInt(ctx.req.param()["id"]);
  const todo = todos.find((todo) => todo.id === id);

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
  const todo = ctx.req.valid("json");
  const newId = todos.length + 1;
  todos.push({ id: newId, ...todo });

  return ctx.json(
    responseWithData<Todo>({ data: { id: newId, ...todo } }),
    201
  );
});

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
