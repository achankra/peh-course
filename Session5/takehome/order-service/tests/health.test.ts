import { describe, it, expect } from "vitest";

describe("order-service", () => {
  it("should have a valid service name", () => {
    const name = "order-service";
    expect(name).toBeTruthy();
    expect(name).toMatch(/^[a-z][a-z0-9-]*$/);
  });

  it("should have a valid port", () => {
    const port = parseInt("8080", 10);
    expect(port).toBeGreaterThan(0);
    expect(port).toBeLessThan(65536);
  });
});
