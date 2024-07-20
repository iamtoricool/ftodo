import { z } from "zod";

import { todo, todoInsertSchema } from "./todo_schema";
import {
  user,
  userInsertSchema,
  userSelectSchema,
  userUpdateSchema,
} from "./user_schema";
import { authUser, authInsertSchema } from "./auth_schema";

type Todo = z.infer<typeof todoInsertSchema>;
type User = z.infer<typeof userSelectSchema>;
type AuthUser = z.infer<typeof authInsertSchema>;

const signInSchema = userInsertSchema
  .pick({ email: true, password: true })
  .strict();

export {
  todo,
  todoInsertSchema as todoReqSchema,
  user,
  userInsertSchema,
  userUpdateSchema,
  userSelectSchema,
  authUser,
  signInSchema,
};
export type { Todo, User, AuthUser };
