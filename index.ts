import { Hono } from "hono";
import { logger } from "hono/logger";
import { todoRoute } from "./src/routes/todo/todo_route";
import { testMiddleware } from "./src/middlewares/test_middleware";

const app = new Hono();

// Middlewares
app.use(logger());
app.use("/api/*", testMiddleware);

// Routes
app.route("/api/todos", todoRoute);

// HTTP Server
const server = Bun.serve({ fetch: app.fetch });
console.log(
  `Bun server is running at http://${server.hostname}:${server.port}`
);