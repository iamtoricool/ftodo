import { z } from "zod";

import { todo, todoReqSchema } from "./todo_schema";
import { user, userInsertSchema } from "./user_schema";
import { authUser, authInsertSchema } from "./auth_schema";

type Todo = z.infer<typeof todoReqSchema>;
type User = z.infer<typeof userInsertSchema>;
type AuthUser = z.infer<typeof authInsertSchema>;

export { todo, todoReqSchema, user, userInsertSchema, authUser };
export type { Todo, User, AuthUser };
