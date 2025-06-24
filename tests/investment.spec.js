const { test, expect } = require('@playwright/test');

// 目标网站（集思录可转债列表）关键元素
const JISILU_SELECTORS = {
  table: 'table.data-table',
  columns: ['转债名称', '价格', '涨跌幅', '正股名称', '正股涨跌幅']
};

// 您的网站URL
const YOUR_SITE_URL = 'https://ruolinchangfeng.github.io/investment/';

test('验证网站与集思录页面的模仿效果', async ({ page }) => {
  // 步骤1：导航到您的网站
  await page.goto(YOUR_SITE_URL);

  // 截图1：首页整体
  await page.screenshot({ path: 'test-results/homepage.png', fullPage: true });

  // 步骤2：检查核心表格是否存在
  const table = page.locator('table.grid-table');
  await expect(table).toBeVisible({ timeout: 10000 });

  // 步骤3：验证表格列名是否匹配集思录
  const columnTitles = await page.locator('table.grid-table thead th').allTextContents();
  const missingColumns = JISILU_SELECTORS.columns.filter(col => !columnTitles.includes(col));
  if (missingColumns.length > 0) {
    test.info().attach('列名不匹配', { body: `缺失列：${missingColumns.join(', ')}` });
  }

  // 步骤4：验证数据行悬停样式（假设目标样式为背景色#f5f5f5）
  const firstRow = table.locator('tr').nth(1);
  await firstRow.hover();
  const hoverBgColor = await firstRow.evaluate(el => getComputedStyle(el).backgroundColor);
  if (hoverBgColor !== 'rgb(245, 245, 245)') {
    test.info().attach('悬停样式异常', { body: `当前背景色：${hoverBgColor}` });
  }

  // 截图2：关键验证点
  await page.screenshot({ path: 'test-results/verification.png' });
});