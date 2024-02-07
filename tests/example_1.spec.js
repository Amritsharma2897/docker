// @ts-check
const { test, expect } = require('@playwright/test');

test('has title', async ({ page }) => {
  await page.goto('https://www.amazon.in');

  // Expect a title "to contain" a substring.
  await page.locator('i.hm-icon').click();
});
