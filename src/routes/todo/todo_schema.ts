import { z } from "zod";

const todoSchema = z.object({
  id: z.number().int().positive(),
  title: z.string().min(3).max(255),
  description: z.string().nullable().default(null),
  isComplete: z.boolean().default(false),
});

export type Todo = z.infer<typeof todoSchema>;
export const todoReqSchema = todoSchema.omit({ id: true });
