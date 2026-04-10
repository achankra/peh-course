import express from "express";
import pino from "pino";
import pinoHttp from "pino-http";

const logger = pino({ level: process.env.LOG_LEVEL || "info" });
const app = express();
const port = parseInt(process.env.PORT || "8080", 10);

app.use(pinoHttp({ logger }));
app.use(express.json());

app.get("/health", (_req, res) => {
  res.json({ status: "ok", service: "order-service" });
});

app.get("/", (_req, res) => {
  res.json({
    service: "order-service",
    version: "0.1.0",
    team: "team-alpha",
  });
});

app.listen(port, () => {
  logger.info(`order-service listening on port ${port}`);
});

export default app;
