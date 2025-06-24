---
layout: default
title: 交易记录
---

<section id="transactions">
  <h2>💰 我的交易记录</h2>
  <div class="upload-area">
    <input type="file" id="trade-img" accept="image/*">
    <button onclick="processTradeImage()">解析交易截图</button>
  </div>
  <table id="records-table"></table>
</section>

<script src="{{ '/assets/js/app.js' | relative_url }}"></script>