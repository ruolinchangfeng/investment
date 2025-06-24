# Page snapshot

```yaml
- banner:
  - heading "智能网格交易助手" [level=1]
  - navigation:
    - link "推荐标的":
      - /url: /grid-trading-website/
    - link "交易记录":
      - /url: /grid-trading-website/transactions/
    - link "策略配置":
      - /url: /grid-trading-website/strategies/
- main:
  - heading "网格交易标的推荐" [level=1]
  - heading "推荐标的" [level=2]
  - combobox:
    - option "全部" [selected]
    - option "可转债"
    - option "ETF"
  - combobox:
    - option "按年化收益率排序" [selected]
    - option "按波动率排序"
    - option "按PE百分位排序"
  - table:
    - rowgroup:
      - row "名称 代码 价格 涨跌幅 波动率 PE(百分位) PB 预估年化 评级 剩余年限":
        - cell "名称"
        - cell "代码"
        - cell "价格"
        - cell "涨跌幅"
        - cell "波动率"
        - cell "PE(百分位)"
        - cell "PB"
        - cell "预估年化"
        - cell "评级"
        - cell "剩余年限"
    - rowgroup
- contentinfo:
  - paragraph: © 2025 网格交易助手 | 数据仅供参考，投资有风险
```