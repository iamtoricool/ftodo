import { z } from "zod";

export const multiDeleteSchema = z.object({
  todoId: z.array(z.number()).nonempty(),
});
