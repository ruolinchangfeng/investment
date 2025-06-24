---
layout: default
title: 智能网格交易助手
---

<section id="recommendations">
  <h2>📈 今日推荐网格标的</h2>
  <div class="filters">
    <select id="type-filter">
      <option value="all">全部类型</option>
      <option value="etf">ETF基金</option>
      <option value="convertible">可转债</option>
    </select>
    <input type="text" id="search" placeholder="搜索标的...">
  </div>
  <div class="grid-container" id="targets-grid"></div>
</section>

<script src="{{ '/assets/js/app.js' | relative_url }}"></script>