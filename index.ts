import { Hono } from "hono";
import { logger } from "hono/logger";
import { trimTrailingSlash } from "hono/trailing-slash";
import { jwt } from "hono/jwt";
import type { JwtVariables } from "hono/jwt";

import { authMiddleware } from "./src/middlewares/auth_middleware";

import { todoRoute } from "./src/routes/todo/todo_route";
import { userRoute } from "./src/routes/user/user_route";
import { authRoute } from "./src/routes/auth/auth_route";

type Variables = JwtVariables;

const app = new Hono<{ Variables: Variables }>().basePath("/api");

app.use(trimTrailingSlash());
app.use(logger());

// Auth Route
app.route("/auth", authRoute);

// Auth Protected Routes
app.use("/*", authMiddleware);
app.route("/todos", todoRoute);
app.route("/users", userRoute);

// HTTP Server
const server = Bun.serve({ fetch: app.fetch });
console.log(
  `Bun server is running at http://${server.hostname}:${server.port}`
);
