---
layout: default
---

<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold text-center mb-8">网格交易标的推荐</h1>
  
  <!-- 推荐标的模块 -->
  <div class="mb-12">
    <div class="flex justify-between items-center mb-4">
      <h2 class="text-2xl font-semibold">推荐标的</h2>
      <div class="flex space-x-2">
        <select id="filter-type" class="px-4 py-2 border rounded-md">
          <option value="all">全部</option>
          <option value="convertible">可转债</option>
          <option value="etf">ETF</option>
        </select>
        <select id="sort-by" class="px-4 py-2 border rounded-md">
          <option value="return">按年化收益率排序</option>
          <option value="volatility">按波动率排序</option>
          <option value="pe">按PE百分位排序</option>
        </select>
      </div>
    </div>
    
    <div class="overflow-x-auto">
      <table class="min-w-full bg-white border rounded-lg overflow-hidden">
        <thead class="bg-gray-100">
          <tr>
            <th class="py-3 px-4 text-left">名称</th>
            <th class="py-3 px-4 text-left">代码</th>
            <th class="py-3 px-4 text-left">价格</th>
            <th class="py-3 px-4 text-left">涨跌幅</th>
            <th class="py-3 px-4 text-left">波动率</th>
            <th class="py-3 px-4 text-left">PE(百分位)</th>
            <th class="py-3 px-4 text-left">PB</th>
            <th class="py-3 px-4 text-left">预估年化</th>
            <th class="py-3 px-4 text-left">评级</th>
            <th class="py-3 px-4 text-left">剩余年限</th>
          </tr>
        </thead>
        <tbody id="recommendations" class="divide-y divide-gray-200">
          <!-- 标的将通过JavaScript动态渲染 -->
        </tbody>
      </table>
    </div>
  </div>
</div>

<script src="/assets/js/app.js"></script>