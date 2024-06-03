import { z } from "zod";

import { todo, todoReqSchema } from "./todo_schema";

type Todo = z.infer<typeof todoReqSchema>;

export { todo, todoReqSchema };
export type { Todo };
