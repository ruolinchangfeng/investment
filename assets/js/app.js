// Mock数据 - 推荐标的
const mockTargets = [
  {
    id: 1,
    symbol: "113657.SH",
    name: "齐鲁转债",
    type: "convertible",
    price: 115.20,
    amplitude: 1.8,
    pe: 12.5,
    yield: 18.2,
    desc: "AA+评级，正股估值低位波动适中"
  },
  {
    id: 2,
    symbol: "03012.HK",
    name: "东方香港科技ETF",
    type: "etf",
    price: 15.62,
    amplitude: 2.1,
    pe: 28.7,
    yield: 22.5,
    desc: "港股科技龙头，高波动性标的"
  },
  {
    id: 3,
    symbol: "512000.SH",
    name: "券商ETF",
    type: "etf",
    price: 0.865,
    amplitude: 3.2,
    pe: 14.8,
    yield: 25.3,
    desc: "高波动周期品种，网格交易经典标的"
  },
  {
    id: 4,
    symbol: "511260.SH",
    name: "十年国债ETF",
    type: "etf",
    price: 131.45,
    amplitude: 0.8,
    pe: null,
    yield: 12.1,
    desc: "低风险稳健型网格标的"
  }
];

// DOM加载完成后执行
document.addEventListener('DOMContentLoaded', () => {
  renderRecommendations();
});

// 渲染推荐标的
function renderRecommendations() {
  const container = document.getElementById('targets-grid');
  container.innerHTML = '';
  
  mockTargets.forEach(target => {
    const card = document.createElement('div');
    card.className = 'target-card';
    
    card.innerHTML = `
      <h3>${target.name} (${target.symbol})</h3>
      <div class="metrics">
        <span>价格: ¥${target.price}</span>
        <span>波动率: ${target.amplitude}%</span>
        <span>预期收益: ${target.yield}%</span>
        ${target.pe ? `<span>PE: ${target.pe}</span>` : ''}
      </div>
      <p>${target.desc}</p>
      <button class="buy-btn">创建网格策略</button>
    `;
    
    container.appendChild(card);
  });
}