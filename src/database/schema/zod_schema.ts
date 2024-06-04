import { z } from "zod";

import { todo, todoReqSchema } from "./todo_schema";
import { user, userInsertSchema } from "./user_schema";
import { authUser, authInsertSchema } from "./auth_schema";

type Todo = z.infer<typeof todoReqSchema>;
type User = z.infer<typeof userInsertSchema>;
type AuthUser = z.infer<typeof authInsertSchema>;

const signInSchema = userInsertSchema
  .pick({ email: true, password: true })
  .strict();

export { todo, todoReqSchema, user, userInsertSchema, authUser, signInSchema };
export type { Todo, User, AuthUser };
