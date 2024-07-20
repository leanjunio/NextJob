import { test, expect } from '@playwright/test';

test("should register user", async ({ page }) => {
  await page.goto("/auth/register");
  await page.getByLabel(/email/i).fill("test@test.com");
  await page.getByLabel(/password/i).fill("password123");
  await page.getByRole("button", { name: "submit" }).click();
  await expect(page.getByText(/registered/i)).toBeVisible();
});