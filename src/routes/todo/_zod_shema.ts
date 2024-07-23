import { z } from "zod";

export const multiTodoActionSchema = z
  .object({ todoId: z.array(z.number()) })
  .strict();

export const multiTodoStatusChanger = multiTodoActionSchema
  .extend({ isCompleted: z.boolean() })
  .strict();
